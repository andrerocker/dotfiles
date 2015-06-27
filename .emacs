;; -*- mode: lisp -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;- Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4"
     "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized)))))


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
(set-face-attribute 'default nil :height 140)

(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%4d ")
(winner-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)


;;
;; Packages Settings
;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(defvar my-packages '(solarized-theme helm helm-projectile magit))

(package-initialize)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; package loading (stolen from brunneca, that stoled from chuck, that stoled from milhouse)
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

(require 'helm-config)
(helm-mode t)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq helm-quick-update t)
(setq helm-buffers-fuzzy-matching t)

(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "M-g c") 'magit-checkout)

(require 'projectile)
(projectile-global-mode)
(global-set-key (kbd "C-x f") 'helm-projectile)
