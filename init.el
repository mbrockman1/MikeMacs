(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(require 'package)

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mouse-1-click-in-non-selected-windows t)
 '(org-agenda-files nil)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 6))))
 '(package-selected-packages
   (quote
    (elpy jedi exec-path-from-shell flycheck-pyflakes flycheck pep8 ipython neotree muse manage-minor-mode cython-mode org-wiki helm-core auto-package-update elscreen dashboard workgroups2 slack guide-key discover go-mode better-shell simpleclip ob-ipython ein linum-relative py-autopep8 zenburn-theme floobits smex helm evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

(require 'evil)
(evil-mode 1)

(show-paren-mode 1)

(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save") t)))

(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
            backup-by-copying t    ; Don't delink hardlinks
            version-control t      ; Use version numbers on backups
            delete-old-versions t  ; Automatically delete excess backups
            kept-new-versions 20   ; how many of the newest versions to keep
            kept-old-versions 20    ; and how many of the old
            )

(setq mac-option-modifier 'meta) ; set alt-key to meta
(setq mac-escape-modifier nil) ; set esc-key to nil

(ido-mode 1)
(setq org-completion-use-ido t)

(load-theme 'zenburn t)

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(global-flycheck-mode)
(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq-default flycheck-flake8-maximum-line-length 79)

(require 'smex)
(smex-initialize)

(require 'autopair)
(autopair-global-mode 1)

(global-linum-mode t)
(setq global-linum-mode t)
(setq linum-format "%d \u2502 ")

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)


(require 'projectile)
(projectile-mode 1)

(require 'dashboard)
(dashboard-setup-startup-hook)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)


(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png which displays whatever image you would prefer

(setq dashboard-items '((recents  . 5)
(bookmarks . 5)
(projects . 5)))

;; Pymacs
(add-to-list 'load-path "~/.emacs.d/el-get/pymacs")
(setq pymacs-load-path '( "~/.emacs.d/el-get/rope"
                          "~/.emacs.d/el-get/ropemode"
                          "~/.emacs.d/el-get/ropemacs"))
(add-to-list 'load-path "~/.emacs.d/el-get/rope")
(add-to-list 'load-path "~/.emacs.d/el-get/ropemode")
(add-to-list 'load-path "~/.emacs.d/el-get/ropemacs")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(add-to-list 'load-path "/Users/michael/.emacs.d/el-get/freex/") (load "freex-conf")

(require 'org-wiki)
(org-wiki-make-menu)
(setq org-wiki-location "~/Dropbox/org_notes/")

(defvar ido-dont-ignore-buffer-names '("*dashboard*"))

(defun ido-ignore-most-star-buffers (name)
  (and
   (string-match-p "^*" name)
   (not (member name ido-dont-ignore-buffer-names))))

(setq ido-ignore-buffers (list "\\` " #'ido-ignore-most-star-buffers))
(kill-buffer "*Messages*")
(kill-buffer "*Pymacs*")
(kill-buffer "*scratch*")


;Jedi.el
(require 'jedi)
(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:key-show-doc (kbd "C-c d"))
(ac-linum-workaround)
(setq py-autopep8-options '("--max-line-length=79"))
