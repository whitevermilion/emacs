;;; init-ui.el --- 界面优化
;;; Commentary:
;; Emacs 界面优化配置，包括工具栏、菜单栏、滚动条等

;;; Code:

;; 关闭工具栏（通常在窗口顶部，显示常用按钮）
(tool-bar-mode -1)

;; 关闭菜单栏（通常在窗口顶部，显示 File、Edit 等菜单）
(menu-bar-mode -1)

;; 关闭右侧滚动条，使用键盘滚动更高效
(scroll-bar-mode -1)

;; 设置默认字体：英文使用 0xProto Nerd Font Mono，中文使用 LXGW WenKai
(set-face-attribute 'default nil :family "0xProto Nerd Font Mono" :height 170)
(set-fontset-font t 'han "LXGW WenKai")

;; 主题配置（当前已注释，可按需启用）
;; (use-package gruvbox-theme
;;   :config
;;   (load-theme 'gruvbox-dark-medium t))
;; 说明：加载 gruvbox 主题（一种流行的深色配色方案）

(provide 'init-ui)
;;; init-ui.el ends here
