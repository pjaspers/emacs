;;; defuns --- A collection of small utilities
;;
;;; Commentary:
;;
;; A grab bag of functions I sometimes use.
;;
;;; Code:
;;
;; From http://stackoverflow.com/questions/3633120/emacs-hotkey-to-align-equal-signs easy access, to align =
(defun pjaspers-align-to-equals (begin end)
  "Align equal signs from BEGIN to END."
   (interactive "r")
   (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))

;; From http://stackoverflow.com/questions/12492/pretty-printing-xml-files-on-emacs
(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup from BEGIN to END.
You need to have 'nxml-mode' http://www.emacswiki.org/cgi-bin/wiki/NxmlMode
installed to do this.  The function inserts linebreaks to separate tags that
have nothing but whitespace between them.  It then indents the markup by using
nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))

(defun chomp (str)
  "Chomp leading and tailing whitespace from STR."
  (while (string-match "\\`\n+\\|^\\s-+\\|\\s-+$\\|\n+\\'"
                       str)
    (setq str (replace-match "" t t str)))
  str)

(defun pjaspers-bundle-line-for-gem()
  "Looks up a gem on rubygems and copies a rather illustrative bundle line.

Example for 'rails_admin':

      # RailsAdmin is a Rails engine that provides an easy-to-use interface f...
      # [rails_admin](https://github.com/sferik/rails_admin)
      gem 'rails_admin', '~> 0.0.5'

Ready to be pasted in the Gemfile"
  (interactive)
  (require 'json)
  (defvar url-http-end-of-headers)

  (let* ((gem_name (read-string "Enter gem: "))
         (json-data (save-excursion
                      (set-buffer (url-retrieve-synchronously (concat "https://rubygems.org/api/v1/gems/" gem_name)))
                      (goto-char url-http-end-of-headers)
                      (json-read)))

         (name (cdr (assoc 'name json-data)))
      (url (cdr (assoc 'homepage_uri json-data)))
      (version (cdr (assoc 'version json-data)))
      (desc ((lambda (s)
               (while (string-match "\n" s)
                 (setq s (replace-match " " t t s)))
               (format "# %s" (truncate-string-to-width s 72 nil nil t))) (chomp (cdr (assoc 'info json-data)))))

      (homepage (format "# [%s](%s)" name url))
      (bundle_line (format "gem \"%s\", \"~> %s\"" name version))
      (total (format "%s\n%s\n%s" desc homepage bundle_line)))
    (kill-new total)
    (message "%s" total)))

(defun pjaspers-pkg-line-for-npm()
  "Looks up a package on npm and copies a the line ready to be pasted in the package.json"
  (interactive)
  (require 'json)
  (defvar url-http-end-of-headers)

  (let* ((gem_name (read-string "Enter package: "))
         (json-data (save-excursion
                      (set-buffer (url-retrieve-synchronously (concat "https://registry.npmjs.org/" gem_name)))
                      (goto-char url-http-end-of-headers)
                      (json-read)))
         (name (cdr (assoc 'name json-data)))
         (description ((lambda (s)
               (while (string-match "\n" s)
                 (setq s (replace-match " " t t s)))
               (format "# %s" (truncate-string-to-width s 72 nil nil t))) (chomp (cdr (assoc 'description json-data)))))
         (latest (cdr (assoc 'latest (assoc 'dist-tags json-data))))
         (homepage (cdr (assoc 'homepage (cdr (assoc (intern latest) (cdr (assoc 'versions json-data)))))))
         (pkg_line (format "// %s\n%s\n\"%s\": \"%s\"" description homepage name latest)))
    (kill-new pkg_line)
    (message "%s" pkg_line)))

(defun pjaspers-ido-find-project()
  "List projects"
  (interactive)
  (let ((projects (pjaspers-find-projects-in-subdirectory "~/development")))
    (find-file (cdr (assoc (completing-read "Project: " (mapcar #'car projects))  projects)))))

(defun pjaspers-find-projects-in-subdirectory(directory)
  (setq projects nil)
    (dolist (kind (directory-files directory nil "^[^.]"))
      (let ((path (concat directory "/" kind)))
        (mapc (lambda (dir)
                (push (cons dir (concat path "/" dir)) projects))
              (directory-files path nil "^[^.]"))))
    (nreverse projects))

; Searches backwards for a < kills everything upto a <, and will enter erb translation thingies
; Leaving you free to type the key while the kill ring has the text to be entered in the yaml
(defun pjaspers-i18n-this()
  "Searches backwards for a < kills everything upto a <, and will enter erb translation thingies."
  (interactive)
   (re-search-backward "\>")
   (forward-char 1)
   (zap-to-char 1 60)
   (insert "<%= t(\"\") %><")
   (backward-char 6)
)

;; From Yegge: https://sites.google.com/site/steveyegge2/my-dot-emacs-file
;;
;; Never understood why Emacs doesn't have this function.
;;
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn 	 (rename-file name new-name 1) 	 (rename-buffer new-name) 	 (set-visited-file-name new-name) 	 (set-buffer-modified-p nil))))))

;; Taken from [here](http://whattheemacsd.com/key-bindings.el-01.html)
(defun wted-goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input."
  (interactive)
  (unwind-protect
      (progn
        (display-line-numbers-mode 1)
        (goto-line (read-number "Goto line: ")))
    (display-line-numbers-mode -1)))

(defun pjaspers-toggle-margins()
  "Toggles between a buffer with margins that center it and one without any margins. Or at least tries to."
  (interactive)
  (let ((left-margin 8)
        (right-margin 6)
        (window (selected-window)))
    (if (> (or (car (window-margins)) 0) 0)
        (progn
          (set-window-margins window 0 0)
          (setq line-spacing nil))
        (progn
          (set-window-margins window left-margin right-margin)
          (setq line-spacing 1)))))


(defun pjaspers-ignored-ag()
  (interactive)
  (let ((ag-ignore-list '("*.min.js")))
    (call-interactively #'ag)))

(defun pjaspers-emoji-me()
  "Takes a word and show in a temporary buffer all emoji that match."
  (interactive)
  (let* ((wildcard-name (read-regexp "Enter regexp to look for: "))
         (all-known (ucs-names))
         (buffer-name (format "*emoji-me-%s*" wildcard-name))
         (results (remove-if-not (lambda(x) (let ((str x))(string-match wildcard-name str))) (hash-table-keys all-known))))
    (with-output-to-temp-buffer buffer-name
      (print (mapconcat (function (lambda(x) (format "%s - %s" x (char-to-string (gethash x all-known))))) results "\n"))
      (switch-to-buffer buffer-name))))

(defun pjaspers-emoji-me-b()
  "Takes a word and show in a temporary buffer all emoji that match."
  (interactive)
  (let* ((wildcard-name (read-regexp "Enter regexp to look for: "))
         (all-known (ucs-names))
         (buffer-name (format "*emoji-me-%s*" wildcard-name))
         (results (remove-if-not (lambda(x) (let ((str x))(string-match wildcard-name str))) (hash-table-keys all-known))))
    (kill-new (completing-read "Tada " (mapcar (lambda(x) (format "%s - %s" x (char-to-string (gethash x all-known)))) results)))))


(defun pjaspers-open-notes-file ()
  "Open the default capture file for 'org-mode'."
  (interactive)
  (find-file org-default-notes-file))

(defun pj-show-vcard-image(begin end)
  "Select the photo part from a vcard and this will show it."
  (interactive "r")
  (let ((data (base64-decode-region begin end)))
    (insert-image (create-image data nil t))))

(defun pjaspers-reveal-in-finder ()
  "Show the current directory in the Finder."
  (interactive)
  (shell-command "open ."))

(defun temacco-beautify-sql ()
  "Format the SQL in region using the sqlformat tool.
If no region is active, the whole file is formatted."
  (interactive)
  (let ((start (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (shell-command-on-region start end "sqlformat -r -" nil t)))

(defun pj-insert-timestamp()
  "Inserts a formatted current time"
  (interactive)
  (insert (format-time-string "%Y%m%d%H%M" (current-time))))

(defun copy-full-path-to-kill-ring ()
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))))

(defun copy-ze-blog-to-kill-ring ()
  "copy an note's path to pjaspers.com"
  (interactive)
  (when buffer-file-name
    (kill-new (concat "https://pjaspers.com/n/" (file-name-base buffer-file-name)))))

(defun eddy ()
  "Like frasier, and niles, but smaller"
  (interactive)
  ;; "print File.open('/usr/share/dict/words').read.lines.reject{|w| w.length < 3 || 10 < w.length}.sample(4).map{|w| w.strip! && w.downcase}.join('-')" | tee >(pbcopy)

  (kill-new (mapconcat 'identity (mapcar (lambda (_) (with-temp-buffer
    (insert-file-contents "/usr/share/dict/words")
    (downcase (seq-random-elt (seq-filter (lambda (e) (and (> (length e) 3) (< (length e) 10))) (split-string (buffer-string) "\n" t)))))) '(1 2 3 4)) "-"))
  )

(provide 'defuns)
;;; defuns.el ends here
