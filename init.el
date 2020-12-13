(load "~/.emacs.d/packages.el")

(load-theme 'dracula t)

(add-to-list 'load-path "~/.emacs.d/config")

(load "development.el")
(load "keybindings.el")

(add-hook 'after-init-hook '(lambda ()
			      (load "~/.emacs.d/config/editor.el")))

(setq gc-cons-threshold most-positive-fixnum
     gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold 300000000 ; 300mb
		  gc-cons-percentage 0.1)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(atom-one-dark-theme monokai-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
