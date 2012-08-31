
(setq user-mail-address "piet@10to1.be")
(setq user-full-name "Piet Jaspers")
(setq tags-file-name ".TAGS")

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq mac-emulate-three-button-mouse nil)

(prefer-coding-system 'utf-8)

; automatically clean up old buffers
(require 'midnight)

; pick up changes to files on disk automatically (ie, after git pull)
(global-auto-revert-mode 1)

;; nicer naming of buffers with identical names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

; autosave files in tmp dir
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

; disable backup files (foo~)
(setq backup-inhibited t)

;; Trying out [Smex](https://github.com/nonsequitur/smex/) as a better M-x
(require 'smex)
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;; Better buffer swithing
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; case insensitive matching
(add-to-list 'ido-ignore-files "\\.DS_Store")
(setq ido-create-new-buffer 'always) ; always create a new buffer with Ido
(setq ido-use-virtual-buffers t)

(put 'ido-exit-minibuffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
