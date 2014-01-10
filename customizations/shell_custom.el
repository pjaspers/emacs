; Homebrew path
(add-to-list 'exec-path "/usr/local/bin")

; PDF LaTeX
(add-to-list 'exec-path "/usr/local/texlive/2011basic/bin/universal-darwin")

;; OS X has an issue with picking up the right system env
;; Explictly setting it here (So shell-command and buddies can use it)
(setq path "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/sbin:/AdobeAIRSDK/bin:/usr/local/share/npm/bin:/usr/local/texlive/2011basic/bin/universal-darwin/")

(setenv "PATH" path)

; can't write over prompt, that would be weird
(setq comint-prompt-read-only)

; colorful shell
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq ansi-term-color-vector [unspecified "#000000" "#963F3C" "#5FFB65" "#FFFD65" "#0082FF" "#FF2180" "#57DCDB" "#FFFFFF"])
