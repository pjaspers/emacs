
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

(setq deft-directory "~/Documents/notes")
(setq deft-recursive t)

(set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)

(use-package selectrum
  :ensure t)
(use-package prescient
  :ensure t)
(use-package selectrum-prescient
  :ensure t)
(use-package marginalia
:ensure t)
(use-package mini-frame
:ensure t)
(ido-mode 'nil)
(mini-frame-mode +1)
(selectrum-mode +1)
(selectrum-prescient-mode +1)
(prescient-persist-mode +1)
(marginalia-mode +1)
(advice-add #'marginalia-cycle :after
              (lambda () (when (bound-and-true-p selectrum-mode) (selectrum-exhibit))))
(use-package embark
  :ensure t
  :bind
  ("C-A-a" . embark-act))
(use-package consult
  :ensure t)
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . embark-consult-preview-minor-mode))

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
        completion-category-overrides '((file (styles partial-completion)))))

(setq selectrum-extend-current-candidate-highlight t)
(set-face-attribute 'selectrum-current-candidate nil
  :background "#F6FECD")

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
  (vertico-mode))

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

(define-transient-command pj/transient-org
    "Dailies"
    [:description
     "Dailies"
     ["Actions"
      ("c" "Capture" org-capture)
      ("a" "Agenda" org-agenda)
      ("f" "Find or create node" org-roam-node-find)
      ("i" "Insert node" org-roam-node-insert)
      ("d" "Dailies" pj/transient-dailies)
      ("r" "Create node from headline" org-roam-create-note-from-headline)
      ]])

(define-transient-command pj/transient-dailies
    "Dailies"
    [:description
     "Dailies"
     ["Actions"
      ("d" "Go to today" org-roam-dailies-goto-today)
      ("c" "Capture today" org-roam-dailies-capture-today)
      ("G" "Go to date" org-roam-dailies-goto-date)
      ("i" "More fun" pj/dailies)
      ]
     ["Navigation"
      ("n" "next" org-roam-dailies-goto-next-note :transient t)
      ("p" "prev" org-roam-dailies-goto-previous-note :transient t)]])

(provide 'pjaspers-little-drawer)
;;; pjaspers-litte-drawer.el ends here
