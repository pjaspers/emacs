;; Make it 2.0-y

;; Current Font
;; Use (pp (current-frame-configuration)) to find it
(set-frame-font "-apple-DejaVu_Sans_Mono-medium-normal-normal-*-16-*-*-*-m-0-iso10646-")

;; This makes sure new frames start with the correct font size
;; (Although I don't use a lot of frames)
(custom-set-faces
 '(default ((t (:height 160 :family "DejaVu_Sans_Mono")))))

;; Highlight current
(global-hl-line-mode 1)

 ;; Customizing background color
;; TODO
;;(set-face-background 'hl-line "#333")  ;; Emacs 22 Only

(setq whitespace-style '(trailing space-before-tab indentation space-after-tab))
(setq whitespace-line-column 80)

;; Hide the chrome
(setq inhibit-startup-message t)
;; Menubar I can handle
(menu-bar-mode 1)

;; Toolbar and scrollbars not so much.
(tool-bar-mode nil)
(scroll-bar-mode nil)

;; Line numbers are overrated, jump-to-line is better
(line-number-mode nil)

;; no newlines past EOF
(setq next-line-add-newlines nil)

:: Theme
(load-theme 'tango-dark)
