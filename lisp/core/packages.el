;;; packages.el --- 包管理配置
;;; Commentary:
;; 包管理器配置，现在使用 Elpaca

;;; Code:

;; ========================================
;; Elpaca 初始化
;; ========================================

;; 等待 Elpaca 初始化完成
(elpaca-wait)

;; ========================================
;; use-package 配置
;; ========================================

;; Elpaca 已经在 elpaca.el 中配置了 use-package 集成
;; 这里可以添加额外的 use-package 设置

;; 如果需要手动确保某个包已安装，可以设置：
;; (setq use-package-always-ensure t)

(provide 'packages)
;;; packages.el ends here