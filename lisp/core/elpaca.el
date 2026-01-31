;;; elpaca.el --- Elpaca 包管理器配置
;;; Commentary:
;; Elpaca 是一个现代化的 Emacs 包管理器，支持懒加载、锁文件和异步操作

;;; Code:

;; ========================================
;; Elpaca 基础配置
;; ========================================

;; Elpaca 版本和目录配置
(defvar elpaca-installer-version 0.7)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))

;; Elpaca 自身配置
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))

;; ========================================
;; Elpaca 安装和初始化
;; ========================================

;; 自动安装和初始化 Elpaca
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (expand-file-name "../" build))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                 ,@(when-let* ((depth (plist-get order :depth)))
                                                     (list (format "--depth=%d" depth) "--no-single-branch"))
                                                 ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(progn
                                                  (require 'elpaca)
                                                  (elpaca-generate-autoloads \"elpaca\" \"elpaca/\"))"))))
            (kill-buffer buffer)
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error 2)
       (with-current-buffer (get-buffer-create "*elpaca-error*")
         (erase-buffer)
         (insert error)
         (pop-to-buffer (current-buffer))))
      ((error 3)
       (message "%s" error) 
       (directory-files-recursively elpaca-builds-directory "\\.*$")))))

;; 加载 Elpaca
(require 'elpaca)

;; 生成 autoloads
(elpaca-generate-autoloads "elpaca" user-emacs-directory)

;; 初始化 Elpaca
(elpaca (elpaca :queue setup))

;; ========================================
;; use-package 集成
;; ========================================

;; Elpaca 与 use-package 集成
(defun elpaca-use-package-hook (use-package)
  (when (bound-and-true-p elpaca-manager)
    (unless (bound-and-true-p elpaca-use-package-mode)
      (elpaca-use-package-mode))))

;; 添加 use-package hook
(add-hook 'use-package-after-init-hook 'elpaca-use-package-hook)

;; 确保 use-package 通过 Elpaca 安装
(elpaca use-package)

;; ========================================
;; 实用命令
;; ========================================

;; Elpaca 状态查看命令
(defun my-elpaca-status ()
  "显示 Elpaca 包的状态"
  (interactive)
  (elpaca-status))

;; 更新所有包
(defun my-elpaca-update-all ()
  "更新所有通过 Elpaca 安装的包"
  (interactive)
  (elpaca-update-all))

;; 清理未使用的包
(defun my-elpaca-clean ()
  "清理未使用的 Elpaca 包"
  (interactive)
  (elpaca-clean))

(provide 'elpaca)
;;; elpaca.el ends here