(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   '(company-bbdb company-eclim company-semantic company-xcode company-cmake company-capf company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev))
 '(company-frontends
   '(company-pseudo-tooltip-unless-just-one-frontend company-echo-metadata-frontend company-preview-frontend))
 '(custom-safe-themes
   '("76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" default))
 '(dap-gdb-lldb-debug-program
   '("/home/jamil/.vscode-oss/extensions/webfreak.debug-0.25.0/out/src/gdb.js"))
 '(dap-gdb-lldb-path "/home/jamil/.vscode-oss/extensions/webfreak.debug-0.25.0")
 '(dap-gdb-lldb-path-lldb
   '("/home/jamil/.vscode-oss/extensions/webfreak.debug-0.25.0/out/src/lldb.js"))
 '(flycheck-pos-tip-timeout 20)
 '(helm-split-window-inside-p t)
 '(helm-use-frame-when-dedicated-window nil)
 '(highlight-indent-guides-method 'character)
 '(highlight-indent-guides-responsive 'stack)
 '(hl-paren-background-colors '("#0D0F21" "#0D0F21" "#0D0F21" "#0D0F21" "#0D0F21"))
 '(hl-paren-colors nil)
 '(inhibit-startup-screen t)
 '(lsp-auto-guess-root t)
 '(lsp-file-watch-threshold 10000)
 '(lsp-ui-doc-alignment 'window)
 '(lsp-ui-doc-delay 10)
 '(lsp-ui-doc-header t)
 '(lsp-ui-doc-include-signature t)
 '(magit-status-margin '(t age-abbreviated magit-log-margin-width t 12))
 '(package-selected-packages
   '(tide docker-compose-mode dockerfile-mode yaml-mode hacker-typer lsp-python-ms lsp-pyright god-mode smooth-scroll lsp-jedi rainbow-delimiters highlight-indent-guides nyan-mode whole-line-or-region mwim flycheck-pycheckers php-mode slime-volleyball poker cmake-mode treemacs-icons-dired diff-hl highlight-parentheses clang-format clang-format+ clang-capf lsp-dart lsp-docker lsp-haskell lsp-intellij lsp-java lsp-javacomp lsp-julia lsp-latex lsp-mssql lsp-origami lsp-p4 lsp-pascal lsp-pyre lsp-scala lsp-sourcekit lush-theme treemacs-projectile vterm dap-mode helm-ag flycheck-pos-tip yasnippet major-mode-icons company-lsp lsp-ui emojify multiple-cursors drag-stuff doom-modeline doom-themes helm-lsp lsp-mode lsp-treemacs treemacs-magit flycheck magit company helm helm-projectile projectile projectile-git-autofetch treemacs))
 '(safe-local-variable-values
   '((projectile-project-run-cmd . "cmake --build . -j8 && ./bomberman")
     (projectile-project-compilation-cmd . "cmake --build . -j8")
     (projectile-project-compilation-dir . "build/")
     (projectile-project-run-cmd . "cmake /home/jamil/delivery/IndieStudio/ -B /home/jamil/delivery/IndieStudio/build/ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && cmake --build . -j8 && ./bomberman")
     (projectile-project-configure-cmd . "cmake /home/jamil/delivery/IndieStudio/ -B /home/jamil/delivery/IndieStudio/build/ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON")
     (projectile-project-compilation-cmd . "cmake /home/jamil/delivery/IndieStudio/ -B /home/jamil/delivery/IndieStudio/build/ -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && cmake --build . -j8")))
 '(smooth-scroll/vscroll-step-size 5)
 '(tab-width 4)
 '(truncate-lines t)
 '(x-gtk-use-system-tooltips nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; melpa:

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)

;;; epitech header

