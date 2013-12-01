;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; ruby-mode
(el-get 'sync '(ruby-mode rcodetools))
(when (require 'ruby-mode nil t)
  (defun my/ruby-mode-hook-function ()
    (setq ruby-deep-indent-paren-style nil)
    (make-local-variable 'ac-ignore-case)
    (setq ac-ignore-case nil)
    (make-local-variable 'ac-omni-completion-sources)
    (make-local-variable 'ac-ignore-case)
    (setq ac-ignore-case nil)
    (setq ac-omni-completion-sources '(("\\.\\=" . (ac-source-rcodetools))))
    t)
  (add-hook 'ruby-mode-hook 'my/ruby-mode-hook-function))
