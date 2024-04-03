;;; pjaspers-editing --- Everything related to typing
;;
;;; Commentary:
;;
;; Yes, I get it.  It's hilarious that I need to configure my editor to do basic
;; editing.  Hardy har har.
;;
;;; Code:
;; Just Say No to tabs.
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; When you have a selection, typing text replaces it all.
(delete-selection-mode t)

(prefer-coding-system 'utf-8)
;; to make tramp play nice when ssh-ing to a mac, otherwise I get the
;; weird mac line endings.
(setq default-buffer-file-coding-system 'utf-8-unix)


; pick up changes to files on disk automatically (ie, after git pull)
(global-auto-revert-mode 1)

;; Marginally better scrolling.
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; no newlines past EOF
(setq next-line-add-newlines nil)

;; All modes
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Turns out electric-pair-mode got awesome since Emacs 24.4
;; So long smart-parens, wrap-region and friends!
(electric-pair-mode t)

;; show whitespace
 ;; limit line length
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face tabs empty trailing))
(whitespace-mode +1)

(require 'expand-region)

;; Better searching
(require 'ag)

;; Delete when typing when selected
(delete-selection-mode t)

;; Try and stop emacs from creating temp files
;
; Disable backup files (foo~)
(setq backup-inhibited t)
;; Can't think of a single time this has helped me.
(setq make-backup-files nil)
;; If it does make them, store them in the temp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(provide 'pjaspers-editing)
;;; pjaspers-editing.el ends here
