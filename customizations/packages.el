(require 'package)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(setq ruby-packages '(rvm inf-ruby yaml-mode))
(setq js-packages '(js2-mode coffee-mode))
(setq git-packages '(magit mo-git-blame))
(setq global-packages '(smex textmate ace-jump-mode))

(setq pjaspers-packages (append ruby-packages js-packages git-packages global-packages))

(dolist (p pjaspers-packages)
  (when (not (package-installed-p p))
    (package-install p)))
