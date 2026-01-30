# Emacs 配置项目

## 项目概述

这是一个个人 Emacs 配置项目，位于 `/home/red/.config/emacs`。该项目采用模块化的配置管理方式，将不同功能的配置分离到独立的文件中，便于维护和扩展。主要特点包括：

- **模块化架构**：配置按功能分为 9 个独立模块文件
- **语言环境**：UTF-8 编码设置，中文语言环境（Chinese-GB）
- **包管理**：使用 `use-package` 进行包管理和配置
- **包源**：配置了 GNU ELPA 和 MELPA 两个包仓库
- **Vim 集成**：集成 Evil 模式，适配 Colemak 键位布局
- **界面优化**：精简的界面，禁用滚动条（工具栏和菜单栏当前已启用）
- **编辑增强**：支持行号显示、当前行高亮、自动缩进、自动括号配对等
- **中文支持**：配置中文字体和中文输入环境，带有容错处理
- **邮件功能**：集成 mu4e 邮件客户端，支持 QQ 邮箱，使用 pass 管理授权码

## 项目结构

```
/home/red/.config/emacs/
├── init.el              # 主配置入口文件
├── README.md            # 项目说明文档
├── AGENTS.md            # 本文件，用于 AI 代理的上下文说明
├── question.md          # 已知问题记录（已加入 .gitignore）
├── .gitignore           # Git 忽略文件配置
├── network-security.data # 网络安全数据
├── elisp/               # 配置模块目录
│   ├── init-basic.el    # 基础设置（编码、行号、缩进等）
│   ├── init-packages.el # 包管理配置
│   ├── init-ui.el       # 界面优化
│   ├── init-evil.el     # Evil 和 Colemak 键位配置
│   ├── init-editing.el  # 编辑增强功能
│   ├── init-git.el      # Git 集成
│   ├── init-misc.el     # 其他实用设置
│   ├── init-mu4e.el     # mu4e 邮件客户端配置
│   └── init-chinese.el  # 中文语言和字体配置
├── elpa/                # 已安装的 Emacs 包
├── eln-cache/           # 原生编译缓存
├── auto-save-list/      # 自动保存文件
├── transient/           # Transient 缓存目录
├── tutorial/            # Emacs 教程文件
└── url/                 # URL 缓存目录
```

## 核心配置文件

### init.el

主配置入口文件，负责加载各个模块化配置。在加载模块之前，设置了中文语言环境，并在文件末尾包含 Emacs 自动生成的 custom 设置。

**语言环境设置：**
- `set-language-environment 'Chinese-GB` - 设置中文环境
- `set-locale-environment "zh_CN.UTF-8"` - 设置区域编码
- `setq current-language-environment "Chinese"` - 当前语言环境

**自定义变量（由 Emacs 自动管理）：**
- `smtpmail-smtp-server` 设置为 `smtp.qq.com`
- `smtpmail-smtp-service` 设置为 25（注意：init-mu4e.el 中配置为 587）

**模块加载顺序：**

1. **init-basic** - 基础设置（编码、行号、缩进等）
2. **init-packages** - 包管理配置
3. **init-ui** - 界面优化
4. **init-evil** - Evil 和 Colemak 键位
5. **init-editing** - 编辑增强功能
6. **init-git** - Git 集成
7. **init-misc** - 其他实用设置
8. **init-mu4e** - mu4e 邮件客户端配置
9. **init-chinese** - 中文语言和字体配置

### 配置模块详解

#### elisp/init-basic.el

基础 Emacs 配置，包括：

- 全局行号显示
- 当前行高亮
- 列号显示
- 自动缩进（electric-indent-mode）
- 自动括号配对（electric-pair-mode）
- 完整的 UTF-8 编码环境设置（包括语言环境、默认编码、终端编码、键盘编码、缓冲区编码、选择区域编码）
- 启动欢迎画面（当前已注释，启用时会关闭）

#### elisp/init-packages.el

包管理系统配置：

- 配置 GNU ELPA 和 MELPA 包源
- 自动安装并配置 `use-package`
- 设置 `use-package-always-ensure` 为 t，自动确保包已安装

#### elisp/init-ui.el

界面优化配置：

- 禁用滚动条
- 工具栏（当前已注释）
- 菜单栏（当前已注释）
- 主题配置（当前已注释，可按需启用 gruvbox-theme）

#### elisp/init-evil.el

Vim 模拟器和 Colemak 键位配置：

- **Evil 模式**：为 Emacs 提供 Vim 风格的编辑体验
- **Colemak 基础移动键位**：
  - `h` = 向左移动
  - `n` = 向下移动
  - `e` = 向上移动
  - `i` = 向右移动
- **Colemak 插入模式映射**：
  - `u` = 在光标处进入插入模式
  - `U` = 在行尾进入插入模式
- **Colemak 撤销/重做映射**：
  - `l` = 撤销
  - `L` = 重做
- **evil-collection**：为各种 Emacs 模式提供统一的 Vim 键位支持

