; Homebrew path
(add-to-list 'exec-path "/usr/local/bin")

; PDF LaTeX
(add-to-list 'exec-path "/usr/local/texlive/2011basic/bin/universal-darwin")

;; OS X has an issue with picking up the right system env
;; Explictly setting it here (So shell-command and buddies can use it)
(setq path "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/sbin:/AdobeAIRSDK/bin:/usr/local/share/npm/bin:/usr/local/texlive/2011basic/bin/universal-darwin/")



(setenv "PATH" path)

; custom place to save customizations
(setq custom-file "~/.emacs.d/pjaspers/custom.el")
(when (file-exists-p "custom.el") (load "custom"))

(load "customizations/ui")
(load "customizations/bindings")
(load "customizations/packages")



