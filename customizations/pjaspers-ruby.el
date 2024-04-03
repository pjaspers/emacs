;;; pjaspers-ruby --- Rubies
;;
;;; Commentary:
;;
;; This makes working with Ruby just a little bit nicer.
;;
;;; Code:
;;
;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.cap\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.podspec\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Berksfile\\'" . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("Appraisals\\'" . ruby-ts-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

;; Look up symbols in ruby `ri' to using yari.
(define-key 'help-command (kbd "R") 'yari)

;; Use chruby for switching rubies
(require 'chruby)
(require 'chruby nil t)
(if (featurep 'chruby) (chruby "ruby-3.1.4"))

(require 'rubocop)

;; Making inf-ruby work with pry
;; (require 'inf-ruby)
;; (add-to-list 'inf-ruby-implementations '("pry" . "pry"))
;; (setq inf-ruby-default-implementation "pry")
;; (setq inf-ruby-first-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)> *")
;; (setq inf-ruby-prompt-pattern "^\\[[0-9]+\\] pry\\((.*)\\)[>*\"'] *")

;; setup ruby buffers
(defun pjaspers-ruby-ts-mode-hook ()
  "Load whenever ruby gets loaded."
  (whitespace-mode 1)
  (setq ruby-insert-encoding-magic-comment nil)
  ;; enable a REPL process loaded with your
  ;; ruby project that provides lots of code insight.
  ;; https://github.com/nonsequitur/inf-ruby
  ;; (inf-ruby-minor-mode +1)

  ;; CamelCase aware editing operations
  (subword-mode +1))

(add-hook 'ruby-ts-mode-hook 'pjaspers-ruby-ts-mode-hook)


(provide 'pjaspers-ruby)
;;; pjaspers-ruby.el ends here
