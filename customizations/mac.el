; use default Mac browser
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

; delete files by moving them to the OS X trash
(setq delete-by-moving-to-trash t)

;; Always open in the same window
(setq ns-pop-up-frames nil)

;; Fullscreen shortcut
;; (global-set-key [f1] 'toggle-frame-fullscreen)
;; http://stackoverflow.com/questions/9248996/how-to-toggle-fullscreen-with-emacs-as-default
(defun switch-fullscreen nil
  (interactive)
  (let* ((modes '(nil fullboth fullwidth fullheight))
         (cm (cdr (assoc 'fullscreen (frame-parameters) ) ) )
         (next (cadr (member cm modes) ) ) )
    (modify-frame-parameters
     (selected-frame)
     (list (cons 'fullscreen next)))))

(define-key global-map [f1] 'switch-fullscreen)


;; Set alt to be meta, to be in line with terminal use.
(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta nil)
(setq mac-command-modifier 'alt)
(setq mac-option-modifier 'meta)
