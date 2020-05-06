;;; pjaspers-ui --- Make it pretty
;;
;;; Commentary:
;;
;; Fonts, hiding uglyness, if you see it, it should go here.  And not anywhere else.
;;
;;; Code:
;;
;; Make it 2.0-y
;;
;; Current Font
;; Use (pp (current-frame-configuration)) to find it.
(set-frame-font "-*-DejaVu Sans Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")
;; Also pretty nice, but not quite my tempo.
;; (set-frame-font "-*-IBM Plex Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

;; This makes sure new frames start with the correct font size
;; (Although I don't use a lot of frames)
(custom-set-faces
 '(default ((t (:height 160 :family "DejaVu Sans Mono")))))

;; default font
(set-face-attribute 'default nil :family "DejaVu Sans Mono")

;; font for all unicode characters
;; (set-fontset-font t 'unicode "Apple Symbols" nil 'prepend)

;; This somehow brings me the emoji back
(set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)

;; Highlight current
(global-hl-line-mode 1)

 ;; Highlighted line.
;; (set-face-background 'hl-line "#2D3436")

;; Hide the chrome
(setq inhibit-startup-message t)
;; Menubar I can handle
(menu-bar-mode 0)

;; Toolbar and scrollbars not so much.
;; (scroll-bar-mode -1)
(tool-bar-mode -1)

;; Line numbers are overrated, jump-to-line is better
(line-number-mode nil)

;; Theme
(setq custom-safe-themes t)
(load-theme 'leuven)

(provide 'pjaspers-ui)
;;; pjaspers-ui.el ends here
