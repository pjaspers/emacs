;; From http://stackoverflow.com/questions/3633120/emacs-hotkey-to-align-equal-signs easy access, to align =
(defun pjaspers-align-to-equals (begin end)
  "Align region to equal signs"
   (interactive "r")
   (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))

(defun pretty-print-touchpoint-body-data (string)
(replace-regexp-in-string "{" "\n{" (replace-regexp-in-string "\"" "" (replace-regexp-in-string "\"," "\n" (url-unhex-string string))))
)

;; From http://stackoverflow.com/questions/12492/pretty-printing-xml-files-on-emacs
(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))

;; If needed you could also use `python -mjson.tool`
(defun pretty-print-json-region (start_pos end_pos)
  "Uses the ruby gem `json` to pretty print the json"
  (interactive "r")
  (let (script_name "python -mjson.tool")
    (shell-command-on-region start_pos end_pos script_name nil t nil t)
    ))

(defun 37signals-status ()
  "Checks and displays the status of 37 signals"
  (interactive)
  (require 'json)
  (defvar url-http-end-of-headers)

  (let* ((json-data (save-excursion
                       (set-buffer (url-retrieve-synchronously "http://status.37signals.com/status.json"))
                       (goto-char url-http-end-of-headers)
                       (json-read)))
         (status-data (cdr (assoc 'status json-data)))
         (updated_at (cdr (assoc 'updated_at status-data)))
         (mood (cdr (assoc 'mood status-data)))
         (description (cdr (assoc 'description status-data))))
    (message "%s: %s" (capitalize mood) description)))

(defun build-and-run()
  (interactive)
  (let ((root (textmate-project-root)))
    (when (null root)
      (error
       (concat
        "Can't find a suitable project root ("
        (string-join " " *textmate-project-roots* )
        ")")))
    (compile
     (format "xcodebuild -project %s -configuration Debug -sdk iphonesimulator build && ios-sim launch %s --family ipad"
             (concat (expand-file-name root) "TouchPoint.xcodeproj")
             (concat (expand-file-name root) "build/Debug-iphonesimulator/TouchPoint.app")))))

(defun pjaspers-ido-find-gem()
  (interactive)
  (find-file
   (concat "~/.rvm/gems/ruby-1.9.3-p194/gems/" (ido-completing-read "Gem: "
                           (directory-files "~/.rvm/gems/ruby-1.9.3-p194/gems/" nil "^[^.]")))))

(defun pjaspers-ido-find-project()
  (interactive)
  (let ((projects (pjaspers-find-projects-in-subdirectory "~/development")))
    (find-file (cdr (assoc (ido-completing-read "Project: " (mapcar #'car projects)
) projects)))))

(defun pjaspers-find-projects-in-subdirectory(directory)
  (setq projects nil)
    (dolist (kind (directory-files directory nil "^[^.]"))
      (let ((path (concat directory "/" kind)))
        (mapc (lambda (dir)
                (push (cons dir (concat path "/" dir)) projects))
              (directory-files path nil "^[^.]"))))
    (nreverse projects))

(defun pjaspers-goto-config ()
  (interactive)
  (find-file "~/.emacs.d/pjaspers.el"))

; Searches backwards for a < kills everything upto a <, and will enter erb translation thingies
; Leaving you free to type the key while the kill ring has the text to be entered in the yaml
(defun pjaspers-i18n-this()
  (interactive)
   (re-search-backward "\>")
   (forward-char 1)
   (defunkt-zap-to-char 1 60)
   (insert "<%= t(\"\") %>")
   (backward-char 5)
)
