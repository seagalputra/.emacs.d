;; This file is contains some package-related configuration
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

(require 'all-the-icons)

(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(require 'lsp-mode)
(with-eval-after-load 'lsp-mode
  (add-hook 'js-mode-hook #'lsp)
  (add-hook 'typescript-mode-hook #'lsp)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(move-text-default-bindings)

(require 'neotree)
(global-set-key (kbd "C-c o p") 'neotree-toggle)
