;;; pjaspers-js --- JS, can't live with it, pass the beernuts.
;;
;;; Commentary:
;;
;;; Code:
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))


(defun pjaspers-js-hook ()
  "Hooks for JS mode."
  (setq js2-basic-offset 2
        js-indent-level 2
        js2-bounce-indent-p t
        ))

(add-hook 'js-mode-hook 'pjaspers-js-hook)

(provide 'pjaspers-js)
;;; pjaspers-js.el ends here
