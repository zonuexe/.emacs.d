;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; ParEdit
(el-get 'sync 'paredit)
(when (require 'eldoc nil t)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (eldoc-add-command 'paredit-backward-delete 'paredit-close-round))
