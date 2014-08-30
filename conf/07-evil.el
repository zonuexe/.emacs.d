;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; Evil
(el-get 'sync 'evil)

(defun my/evil-mode ()
  (setq evil-cross-lines nil))

(add-hook 'evil-mode-hook 'my/evil-mode)

;(evil-mode t)

