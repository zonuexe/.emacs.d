;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; ファイルシステムごとの設定
(cond
 ;; darwin(= OS X)のとき
 ((eq system-type 'darwin)
  ;; HFS+のエンコーディングはUTF-8(NFD likeな正規化)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (custom-set-variables
   '(locale-coding-system 'utf-8-hfs)))
 ;; Windowsのとき
 ((eq system-type 'windows-nt)
  ;; NTFSのエンコーディングはCP932
  (set-file-name-coding-system 'cp932)
  (custom-set-variables
   '(locale-coding-system 'cp932))))

