;;; pjaspers-vc --- Version Control
;;
;;; Commentary:
;;
;; Basically, what I need with magit.  Magit is amazing.
;;
;;; Code:

;; Ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; Magit
(eval-after-load 'magit
  '(progn
     (setq magit-git-executable (concat pjaspers-homebrew "/bin/git"))
     ))

(provide 'pjaspers-vc)
;;; pjaspers-vc.el ends here
