;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;; load initial files
(load (locate-user-emacs-file "./macros"))
(load (locate-user-emacs-file "./packages"))

;;; load config files
(pkg-sync 'init-loader require
	  (init-loader-load (locate-user-emacs-file "./conf")))
(put 'dired-find-alternate-file 'disabled nil)

(el-get 'sync 'ov)
(el-get 'sync 'helm-swoop)

(el-get 'sync 'howm)
(require 'howm)

(el-get 'sync 'maxframe)
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

(el-get 'sync 'nendo-mode)
(require 'nendo-mode)

(el-get 'sync 'scss-mode)
(el-get 'sync 'cedet)
(require 'semantic)

(el-get 'sync 'json-mode)
(el-get 'sync 'go-mode)
(el-get 'sync 'clojure-mode)
