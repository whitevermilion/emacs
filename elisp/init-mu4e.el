;; 基本 mu4e 配置
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e/")
(require 'mu4e)

;; 核心 设置
(setq
 ;; 邮件目录
 mu4e-maildir "~/.mail"

 ;; 已发送邮件保存位置（使用 sent 文件夹）
 mu4e-sent-messages-behavior 'sent

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

;; ========================================
;; SMTP 发送配置（QQ 邮箱）
;; ========================================

;; SMTP 服务器设置
(setq smtpmail-smtp-server "smtp.qq.com"
      smtpmail-smtp-service "587"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-user "whitevermilion@qq.com")

;; 使用 pass 获取授权码
(defun my-mu4e-get-passwd (key)
  "从 pass 获取密码"
  (string-trim (shell-command-to-string (concat "pass show " key))))

;; 设置认证信息
(let ((password (my-mu4e-get-passwd "whitevermilion@qq.com")))
  (setq smtpmail-auth-credentials
        (list (list "smtp.qq.com" "587" "whitevermilion@qq.com" password))))

;; SMTP 认证设置
(setq smtpmail-auth-supported '(plain login cram-md5)
      smtpmail-starttls-credentials '(("smtp.qq.com" "587" nil nil))
      smtpmail-ehlo-supported t)

;; 设置发送函数
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it)

(provide 'init-mu4e)
