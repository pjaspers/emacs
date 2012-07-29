; use default Mac browser
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

; delete files by moving them to the OS X trash
(setq delete-by-moving-to-trash t)

;; Always open in the same window
(setq ns-pop-up-frames nil)

;; Fullscreen shortcut
(global-set-key [f1] 'ns-toggle-fullscreen)

;; Set alt to be meta, to be in line with terminal use.
(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta nil)
(setq mac-command-modifier 'alt)
(setq mac-option-modifier 'meta)
