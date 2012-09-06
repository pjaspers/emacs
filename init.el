(add-to-list 'load-path "~/.emacs.d/")

;; custom place to save, wait for it, customizations
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p "custom.el") (load "custom"))


(load "customizations/ui")       ;; Set up all things colors/fonts/appearance
(load "customizations/bindings") ;; All non platform specific bindings
(load "customizations/mac")      ;; All things related to the mac
(load "customizations/packages") ;; Fetch modes
(load "customizations/modes")    ;; Setup mode specific stuff
(load "customizations/shell")    ;; All things with paths and shells
(load "customizations/global")	 ;; All things with paths and shells
(load "elisp/defuns")            ;; Lisp helper functions
