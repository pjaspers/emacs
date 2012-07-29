; general
;; ibuffer is a better buffer manager
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key "\C-xg" 'magit-status)

(global-set-key "\M-a" 'align-to-equals)

(global-set-key "\C-xp" 'pjaspers-ido-find-project)
(global-set-key "\C-xr" 'pjaspers-ido-find-gem)
(global-set-key "\C-xt" 'pjaspers-i18n-this)

;; Steve Yegge · Effective Emacs ·
;; http://steve.yegge.googlepages.com/effective-emacs
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

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
(global-set-key [(meta t)] 'peepopen-goto-file-gui)
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
