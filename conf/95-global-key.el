;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; C-c [←↓↑→]
(mapc (lambda (k)
        (global-set-key
         (read-kbd-macro (concat "C-c " "<" k ">"))
         (intern (concat "windmove-" k))))
      '("right" "left" "up" "down"))

(cond
    ((eq window-system 'ns)
     (global-set-key (kbd "¥") (lambda () (interactive) (insert "\\")))
     (global-set-key (kbd "M-¥") (lambda () (interactive) (insert "¥")))
     window-system)
    (t nil))
