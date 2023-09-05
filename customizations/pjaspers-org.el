;;; pjaspers-org --- Org-mode settings
;;
;;; Commentary:
;;
;; Org-mode is amazing.  I hardly use any of it and it's still great.
;;
;;; Code:
(setq org-directory "~/Documents/notes")
(setq org-agenda-files '("~/Documents/notes"))
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; Org-Roam specific
(setq org-roam-directory "/Users/pjaspers/Documents/notes")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
             "* TODO %?\n  %T\n%i\n  %a")
        ("n" "Note" entry (file+headline org-default-notes-file "Notes")
             "* %?\n:PROPERTIES:\n:Created: %U\n:END:\n  %i\n  %a")
        ("q" "Quote" entry (file+headline org-default-notes-file "Notes")
         "* %^{author} - %^{quote}")
        ("m" "Meeting" entry (file+headline org-default-notes-file "Notes")
         "* Meeting: %?\nEntered on %U\nAttendees:\nSummary:\nTodos:\n  %i\n  %a")
        ("u" "URL" entry (file+headline org-default-notes-file "Notes")
         "* %^{description}\n %^{url}")))

(setq org-refile-targets '((nil :maxlevel . 4)
                                ; all top-level headlines in the
                                ; current buffer are used (first) as a
                                ; refile target
                           (org-agenda-files :maxlevel . 4)))

;; provide refile targets as paths, including the file name
;; (without directory) as level 1 of the path
(setq org-refile-use-outline-path 'file)

;; allow to create new nodes (must be confirmed by the user) as
;; refile targets
(setq org-refile-allow-creating-parent-nodes 'confirm)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (shell . t)
   (sqlite . t)
   (deno . t)
   ))

(setq org-confirm-babel-evaluate nil)

;; Markdown export?
;; (with-eval-after-load 'ox
;;  (require 'ox-hugo))

(setq org-roam-dailies-directory "dailies/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))

(setq org-roam-capture-templates
      '(("d" "default" plain "%?"
        :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                           "#+title: Such ${title}\n")
        :unnarrowed t)))

(setq org-roam-mode-section-functions
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            #'org-roam-unlinked-references-section
            ))

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
    (org-roam-find-file title nil nil 'no-confirm)
    (org-paste-subtree)
    (unless has-properties
      (kill-line)
      (while (outline-next-heading)
        (org-promote)))
    (goto-char (point-min))
    (when has-properties
      (kill-line)
      (kill-line))))

(transient-define-prefix pj/transient-org()
    "Notekeeping"
    ["Such notekeeping"
     ["Actions"
      ("c" "Capture" org-capture)
      ("f" "Find or create node" org-roam-node-find)
      ("i" "Insert node" org-roam-node-insert)
      ("d" "Dailies" pj/transient-dailies)
      ("p" "Pinboard add" pinboard-add)
      ("n" "Create node from headline" org-roam-create-note-from-headline)
      ]
     ["Editing"
      ("i" "Insert node" org-roam-node-insert)
      ("a" "Add tag" org-roam-tag-add)
      ]
     ["Navigation"
      ("g" "Agenda" org-agenda)
      ("t" "Go to today note" org-roam-dailies-goto-today)
      ("r" "Go to random note" pj-random-node)
      ]
     ["Housekeeping"
      ("s" "Sync DB" org-roam-db-sync)
     ]])

(transient-define-prefix pj/transient-dailies()
    "Dailies"
    ["Dailies"
     ["Actions"
      ("t" "Go to today" org-roam-dailies-goto-today)
      ("c" "Capture today" org-roam-dailies-capture-today)
      ("G" "Go to date" org-roam-dailies-goto-date)
      ]
     ["Navigation"
      ("n" "next" org-roam-dailies-goto-next-note :transient t)
      ("p" "prev" org-roam-dailies-goto-previous-note :transient t)]])

(defun pj-random-node (&optional other-window)
  "Find and open a random Org-roam node.
With prefix argument OTHER-WINDOW, visit the node in another
window instead."
  (interactive current-prefix-arg)
  (let ((random-row (seq-random-elt (org-roam-db-query [:select [id file pos]
                                                                :from nodes
                                                                :where (not (like file '"%dailies%"))]))))
    (org-roam-node-visit (org-roam-node-create :id (nth 0 random-row)
                                               :file (nth 1 random-row)
                                               :point (nth 2 random-row))
                         other-window)))

(provide 'pjaspers-org)
;;; pjaspers-org.el ends here
