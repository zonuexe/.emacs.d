;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(setq vc-handled-backends '())
(eval-after-load "vc"
  '(remove-hook 'find-file-hooks 'vc-find-file-hook))
 
(el-get 'sync 'magit)
(require 'magit)
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "white"))))
(global-set-key (kbd "C-x m") 'magit-status)
