;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; 一二三氏御祿貭鉢鳩澁
;;; いろはにほへと　ちりぬるを
;;; わかよたれそ　　つねならむ
;;; うゐのおくやま　けふこえて
;;; あさきゆめみし　ゑひもせす
(setq my/default-font-family "Migu 2M")
;(setq my/default-font-family "Mgen+ 2m")
(when window-system
  (set-face-attribute 'default nil
		      :family my/default-font-family
		      :height 160)
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family my/default-font-family)))
