;;; editing.el --- 编辑增强功能
;;; Commentary:
;; 编辑增强插件配置，包括自动补全、语法检查等

;;; Code:

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

(provide 'editing)
;;; editing.el ends here