(add-to-list 'load-path "~/.emacs.d/lisp")
(load "site-start.d/epitech-init.el")

;;; functions:

(defun prev-window ()
  "Switch to the previous window."
  (interactive)
  (other-window -1))

(defun dont-kill-emacs()
  "Disable binding that would have executed 'kill-emacs'."
  (interactive)
  (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  "Truc machin."
  (interactive)
  (split-window-right)
  (other-window 1))

;;; key bindings:

(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-<iso-lefttab>") 'prev-window)
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)
(global-set-key (kbd "C-x p") 'prev-window)
(global-set-key (kbd "C-.") 'comment-line)
(global-set-key (kbd "C-M-i") 'company-complete)
(global-set-key (kbd "C-c d") 'lsp-ui-doc-show)

;;; packages

;; projectile
(require 'projectile)
(projectile-mode 't)
(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)

;; treemacs
(require 'treemacs)
(global-set-key (kbd "<f8>") 'treemacs)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(winner-mode 1)
(electric-pair-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode)))
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))

(tooltip-mode 1)

;; (add-hook 'shell-mode-hook (lambda () (compilation-shell-minor-mode 1)))
;; (add-hook 'eshell-mode-hook (lambda () (compilation-shell-minor-mode 1)))
;; (add-hook 'term-mode-hook (lambda () (compilation-shell-minor-mode 1)))
;; (add-hook 'vterm-mode-hook (lambda () (compilation-shell-minor-mode 1)))

(require 'company)
(add-hook 'prog-mode-hook (lambda () (company-mode)))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)

(require 'drag-stuff)
(drag-stuff-global-mode 1)

(global-set-key (kbd "<M-up>") 'drag-stuff-up)
(global-set-key (kbd "<M-down>") 'drag-stuff-down)
(global-set-key (kbd "<M-left>") 'drag-stuff-left)
(global-set-key (kbd "<M-right>") 'drag-stuff-right)

(require 'multiple-cursors)
(add-hook 'prog-mode-hook (lambda () (interactive) (multiple-cursors-mode 1)))
(global-set-key (kbd "C-c m") 'mc/edit-lines)
(global-set-key (kbd "M-{") 'mc/mark-next-like-this)
(global-set-key (kbd "M-}") 'mc/unmark-next-like-this)

(require 'emojify)
(add-hook 'magit-mode-hook (lambda () (interactive) (emojify-mode 1)))
(add-hook 'text-mode-hook (lambda () (interactive) (emojify-mode 1)))

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

(use-package lsp-mode
  :commands lsp
  :ensure t)
(use-package lsp-ui :commands lsp-ui-mode :ensure t)
(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config (push 'company-lsp company-backends)) ;; add company-lsp as a backend

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))


(require 'flycheck)
(global-flycheck-mode 1)
(flycheck-pos-tip-mode 1)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup)) ;; python

(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook (lambda () (yas-minor-mode-on)))
(global-set-key (kbd "C-x y") 'company-yasnippet)

(require 'doom-modeline)
(doom-modeline-mode 1)

(use-package lsp-ui)
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;; (use-package lsp-python-ms
;;   :ensure t
;;   :init (setq lsp-python-ms-auto-install-server t)
;;   ;; :config (progn
;;             ;; (setq lsp-python-ms-extra-paths
;;                   ;; "[\"/home/jamil/delivery/PokerWebsite/poker/ipc/\", \"/home/jamil/delivery/PokerWebsite/poker/game_logic/\", \"/home/jamil/delivery/PokerWebsite/poker/\"]")
;;             ;; )
;;   :hook (python-mode . lsp))

;; (use-package lsp-jedi
;;   :ensure t
;;   :config
;;   (with-eval-after-load "lsp-mode"
;;     (add-to-list 'lsp-disabled-clients 'pyls)
;;     (add-to-list 'lsp-enabled-clients 'jedi)))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

(dap-auto-configure-mode 1)

(add-to-list 'load-path "~/.emacs.d/elpa/dap-mode-20200529.126")
(require 'dap-python)
(lsp-treemacs-sync-mode 1)
;; (require 'dap-lldb)
;; (setq dap-lldb-debug-program "/bin/lldb-vscode")

(global-set-key (kbd "<f1>") 'dap-debug)
(global-set-key (kbd "<f2>") 'dap-eval-thing-at-point)
(global-set-key (kbd "<f3>") 'dap-eval-region)
(global-set-key (kbd "<f4>") 'dap-eval)
(global-set-key (kbd "<f5>") 'dap-continue)
(global-set-key (kbd "<f6>") 'dap-hydra)
(global-set-key (kbd "<f10>") 'dap-next)
(global-set-key (kbd "<f11>") 'dap-step-in)
(global-set-key (kbd "<f12>") 'dap-step-out)

(require 'dap-gdb-lldb)
;;; dap end


(if (display-graphic-p)
    (progn
      (use-package doom-themes
        :config

        (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
              doom-themes-enable-italic t) ; if nil, italics is universally disabled

        (load-theme 'doom-molokai t)

        ;; Enable flashing mode-line on errors
        (doom-themes-visual-bell-config)

        ;; Corrects (and improves) org-mode's native fontification.
        ;; Enable custom treemacs theme (all-the-icons must be installed!)
        (setq doom-themes-treemacs-theme "doom-colors")
        ;; (doom-themes-treemacs-config)

        (doom-themes-org-config))

      (normal-erase-is-backspace-mode 1)
      (global-set-key (kbd "C-x C-c") 'dont-kill-emacs))
  (progn
    (load-theme 'doom-dark+)
    (xterm-mouse-mode 1)
    )
  )

(add-hook 'prog-mode-hook (gdb-enable-debug 1))
(add-hook 'prog-mode-hook (gdb-many-windows 1))
(add-hook 'prog-mode-hook (gud-tooltip-mode 1))

(setq-default scroll-down-aggressively 0.01)
(setq-default scroll-up-aggressively 0.01)
(setq-default scroll-margin 0)

(require 'highlight-parentheses)
(global-highlight-parentheses-mode 1)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(global-set-key (kbd "C-a") 'mwim-beginning)
(global-set-key (kbd "C-e") 'mwim-end)

(whole-line-or-region-global-mode t)

;; (require 'smooth-scroll)
;; (smooth-scroll-mode 1)

(global-set-key (kbd "<f9>") 'god-mode)
(global-set-key (kbd "C-<f9>") 'god-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'js-mode-hook #'setup-tide-mode)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(require 'vterm)

(define-key vterm-mode-map (kbd "<C-backspace>")
    (lambda () (interactive) (vterm-send-key (kbd "C-w"))))

(add-hook 'vterm-mode-hook 'compilation-shell-minor-mode)

;; (nyan-mode)
;; (nyan-toggle-wavy-trail)
;; (nyan-start-animation)

;; (add-hook 'prog-mode-hook 'hl-line-mode)
;; (add-hook 'prog-mode-hook 'diff-hl-mode)
;; (diff-hl-margin-mode 1)
;; (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
;; (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
