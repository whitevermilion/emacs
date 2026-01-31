;;; misc.el --- 其他实用设置
;;; Commentary:
;; 其他实用的 Emacs 配置，如自动重载、锁文件等

;;; Code:

;; 禁止创建锁文件（.#filename），避免在共享目录中产生冲突文件
(setq create-lockfiles nil)

;; 将 yes-or-no-p 的问答替换为 y-or-n-p
;; 修改后，所有确认提示只需按 y/n，无需输入完整的 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 全局自动重新加载模式
;; 当文件在 Emacs 外部被修改时，自动重新加载缓冲区
(global-auto-revert-mode t)

(provide 'misc)
;;; misc.el ends here