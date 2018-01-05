;;; pjaspers-web --- Making web development nicer
;;
;;; Commentary:
;;
;;; Code:
;; Enable Emmet mode: http://emmet.io/
;; Emmet is a plugin for many popular text editors which greatly improves HTML & CSS workflow
(require 'emmet-mode)

;; It's not perfect, but it does the job.
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.scss?\\'" . sass-mode))

(defun pjaspers-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-quoting nil
        emmet-indentation 2)

  (emmet-mode t))

(add-hook 'web-mode-hook  'pj-web-mode-hook)

(provide 'pjaspers-web)
;;; pjaspers-web.el ends here
