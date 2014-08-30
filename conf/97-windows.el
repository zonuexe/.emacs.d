;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; windows.el
(el-get 'sync 'windows)
(win:startup-with-window)


(global-set-key (kbd "C-<tab>") 'win-next-window)
(global-set-key (kbd "C-S-<tab>") 'win-prev-window)