#### elisp/init-editing.el

编辑增强功能（当前已注释，可按需启用）：

- **company**：自动补全框架（设置 0.1 秒延迟，至少输入 2 个字符才开始补全）
- **flycheck**：语法检查工具
- **rainbow-delimiters**：彩虹括号高亮
- **smartparens**：智能括号管理

#### elisp/init-git.el

Git 集成（当前已注释）：

- **magit**：Emacs 中的 Git 界面（快捷键：`C-x g`）

#### elisp/init-misc.el

其他实用设置：

- 禁止创建锁文件（避免在共享目录中产生冲突文件）
- 将 `yes-or-no-p` 替换为 `y-or-n-p`（确认提示只需按 y/n）
- 全局自动重新加载文件（当文件在 Emacs 外部被修改时自动重新加载）

#### elisp/init-mu4e.el

mu4e 邮件客户端配置：

- **mu4e**：基于 mu 的邮件搜索和管理工具
- **邮件目录**：`~/Maildir`
- **同步命令**：`mbsync qq`（使用 isync 同步 QQ 邮箱）
- **自动更新**：每 300 秒自动检查新邮件
- **用户信息**：
  - 邮箱：`whitevermilion@qq.com`
  - 姓名：`whitevermilion`
- **显示设置**：
  - 显示邮件中的图片（最大宽度 800px）
  - 使用漂亮的字符（如箭头）
- **编写邮件设置**：
  - `mu4e-compose-dont-reply-to-self t` - 给自己发邮件时不回复自己
- **文件夹快捷键**：
  - `i` - 收件箱（INBOX）
  - `s` - 已发送（Sent Messages）
  - `d` - 草稿（Drafts）
  - `t` - 已删除（Deleted Messages）
- **启动快捷键**：`C-c m`
- **SMTP 发送配置（QQ 邮箱）**：
  - SMTP 服务器：`smtp.qq.com`
  - SMTP 端口：587
  - 流程类型：`starttls`
  - 发送函数：`smtpmail-send-it`
- **授权码管理**：
  - 使用 `pass` 命令获取授权码
  - 自定义函数 `my-mu4e-get-passwd` 从 pass 密码库中读取密码
  - 存储路径：`pass show whitevermilion@qq.com`

#### elisp/init-chinese.el

中文语言和字体配置（极简安全版）：

- **编码设置**：优先使用 UTF-8 编码
- **字体配置**（仅在图形界面下生效，带有容错处理）：
  - 英文字体：0xProto Nerd Font Mono（高度 170）
  - 中文字体：LXGW WenKai（用于汉字和 CJK 字符）
- **容错处理**：使用 `condition-case` 包裹字体设置，如果字体不存在会显示消息并跳过设置而不会报错

## 构建和运行

这是一个 Emacs 配置项目，不需要传统的构建过程。

### 依赖项

基本配置无需额外依赖，但如果使用 mu4e 邮件功能或中文支持，需要安装以下工具和字体：

**系统工具（mu4e 邮件）：**

```bash
# Arch Linux
sudo pacman -S mu isync

# Ubuntu/Debian
sudo apt-get install mu4e isync

# macOS
brew install mu isync
```

**pass 密码管理器（用于存储 QQ 邮箱授权码）：**

```bash
# Arch Linux
sudo pacman -S pass

# Ubuntu/Debian
sudo apt-get install pass

# macOS
brew install pass
```

**中文字体（可选，用于更好的中文显示）：**

```bash
# Arch Linux
sudo pacman -S ttf-lxgw-wenkai

# Ubuntu/Debian
# 从 LXGW 官方网站下载安装或使用其他源

# macOS
# 使用 Homebrew Cask 安装或手动下载安装
```

**英文字体（可选，用于编程）：**

```bash
# Arch Linux
sudo pacman -S nerd-fonts

# Ubuntu/Debian
# 从 Nerd Fonts 官方网站下载安装

# macOS
brew install font-0xproto-nerd-font
```

### 使用方式

1. **启动 Emacs**
   ```bash
   emacs
   ```

2. **使用调试模式启动**
   ```bash
   emacs --debug-init
   ```

3. **重新加载配置**
   在 Emacs 中执行：
   ```
   M-x load-file RET ~/.config/emacs/init.el RET
   ```
   或直接重启 Emacs。

4. **启用已注释的插件**
   取消对应模块文件中插件配置的注释，然后重新加载配置文件即可。

5. **添加新配置模块**
   在 `elisp/` 目录下创建新的 `.el` 文件，并在 `init.el` 中使用 `(require 'module-name)` 加载。

### 配置 QQ 邮箱

1. **安装 mbsync（isync）** 和 **mu**
   ```bash
   sudo pacman -S mu isync  # Arch Linux
   ```

2. **获取 QQ 邮箱授权码**
   - 登录 QQ 邮箱网页版
   - 进入设置 -> 账户
   - 开启 SMTP 服务并获取授权码

