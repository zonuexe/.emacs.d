;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; Set GUI element
(cond
 (window-system (tool-bar-mode -1))
 (t             (menu-bar-mode -1)))

(set-cursor-color "orange")
(setq blink-cursor-interval 0.6)
(setq blink-cursor-delay 5.0)
(blink-cursor-mode t)
