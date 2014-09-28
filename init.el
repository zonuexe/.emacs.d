;;; init.el --- My Emacs Initialization/Customization file  -*- lexical-binding: t -*-

;; Filename: init.el
;; Description: My Emacs Initialization/Customization file
;; Package-Requires: ((emacs "24.3"))
;; Author: USAMI Kenta <tadsan@zonu.me>
;; Created: 2014-09-03
;; Modified: 2014-09-20
;; Version: 1
;; Keywords: internal, local
;; Human-Keywords: Emacs Initialization
;; Namespace: my:
;; URL: https://github.com/zonuexe/

;;; Code:
(add-to-list 'load-path (locate-user-emacs-file "./site-lisp/emacswiki"))

(require 'cl-lib)
(require 'anaphora)

(setq init-file-debug t)

(add-to-list 'load-path (locate-user-emacs-file "./site-lisp/use-package"))
(require 'use-package)
(require 'bind-key)

;;;; Cask
(add-to-list 'load-path "~/.cask")
(when (require 'package nil t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
  (package-initialize))

(require 'cask)
(cask-initialize)
(use-package palette)

;;;; Window
(cond
 (window-system (tool-bar-mode -1))
 (t             (menu-bar-mode -1)))

(when (and window-system (require 'maxframe nil t))
  (add-hook 'window-setup-hook 'maximize-frame t))

;;;; Font
(when (and window-system (>= emacs-major-version 23))
  (set-face-attribute 'default nil
                      :family "Migu 2M"
                      :height 150))

;;;; Editor
(setq-default
 tab-width 4
 indent-tabs-mode nil)

(use-package smart-newline)

;;;; Auto Complete
(use-package auto-complete-config :defer t
  :config
  (ac-config-default))

;;;; Coding

(use-package yasnippet)

;;;;; Emacs Lisp
(defun my/emacs-lisp-mode-hook ()
  (turn-on-eldoc-mode)
  (smart-newline-mode t)
  (setq ac-sources
        '(ac-source-functions
          ac-source-symbols
          ac-source-words-in-same-mode-buffers)))
(add-hook 'emacs-lisp-mode-hook 'my/emacs-lisp-mode-hook)

;;;;; Ruby
(use-package yard-mode)
(use-package rinari)
(use-package enh-ruby-mode
  :mode (("Gemfile" . ruby-mode)
         ("Capfile" . ruby-mode)
         ("Rakefile" . ruby-mode)
         ("Vagrantfile" . ruby-mode))
  :config
  (smart-newline-mode t)
  (yard-mode t)
  (when (require 'auto-complete nil :no-error)
    (add-to-list 'ac-modes 'enh-ruby-mode))
  (setq ac-sources
        '(ac-source-functions
          ac-source-symbols
          ac-source-words-in-same-mode-buffers))
  (setq enh-ruby-bounce-deep-indent t)
  (setq enh-ruby-hanging-brace-indent-level 2))

(use-package php-eldoc)
(use-package php-mode
  )

;;;;; Markdown
(use-package markdown-mode
  :config
  )

;;;; Helm
(use-package helm
  :config
  (helm-mode t))

;;;; Magit
(use-package magit
  :config
  (bind-key "C-x m" 'magit-status)
  (bind-key "C-c l" 'magit-blame-mode))

;;;; ParEdit
(when (require 'paredit nil t)
  (add-hook 'emacs-lisp-mode-hook      'enable-paredit-mode)
  (add-hook 'lisp-interacton-mode-hook 'enable-paredit-mode)
  (add-hook 'scheme-mode-hook          'enable-paredit-mode))

;;;; undo-tree
(use-package undo-tree
  :config
  (global-undo-tree-mode))

;;;; outline.el (minor-mode)
(use-package outline :defer t
  :config
  (bind-key "<tab>" 'org-cycle outline-minor-mode-map)
  (bind-key "C-<tab>" 'org-global-cycle outline-minor-mode-map)
  (bind-key "C-c C-f" 'outline-forward-same-level outline-minor-mode-map)
  (bind-key "C-c C-b" 'outline-backward-same-level outline-minor-mode-map)
  (bind-key "C-c C-n" 'outline-next-visible-heading outline-minor-mode-map)
  (bind-key "C-c C-p" 'outline-previous-visible-heading outline-minor-mode-map)
  (bind-key "<tab>" 'org-cycle outline-mode-map)
  (bind-key "S-<tab>" 'org-global-cycle outline-mode-map))

;;;; Global key-binding
;;;;; windmove
(bind-key "C-c <down>"  'windmove-down)
(bind-key "C-c <right>" 'windmove-right)
(bind-key "C-c <left>"  'windmove-left)
(bind-key "C-c <up>"    'windmove-up)

;;;;; for Mac
;;;; keybind
(cond
 ((eq window-system 'ns)
  (bind-key "M-¥" (lambda () (interactive) (insert "¥")))
  (bind-key "¥"   (lambda () (interactive) (insert "\\")))))

(when window-system
  (server-start)
  (edit-server-start))

;;;; modes
(show-paren-mode t)
(setq-default show-trailing-whitespace t)

(provide 'init) ; make sure it only load once.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((eval hide-sublevels 5) (outline-minor-mode . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; Footer:

;; Local Variables:
;; coding: utf-8-unix
;; outline-minor-mode: t
;; time-stamp-pattern: "10/Modified:\\\\?[ \t]+%:y-%02m-%02d\\\\?\n"
;; eval: (hide-sublevels 5)
;; End:

;;; init.el ends here
