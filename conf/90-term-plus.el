;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; term+
(el-get 'sync '(term+ term+ki term+mux term+evil))
(require 'term+)
(require 'xterm-256color)
(require 'term+key-intercept)
(require 'term+mux)
(require 'term+evil)

(global-set-key (kbd "C-x t") 'term+mux-other-window)
(define-key term+char-map (kbd "C-h") nil)

;;; C-c [←↓↑→]
(mapc (lambda (k)
        (define-key
	  term+char-map
         (read-kbd-macro (concat "C-c " "<" k ">"))
         (intern (concat "windmove-" k))))
      '("right" "left" "up" "down"))
