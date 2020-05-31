;; -*- mode: lisp -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(package-selected-packages
   (quote
    (rainbow-delimiters clojure-mode-extra-font-locking go-autocomplete exec-path-from-shell markdown-mode systemd edn go dart-mode wakatime-mode gradle-mode json-mode helm-cider cider fancy-battery dockerfile-mode git-timemachine zone-nyan midje-mode ac-cider scala-mode buffer-sets paredit json-reformat rainbow-identifiers nyan-prompt rainbow-blocks 4clojure clojure-mode yaml-mode lua-mode whitespace-cleanup-mode ag go-mode neotree company nyan-mode helm-fuzzy-find helm-projectile helm-ag helm projectile magit solarized-theme))))




(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

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
(set-face-attribute 'default nil :height 110 :family "Monaco")

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

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

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

(add-hook 'after-init-hook #'fancy-battery-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
)
(add-hook 'go-mode-hook 'my-go-mode-hook)

(global-wakatime-mode)


;; clojure stuff
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(require 'clojure-mode-extra-font-locking)
(add-hook 'clojure-mode-hook
          (lambda ()
            (setq inferior-lisp-program "lein repl")
            (global-hl-line-mode 1)
            (font-lock-add-keywords
             nil
             '(("(\\(facts?\\)"
                (1 font-lock-keyword-face))
               ("(\\(background?\\)"
                (1 font-lock-keyword-face))))
            (define-clojure-indent (fact 1))
            (define-clojure-indent (facts 1))
            (rainbow-delimiters-mode)))

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)

(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; clojure - cider stuff
(add-hook 'cider-mode-hook 'eldoc-mode)

;; go right to the REPL buffer when it's finished connecting
(setq cider-repl-pop-to-buffer-on-connect t)

;; When there's a cider error, show its buffer and switch to it
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; Where to store the cider history.
(setq cider-repl-history-file "~/.emacs.d/cider-history")

;; Wrap when navigating history.
(setq cider-repl-wrap-history t)

;; enable paredit in your REPL
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Use clojure mode for other extensions
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
(add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode))


;; key bindings
;; these help me out with the way I usually develop web apps
(defun cider-start-http-server ()
  (interactive)
  (cider-load-current-buffer)
  (let ((ns (cider-current-ns)))
    (cider-repl-set-ns ns)
    (cider-interactive-eval (format "(println '(def server (%s/start))) (println 'server)" ns))
    (cider-interactive-eval (format "(def server (%s/start)) (println server)" ns))))

(defun cider-refresh ()
  (interactive)
  (cider-interactive-eval (format "(user/reset)")))

(defun cider-user-ns ()
  (interactive)
  (cider-repl-set-ns "user"))

(eval-after-load 'cider
  '(progn
     (define-key clojure-mode-map (kbd "C-c C-v") 'cider-start-http-server)
     (define-key clojure-mode-map (kbd "C-M-r") 'cider-refresh)
     (define-key clojure-mode-map (kbd "C-c u") 'cider-user-ns)
     (define-key cider-mode-map (kbd "C-c u") 'cider-user-ns)))


;; company autocomplete stuff
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)


;; emacs server
(server-start)
