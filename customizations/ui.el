;; Make it 2.0-y

;; Current Font
;; Use (pp (current-frame-configuration)) to find it.
(set-frame-font "-*-DejaVu Sans Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

;; This makes sure new frames start with the correct font size
;; (Although I don't use a lot of frames)
(custom-set-faces
 '(default ((t (:height 160 :family "DejaVu Sans Mono")))))

;; default font
(set-face-attribute 'default nil :family "DejaVu Sans Mono")

;; font for all unicode characters
(set-fontset-font t 'unicode "Apple Symbols" nil 'prepend)

;; Highlight current
(global-hl-line-mode 1)

 ;; Highlighted line.
;; (set-face-background 'hl-line "#2D3436")
;; (set-face-background 'hl-line "#E5E5E5")
(setq whitespace-style '(trailing space-before-tab tab tab-mark indentation space-after-tab lines lines-tail))
(setq whitespace-line-column 80)

;; Hide the chrome
(setq inhibit-startup-message t)
;; Menubar I can handle
(menu-bar-mode 0)

;; Toolbar and scrollbars not so much.
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Line numbers are overrated, jump-to-line is better
(line-number-mode nil)

;; no newlines past EOF
(setq next-line-add-newlines nil)

;; Theme
(setq custom-safe-themes t)
(load-theme 'leuven)

;; (setq custom-enabled-themes 'sanityinc-tomorrow-eighties)

;; Use sane fullscreen until Sea Lion fixes fullscreen apps.
;; [Source](http://crypt.codemancers.com/posts/2013-07-05-non-native-fullscreen-for-osx-on-emacs-24-dot-3/)
(setq ns-use-native-fullscreen nil)

(setq ns-use-srgb-colorspace t)

;; See http://bzg.fr/emacs-hide-mode-line.html
(defvar-local hidden-mode-line-mode nil)
(defvar-local hide-mode-line nil)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))

;; Activate hidden-mode-line-mode
;; (hidden-mode-line-mode 1)

;; If you want to hide the mode-line in all new buffers
;; (add-hook 'after-change-major-mode-hook 'hidden-mode-line-mode)

;; Alternatively, you can paint your mode-line in White but then
;; you'll have to manually paint it in black again
;; (custom-set-faces
;;  '(mode-line-highlight ((t nil)))
;;  '(mode-line ((t (:foreground "white" :background "white"))))
;;  '(mode-line-inactive ((t (:background "white" :foreground "white")))))

(setq emoji-display-image-directory "/Users/pjaspers/.gem/ruby/1.9.3/gems/emoji-1.0.1/assets")

;; (require 'emoji-display)
;; (emoji-display-mode)
