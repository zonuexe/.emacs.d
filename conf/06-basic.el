;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; uniquify
(when (require 'uniquify nil t)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
  (setq-default show-trailing-whitespace t))

;;; TRAMP
(when (require 'tramp nil t)
  (setq tramp-default-method "ssh"))

;;; disable backup
(setq
 make-backup-files nil
 auto-save-default nil)
