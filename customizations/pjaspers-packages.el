;;; pjaspers-packages --- Load any packages we need
;;
;;; Commentary:
;;
;; At the moment I'm using cask, this might change, but this file should always
;; load the packages and make them available to Emacs.
;;
;;; Code:
;;
;; Let's use use-package
(customize-set-variable 'package-archives
                        '(("org" . "https://orgmode.org/elpa/")
                          ("melpa" . "https://melpa.org/packages/")
                          ("gnu" . "https://elpa.gnu.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)





;; pjaspers-ruby
(use-package chruby
  :ensure t)
(use-package inf-ruby
  :ensure t)
(use-package yaml-mode
  :ensure t)
(use-package robe
  :ensure t)
(use-package rubocop
  :ensure t)
(use-package yari
  :ensure t)
(use-package eglot
  ;; no :ensure t here because it's built-in

  ;; Configure hooks to automatically turn-on eglot for selected modes
  :custom
  (eglot-send-changes-idle-time 0.1)

  :config
  (fset #'jsonrpc--log-event #'ignore)  ; massive perf boost---don't log every event
  ;; Sometimes you need to tell Eglot where to find the language server
                                        ; (add-to-list 'eglot-server-programs
                                        ;              '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))
  )
;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs '((ruby-mode ruby-ts-mode) "ruby-lsp")))

;; pjaspers-web
(use-package web-mode
  :ensure t)
(use-package emmet-mode
  :ensure t)
(use-package sass-mode
  :ensure t)

;; pjaspers-js
(use-package markdown-mode
  :ensure t)
(use-package edit-indirect
  :ensure t)
(use-package graphviz-dot-mode
  :ensure t)

;; pjaspers-vc
(use-package magit
  :ensure t)

;; pjaspers-editing
(use-package dumb-jump
  :ensure t)
(use-package expand-region
  :ensure t)
(use-package smartparens
  :ensure t)

;; pjaspers-shell
(use-package exec-path-from-shell
  :ensure t)

;; pjaspers-global
(use-package flx-ido
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package ag
  :ensure t)
(use-package rainbow-delimiters
  :ensure t)

(use-package ob-deno :ensure t)

;; pjaspers-ui

;; pjaspers-buffers

(use-package org-roam
  :ensure t)

(provide 'pjaspers-packages)
;;; pjaspers-packages.el ends here

(require 'use-package)
