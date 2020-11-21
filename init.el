;; Load packages
(load "~/.emacs.d/load-packages.el")

;; load theme
(load-theme 'monokai t)

;; Run the external file after initial config successfully loaded
(add-hook 'after-init-hook '(lambda ()
			      (load "~/.emacs.d/my-noexternals.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
