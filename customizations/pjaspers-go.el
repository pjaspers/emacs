;;; pjaspers-go --- Le Go
;;
;;; Commentary:
;;
;; Make working with go a little bit nicer
;;
;;; Code:
;;

(defun pjaspers-go-mode-hook ()
  "Load whenever go gets loaded"

  (exec-path-from-shell-copy-env "GOPATH")
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook #'gofmt-before-save)
  (local-set-key (kbd "M-.") #'godef-jump)
  )

(add-hook 'go-mode-hook 'pjaspers-go-mode-hook)

(provide 'pjaspers-go)
;;; pjaspers-go.el ends here
