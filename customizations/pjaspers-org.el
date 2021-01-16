;;; pjaspers-org --- Org-mode settings
;;
;;; Commentary:
;;
;; Org-mode is amazing.  I hardly use any of it and it's still great.
;;
;;; Code:
(setq org-directory "~/Documents/notes")
(setq org-agenda-files '("~/Documents/notes"))
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; Org-Roam specific
(setq org-roam-directory "/Users/pjaspers/Documents/notes")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
             "* TODO %?\n  %T\n%i\n  %a")
        ("n" "Note" entry (file+headline org-default-notes-file "Notes")
             "* %?\n:PROPERTIES:\n:Created: %U\n:END:\n  %i\n  %a")
        ("q" "Quote" entry (file+headline org-default-notes-file "Notes")
         "* %^{author} - %^{quote}")
        ("m" "Meeting" entry (file+headline org-default-notes-file "Notes")
         "* Meeting: %?\nEntered on %U\nAttendees:\nSummary:\nTodos:\n  %i\n  %a")
        ("u" "URL" entry (file+headline org-default-notes-file "Notes")
         "* %^{description}\n %^{url}")))

(setq org-refile-targets '((nil :maxlevel . 4)
                                ; all top-level headlines in the
                                ; current buffer are used (first) as a
                                ; refile target
                           (org-agenda-files :maxlevel . 4)))

;; provide refile targets as paths, including the file name
;; (without directory) as level 1 of the path
(setq org-refile-use-outline-path 'file)

;; allow to create new nodes (must be confirmed by the user) as
;; refile targets
(setq org-refile-allow-creating-parent-nodes 'confirm)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (shell . t)
   ))

(setq org-confirm-babel-evaluate nil)

(with-eval-after-load 'ox
  (require 'ox-hugo))

(setq org-roam-dailies-directory "dailies/")

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         #'org-roam-capture--get-point
         "* %?"
         :file-name "dailies/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n\n")))

(defun org-roam-create-note-from-headline ()
  "Create an Org-roam note from the current headline and jump to it.

Normally, insert the headline’s title using the ’#title:’ file-level property
and delete the Org-mode headline. However, if the current headline has a
Org-mode properties drawer already, keep the headline and don’t insert
‘#+title:'. Org-roam can extract the title from both kinds of notes, but using
‘#+title:’ is a bit cleaner for a short note, which Org-roam encourages."
  (interactive)
  (let ((title (nth 4 (org-heading-components)))
        (has-properties (org-get-property-block)))
    (org-cut-subtree)
    (org-roam-find-file title nil nil 'no-confirm)
    (org-paste-subtree)
    (unless has-properties
      (kill-line)
      (while (outline-next-heading)
        (org-promote)))
    (goto-char (point-min))
    (when has-properties
      (kill-line)
      (kill-line))))

(provide 'pjaspers-org)
;;; pjaspers-org.el ends here
