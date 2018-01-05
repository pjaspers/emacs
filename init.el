;; custom place to save, wait for it, customizations

;; (package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p "custom.el") (load "custom"))
(require 'cl)
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Homebrew dir
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'pjaspers-packages)

;; Emacs stuff
(require 'pjaspers-config)
(require 'pjaspers-ui)
(require 'pjaspers-mac)
(require 'pjaspers-buffers)

;; Globally used
(require 'pjaspers-editing)
(require 'pjaspers-vc)

;; Targeted modes
(require 'pjaspers-ruby)
(require 'pjaspers-web)
(require 'pjaspers-shell)
(require 'pjaspers-modes)
(require 'pjaspers-org)

;; All the keybindings
(require 'pjaspers-bindings)



(add-to-list 'load-path "~/.emacs.d/elisp")
(load "defuns")            ;; Lisp helper functions
