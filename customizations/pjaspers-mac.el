;;; pjaspers-mac --- Make Emacs work better on the Mac
;;
;;; Commentary:
;;
;; macOS is the worst OS, except for all the others.
;;
;;; Code:
;;
; use default Mac browser
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

(setq mac-emulate-three-button-mouse nil)

; delete files by moving them to the OS X trash
(setq delete-by-moving-to-trash t)

;; Always open in the same window
(setq ns-pop-up-frames nil)

;; Use sane fullscreen until Sea Lion fixes fullscreen apps.
;; [Source](http://crypt.codemancers.com/posts/2013-07-05-non-native-fullscreen-for-osx-on-emacs-24-dot-3/)
(setq ns-use-native-fullscreen nil)

;; Use srgb
(setq ns-use-srgb-colorspace t)

;; Fullscreen shortcut
;; (global-set-key [f1] 'toggle-frame-fullscreen)
;; http://stackoverflow.com/questions/9248996/how-to-toggle-fullscreen-with-emacs-as-default
(defun switch-fullscreen nil
  "Switch between sensible definitions of full screen."
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

(provide 'pjaspers-mac)
;;; pjaspers-mac.el ends here
