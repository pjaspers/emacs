(require 'package)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq ruby-packages '(rvm inf-ruby yaml-mode sass-mode))
(setq js-packages '(js2-mode coffee-mode))
(setq git-packages '(magit mo-git-blame))
(setq text-packages '(markdown-mode))
(setq lisp-packages '(elisp-slime-nav-mode))
(setq global-packages '(smex textmate ace-jump-mode color-theme-gruber-darker multiple-cursors))

(setq pjaspers-packages (append ruby-packages js-packages git-packages text-packages lisp-packages global-packages))

(dolist (p pjaspers-packages)
  (when (not (package-installed-p p))
    (package-install p)))
