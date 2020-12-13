(define-key global-map (kbd "C-x g") 'magit-status)
(define-key global-map (kbd "C-x M-g") 'magit-dispatch-popup)

(global-set-key (kbd "C-c C-r") 'restart-emacs)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; Re-map the old M-x command
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-c C-j") 'windmove-left)
(global-set-key (kbd "C-c C-k") 'windmove-down)
(global-set-key (kbd "C-c C-i") 'windmove-up)
(global-set-key (kbd "C-c C-l") 'windmove-right)

(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(global-set-key (kbd "s-<backspace>") 'paredit-delete-region)