3. **使用 pass 存储授权码**
   ```bash
   pass init "your-gpg-key-id"
   pass insert whitevermilion@qq.com
   # 粘贴 QQ 邮箱授权码
   ```

4. **配置 mbsync**
   创建或编辑 `~/.mbsyncrc` 文件，配置 QQ 邮箱同步。

5. **初始化 mu 索引**
   ```bash
   mu init --maildir=~/Maildir --my-address=whitevermilion@qq.com
   mu index
   ```

## 开发约定

### 编码风格

- 使用 Emacs Lisp (Elisp) 语法
- 文件开头添加 `;;; filename.el --- Description` 头部注释
- 文件开头添加 `;;; Commentary:` 和 `;;; Code:` 分节
- 文件末尾添加 `(provide 'module-name)` 和 `;;; filename.el ends here`
- 使用 `use-package` 进行包的声明式配置
- 使用词法作用域：`-*- lexical-binding: t -*-`

### 模块文件结构

每个配置模块文件应遵循以下结构：

```elisp
;;; module-name.el --- 模块描述
;;; Commentary:
;; 模块的详细说明

;;; Code:

;; 配置代码

(provide 'module-name)
;;; module-name.el ends here
```

### 配置原则

1. **模块化组织**：不同功能分离到独立文件，便于管理和扩展
2. **按需启用**：许多增强功能默认处于注释状态，按实际需求启用
3. **渐进式配置**：从基础设置开始，逐步添加功能模块
4. **清晰的加载顺序**：在 `init.el` 中按依赖顺序加载模块
5. **容错处理**：关键配置（如字体）使用 `condition-case` 处理错误

### 扩展配置

添加新的包配置时，遵循以下模式：

```elisp
(use-package package-name
  :init
  ;; 在包加载之前执行的代码
  :config
  ;; 在包加载之后执行的代码
  :hook
  ;; 绑定到特定模式
  :bind
  ;; 绑定快捷键
  )
```

## 常用操作

### 安装新包

1. 在对应的模块文件中添加 `use-package` 配置
2. 重启 Emacs 或执行 `M-x load-file RET ~/.config/emacs/init.el RET`

### 手动安装包

```
M-x package-install RET package-name RET
```

### 使用 mu4e 邮件

1. **启动 mu4e**
   - 按下 `C-c m` 或在 Emacs 中执行 `M-x mu4e`

2. **同步邮件**
   - mu4e 会每 300 秒自动同步
   - 手动同步：在 mu4e 主界面按 `U`（大写）

3. **发送邮件**
   - 在 mu4e 主界面按 `C`（大写）撰写新邮件
   - 回复邮件：按 `R`（大写）
   - 转发邮件：按 `F`（大写）
   - 发送时自动从 pass 获取授权码

4. **邮件快捷键**
   - `i` - 收件箱
   - `s` - 已发送
   - `d` - 草稿
   - `t` - 已删除

### 排查问题

如果遇到配置问题：

1. 检查 `*Messages*` 缓冲区查看错误信息
2. 使用 `emacs --debug-init` 启动查看完整错误回溯
3. 使用 `M-x toggle-debug-on-error` 启用错误调试
4. 使用 `M-x eval-buffer` 在当前缓冲区中执行配置代码

## 已知问题

### mu4e 相关

1. **mu4e 提示**：启动时会显示提示信息，建议使用 `mu init --personal-address=` 添加个人地址到 mu 的地址列表中
2. **SMTP 端口不一致**：init.el 中 `smtpmail-smtp-service` 设置为 25，而 init-mu4e.el 中设置为 587，需要统一
3. **mu 版本**：当前使用 mu 版本为 1.14.0-pre1（预发布版本）

### 字体相关

1. **字体不存在**：如果系统中未安装 0xProto Nerd Font Mono 或 LXGW WenKai 字体，配置会跳过字体设置并显示提示消息，不会报错

## 注意事项

- 该配置目录是 Git 仓库的一部分（远程：`git@github.com:whitevermilion/emacs.git`）
- 当前分支：`main`
- 配置使用模块化结构，便于维护和扩展（共 9 个模块）
- 部分增强功能已注释，需要时可以启用
- 配置使用 UTF-8 编码，并设置中文语言环境（Chinese-GB）
- Evil 模式已配置 Colemak 键位，注意移动键位已重新映射（h/n/e/i）
- 工具栏和菜单栏当前已启用（相关配置已注释）
- mu4e 邮件功能需要提前安装 mu、mbsync（isync）和 pass 工具
- mu4e 配置使用 QQ 邮箱，需要配置好 mbsync 的账户信息，并使用 pass 存储授权码
- 中文字体配置需要系统中已安装 LXGW WenKai 字体
- 英文字体配置需要系统中已安装 0xProto Nerd Font Mono 字体
- 如果字体不存在，会自动跳过字体设置而不会报错
- init.el 文件末尾的 `custom-set-variables` 和 `custom-set-faces` 由 Emacs 自动管理，手动编辑可能会被覆盖
- question.md 文件用于临时记录问题，已加入 .gitignore