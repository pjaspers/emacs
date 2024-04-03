;; This emacs won't start itself, let's dig in.
;;
;;
;; Make sure that no matter where this config is stored, much like the
;; Iron Giant, it can always find its parts.
(setq org-roam-v2-ack t)
(defvar pjaspers-start-directory
  user-emacs-directory
  "Directory where emacs loaded from")

(defconst pjaspers-customizations-directory
  (expand-file-name (concat pjaspers-start-directory "customizations/"))
  "Has most of the emacs config")

(defconst pjaspers-elisp-directory
  (expand-file-name (concat pjaspers-start-directory "elisp/"))
  "Has the lisp functions")

(defconst pjaspers-custom-file
  (expand-file-name (concat pjaspers-start-directory "custom.el"))
  "Such custom")

(defconst pjaspers-scratch-file
  (expand-file-name (concat pjaspers-start-directory "scratch.el"))
  "I have a bad habit of stuffing everything in that one")

;; Load custom.el if any
(setq custom-file pjaspers-custom-file)
(when (file-exists-p custom-file) (load "custom"))

;; Fix env variables, so that we can use them in the rest of the config
(require 'exec-path-from-shell)
(dolist (var '("LANG" "LC_CTYPE" "HOMEBREW_PREFIX"))
  (add-to-list 'exec-path-from-shell-variables var))

;; OS X has an issue with picking up the right system env
;; Explictly setting it here (So shell-command and buddies can use it)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(defconst pjaspers-homebrew
  (getenv "HOMEBREW_PREFIX")
  "Homebrew prefix")

;; Homebrew dir
;; (getenv "HOMEBREW_PREFIX")
(let ((default-directory (concat pjaspers-homebrew "/share/emacs/site-lisp/")))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path pjaspers-customizations-directory)

(require 'pjaspers-packages)

;; Emacs stuff
(require 'pjaspers-config)
(require 'pjaspers-ui)
(require 'pjaspers-mac)
(require 'pjaspers-buffers)

;; Globally used
(require 'pjaspers-editing)
(require 'pjaspers-vc)

;; Targeted modes
(require 'pjaspers-go)
(require 'pjaspers-js)
(require 'pjaspers-modes)
(require 'pjaspers-org)
(require 'pjaspers-ruby)
(require 'pjaspers-shell)
(require 'pjaspers-web)

;; All the keybindings
(require 'pjaspers-bindings)

(require 'pjaspers-little-drawer)

(add-to-list 'load-path pjaspers-elisp-directory)
(load "defuns")            ;; Lisp helper functions
(put 'narrow-to-region 'disabled nil)
