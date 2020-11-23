;; Load packages
(load "~/.emacs.d/load-packages.el")

;; load theme
(load-theme 'monokai t)

;; set JAVA_HOME
(setenv "JAVA_HOME" "/Users/seagalputra/.sdkman/candidates/java/current")
(setq lsp-java-java-path "/Users/seagalputra/.sdkman/candidates/java/current")

;; Run the external file after initial config successfully loaded
(add-hook 'after-init-hook '(lambda ()
			      (load "~/.emacs.d/my-noexternals.el")))

;; Avoid garbage collection at statup
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
 '(package-selected-packages '(magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
