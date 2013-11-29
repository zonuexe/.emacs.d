;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; C-c [←↓↑→]
(mapc (lambda (k)
        (global-set-key
         (read-kbd-macro (concat "C-c " "<" k ">"))
         (intern (concat "windmove-" k))))
      '("right" "left" "up" "down"))
