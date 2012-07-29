;; all modes
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; bash
(setq auto-mode-alist (cons '("\\.bashrc" . sh-mode) auto-mode-alist))

;; zsh
(setq auto-mode-alist (cons '("\\.zshrc" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.zsh$" . sh-mode) auto-mode-alist))

;; Obj-C
(setq auto-mode-alist (cons '("\\.m$" . objc-mode) auto-mode-alist))

;; Ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; Yaml
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
	  '(lambda ()
	     (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; Magit
(eval-after-load 'magit
  '(progn
     (setq magit-git-executable "/usr/local/bin/git")
     (set-face-attribute 'magit-diff-add nil :foreground "#559944")
     (set-face-attribute 'magit-diff-del nil :foreground "#de1923")
     (set-face-attribute 'magit-diff-file-header nil :foreground "RoyalBlue1")
     (set-face-attribute 'magit-diff-hunk-header nil :foreground "#fbde2d")
     (set-face-attribute 'magit-item-highlight nil :background "black")))

; rhtml
(setq auto-mode-alist (cons '("\\.html\\.erb" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.erb" . nxml-mode) auto-mode-alist))

; ruby
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.god" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ru" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))

;; Making inf-ruby work with pry
(add-to-list 'inf-ruby-implementations '("pry" . "pry"))
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-first-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)> *")
(setq inf-ruby-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)[>*\"'] *")

;; Whitespace cleanup
(add-hook 'ruby-mode-hook (lambda () (whitespace-mode 1)))
