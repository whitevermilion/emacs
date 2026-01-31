;; 添加配置模块目录到加载路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/plugins" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/passiveplugins" user-emacs-directory))

;; 将运行时数据文件移到 XDG 标准目录，保持配置目录整洁
(setq url-cache-directory (expand-file-name "~/.cache/emacs/url/"))
(setq native-comp-eln-load-path (list (expand-file-name "~/.cache/emacs/eln-cache/")))
(setq network-security-data-directory (expand-file-name "~/.cache/emacs/"))
(setq tutorial-directory (expand-file-name "~/.local/share/emacs/tutorial/"))
(setq auto-save-list-file-prefix (expand-file-name "~/.local/state/emacs/auto-save-list/.saves-"))


(set-language-environment 'Chinese-GB)
(set-locale-environment "zh_CN.UTF-8")
(setq current-language-environment "Chinese")

;; ========================================
;; 0. 包管理器（必须最先加载）
;; ========================================
(message "🚀 [init.el] 开始加载 core/elpaca...")
(require 'core/elpaca)
(message "✅ [init.el] core/elpaca 加载完成")

;; 1. 基础设置（编码、行号、缩进等）
(message "🚀 [init.el] 开始加载 core/basic...")
(require 'core/basic)
(message "✅ [init.el] core/basic 加载完成")

;; 2. 界面优化
(message "🚀 [init.el] 开始加载 passiveplugins/ui...")
(require 'passiveplugins/ui)
(message "✅ [init.el] passiveplugins/ui 加载完成")

;; 3. Evil 和 Colemak 键位
(message "🚀 [init.el] 开始加载 plugins/evil...")
(require 'plugins/evil)
(message "✅ [init.el] plugins/evil 加载完成")

;; 4. 编辑增强功能
(message "🚀 [init.el] 开始加载 core/editing...")
(require 'core/editing)
(message "✅ [init.el] core/editing 加载完成")

;; 5. Git 集成
(message "🚀 [init.el] 开始加载 plugins/git...")
(require 'plugins/git)
(message "✅ [init.el] plugins/git 加载完成")

;; 6. 其他实用设置
(message "🚀 [init.el] 开始加载 core/misc...")
(require 'core/misc)
(message "✅ [init.el] core/misc 加载完成")

;; 7. 邮箱
(message "🚀 [init.el] 开始加载 plugins/mu4e...")
(require 'plugins/mu4e)
(message "✅ [init.el] plugins/mu4e 加载完成")

;; 8. 中文
(message "🚀 [init.el] 开始加载 core/chinese...")
(require 'core/chinese)
(message "✅ [init.el] core/chinese 加载完成")

(message "🎉 [init.el] 所有配置模块加载完成！")
