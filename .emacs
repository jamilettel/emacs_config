
;; ----------------------------------
;;           EPITECH CONFIG
;; ----------------------------------

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives
             '("MELPA Stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(load "~/.emacs.d/epitech/std.el")
(load "~/.emacs.d/epitech/std_comment.el")
(add-hook 'c-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-yellow)))
(menu-bar-mode nil)
(xterm-mouse-mode t)
(global-flycheck-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0)
 '(company-tooltip-idle-delay 0)
 '(custom-buffer-indent 4)
 '(indent-tabs-mode nil)
 '(mail-indentation-spaces 4)
 '(menu-bar-mode nil)
 '(nlinum-format "%d ")
 '(package-selected-packages
   (quote
    (nlinum company-irony-c-headers company-irony company flycheck-irony flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'wombat)
(electric-pair-mode)
(global-company-mode)
(column-number-mode)
(show-paren-mode)
(global-cwarn-mode)
(global-nlinum-mode)

;;; .emacs ends here
