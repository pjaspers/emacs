;;; pjaspers-little-drawer --- A little drawer for random stuff
;;
;;; Commentary:
;;
;; No matter how much you clean, you'll always need a place to store a
;; bunch of crap. This is usually a little drawer that eventually
;; piles out with useful and less useful stuff. At that point you
;; probably move things to places where they belong. But this is a
;; guilt-free zone to store things.
;;
;;; Code:
;;

(setenv "HUSKY_SKIP_HOOKS" "1")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq deft-directory "~/dl/notes")
(setq deft-recursive t)

(set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)

;; (require 'ox-confluence)

(provide 'pjaspers-little-drawer)
;;; pjaspers-litte-drawer.el ends here
