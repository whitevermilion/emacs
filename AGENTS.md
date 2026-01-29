# Emacs 配置项目

## 项目概述

这是一个个人 Emacs 配置项目，位于 `/home/red/.config/emacs`。该项目采用模块化的配置管理方式，将不同功能的配置分离到独立的文件中，便于维护和扩展。主要特点包括：

- **模块化架构**：配置按功能分为 7 个独立模块文件
- **语言环境**：UTF-8 编码设置
- **包管理**：使用 `use-package` 进行包管理和配置
- **包源**：配置了 GNU ELPA 和 MELPA 两个包仓库
- **Vim 集成**：集成 Evil 模式，适配 Colemak 键位布局
- **界面优化**：精简的界面，禁用了工具栏、菜单栏和滚动栏
- **编辑增强**：支持行号显示、语法高亮、智能括号等（部分功能已注释）

## 项目结构

```
/home/red/.config/emacs/
├── init.el              # 主配置入口文件
├── README.md            # 项目说明文档
├── AGENTS.md            # 本文件，用于 AI 代理的上下文说明
├── question.md          # 已知问题记录
├── .gitignore           # Git 忽略文件配置
├── elisp/               # 配置模块目录
│   ├── init-basic.el    # 基础设置（编码、行号、缩进等）
│   ├── init-packages.el # 包管理配置
│   ├── init-ui.el       # 界面优化
│   ├── init-evil.el     # Evil 和 Colemak 键位配置
│   ├── init-editing.el  # 编辑增强功能
│   ├── init-git.el      # Git 集成
│   ├── init-misc.el     # 其他实用设置
│   └── init-mail.el     # 邮件配置（当前存在问题）
├── elpa/                # 已安装的 Emacs 包
├── eln-cache/           # 原生编译缓存
├── auto-save-list/      # 自动保存文件
└── transient/           # Transient 缓存目录
```

## 核心配置文件

### init.el

主配置入口文件，负责加载各个模块化配置。加载顺序：

1. **init-basic** - 基础设置（编码、行号、缩进等）
2. **init-packages** - 包管理配置
3. **init-ui** - 界面优化
4. **init-evil** - Evil 和 Colemak 键位
5. **init-editing** - 编辑增强功能
6. **init-git** - Git 集成
7. **init-misc** - 其他实用设置
8. **init-mail** - 邮件配置

### 配置模块详解

#### elisp/init-basic.el

基础 Emacs 配置，包括：

- 关闭启动欢迎画面
- 全局行号显示
- 当前行高亮
- 列号显示
- 自动缩进（electric-indent-mode）
- 自动括号配对（electric-pair-mode）
- 完整的 UTF-8 编码环境设置

#### elisp/init-packages.el

包管理系统配置：

- 配置 GNU ELPA 和 MELPA 包源
- 自动安装并配置 `use-package`
- 设置 `use-package-always-ensure` 为 t，自动确保包已安装

#### elisp/init-ui.el

界面优化配置：

- 禁用工具栏
- 禁用菜单栏
- 禁用滚动条
- 主题配置（当前已注释）

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

- **company**：自动补全框架
- **flycheck**：语法检查工具
- **rainbow-delimiters**：彩虹括号高亮
- **smartparens**：智能括号管理

#### elisp/init-git.el

Git 集成（当前已注释）：

- **magit**：Emacs 中的 Git 界面（快捷键：`C-x g`）

#### elisp/init-misc.el

其他实用设置：

- 禁止创建锁文件
- 将 `yes-or-no-p` 替换为 `y-or-n-p`
- 全局自动重新加载文件

#### elisp/init-mail.el

邮件配置模块（当前存在问题，见下文"已知问题"）

## 构建和运行

这是一个 Emacs 配置项目，不需要传统的构建过程。

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

## 开发约定

### 编码风格

- 使用 Emacs Lisp (Elisp) 语法
- 文件开头添加 `;;; filename.el --- Description` 头部注释
- 文件开头添加 `;;; Commentary:` 和 `;;; Code:` 分节
- 文件末尾添加 `(provide 'module-name)` 和 `;;; filename.el ends here`
- 使用 `use-package` 进行包的声明式配置

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

### 排查问题

如果遇到配置问题：

1. 检查 `*Messages*` 缓冲区查看错误信息
2. 使用 `emacs --debug-init` 启动查看完整错误回溯
3. 使用 `M-x toggle-debug-on-error` 启用错误调试
4. 使用 `M-x eval-buffer` 在当前缓冲区中执行配置代码

## 已知问题

### init-mail.el 加载失败

**错误信息**：
```
error: Loading file /home/red/.config/emacs/elisp/init-mail.el failed to provide feature 'init-mail'
```

**原因**：`init-mail.el` 文件缺少必要的 `(provide 'init-mail)` 声明。

**临时解决方案**：从 `init.el` 中注释掉 `(require 'init-mail)` 行。

**永久解决方案**：在 `init-mail.el` 文件末尾添加 `(provide 'init-mail)`。

## 注意事项

- 该配置目录是 Git 仓库的一部分（远程：`git@github.com:whitevermilion/emacs.git`）
- 当前分支：`main`
- 配置使用模块化结构，便于维护和扩展
- 部分增强功能已注释，需要时可以启用
- 配置使用 UTF-8 编码，确保文件和终端编码一致
- Evil 模式已配置 Colemak 键位，注意移动键位已重新映射（h/n/e/i）