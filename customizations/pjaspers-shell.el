;;; pjaspers-shell --- Working with and displaying shell
;;
;;; Commentary:
;;
;; This is cheating.  It does 2 things, it makes Emacs work with the shell and
;; it sets up working with shell files.
;;
;;; Code:
;; Homebrew path
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path (concat pjaspers-homebrew "/bin"))

; PDF LaTeX
(add-to-list 'exec-path "/Library/TeX/texbin")

; can't write over prompt, that would be weird
(setq comint-prompt-read-only t)

; colorful shell
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq ansi-term-color-vector [unspecified "#000000" "#963F3C" "#5FFB65" "#FFFD65" "#0082FF" "#FF2180" "#57DCDB" "#FFFFFF"])

;; bash
(add-to-list 'auto-mode-alist '("\\.bashrc\\'" . sh-mode))

;; zsh
(add-to-list 'auto-mode-alist '("\\.zshrc\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zsh$\\'" . sh-mode))
(provide 'pjaspers-shell)
;;; pjaspers-shell.el ends here
