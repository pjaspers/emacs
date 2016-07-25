;; custom place to save, wait for it, customizations

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p "custom.el") (load "custom"))
(require 'cl)
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "packages") ;; Fetch modes
(load "ui")       ;; Set up all things colors/fonts/appearance
(load "bindings") ;; All non platform specific bindings
(load "mac")      ;; All things related to the mac
(load "modes")    ;; Setup mode specific stuff
(load "shell_custom")    ;; All things with paths and shells
(load "global")	 ;; All things with paths and shells
(load "org-mode") ;; Trying to get back in the org-mode habit.

(add-to-list 'load-path "~/.emacs.d/elisp")
(load "defuns")            ;; Lisp helper functions

;; Homebrew dir
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
