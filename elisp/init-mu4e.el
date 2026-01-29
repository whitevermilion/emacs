;; 基本 mu4e 配置
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e/")
(require 'mu4e)

;; 核心设置
(setq
 ;; 邮件目录
 mu4e-maildir "~/Mail"
 
 ;; 同步命令
 mu4e-get-mail-command "mbsync qq"
 
 ;; 自动检查新邮件间隔（秒），设为 nil 禁用
 mu4e-update-interval 300
 
 ;; 用户信息
 user-mail-address "whitevermilion@qq.com"
 user-full-name "whitevermilion"
 
 ;; 显示设置
 mu4e-view-show-images t          ; 显示邮件中的图片
 mu4e-view-image-max-width 800    ; 图片最大宽度
 mu4e-use-fancy-chars t           ; 使用漂亮的字符（如箭头）
 
 ;; 编写邮件设置
 mu4e-compose-dont-reply-to-self t ; 给自己发邮件时不回复自己
 
 ;; 文件夹设置
 mu4e-maildir-shortcuts
 '(("/qq/INBOX"             . ?i)
   ("/qq/Sent Messages"     . ?s)
   ("/qq/Drafts"           . ?d)
   ("/qq/Deleted Messages" . ?t)))

;; 快捷键设置（C-c m 启动 mu4e）
(global-set-key (kbd "C-c m") 'mu4e)

;; 提供init-mu4e 功能
(provide 'init-mu4e)
