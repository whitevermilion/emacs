;;; packages.el --- 包管理配置
;;; Commentary:
;; Emacs 包管理系统配置，包括包源和 use-package 设置

;;; Code:

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

(provide 'packages)
;;; packages.el ends here