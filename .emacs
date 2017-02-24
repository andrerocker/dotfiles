;; -*- mode: lisp -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(package-selected-packages
   (quote
    (git-timemachine zone-nyan midje-mode ac-cider scala-mode buffer-sets paredit json-reformat rainbow-identifiers nyan-prompt rainbow-blocks cider 4clojure clojure-mode yaml-mode lua-mode whitespace-cleanup-mode ag go-mode neotree company nyan-mode helm-fuzzy-find helm-projectile helm-ag helm projectile magit solarized-theme))))

;;
;; Emacs custom appearence settings
;;

(setq
  inhibit-splash-screen t
  inhibit-startup-message t
  column-number-mode t
  ring-bell-function 'ignore
  redisplay-dont-pause t)

(menu-bar-mode -99)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 120)

(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%4d ")
(winner-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(setq
 ;; default directory
 default-directory (concat (getenv "HOME"))

 ;; disable backup files
 make-backup-files nil
 auto-save-default nil
 backup-inhibited t

 ;; If a frame alredy opened, use it!
 display-buffer-reuse-frames t
)

;; make indentation commands use space only
(setq-default indent-tabs-mode nil)

(setq explicit-shell-file-name "/bin/zica")
(display-time-mode)

;;
;; Packages Settings
;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(defvar my-packages
  '(clojure-mode yaml-mode lua-mode whitespace-cleanup-mode ag go-mode neotree company nyan-mode helm-fuzzy-find helm-projectile helm-ag helm projectile magit solarized-theme))

;;
;; Emacs custom appearence settings
;;

(setq
  inhibit-splash-screen t
  inhibit-startup-message t
  column-number-mode t
  ring-bell-function 'ignore
  redisplay-dont-pause t)

(menu-bar-mode -99)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 120)

(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%4d ")
(winner-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(setq
 ;; default directory
 default-directory (concat (getenv "HOME") "/andre/work/")

 ;; disable backup files
 make-backup-files nil
 auto-save-default nil
 backup-inhibited t

 ;; If a frame alredy opened, use it!
 display-buffer-reuse-frames t
)

;; make indentation commands use space only
(setq-default indent-tabs-mode nil)

(setq explicit-shell-file-name "/bin/zica")
(display-time-mode)

;;
;; Packages Settings
;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(defvar my-packages
  '(lua-mode whitespace-cleanup-mode ag go-mode neotree company nyan-mode helm-fuzzy-find helm-projectile helm-ag helm projectile magit solarized-theme))

(package-initialize)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; package loading (stolen from brunneca, that stoled from chuck,
;; that stoled from milhouse)
(setq packaged-contents-refreshed-p nil)
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (condition-case ex
  (package-install p)
  ('error (if packaged-contents-refreshed-p
      (error ex)
    (package-refresh-contents)
    (setq packaged-contents-refreshed-p t)
    (package-install p))))))

(load-theme 'solarized-dark)
(setq magit-last-seen-setup-instructions "1.4.0")

;;
;; Custom Plugin Settings
;;

(require 'helm-config)
(helm-mode t)

(setq helm-quick-update t)
(setq helm-buffers-fuzzy-matching t)

(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "M-g c") 'magit-checkout)

(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-x f") 'helm-projectile)
(setq projectile-enable-caching t)

(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
(setq helm-projectile-sources-list '(helm-source-projectile-buffers-list
				     helm-source-projectile-files-list))

(require 'nyan-mode)
(nyan-mode)

(defun fullscreen ()
       (interactive)
       (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-.") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c u") (lambda (&optional arg) (interactive "P") (move-beginning-of-line arg) (kill-line)))
(global-set-key (kbd "C-x C-a") '(lambda ()(interactive)(ansi-term "/bin/zica")))
(global-set-key (kbd "C-x C-,") 'fullscreen)
(global-set-key (kbd "C-x /") 'rename-buffer)

;; Use emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

;; Use utf-8 in ansi-term
(defadvice ansi-term (after advise-ansi-term-coding-system)
	       (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(defun default-buffer ()
  (ansi-term "/bin/zica")
  (rename-buffer "etc-term"))

(add-hook 'ruby-mode-hook 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-company-mode)

(require 'auto-complete-config)
(setq ac-delay 0.0)
(setq ac-quick-help-delay 0.5)
(ac-config-default)

(show-paren-mode 1)

(default-buffer)


