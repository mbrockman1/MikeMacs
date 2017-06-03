;;; org-brain-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "org-brain" "org-brain.el" (22820 16284 0 0))
;;; Generated autoloads from org-brain.el

(autoload 'org-brain-invalidate-all-caches "org-brain" "\
Empty org-brain caches, in case modified outside `org-brain-visualize'.
This is a convenience function for those who (occasionally)
edit children, parents, i.e., entries in the Brainchildren
node, or pins, outside the org-brain-visualize interface. In
that case, you have to call this function manually. It is not
needed if children, parents, and pins are added using the
org-brain-visualize interface/mode.

\(fn)" t nil)

(autoload 'org-brain-build-caches "org-brain" "\
Build `org-brain-files' and `org-brain-pins'.

It is not necessary to use this function as the caches are built
lazily, automatically. However, this is just here if you want
to do some cache building ahead of time, for instance during
Emacs startup (at the cost of a longer Emacs startup) while you
grab your coffee.

A better solution could be to use `org-brain-activate-cache-saving'.

\(fn)" t nil)

(autoload 'org-brain-insert-link "org-brain" "\
Insert a link to an org-brain entry and suggest a description.

\(fn)" t nil)

(autoload 'org-brain-agenda "org-brain" "\
Like `org-agenda', but only for `org-brain-files'.

\(fn)" t nil)

(autoload 'org-brain-open "org-brain" "\
Open ENTRY file in `org-brain-path'. Prompt for ENTRY if not given.

\(fn &optional ENTRY)" t nil)

(autoload 'org-brain-rename-entry "org-brain" "\
Rename org-brain ENTRY to NEWNAME.
If run interactively the user will be prompted for ENTRY and NEWNAME.

All links to ENTRY in `org-brain-path' files will be converted to
NEWENTRY. The ENTRY file will also be renamed.

\(fn ENTRY NEWNAME)" t nil)

(autoload 'org-brain-visualize "org-brain" "\
View a concept map with ENTRY at the center.
IGNORED-SIBLINGS, a list of org-brain entries, can be provided to
ignore certain sibling links to show. Unless NOFOCUS is non-nil,
the concept map buffer will gain focus.

\(fn ENTRY &optional IGNORED-SIBLINGS NOFOCUS)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; org-brain-autoloads.el ends here
