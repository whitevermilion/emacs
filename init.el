;;; init.el --- Emacs 配置主文件
;;; Commentary:
;; Emacs 配置入口文件，负责加载各个模块化配置

;;; Code:

;; -*- lexical-binding: t -*-
;; 文件头声明：启用词法作用域（lexical binding），这是现代 Emacs Lisp 的推荐做法

;; 添加配置模块目录到加载路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

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
