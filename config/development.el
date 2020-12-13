(require 'magit)

(require 'yasnippet)
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
(add-hook 'term-mode-hook (lambda ()
			    (setq yas-dont-activate t)))

(require 'projectile)
(projectile-mode +1)
(setq projectile-project-search-path '("~/Documents/source_code"))

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-flycheck-mode)

(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
