;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; Coffee Script
(el-get 'sync 'coffee-mode)
(when (require 'coffee-mode nil t)
  (defun my/coffee-mode-hook-function ()
    "coffee-mode-hook"
    (set (make-local-variable 'tab-width) 2)
    (setq coffee-tab-width 2))
  (add-hook 'coffee-mode-hook 'my/coffee-mode-hook-function))
