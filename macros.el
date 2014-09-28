;;; macros.el --- My private macro definition file  -*- lexical-binding: t -*-

;; Filename: macros.el
;; Description: My private macro definition file
;; Package-Requires: ((emacs "24.3"))
;; Author: KAWABATA, Taichi <kawabata.taichi_at_gmail.com>
;; Created: around 1995 (Since my first Emacs experience...)
;; Modified: 2014-04-29
;; Version: 13
;; Keywords: internal, local
;; Human-Keywords: Emacs Initialization
;; Namespace: tkw-
;; URL: https://github.com/kawabata/dotfiles/.emacs.d/init.el

;;; マクロ・関数
;; 本ファイルで使用するマクロと関数の定義
;;;; ライブラリ遅延読み込み
;; hinted by http://lunaryorn.com/blog/2013/05/31_byte-compiling-eval-after-load.html
;; * with-eval-after-load (Emacs 24.4 から)
(unless (fboundp 'with-eval-after-load)
  (defmacro with-eval-after-load (file &rest body)
    `(eval-after-load ,file
       `(funcall (function ,(lambda () ,@body))))))

;;;; 関数のコマンド化
(defmacro command (&rest body)
  `(lambda () (interactive) ,@body))

;;;; auto-mode-alist への追加の高速化
(defsubst add-to-auto-mode-alist (pair)
  "Faster version of (add-to-list 'auto-mode-alist pair)."
  (setq auto-mode-alist (cons pair auto-mode-alist)))

(defun remove-from-auto-mode-alist (pair)
  (setq auto-mode-alist (delete pair auto-mode-alist)))


;; 上記の通常版
;; (defsubst add-to-auto-mode-alist (pair)
;;   (add-to-list 'auto-mode-alist pair))

;;;; バッチモードの時に不要なライブラリを読み込ませない。
;;(defmacro when-interactive-and (cond &rest body)
;;  "When Emacs is interactive (not-batch) and COND, then execute BODY."
;;  (declare (indent 1) (debug t))
;;  `(when (and (not noninteractive) ,cond) ,@body))
;;
;;(font-lock-add-keywords 'emacs-lisp-mode
;;  '(("when-interactive-and" . font-lock-keyword-face)))

;;;; 設定済のassocから不要な設定を削除
(defun tkw-assoc-delete-all (key alist) ; assq-delete-all より
  "Delete from ALIST all elements whose car is `equal' to KEY.
Return the modified alist.
Elements of ALIST that are not conses are ignored."
  (while (and (consp (car alist))
	      (equal (car (car alist)) key))
    (setq alist (cdr alist)))
  (let ((tail alist) tail-cdr)
    (while (setq tail-cdr (cdr tail))
      (if (and (consp (car tail-cdr))
	       (equal (car (car tail-cdr)) key))
	  (setcdr tail (cdr tail-cdr))
	(setq tail tail-cdr))))
  alist)

;;;; major-mode, minor-mode のモードライン名を変更
;; - cf. https://github.com/znz/dot-emacs
(defun tkw-minor-mode-lighter (mode string &optional face)
  "Change the mode-line MODE lighter to STRING with FACE."
  (let ((mode-pair (assq mode minor-mode-alist))
        (string (if face (propertize string 'face face)
                  (concat " " string))))
    (if mode-pair (setcar (cdr mode-pair) string)
      (add-to-list 'minor-mode-alist (list mode string)))))

(defun tkw-major-mode-lighter (mode string &optional face)
  "Change the mode-line MODE lighter to STRING with FACE."
  (let ((string (if face (propertize string 'face face) string)))
    (add-hook (intern (concat (symbol-name mode) "-hook"))
              `(lambda () (setq mode-name ,string)))))

