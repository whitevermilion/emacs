;;; init.el --- Emacs 配置主文件
;;; Commentary:
;; Emacs 配置入口文件，负责加载各个模块化配置

;;; Code:

;; -*- lexical-binding: t -*-
;; 文件头声明：启用词法作用域（lexical binding），这是现代 Emacs Lisp 的推荐做法

;; 添加配置模块目录到加载路径
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

;; ========================================
;; 加载各个配置模块
;; ========================================
(set-language-environment 'Chinese-GB)
(set-locale-environment "zh_CN.UTF-8")
(setq current-language-environment "Chinese")
;; 1. 基础设置（编码、行号、缩进等）
(require 'init-basic)

;; 2. 包管理配置
(require 'init-packages)

;; 3. 界面优化
(require 'init-ui)

;; 4. Evil 和 Colemak 键位
(require 'init-evil)

;; 5. 编辑增强功能
(require 'init-editing)

;; 6. Git 集成
(require 'init-git)

;; 7. 其他实用设置
(require 'init-misc)

;; 邮箱
(require 'init-mu4e)

;; 中文
(require 'init-chinese)
;;; ========================================
;;; 自定义变量（由 Emacs 自动管理）
;;; ========================================
;; 这部分配置通常由 Emacs 的图形界面设置工具自动生成
;; 手动编辑后可能会被覆盖，所以保持注释状态
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil)
 '(smtpmail-smtp-server "smtp.qq.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; init.el ends here
