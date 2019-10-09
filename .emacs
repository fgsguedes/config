(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://stable.melpa.org/packages/") t)

(package-initialize)


(menu-bar-mode 0)

;; Line number in file
;; (global-linum-mode t)

;; Change line number description from L{line} to ({line},{column})
(column-number-mode 1)

;; Highlight matching parenthesis
(show-paren-mode 1)


(setq inhibit-startup-screen t)

(setq backup-directory-alist
      `(("." . "/tmp")))

(defvar package-list)
(setq package-list '(smartparens org magit smex))


(require 'ido)
(ido-mode 1)


(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching t)
 '(package-selected-packages (quote (magit smex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
