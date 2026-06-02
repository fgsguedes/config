(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(menu-bar-mode 0)

;; Change line number description from L{line} to ({line},{column})
(column-number-mode 1)

;; Highlight matching parenthesis
(show-paren-mode 1)

(setq inhibit-startup-screen t)
(transient-mark-mode 1)

(defvar package-list)
(setq package-list '(magit smex))

(require 'org)

(require 'ido)
(ido-mode 1)

(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(custom-set-variables
 '(ido-enable-flex-matching t)
 '(package-selected-packages (quote (darcula-theme magit smex org)))
)

(custom-set-faces )

(load-theme 'darcula t)
