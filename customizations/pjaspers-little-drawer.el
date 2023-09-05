
;;
;;; Commentary:
;;
;; No matter how much you clean, you'll always need a place to store alsdfkldsklfj
;; bunch of crap. This is usually a little drawer that eventually
;; piles out with useful and less useful stuff. At that point you
;; probably move things to places where they belong. But this is a
;; guilt-free zone to store things.
;;
;;; Code:
;;

(setenv "HUSKY_SKIP_HOOKS" "1")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)

(use-package prescient
  :ensure t)
(use-package marginalia
  :ensure t)
(use-package mini-frame
  :ensure t)
(ido-mode 'nil)
(mini-frame-mode +1)
(prescient-persist-mode +1)
(marginalia-mode +1)

(custom-set-variables
 '(mini-frame-show-parameters
   '((top . 10)
     (width . 0.8)
     (left . 0.2))))

(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))))
  :ensure t)

(require 'project)

(use-package vterm
  :ensure t)
(use-package pinboard
  :ensure t)

;; (require 'ox-confluence)

(use-package quickrun
  :ensure t)

(require 'quickrun)

;; selectrum like thing
(use-package vertico
  :init
  (vertico-mode)
  :ensure t)
(use-package vertico-prescient
  :init
  (vertico-prescient-mode)
  :ensure t)

(defun org-roam-create-note-from-headline ()
  "Create an Org-roam note from the current headline and jump to it.
Normally, insert the headline’s title using the ’#title:’ file-level property
and delete the Org-mode headline. However, if the current headline has a
Org-mode properties drawer already, keep the headline and don’t insert
‘#+title:'. Org-roam can extract the title from both kinds of notes, but using
‘#+title:’ is a bit cleaner for a short note, which Org-roam encourages."
  (interactive)
  (let ((title (nth 4 (org-heading-components)))
        (has-properties (org-get-property-block)))
    (org-cut-subtree)
    (org-roam-node-find nil title)
    (org-paste-subtree)
    (unless has-properties
      (kill-line)
      (while (outline-next-heading)
        (org-promote)))
    (goto-char (point-min))
    ))

(setq erc-email-userid "pjaspers/irc.libera.chat") ;; Example with Libera.Chat

(defun run-erc ()
  "Start erc with all things configured to join chat.sr.ht"
  (interactive)
  (erc-tls :server "chat.sr.ht"
           :port 6697
           :nick "pjaspers"
           :password "AKgzX2QAAAAAAAAIcGphc3BlcnOfeCWA/+7h4Nv+JbbO31hH0fE2DoofYSxBh4Fc86I1Zw"))

(use-package deadgrep :ensure t)

(defun thing (&rest _)
  (let* (
         (name (if (project-current) (project-name (project-current)) (buffer-file-name)))
         (default-color '("#335EA8" . "#85CEEB" ))
         (color (cond ((string-match "radio-api" (or name "")) '("#8D5EA8" . "white"))
                      ((string-match "radio-sites" (or name "")) '("#3BACA8" . "white"))
                      (t default-color))))
    (set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))

;; todo:
;; - make this bail earlier
;; - make this use the name as a kind of hashing thing for a color, so each project automagically has it
;; - roll it up in minor mode?
;; https://stackoverflow.com/questions/47456134/emacs-lisp-hooks-for-detecting-change-of-active-buffer
(add-hook 'post-command-hook 'thing)

(setq-default indicate-buffer-boundaries 'left)
(pixel-scroll-precision-mode)

;; Make right-click do something sensible
(when (display-graphic-p)
  (context-menu-mode))

;; which-key: shows a popup of available keybindings when typing a long key
;; sequence (e.g. C-x ...)
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(provide 'pjaspers-little-drawer)
;;; pjaspers-litte-drawer.el ends here
