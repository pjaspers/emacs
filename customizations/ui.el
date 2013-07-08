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

 ;; Highlighted line.
;; (set-face-background 'hl-line "#2D3436")
;; (set-face-background 'hl-line "#E5E5E5")

(setq whitespace-style '(trailing space-before-tab indentation space-after-tab))
(setq whitespace-line-column 80)

;; Hide the chrome
(setq inhibit-startup-message t)
;; Menubar I can handle
(menu-bar-mode 1)

;; Toolbar and scrollbars not so much.
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Line numbers are overrated, jump-to-line is better
(line-number-mode nil)

;; no newlines past EOF
(setq next-line-add-newlines nil)

;; Theme
;; (require 'color-theme-gruber-darker)
;; (color-theme-gruber-darker)

;; Didn't play nice with magit, very nice otherwise
;; (load-theme 'tango-dark)

(load-theme 'zenburn t)

;; Use sane fullscreen until Sea Lion fixes fullscreen apps.
;; [Source](http://crypt.codemancers.com/posts/2013-07-05-non-native-fullscreen-for-osx-on-emacs-24-dot-3/)
(setq ns-use-native-fullscreen nil)
