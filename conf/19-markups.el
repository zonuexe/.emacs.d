;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; for YAML
(el-get 'sync 'yaml-mode)

;;; for Markdown
(el-get 'sync 'markdown-mode)
(defun my/markdown-mode-hook-function ()
  (setq markdown-command "github_markdown_api"))

(add-to-list 'auto-mode-alist '("\\.md" . gfm-mode))

;;; for reStructuredText
(el-get 'sync 'rst-mode)
