(require 'package)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar pjaspers-packages '(rvm inf-ruby yaml-mode css-mode coffee-mode magit)
  "List of packages that I use all the time.")

(dolist (p pjaspers-packages)
  (when (not (package-installed-p p))
    (package-install p)))
