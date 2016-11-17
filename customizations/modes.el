;; all modes
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; flx-ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

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
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
	  '(lambda ()
	     (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Magit
(eval-after-load 'magit
  '(progn
     (setq magit-git-executable "/usr/local/bin/git")
     ;; (set-face-attribute 'magit-diff-add nil :foreground "#559944")
     ;; (set-face-attribute 'magit-diff-del nil :foreground "#de1923")
     ;; (set-face-attribute 'magit-diff-file-header nil :foreground "RoyalBlue1")
     ;; (set-face-attribute 'magit-diff-hunk-header nil :foreground "#fbde2d")
     ;; (set-face-attribute 'magit-item-highlight nil :background "black")
     ))

;; A M-x with autocomplete features
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                                        ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-markup-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; Web-mode
(require 'web-mode)
(require 'projectile)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
; ruby
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.god" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ru" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))

(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))

(require 'chruby)
;; Default ruby
(chruby "ruby-2.0.0-p247")
(chruby "ruby-2.1.1")
(require 'rubocop)

;; Markdown
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; Making inf-ruby work with pry
(require 'inf-ruby)
(add-to-list 'inf-ruby-implementations '("pry" . "pry"))
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-first-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)> *")
(setq inf-ruby-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)[>*\"'] *")

(defun pj-ruby-mode-hook()
  (whitespace-mode 1)
  (projectile-mode 1)
  (local-set-key [M-t] 'projectile-find-file))

;; Whitespace cleanup
(add-hook 'ruby-mode-hook 'pj-ruby-mode-hook)

(require 'browse-kill-ring)
(require 'graphviz-dot-mode)
(require 'ag)
