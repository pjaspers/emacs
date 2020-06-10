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

(provide 'pjaspers-org)
;;; pjaspers-org.el ends here
