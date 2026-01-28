# Emacs 配置项目

## 项目概述

这是一个个人 Emacs 配置项目，位于 `/home/red/.config/emacs`。该项目使用现代 Emacs 配置管理方式，主要包含以下特点：

- **语言环境**：UTF-8 编码设置
- **包管理**：使用 `use-package` 进行包管理和配置
- **包源**：配置了 GNU ELPA 和 MELPA 两个包仓库
- **界面优化**：精简的界面，禁用了工具栏、菜单栏和滚动栏
- **编辑增强**：支持行号显示、语法高亮、智能括号等（部分功能已注释）

## 项目结构

```
/home/red/.config/emacs/
├── init.el          # 主配置文件
├── README.md        # 项目说明文档
└── AGENTS.md        # 本文件，用于 AI 代理的上下文说明
```

## 核心配置文件

### init.el

这是 Emacs 的主要初始化文件，包含以下配置模块：

1. **基础设置**
   - 禁用启动画面
   - 启用全局行号显示
   - 启用当前行高亮
   - 显示列号
   - 启用自动缩进和括号配对
   - UTF-8 编码环境

2. **包管理**
   - 配置 GNU ELPA 和 MELPA 包仓库
   - 自动安装并配置 `use-package`
   - 设置 `use-package-always-ensure` 为 t，自动确保包已安装

3. **界面配置**
   - 禁用工具栏、菜单栏和滚动栏

4. **已注释的功能模块**（可按需启用）
   - `gruvbox-theme`：主题配置
   - `company`：自动补全框架
   - `flycheck`：语法检查
   - `rainbow-delimiters`：彩虹括号
   - `smartparens`：智能括号
   - `magit`：Git 接口（快捷键绑定：`C-x g`）

5. **其他设置**
   - 禁用创建锁文件
   - 将 `yes-or-no-p` 替换为 `y-or-n-p`
   - 启用全局自动重新加载文件

## 构建和运行

这是一个 Emacs 配置项目，不需要传统的构建过程。

### 使用方式

1. **启动 Emacs**
   ```bash
   emacs
   ```

2. **重新加载配置**
   在 Emacs 中执行：
   ```
   M-x load-file RET ~/.config/emacs/init.el RET
   ```
   或直接重启 Emacs。

3. **启用已注释的插件**
   取消 `init.el` 中相应插件配置的注释，然后重新加载配置文件即可。

## 开发约定

### 编码风格

- 使用 Emacs Lisp (Elisp) 语法
- 文件开头添加 `lexical-binding: t` 以启用词法作用域
- 使用 `use-package` 进行包的声明式配置

### 配置原则

1. **按需启用**：许多增强功能默认处于注释状态，按实际需求启用
2. **渐进式配置**：从基础设置开始，逐步添加功能模块
3. **模块化组织**：不同功能通过注释分隔，便于管理和扩展

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

1. 确保包已列在配置中
2. 重启 Emacs 或执行 `M-x package-install RET package-name RET`

### 排查问题

如果遇到配置问题：

1. 检查 `*Messages*` 缓冲区查看错误信息
2. 使用 `M-x toggle-debug-on-error` 启用错误调试
3. 使用 `M-x eval-buffer` 在当前缓冲区中执行配置代码

## 注意事项

- 该配置目录是 Git 仓库的一部分（远程：`git@github.com:whitevermilion/emacs.git`）
- 当前分支：`main`
- 部分增强功能已注释，需要时可以启用
- 配置使用 UTF-8 编码，确保文件和终端编码一致