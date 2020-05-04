;;; ctune-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ctune" "ctune.el" (0 0 0 0))
;;; Generated autoloads from ctune.el

(autoload 'ctune-mode "ctune" "\
Minor mode for easily managing CC Noise Macros, project-wide.
To add a CC Noise Macro, navigate to the identifier and type
\\[ctune-add-noise-macro].  If you want to
remove the identifier from the CC Noise Macro lists, just pass a prefix argument
to the `ctune-add-noise-macro' command.
For saving the changes, either customize the option
`ctune-save-noise-macros-automatically' to a value of your choice, or use the
command `ctune-save-noise-macros'.  This command will save the changed values
of `c-noise-macro-names' and `c-noise-macro-with-parens-names' to the
correspondent `dir-locals-file'.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ctune" '("ctune-")))

;;;***

;;;### (autoloads nil nil ("ctune-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ctune-autoloads.el ends here
