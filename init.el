;; -*- lexical-binding: t -*-

;; 基础设置
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)
(global-hl-line-mode t)
(column-number-mode t)
(electric-indent-mode t)
(electric-pair-mode t)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; 包管理
(require 'package)
(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; 界面
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; (use-package gruvbox-theme
;;   :config
;;   (load-theme 'gruvbox-dark-medium t))

;; 编辑增强
;; (use-package company
;;   :hook (after-init . global-company-mode)
;;   :config
;;   (setq company-idle-delay 0.1)
;;   (setq company-minimum-prefix-length 2))

;; (use-package flycheck
;;   :init (global-flycheck-mode))

;; (use-package rainbow-delimiters
;;   :hook (prog-mode . rainbow-delimiters-mode))

;; (use-package smartparens
;;   :config
;;   (require 'smartparens-config)
;;   (smartparens-global-mode 1))

;; Git
;; (use-package magit
;;   :bind ("C-x g" . magit-status))

;; 其他设置
(setq create-lockfiles nil)
(fset 'yes-or-no-p 'y-or-n-p)
(global-auto-revert-mode t)

;; (custom-set-variables
;;  '(package-selected-packages
;;    '(use-package gruvbox-theme company flycheck rainbow-delimiters smartparens magit)))