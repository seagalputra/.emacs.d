(global-set-key (kbd "C-c C-r") 'restart-emacs)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; Re-map the old M-x command
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-c C-j") 'windmove-left)
(global-set-key (kbd "C-c C-k") 'windmove-down)
(global-set-key (kbd "C-c C-i") 'windmove-up)
(global-set-key (kbd "C-c C-l") 'windmove-right)