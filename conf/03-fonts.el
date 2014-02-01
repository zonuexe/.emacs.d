;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; 一二三氏御祿貭鉢鳩澁
;;; いろはにほへと　ちりぬるを
;;; わかよたれそ　　つねならむ
;;; うゐのおくやま　けふこえて
;;; あさきゆめみし　ゑひもせす
(when window-system
  (set-face-attribute 'default nil
		      :family "Migu 2M"
		      :height 160)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Migu 2M")))
