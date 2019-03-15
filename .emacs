
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

(electric-pair-mode 't)
(setq-default show-trailing-whitespace t)
(display-time)
(column-number-mode)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)
(xterm-mouse-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-hscroll-mode (quote current-line))
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/")))
 '(company-c-headers-path-user (quote ("." "../include/" "../../include/")))
 '(company-clang-arguments (quote ("-I../include/" "-I../../include")))
 '(company-dabbrev-code-modes
   (quote
    (prog-mode batch-file-mode csharp-mode css-mode erlang-mode haskell-mode jde-mode lua-mode python-mode c-mode)))
 '(company-dabbrev-minimum-length 2)
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 2)
 '(custom-safe-themes
   (quote
    ("080fd60366fb1d6e7aea9f8fd0de03e2a40ac995e51b1ed21de37431d43b4d88" "c335adbb7d7cb79bc34de77a16e12d28e6b927115b992bccc109fb752a365c72" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" default)))
 '(flycheck-clang-include-path (quote ("../../include" "../include/" "./")))
 '(flycheck-idle-change-delay 0)
 '(global-company-mode t)
 '(global-flycheck-mode t)
 '(global-linum-mode nil)
 '(global-nlinum-mode t)
 '(linum-format "%2d ")
 '(maximum-scroll-margin 0.0)
 '(menu-bar-mode nil)
 '(nlinum-format "%2d ")
 '(package-selected-packages
   (quote
    (nlinum company-irony-c-headers company-irony company-c-headers company flycheck)))
 '(scroll-down-aggressively 0.0)
 '(scroll-margin 1)
 '(scroll-up-aggressively 0.0)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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


(require 'company)


;; (add-to-list 'company-backends 'company-irony)
;; (add-to-list 'company-backends 'company-irony-c-headers)

;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;; (add-hook 'c-mode-common-hook 'irony-mode)
;; (add-hook 'c-mode-common-hook 'company-mode)



(setq company-backends (delete 'company-semantic company-backends))

(require 'company-irony-c-headers)
   ;; Load with `irony-mode` as a grouped backend
   (eval-after-load 'company
     '(add-to-list
       'company-backends '(company-irony-c-headers company-irony)))
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(add-to-list 'company-backends 'company-c-headers)




(load-theme 'ample)

;;; .emacs ends here
