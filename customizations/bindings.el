;; All my custom keybindings in one minor mode
;;
;; Idea from [here](http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs), now all my bindings are contained
;; to a single minor mode. Which is nice.

(defvar pj-bindings-map (make-keymap)
  "A keymap for custom bindings.")

;; ibuffer is a better buffer manager
(define-key pj-bindings-map (kbd "C-x C-b")  'ibuffer)
(define-key pj-bindings-map (kbd "C-x g") 'magit-status)
(define-key pj-bindings-map (kbd "M-a") 'align-to-equals)

(define-key pj-bindings-map (kbd "C-x p") 'pjaspers-ido-find-project)
(define-key pj-bindings-map (kbd "<f5>") 'pjaspers-open-notes-file)
(define-key pj-bindings-map (kbd "C-x r") 'pjaspers-ido-find-gem)
(define-key pj-bindings-map (kbd "C-x t") 'pjaspers-i18n-this)
(define-key pj-bindings-map (kbd "C-x C-g") 'pjaspers-bundle-line-for-gem)
(define-key pj-bindings-map (kbd "C-x C-n") 'pjaspers-pkg-line-for-npm)
(define-key pj-bindings-map (kbd "C-x 9") 'pjaspers-emoji-me)

;; Make it easier to hit M-x
;; http://steve.yegge.googlepages.com/effective-emacs
(define-key pj-bindings-map (kbd "C-x C-m") 'execute-extended-command)
(define-key pj-bindings-map (kbd "C-c C-m") 'execute-extended-command)

;; Prefer backward-kill-word over backspace
(define-key pj-bindings-map (kbd "C-w") 'backward-kill-word)
(define-key pj-bindings-map (kbd "C-x C-k") 'kill-region)
(define-key pj-bindings-map (kbd "C-c C-k") 'kill-region)

;; Use ag to search for things
(define-key pj-bindings-map (kbd "<f2>") 'ag)

;; Setup textmate-ish bindings right again.
(define-key pj-bindings-map (kbd "C-;") 'comment-line)
(define-key pj-bindings-map (kbd "M-t") 'projectile-find-file)

;; Putting replace in a handy place
(define-key pj-bindings-map (kbd "C-r") 'replace-regexp)

;; Use regex searches by default.
(define-key pj-bindings-map (kbd "C-s") 'isearch-forward-regexp)
(define-key pj-bindings-map (kbd "C-M-s") 'isearch-forward)
(define-key pj-bindings-map (kbd "C-M-r") 'isearch-backward)

;; ace
(define-key pj-bindings-map (kbd "C-c SPC") 'ace-jump-mode)

;; Multiple cursors
(define-key pj-bindings-map (kbd "C-S-c C-S-c") 'mc/edit-lines)
(define-key pj-bindings-map (kbd "C-.") 'mc/mark-next-like-this)
(define-key pj-bindings-map (kbd "C-,") 'mc/mark-previous-like-this)
(define-key pj-bindings-map (kbd "C-c C-.") 'mc/mark-all-like-this)

(define-key pj-bindings-map (kbd "C-c y") 'browse-kill-ring)

;; HIPSTER WRITER MODE.
(define-key pj-bindings-map (kbd "M-<f1>") 'pjaspers-toggle-margins)

;; Cool trick to show line numbers only when needed
(define-key pj-bindings-map [remap goto-line] 'wted-goto-line-with-feedback)

(define-minor-mode pj-bindings-mode
  "A mode that activates my custom bindings."
  t nil pj-bindings-map)
