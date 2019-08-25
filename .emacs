
;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp")
(load "site-start.d/epitech-init.el")

(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(global-flycheck-mode)
(menu-bar-mode -1)
(electric-pair-mode 't)
(setq-default show-trailing-whitespace t)
(display-time)
(column-number-mode)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)
(xterm-mouse-mode)
(global-company-mode)
(global-display-line-numbers-mode)
(show-paren-mode)


(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-hscroll-mode (quote current-line))
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/9/")))
 '(company-c-headers-path-user
   (quote
    ("." "../include" "../../include" "../../../include/" "../../" "../")))
 '(company-clang-arguments
   (quote
    ("-I../include" "-I../../include" "-I../../../include" "-I../" "-I../../" "-I../corewar/include" "-I../../corewar/include" "-I../../../corewar/include")))
 '(company-dabbrev-minimum-length 2)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 2)
 '(custom-safe-themes
   (quote
    ("080fd60366fb1d6e7aea9f8fd0de03e2a40ac995e51b1ed21de37431d43b4d88" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" default)))
 '(flycheck-clang-include-path
   (quote
    ("../include" "../../include" "../../../include" "../../" "../" "../corewar/include" "../../corewar/include" "../../../corewar/include")))
 '(package-selected-packages
   (quote
    (## yasnippet 2048-game term+ company-c-headers company flycheck)))
 '(pixel-scroll-mode t)
 '(scroll-down-aggressively 0.0)
 '(scroll-margin 1)
 '(scroll-up-aggressively 0.0)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'ample)

(require 'company)
(add-to-list 'company-backends 'company-c-headers)

(add-to-list 'load-path "~/.emacs.d/column-marker")
(load "column-marker")
(require 'column-marker)
(add-hook 'c-mode-hook (lambda () (interactive) (column-marker-2 80)))
(add-hook 'c++-mode-hook (lambda () (interactive) (column-marker-2 80)))

(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))

(setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))

(yas-global-mode)

;;; .emacs ends here
;;
;; Epitech configuration
;;
