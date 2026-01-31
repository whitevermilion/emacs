;;; evil.el --- Evil 和 Colemak 键位配置
;;; Commentary:
;; Vim 模拟器 Evil 配置，以及 Colemak 键位映射

;;; Code:

;; ========================================
;; 调试输出：确认文件被加载
;; ========================================
(message "🔧 [evil.el] 文件开始加载...")

;; 等待 Elpaca 和 use-package 准备好
(elpaca-wait)

(message "✅ [evil.el] Elpaca 和 use-package 已准备好")

;; Evil - Vim 模拟器（为 Vim 用户提供熟悉的编辑体验）
(use-package evil
  :init
  (message "📦 [evil.el] 开始初始化 Evil...")
  (setq evil-want-keybinding nil)  ; 必须在加载 evil 之前设置，避免与 evil-collection 冲突
  :config
  (message "⚙️  [evil.el] 开始配置 Evil...")
  (evil-mode 1)  ; 启用 Evil 模式，启动后即进入 Vim 的普通模式
  (message "🚀 [evil.el] Evil 模式已启用！当前模式: %s" evil-state)

  ;; Colemak 基础移动键位映射：h=左, n=下, e=上, i=右
  (define-key evil-normal-state-map "h" 'evil-backward-char)    ; h 向左移动
  (define-key evil-normal-state-map "n" 'evil-next-line)        ; n 向下移动
  (define-key evil-normal-state-map "e" 'evil-previous-line)    ; e 向上移动
  (define-key evil-normal-state-map "i" 'evil-forward-char)     ; i 向右移动

  ;; 在可视化模式下应用相同的移动键位
  (define-key evil-visual-state-map "h" 'evil-backward-char)
  (define-key evil-visual-state-map "n" 'evil-next-line)
  (define-key evil-visual-state-map "e" 'evil-previous-line)
  (define-key evil-visual-state-map "i" 'evil-forward-char)

  ;; 在操作符待决模式下应用相同的移动键位
  (define-key evil-operator-state-map "h" 'evil-backward-char)
  (define-key evil-operator-state-map "n" 'evil-next-line)
  (define-key evil-operator-state-map "e" 'evil-previous-line)
  (define-key evil-operator-state-map "i" 'evil-forward-char)

  ;; Colemak 插入模式映射：u=插入, U=行尾插入
  (define-key evil-normal-state-map "u" 'evil-insert)           ; u 在光标处进入插入模式
  (define-key evil-normal-state-map "U" 'evil-insert-line)      ; U 在行尾进入插入模式

  ;; Colemak 撤销/重做映射：l=撤销, L=重做
  (define-key evil-normal-state-map "l" 'evil-undo)             ; l 撤销上一步操作
  (define-key evil-normal-state-map "L" 'evil-redo))            ; L 重做上一步操作

;; evil-collection - 为各种 Emacs 模式提供 Vim 键位
;; 让 Emacs 的各种插件和模式都支持 Vim 风格的操作
(use-package evil-collection
  :after evil
  :config
  (message "📦 [evil.el] 开始初始化 evil-collection...")
  (evil-collection-init)  ; 初始化所有默认模式的 Vim 键位
  (message "✅ [evil.el] evil-collection 初始化完成！"))

(provide 'evil)

;; ========================================
;; 调试输出：文件加载完成
;; ========================================
(message "🎉 [evil.el] 文件加载完成！Evil 状态: %s" (if (bound-and-true-p evil-mode) "✅ 已启用" "❌ 未启用"))

;;; evil.el ends here