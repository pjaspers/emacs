

; custom place to save customizations
(setq custom-file "~/.emacs.d/pjaspers/custom.el")
(when (file-exists-p "custom.el") (load "custom"))

(load "customizations/ui")		;; Set up all things colors/fonts/appearance
(load "customizations/bindings")	;; All non platform specific bindings
(load "customizations/mac")		;; All things related to the mac
(load "customizations/packages")	;; Fetch modes
(load "customizations/modes")		;; Setup mode specific stuff
(load "customizations/shell");; All things with paths and shells

