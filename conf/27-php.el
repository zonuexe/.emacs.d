;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; for PHP
(el-get 'sync '(php-mode php-completion php-eldoc))
(when (require 'php-mode nil t)
  (defun my/php-mode-hook-function ()
    (when (require 'php-completion nil t)
      (php-completion-mode t))
    (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
    (define-key php-mode-map (kbd "[") (smartchr "[]" "array()" "[[]]"))
    (define-key php-mode-map (kbd "]") (smartchr "array " "]" "]]"))
    (let ((my/php-offset 4))
      (setq tab-width my/php-offset
            c-basic-offset my/php-offset
            indent-tabs-mode nil)
      (c-set-offset 'case-label' my/php-offset)
      (c-set-offset 'arglist-intro' my/php-offset)
      (c-set-offset 'arglist-cont-nonempty' my/php-offset)
      (c-set-offset 'arglist-close' 0))
    t)
  (add-hook 'php-mode-hook 'my/php-mode-hook-function))
