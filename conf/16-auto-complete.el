;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; Auto Complete Mode
(el-get 'sync '(auto-complete
		auto-complete-ruby
		auto-complete-yasnippet
		auto-complete-css
		auto-complete-emacs-lisp
		auto-complete-etags
		auto-complete-extension
		auto-complete-latex))
(when (require 'auto-complete nil t)
  (require 'auto-complete-config)
  (add-to-list 'ac-dictionary-directories (locate-user-emacs-file "./ac-dict"))
  (require 'auto-complete-ruby)
  (global-auto-complete-mode t)
  (custom-set-variables
   '(ac-ignore-case nil)
   '(ac-auto-start t)
   '(ac-sources
     '(ac-source-filename
       ac-source-functions
       ac-source-yasnippet
       ac-source-variables
       ac-source-symbols
       ac-source-features
       ac-source-abbrev
       ac-source-words-in-same-mode-buffers
       ac-source-dictionary)))
  (ac-config-default))
