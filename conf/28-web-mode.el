;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; web-mode http://web-mode.org/
(el-get 'sync 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl\\(\\.php\\)?'" . web-mode))
