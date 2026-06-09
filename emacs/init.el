(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://stable.melpa.org/packages/") t)

(package-initialize)

(menu-bar-mode 0)

;; Change line number description from L{line} to ({line},{column})
(column-number-mode 1)

;; Highlight matching parenthesis
(show-paren-mode 1)

(setq require-final-newline t)

(setq inhibit-startup-screen t)
(transient-mark-mode 1)

(defvar package-list)
(setq package-list '(smex))

(require 'ido)
(ido-mode 1)

(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)

(defvar --backup-dir (expand-file-name "backups" user-emacs-directory))
(if (not (file-exists-p --backup-dir))
    (make-directory --backup-dir t))

(setq backup-directory-alist `(("." . ,--backup-dir)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching t)
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((tokyonight-themes :url
			"https://github.com/xuchengpeng/tokyonight-themes"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package tokyonight-themes
  :vc (:url "https://github.com/xuchengpeng/tokyonight-themes")
  :config
  (load-theme 'tokyonight-moon :no-confirm))
