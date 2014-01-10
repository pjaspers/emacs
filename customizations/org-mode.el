(setq org-directory "~/Dropbox/Documents/Personal/notes")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)


(setq org-refile-targets '((nil :maxlevel . 2)
                                ; all top-level headlines in the
                                ; current buffer are used (first) as a
                                ; refile target
                           (org-agenda-files :maxlevel . 2)))

;; provide refile targets as paths, including the file name
;; (without directory) as level 1 of the path
(setq org-refile-use-outline-path 'file)

;; allow to create new nodes (must be confirmed by the user) as
;; refile targets
(setq org-refile-allow-creating-parent-nodes 'confirm)

(setq org-agenda-files '("~/Dropbox/Documents/Personal/notes"))

;; MobileOrg
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrgBeta/")
(setq org-mobile-inbox-for-pull "~/Dropbox/Documents/Personal/notes/from-mobile.org")
