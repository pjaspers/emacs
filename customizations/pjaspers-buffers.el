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

(defun bind-ido-keys ()
  "Keybindings for ido mode."
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p")   'ido-prev-match))

(add-hook 'ido-setup-hook #'bind-ido-keys)

(put 'ido-exit-minibuffer 'disabled nil)

(provide 'pjaspers-buffers)
;;; pjaspers-buffers.el ends here
