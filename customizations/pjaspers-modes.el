;;; pjaspers-modes --- Various modes
;;
;;; Commentary:
;;
;; All the (programming) modes that don't really need their own file.
;;
;;; Code:
;;
;; Obj-C
(setq auto-mode-alist (cons '("\\.m$" . objc-mode) auto-mode-alist))

;; Yaml
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
	  '(lambda ()
n	     (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; Markdown
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

(require 'graphviz-dot-mode)


;; Set your lisp system and, optionally, some contribs
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/clisp")
(setq slime-contribs '(slime-fancy))

;; Yes, you can do this same trick with the cool "It's All Text" firefox add-on :-)
(add-to-list 'auto-mode-alist '("/mutt-\\|itsalltext.*mail\\.google" . mail-mode))
(add-hook 'mail-mode-hook 'turn-on-auto-fill)
(add-hook
 'mail-mode-hook
 (lambda ()
   (define-key mail-mode-map [(control c) (control c)]
     (lambda ()
       (interactive)
       (save-buffer)
       (server-edit)))))

(provide 'pjaspers-modes)
;;; pjaspers-modes.el ends here
