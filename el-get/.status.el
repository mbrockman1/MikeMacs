((auctex status "required" recipe nil)
 (auto-pair-plus status "installed" recipe
		 (:name auto-pair-plus :description "Autopair handler to extend Autopair behavior." :type github :pkgname "emacsmirror/auto-pair-plus" :autoloads nil :depends autopair))
 (autopair status "installed" recipe
	   (:name autopair :website "https://github.com/capitaomorte/autopair" :description "Autopair is an extension to the Emacs text editor that automatically pairs braces and quotes." :type github :pkgname "capitaomorte/autopair" :features autopair))
 (autopep8 status "installed" recipe
	   (:name autopep8 :description "autopep8 wrapper for emacs" :type http :url "https://gist.github.com/whirm/6122031/raw/28d0d47a95a9006b7fbb8d5ac5203577c52b9534/autopep8.el" :features autopep8))
 (cdlatex-mode status "installed" recipe
	       (:name cdlatex-mode :description "a minor mode which re-implements many features also found in the AUCTeX LaTeX mode." :type http :url "http://staff.science.uva.nl/~dominik/Tools/cdlatex/cdlatex.el"))
 (company-mode status "installed" recipe
	       (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (cython-mode status "installed" recipe
	      (:name cython-mode :description "Major mode for the Cython language" :type http :url "https://raw.github.com/cython/cython/master/Tools/cython-mode.el" :features cython-mode :localname "cython-mode.el"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (find-file-in-project status "installed" recipe
		       (:name find-file-in-project :type github :pkgname "technomancy/find-file-in-project" :description "Quick access to project files in Emacs"))
 (flyspell status "installed" recipe
	   (:name flyspell :website "http://www-sop.inria.fr/members/Manuel.Serrano/flyspell/flyspell.html" :description "On-the-fly spell checker." :type http :url "http://www-sop.inria.fr/members/Manuel.Serrano/flyspell/flyspell-1.7q.el"))
 (highlight-indentation status "installed" recipe
			(:name highlight-indentation :description "Function for highlighting indentation" :type git :url "https://github.com/antonj/Highlight-Indentation-for-Emacs"))
 (ispell-multi status "installed" recipe
	       (:name ispell-multi :description "Multiple ispell processes and multiple flyspell languages" :website "http://www.dur.ac.uk/p.j.heslin/Software/Emacs" :type http :url "http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/ispell-multi.el" :localname "ispell-multi.el.gz" :features ispell-multi))
 (latex-preview-pane status "installed" recipe
		     (:name latex-preview-pane :website "http://www.emacswiki.org/emacs/LaTeXPreviewPane" :description "latex-preview-pane is a minor mode for Emacs that enables you to preview your LaTeX files directly in Emacs. It supports PDF previews, your choice of pdflatex or xelatex, and it highlights errors in your LaTeX buffer." :type github :pkgname "jsinglet/latex-preview-pane"))
 (let-alist status "installed" recipe
	    (:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type elpa :url "https://elpa.gnu.org/packages/let-alist.html"))
 (manage-minor-mode status "installed" recipe
		    (:name manage-minor-mode :description "Manage your minor-mode on the dedicated interface buffer." :type github :pkgname "ShingoFukuyama/manage-minor-mode"))
 (org-mode status "installed" recipe
	   (:name org-mode :website "http://orgmode.org/" :description "Org-mode is for keeping notes, maintaining ToDo lists, doing project planning, and authoring with a fast and effective plain-text system." :type git :url "git://orgmode.org/org-mode.git" :info "doc" :build/berkeley-unix `,(mapcar
																																				       (lambda
																																					 (target)
																																					 (list "gmake" target
																																					       (concat "EMACS="
																																						       (shell-quote-argument el-get-emacs))))
																																				       '("oldorg"))
		  :build `,(mapcar
			    (lambda
			      (target)
			      (list "make" target
				    (concat "EMACS="
					    (shell-quote-argument el-get-emacs))))
			    '("oldorg"))
		  :load-path
		  ("." "contrib/lisp" "lisp")
		  :load
		  ("lisp/org-loaddefs.el")))
 (org-wiki status "installed" recipe
	   (:name org-wiki :url "https://raw.githubusercontent.com/caiorss/org-wiki/master/org-wiki.el" :description "Emacs' desktop wiki built with org-mode" :features
		  (org-wiki)
		  :type http :after nil))
 (pkg-info status "installed" recipe
	   (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
		  (dash epl)))
 (py-autopep8 status "installed" recipe
	      (:name py-autopep8 :description "Use autopep8 to beautify a Python buffer." :type github :pkgname "paetzke/py-autopep8.el"))
 (pyvenv status "installed" recipe
	 (:name pyvenv :website "https://github.com/jorgenschaefer/pyvenv" :description "Python virtual environment interface for Emacs" :type github :pkgname "jorgenschaefer/pyvenv" :post-init
		(el-get-envpath-prepend "PYTHONPATH" default-directory)))
 (rope status "installed" recipe
       (:name rope :description "A python refactoring library" :post-init
	      (el-get-envpath-prepend "PYTHONPATH" default-directory)
	      :type git :url "https://github.com/python-rope/rope.git"))
 (ropemacs status "installed" recipe
	   (:name ropemacs :description "An Emacs minor mode for using rope python refactoring library in emacs." :post-init
		  (progn
		    (unless
			(boundp 'pymacs-load-path)
		      (setq pymacs-load-path nil))
		    (add-to-list 'pymacs-load-path default-directory))
		  :depends
		  (rope ropemode pymacs)
		  :type git :url "https://github.com/python-rope/ropemacs"))
 (ropemode status "installed" recipe
	   (:name ropemode :description "Common parts of ropemacs and ropevim." :post-init
		  (progn
		    (unless
			(boundp 'pymacs-load-path)
		      (setq pymacs-load-path nil))
		    (add-to-list 'pymacs-load-path default-directory))
		  :type git :url "https://github.com/python-rope/ropemode"))
 (s status "installed" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (seq status "installed" recipe
      (:name seq :description "Sequence manipulation library for Emacs" :builtin "25" :type github :pkgname "NicolasPetton/seq.el"))
 (virtualenvwrapper status "installed" recipe
		    (:name virtualenvwrapper :type github :website "https://github.com/porterjamesj/virtualenvwrapper.el" :description "virtualenv tool for emacs" :pkgname "porterjamesj/virtualenvwrapper.el" :depends
			   (dash s)))
 (yasnippet status "installed" recipe
	    (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
		   (("git" "submodule" "update" "--init" "--" "snippets")))))
