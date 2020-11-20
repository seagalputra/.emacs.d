;; loading package
(load "~/.emacs.d/packages.el")

(when (fboundp 'winner-mode)
  (winner-mode 1))

(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

(require 'yasnippet)
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
(add-hook 'term-mode-hook (lambda ()
			    (setq yas-dont-activate t)))

(require 'which-key)
(which-key-mode)

(require 'helm)
(helm-mode 1)

(require 'multiple-cursors)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(nyan-mode 1)
