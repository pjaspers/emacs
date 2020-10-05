;;; pjaspers-buffers --- Everything buffer related
;;
;;; Commentary:
;;
;; If it touches an Emacs buffer, if it moves an Emacs buffer, if it
;; renames an Emacs buffer, it even slightly looks at an Emacs buffer.
;; It needs to be in here.
;;
;;; Code:

;; nicer naming of buffers with identical names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; Better buffer swithing
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; case insensitive matching
(add-to-list 'ido-ignore-files "\\.DS_Store")
(setq ido-create-new-buffer 'always) ; always create a new buffer with Ido
(setq ido-use-virtual-buffers t)

;; flx-ido
;; Makes ido to fuzzy matching.
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(put 'ido-exit-minibuffer 'disabled nil)

;; (define-key ido-completion-map [C-s] 'ido-next-history-element)
;; This tab override shouldn't be necessary given ido's default
;; configuration, but minibuffer-complete otherwise dominates the
;; tab binding because of my custom tab-completion-everywhere
;; configuration.
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [C-s] 'ido-next-history-element)))

;; Let's give ivy a chance
(setq projectile-completion-system 'ivy)

(defun horizontal-ivy-format-function (cands)
  (ivy--format-function-generic
   (lambda (str)
     (ivy--add-face str 'ivy-current-match))
   #'identity
   cands
   " | "))

(add-to-list 'ivy-format-functions-alist '(t . horizontal-ivy-format-function))
(setq ivy-use-virtual-buffers t)
(define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
(ivy-mode 1)

(provide 'pjaspers-buffers)
;;; pjaspers-buffers.el ends here
