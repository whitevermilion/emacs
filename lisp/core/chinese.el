;; 极简中文配置 - 安全版
;; 完全避免字体错误

;; 1. 基本编码设置（必须）
(prefer-coding-system 'utf-8)

;; 2. 安全的字体设置（不会报错）
(when (display-graphic-p)
  (condition-case nil
      (progn
        ;; 尝试设置英文字体
        (set-face-attribute 'default nil :family "0xProto Nerd Font Mono" :height 170)
        
        ;; 尝试设置中文字体
        (set-fontset-font t 'han (font-spec :family "LXGW WenKai"))
        (set-fontset-font t 'cjk-misc (font-spec :family "LXGW WenKai")))
    (error 
     (message "字体设置跳过（可能字体不存在）"))))

;; 3. 提供功能（必须）
(provide 'chinese)
