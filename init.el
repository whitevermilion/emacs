;; -*- lexical-binding: t -*-
;; 文件头声明：启用词法作用域（lexical binding），这是现代 Emacs Lisp 的推荐做法

;;; ========================================
;;; 基础设置
;;; ========================================


;; 在所有缓冲区左侧显示行号
(global-display-line-numbers-mode t)

;; 高亮显示光标所在行，便于快速定位当前编辑位置
(global-hl-line-mode t)

;; 在底部状态栏显示光标所在的列号
(column-number-mode t)

;; 启用自动缩进：按回车时，新行自动缩进到与上一行相同的级别
(electric-indent-mode t)

;; 启用自动补全括号：输入左括号时自动补全右括号（包括圆括号、方括号、大括号等）
(electric-pair-mode t)

;; 设置语言环境为 UTF-8，确保多语言支持
(set-language-environment "UTF-8")

;; 设置默认编码系统为 UTF-8，用于读写文件
(set-default-coding-systems 'utf-8)

;;; ========================================
;;; 包管理配置
;;; ========================================

;; 加载 Emacs 内置的包管理系统
(require 'package)

;; 配置包源：告诉 Emacs 从哪里下载扩展包
(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")  ; GNU 官方 ELPA 源（稳定）
                         ("melpa" . "https://melpa.org/packages/")))     ; MELPA 社区源（最新版本）

;; 初始化包管理系统，使配置的包源生效
(package-initialize)

;; 检查是否已安装 use-package 插件
;; use-package 是一个用于声明式管理其他插件的工具
(unless (package-installed-p 'use-package)
  ;; 如果没安装，先刷新包列表（获取最新的包信息）
  (package-refresh-contents)
  ;; 然后自动安装 use-package
  (package-install 'use-package))

;; 加载 use-package 插件
(require 'use-package)

;; 设置 use-package 的默认行为：自动确保包已安装
;; 这样使用 use-package 配置插件时，不需要每次都写 :ensure t
(setq use-package-always-ensure t)

;;; ========================================
;;; 界面优化
;;; ========================================

;; 关闭工具栏（通常在窗口顶部，显示常用按钮）
(tool-bar-mode -1)

;; 关闭菜单栏（通常在窗口顶部，显示 File、Edit 等菜单）
(menu-bar-mode -1)

;; 关闭右侧滚动条，使用键盘滚动更高效
(scroll-bar-mode -1)

;; 主题配置（当前已注释，可按需启用）
;; (use-package gruvbox-theme
;;   :config
;;   (load-theme 'gruvbox-dark-medium t))
;; 说明：加载 gruvbox 主题（一种流行的深色配色方案）

;;; ========================================
;;; 编辑增强功能
;;; ========================================

;; Evil - Vim 模拟器（为 Vim 用户提供熟悉的编辑体验）
(use-package evil
  :init
  (setq evil-want-keybinding nil)  ; 必须在加载 evil 之前设置，避免与 evil-collection 冲突
  (evil-mode 1))  ; 启用 Evil 模式，启动后即进入 Vim 的普通模式

;; evil-collection - 为各种 Emacs 模式提供 Vim 键位
;; 让 Emacs 的各种插件和模式都支持 Vim 风格的操作
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))  ; 初始化所有默认模式的 Vim 键位

;; 自动补全框架（当前已注释，可按需启用）
;; (use-package company
;;   :hook (after-init . global-company-mode)  ; Emacs 初始化完成后自动启用
;;   :config
;;   (setq company-idle-delay 0.1)             ; 停止输入 0.1 秒后显示补全建议
;;   (setq company-minimum-prefix-length 2))   ; 至少输入 2 个字符才开始补全

;; 语法检查工具（当前已注释，可按需启用）
;; (use-package flycheck
;;   :init (global-flycheck-mode))  ; 全局启用语法检查

;; 彩虹括号高亮（当前已注释，可按需启用）
;; 用不同颜色显示嵌套的括号，便于阅读嵌套代码
;; (use-package rainbow-delimiters
;;   :hook (prog-mode . rainbow-delimiters-mode))  ; 在编程模式下自动启用

;; 智能括号管理（当前已注释，可按需启用）
;; 提供更强大的括号操作（如快速跳转、删除等）
;; (use-package smartparens
;;   :config
;;   (require 'smartparens-config)
;;   (smartparens-global-mode 1))

;;; ========================================
;;; Git 集成
;;; ========================================

;; Magit - Emacs 中的 Git 界面（当前已注释，可按需启用）
;; (use-package magit
;;   :bind ("C-x g" . magit-status))  ; 按下 Ctrl+x g 打开 Magit 状态窗口

;;; ========================================
;;; 其他实用设置
;;; ========================================

;; 禁止创建锁文件（.#filename），避免在共享目录中产生冲突文件
(setq create-lockfiles nil)

;; 将 yes-or-no-p 的问答替换为 y-or-n-p
;; 修改后，所有确认提示只需按 y/n，无需输入完整的 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 全局自动重新加载模式
;; 当文件在 Emacs 外部被修改时，自动重新加载缓冲区
(global-auto-revert-mode t)

;;; ========================================
;;; 自定义变量（由 Emacs 自动管理）
;;; ========================================
;; 这部分配置通常由 Emacs 的图形界面设置工具自动生成
;; 手动编辑后可能会被覆盖，所以保持注释状态
;; (custom-set-variables
;;  '(package-selected-packages
;;    '(use-package gruvbox-theme company flycheck rainbow-delimiters smartparens magit)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
