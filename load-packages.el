;; This file is contains some package-related configuration
(load "~/.emacs.d/packages.el")

(when (fboundp 'winner-mode)
  (winner-mode 1))

(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

(require 'yasnippet)
(yas-global-mode 1)
(yas-load-directory "~/.emacs.d/snippets")
;; (add-hook 'term-mode-hook (lambda ()
;; 							(setq yas-dont-activate t)))

(require 'which-key)
(which-key-mode)

(require 'helm)
(helm-mode 1)
(progn (setq helm-buffers-fuzzy-matching t))

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-c b") 'helm-bookmarks)
(global-set-key (kbd "C-c f") 'helm-recentf)
(global-set-key (kbd "C-c g") 'helm-grep-do-git-grep)

(require 'multiple-cursors)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(nyan-mode 1)

(require 'all-the-icons)

(require 'projectile)
(projectile-mode +1)
;; Change the search path of projectile with yours
(setq projectile-project-search-path '("~/Documents/source_code" "~/Documents/CIMB-SiAB"))
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(require 'helm-projectile)
(helm-projectile-on)

(require 'perspective)
(persp-mode)
(persp-turn-on-modestring)

(require 'lsp-mode)
(setq lsp-keymap-prefix "C-c l")
(setq lsp-enable-file-watchers nil)
(setq read-process-output-max (* 1024 1024))
(setq lsp-completion-provider :capf)
(setq lsp-idle-delay 0.500)
(setq lsp-intelephense-multi-root nil)

(with-eval-after-load 'lsp-intelephense
  (setf (lsp--client-multi-root (gethash 'iph lsp-clients)) nil))

(define-key lsp-mode-map (kbd "C-c l") lsp-command-map)

(with-eval-after-load 'lsp-mode
  (add-hook 'js-mode-hook #'lsp)
  (add-hook 'typescript-mode-hook #'lsp)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))

(move-text-default-bindings)

(require 'neotree)
(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
		(file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
		(if (neo-global--window-exists-p)
			(progn
			  (neotree-dir project-dir)
			  (neotree-find file-name)))
      (message "Could not find git project root."))))

;; (global-set-key (kbd "C-c o p") 'neotree-toggle)
(global-set-key (kbd "C-c o p") 'neotree-project-dir)
(setq neo-theme 'nerd)
(setq neo-window-fixed-size nil)

(require 'web-mode)
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook
		  (lambda ()
			(setq emmet-indent-after-insert nil)))

(add-hook 'emmet-mode-hook
		  (lambda ()
			(setq emmet-indentation 2)))

(setq emmet-move-cursor-between-quotes t)
(setq emmet-expand-jsx-className? t)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'smartparens-config)
(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'typescript-mode-hook #'smartparens-mode)

(require 'helm-descbinds)
(helm-descbinds-mode)
(global-set-key (kbd "C-h b") 'helm-descbinds)

(require 'helm-swoop)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(define-key isearch-mode-map (kbd "M-m") 'helm-swoop-from-isearch)
(setq helm-swoop-use-fuzzy-match t)
(setq helm-multi-swoop-edit-save t)
(setq helm-swoop-split-with-multiple-windows nil)
(setq helm-swoop-split-direction 'split-window-vertically)
(setq helm-swoop-speed-or-color nil)
(setq helm-swoop-move-to-line-cycle t)

(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g f") 'avy-goto-line)

(require 'quickrun)
(global-set-key (kbd "C-c r") 'quickrun)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'global-flycheck-mode)

(global-set-key (kbd "<f5>") 'dap-debug)
(global-set-key (kbd "M-<f5>") 'dap-hydra)
(add-hook 'dap-mode 'dap-ui-mode)
(add-hook 'dap-session-created (lambda (&_rest) (dap-hydra)))
(add-hook 'dap-terminated (lambda (&_rest) (dap-hydra/nil)))

(require 'lsp-ui)
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
(setq lsp-ui-doc-delay 1.5)
(setq lsp-ui-doc-position 'bottom)
(setq lsp-ui-doc-max-width 100)

(require 'helm-lsp)
(define-key lsp-mode-map [remap xref-find-apropos] #'helm-lsp-workspace-symbol)
