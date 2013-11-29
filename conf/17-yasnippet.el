;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; YASnippet
(el-get 'sync '(yasnippet yasnippet-config dropdown-list))
(require 'dropdown-list)
(when (require 'yasnippet nil t)
  (yas/load-directory (locate-user-emacs-file "./el-get/yasnippet/snippets"))
  ;(yas-global-mode t)
  (call-interactively 'yas/reload-all)
  (custom-set-variables
   '(yas/prompt-functions
     '(yas/dropdown-prompt
       yas/completing-prompt
       yas/ido-prompt
       yas/no-prompt))))
