
;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp")
(load "site-start.d/epitech-init.el")

(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(global-flycheck-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)

(electric-pair-mode 't)

(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))
(add-hook 'prog-mode-hook (lambda () (company-mode)))
(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode)))

;; (global-display-line-numbers-mode)

(display-time)
(column-number-mode)
(mouse-wheel-mode 0)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)
(xterm-mouse-mode)
;; (global-company-mode)
;; (global-display-line-numbers-mode)
(show-paren-mode)


(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-hscroll-mode t)
 '(company-backends
   (quote
    (company-jedi company-c-headers company-bbdb company-eclim company-clang company-semantic company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev)))
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/9/" "/usr/include/irrlicht")))
 '(company-c-headers-path-user
   (quote
    ("./include/" "." "../include" "../../include" "../../../include/" "../../../../include/" "../../" "../")))
 '(company-clang-arguments
   (quote
    ("-Iinclude" "-I../include" "-I../../include" "-I../../../include" "-I../../../../include" "-I../" "-I../../" "-I../corewar/include" "-I../../corewar/include" "-I../../../corewar/include" "-I../rsrc")))
 '(company-dabbrev-minimum-length 2)
 '(company-idle-delay 0)
 '(company-irony-ignore-case (quote smart))
 '(company-minimum-prefix-length 2)
 '(company-tooltip-idle-delay 0)
 '(custom-safe-themes
   (quote
    ("2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "f9cae16fd084c64bf0a9de797ef9caedc9ff4d463dd0288c30a3f89ecf36ca7e" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" "a83f05e5e2f2538376ea2bfdf9e3cd8b7f7593b16299238c1134c1529503fa88" "0ad7f1c71fd0289f7549f0454c9b12005eddf9b76b7ead32a24d9cb1d16cbcbd" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a339f231e63aab2a17740e5b3965469e8c0b85eccdfb1f9dbd58a30bdad8562b" default)))
 '(electric-pair-pairs (quote ((34 . 34) (8216 . 8217) (8220 . 8221))))
 '(fast-scroll-mode nil)
 '(flycheck-clang-include-path
   (quote
    ("./include/" "../include" "../../include" "../../../include" "../../../../include" "../../" "../" "../corewar/include" "../../corewar/include" "../../../corewar/include" "./rsrc/" "../rsrc")))
 '(flycheck-display-errors-delay 1)
 '(flycheck-highlighting-mode (quote symbols))
 '(flycheck-idle-change-delay 0.8)
 '(flycheck-pos-tip-mode t)
 '(global-yascroll-bar-mode t)
 '(gmm-tool-bar-style (quote gnome))
 '(helm-completion-style (quote emacs))
 '(hscroll-step 1)
 '(idle-highlight-exceptions nil)
 '(idle-highlight-idle-time 0.2)
 '(inhibit-startup-screen t)
 '(irony-additional-clang-options (quote ("-std=c++17")))
 '(package-selected-packages
   (quote
    (atom-dark-theme function-args c-eldoc irony-eldoc flycheck-irony company-irony company-irony-c-headers doom-modeline helm-rtags rtags flycheck-pos-tip quick-peek flycheck-inline treemacs-magit treemacs-projectile treemacs vterm emoji-github helm-ag ctune helm-company helm-gtags ag helm telephone-line scroll-restore fast-scroll jedi company-jedi irony nand2tetris autotetris-mode diff-hl doom-themes neotree drag-stuff nyan-mode srefactor clipboard-collector eww-lnum multiple-cursors flycheck-clang-analyzer magit ## yasnippet 2048-game term+ company-c-headers company flycheck)))
 '(pixel-scroll-mode t)
 '(safe-local-variable-values
   (quote
    ((eval let
           ((root
             (projectile-project-root)))
           (setq-local company-clang-arguments
                       (list
                        (concat "-I" root "include")
                        (concat "-I" root "client/include")
                        (concat "-I" root "lib/include")
                        (concat "-I" root "server/include")))
           (setq-local company-c-headers-path-user
                       (list
                        (concat root "include")
                        (concat root "client/include")
                        (concat root "lib/include")
                        (concat root "server/include")))
           (setq-local flycheck-clang-include-path
                       (list
                        (concat root "include")
                        (concat root "client/include")
                        (concat root "lib/include")
                        (concat root "server/include"))))
     (eval let
           ((root
             (projectile-project-root)))
           (setq-local company-clang-arguments
                       (list
                        (concat "-I" root "include")
                        (concat "-I" root "class")))
           (setq-local company-c-headers-path-user
                       (list
                        (concat root "include")
                        (concat root "class")))
           (setq-local flycheck-clang-include-path
                       (list
                        (concat root "include")
                        (concat root "class"))))
     (eval let
           ((root
             (projectile-project-root)))
           (setq-local company-clang-arguments
                       (list
                        (concat "-I" root "cmake-dependencies/include")
                        (concat "-I" root "include")
                        "-std=c++17"))
           (setq-local flycheck-clang-args
                       (list "-std=c++17"))
           (setq-local company-c-headers-path-user
                       (list
                        (concat root "cmake-dependencies/include")
                        (concat root "include")))
           (setq-local flycheck-clang-include-path
                       (list
                        (concat root "cmake-dependencies/include")
                        (concat root "include")))))))
 '(scroll-down-aggressively 0.0)
 '(scroll-margin 1)
 '(scroll-up-aggressively 0.0)
 '(spaceline-info-mode t)
 '(tab-width 4)
 '(tooltip-mode nil)
 '(treemacs-fringe-indicator-mode t)
 '(truncate-lines t)
 '(yascroll:delay-to-hide 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-error ((t (:foreground "#d02b61" :underline "#d02b61"))))
 '(flycheck-error-list-highlight ((t (:inherit highlight))))
 '(flycheck-error-list-warning ((t (:inherit warning))))
 '(flycheck-warning ((t (:foreground "color-202" :underline (:color "color-202" :style wave)))))
 '(idle-highlight ((t (:background "#393f4b")))))

(load-theme 'doom-one)

(require 'company)
(add-to-list 'company-backends 'company-c-headers)

(add-to-list 'company-backends 'company-jedi)
(add-hook 'python-mode-hook (lambda () (jedi-mode -1)))

(add-to-list 'load-path "~/.emacs.d/column-marker")
(load "column-marker")
(require 'column-marker)
(add-hook 'c-mode-hook (lambda () (interactive) (column-marker-2 80)))

(add-hook 'c-mode-hook (lambda () (interactive) (hs-minor-mode)))
(add-hook 'c++-mode-hook (lambda () (interactive) (hs-minor-mode)))
(global-set-key (kbd "C-c h") 'hs-hide-block)
(global-set-key (kbd "C-c s") 'hs-show-block)
(global-set-key (kbd "C-c M-h") 'hs-hide-all)
(global-set-key (kbd "C-c M-s") 'hs-show-all)

(yas-global-mode)

(require 'multiple-cursors)
(add-hook 'c++-mode-hook (lambda () (interactive) (multiple-cursors-mode)))
(add-hook 'c-mode-hook (lambda () (interactive) (multiple-cursors-mode)))
(global-set-key (kbd "C-c m") 'mc/edit-lines)
(global-set-key (kbd "C-x [") 'mc/mark-next-like-this)
(global-set-key (kbd "C-x ]") 'mc/unmark-next-like-this)
(global-set-key (kbd "C-c <mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-x ESC ] <") 'mc/add-cursor-on-click)

(global-set-key (kbd "C-x y") 'company-yasnippet)
(global-set-key (kbd "C-c ;") 'comment-line)

(require 'drag-stuff)

(drag-stuff-global-mode 1)

(global-set-key (kbd "<M-up>") 'drag-stuff-up)
(global-set-key (kbd "<M-down>") 'drag-stuff-down)
(global-set-key (kbd "<M-left>") 'drag-stuff-left)
(global-set-key (kbd "<M-right>") 'drag-stuff-right)

(add-to-list 'load-path "~/.local/share/icons-in-terminal/")

(require 'treemacs)

(global-set-key (kbd "<f8>") 'treemacs)

(add-to-list 'load-path "~/.emacs.d/idle-highlight-mode")
(load "idle-highlight-mode")
(add-hook 'prog-mode-hook (lambda () (idle-highlight-mode t)))

(setq projectile-project-search-path '("~/delivery/"))

(require 'srefactor)
(require 'srefactor-lisp)

(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)

(require 'projectile)
(projectile-mode 't)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)

(require 'fast-scroll)

(add-hook 'fast-scroll-start-hook (lambda () (flycheck-mode -1)))
(add-hook 'fast-scroll-end-hook (lambda () (flycheck-mode 1)))

(add-hook 'fast-scroll-start-hook (lambda () (idle-highlight-mode -1)))
(add-hook 'fast-scroll-end-hook (lambda () (flycheck-mode t)))

(fast-scroll-config)
(fast-scroll-mode 1)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(require 'scroll-restore)
(scroll-restore-mode 1)
;; Allow scroll-restore to modify the cursor face
(setq scroll-restore-handle-cursor t)
;; Make the cursor invisible while POINT is off-screen
(setq scroll-restore-cursor-type nil)
;; Jump back to the original cursor position after scrolling
(setq scroll-restore-jump-back t)
(put 'scroll-left 'disabled nil)

(require 'telephone-line)
(telephone-line-mode 1)
;; (require 'doom-modeline)
;; (doom-modeline-mode 1)

(require 'helm)

(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-projectile)
(helm-projectile-on)

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(add-hook 'prog-mode-hook (gdb-enable-debug 1))
(add-hook 'prog-mode-hook (gdb-many-windows 1))
(add-hook 'prog-mode-hook (gud-tooltip-mode 1))

;; (require 'cc-mode)
;; (require 'semantic)

;; (global-semanticdb-minor-mode 1)
;; (global-semantic-idle-scheduler-mode 1)

;; (global-set-key (kbd "C-c d") 'semantic-ia-show-summary)

;;; .emacs ends here


(defun dont-kill-emacs()
  "Disable binding that would have executed 'kill-emacs'."
  (interactive)
  (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))

(if (display-graphic-p)
    (progn
      (normal-erase-is-backspace-mode 1)
      (global-set-key (kbd "C-x C-c") 'dont-kill-emacs))
  )

(winner-mode 1)

(defun prev-window ()
  "Switch to the previous window."
   (interactive)
   (other-window -1))
(define-key global-map (kbd "C-x p") 'prev-window)

(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-S-<iso-lefttab>") 'prev-window)

;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;; (setq flycheck-inline-display-function
;;       (lambda (msg pos)
;;         (let* ((ov (quick-peek-overlay-ensure-at pos))
;;                (contents (quick-peek-overlay-contents ov)))
;;           (setf (quick-peek-overlay-contents ov)
;;                 (concat contents (when contents "\n") msg))
;;           (quick-peek-update ov)))
;;       flycheck-inline-clear-function #'quick-peek-hide)


(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(global-set-key (kbd "C-;") 'irony-get-type)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
