; general
;; ibuffer is a better buffer manager
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key "\C-xg" 'magit-status)

(global-set-key "\M-a" 'align-to-equals)

(global-set-key "\C-xp" 'pjaspers-ido-find-project)
(global-set-key "\C-xr" 'pjaspers-ido-find-gem)
(global-set-key "\C-xt" 'pjaspers-i18n-this)
(global-set-key "\C-x\C-g" 'pjaspers-bundle-line-for-gem)
(global-set-key "\C-x\C-n" 'pjaspers-pkg-line-for-npm)

;; Steve Yegge · Effective Emacs ·
;; http://steve.yegge.googlepages.com/effective-emacs
(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-c\C-m" 'smex)

;; Prefer backward-kill-word over backspace
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Grep is pretty heavily used.
(global-set-key [f2] 'rgrep)

;; Trying out a handy binding for feature branches
(global-set-key "\C-c\C-n" 'magit-create-branch)

;; Setup textmate bindings right again.
(global-set-key [(control \;)] 'comment-or-uncomment-region-or-line)
(global-set-key [(meta t)] 'textmate-goto-file)
(global-set-key [(meta shift t)] 'textmate-goto-symbol)

;; Putting replace in a handy place
(global-set-key (kbd "\C-r") 'replace-regexp)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

; vim emulation
(global-set-key [C-tab] 'other-window)

;; ace
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-.") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c y") 'browse-kill-ring)

;; Fullscreen shortcut
(global-set-key [M-f1] 'pjaspers-toggle-margins)

;; Cool trick to show line numbers only when needed
(global-set-key [remap goto-line] 'wted-goto-line-with-feedback)
