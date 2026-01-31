;; 添加配置模块目录到加载路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; 将运行时数据文件移到 XDG 标准目录，保持配置目录整洁
(setq url-cache-directory (expand-file-name "~/.cache/emacs/url/"))
(setq native-comp-eln-load-path (list (expand-file-name "~/.cache/emacs/eln-cache/")))
(setq network-security-data-directory (expand-file-name "~/.cache/emacs/"))
(setq tutorial-directory (expand-file-name "~/.local/share/emacs/tutorial/"))
(setq auto-save-list-file-prefix (expand-file-name "~/.local/state/emacs/auto-save-list/.saves-"))


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
