;;; init-basic.el --- 基础设置
;;; Commentary:
;; 基础的 Emacs 配置，包括编码、行号、缩进等

;;; Code:

;; 关闭启动欢迎画面
;; (setq inhibit-startup-screen t)

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

;; 终端编码
(set-terminal-coding-system 'utf-8)

;; 键盘输入编码
(set-keyboard-coding-system 'utf-8)

;; 缓冲区文件编码
(set-buffer-file-coding-system 'utf-8)

;; 选择区域编码
(set-selection-coding-system 'utf-8)

;; 优先使用 UTF-8
(prefer-coding-system 'utf-8)

(provide 'init-basic)
;;; init-basic.el ends here
