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
 '(package-selected-packages
   (quote
    (muse manage-minor-mode cython-mode org-wiki helm-core auto-package-update elscreen dashboard workgroups2 slack guide-key discover go-mode jedi better-shell simpleclip ob-ipython ein linum-relative py-autopep8 zenburn-theme floobits smex helm evil-visual-mark-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'evil)
(evil-mode 1)

(setq mac-option-modifier 'meta) ; set alt-key to meta
(setq mac-escape-modifier nil) ; set esc-key to nil

(ido-mode 1)

(load-theme 'zenburn t)

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(require 'smex)
(smex-initialize)

(global-linum-mode t)
(setq global-linum-mode t)
(setq linum-format "%d \u2502 ")

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(require 'projectile)
(projectile-mode 1)

;; (x-focus-frame nil)

(require 'dashboard)
(dashboard-setup-startup-hook)

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
