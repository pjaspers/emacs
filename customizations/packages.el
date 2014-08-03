(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq ruby-packages '(chruby inf-ruby yaml-mode sass-mode robe web-mode rubocop))
(setq js-packages '(js2-mode coffee-mode))
(setq git-packages '(magit mo-git-blame git-commit-mode gitconfig-mode gitignore-mode))
(setq text-packages '(markdown-mode))
(setq lisp-packages '())
(setq color-themes '(color-theme-sanityinc-tomorrow color-theme-gruber-darker))
(setq global-packages '(smex textmate ace-jump-mode multiple-cursors zenburn-theme browse-kill-ring auto-complete projectile flx-ido flycheck expand-region exec-path-from-shell swift-mode ag))

(setq pjaspers-packages (append ruby-packages js-packages git-packages text-packages lisp-packages global-packages color-themes))

(dolist (p pjaspers-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; No package found.
;; More [here](https://github.com/pry/pry/wiki/ruby-dev.el)
(add-to-list 'load-path "~/.emacs.d/ruby-dev.el" )
(autoload 'turn-on-ruby-dev "ruby-dev" nil t)
(add-hook 'ruby-mode-hook 'turn-on-ruby-dev)
