;;; pjaspers-packages --- Load any packages we need
;;
;;; Commentary:
;;
;; At the moment I'm using cask, this might change, but this file should always
;; load the packages and make them available to Emacs.
;;
;;; Code:
;;
;; Let's use [cask](https://github.com/cask/cask)
;; All packages now defined in `Cask`
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(provide 'pjaspers-packages)
;;; pjaspers-packages.el ends here
