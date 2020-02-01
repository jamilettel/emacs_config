;;; clipboard-collector-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "clipboard-collector" "clipboard-collector.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from clipboard-collector.el

(defvar clipboard-collector-mode nil "\
Non-nil if Clipboard-Collector mode is enabled.
See the `clipboard-collector-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `clipboard-collector-mode'.")

(custom-autoload 'clipboard-collector-mode "clipboard-collector" nil)

(autoload 'clipboard-collector-mode "clipboard-collector" "\
Start collecting clipboard items.

Rules used are defined in `clipboard-collector--rules'. Because
this mode is only for temporary use and you want its bindings to
have precedence over all other ones when activated,
`clipboard-collector-mode-map' is made transient while this mode
is active.

\(fn &optional ARG)" t nil)

(autoload 'clipboard-collector-create "clipboard-collector" "\
Create clipboard collector command named NAME.

Calling the command will start a timer which checks the clipboard
for changes. If the content of a clipboard change match a rule of
RULES with format of `clipboard-collector--rules', it is
collected according to the rule.

The command will enable `clipboard-collector-mode' which will
bind `clipboard-collector-finish' to finish collecting items
using FINISHF which defaults to
`clipboard-collector-finish-default'.

\(fn NAME RULES &optional FINISHF)" nil t)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "clipboard-collector" '("clipboard-collector-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; clipboard-collector-autoloads.el ends here
