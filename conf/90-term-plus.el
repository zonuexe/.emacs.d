;;; 

(el-get 'sync '(term+ term+ki term+mux))
(require 'term+)
(require 'xterm-256color)
(require 'term+key-intercept)
(require 'term+mux)

(global-set-key (kbd "C-x t") 'term+mux-other-window)
(define-key term+char-map (kbd "C-z") 'bury-buffer)
