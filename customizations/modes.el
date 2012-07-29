;; all modes
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; bash
(setq auto-mode-alist (cons '("\\.bashrc" . sh-mode) auto-mode-alist))

;; zsh
(setq auto-mode-alist (cons '("\\.zshrc" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.zsh$" . sh-mode) auto-mode-alist))

;; Obj-C
(setq auto-mode-alist (cons '("\\.m$" . objc-mode) auto-mode-alist))

;; Ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; Yaml
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
    '(lambda ()
       (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; Magit
(eval-after-load 'magit
  '(progn
     (setq magit-git-executable "/usr/local/bin/git")
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))
