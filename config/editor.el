(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(when (not (display-graphic-p))
  (menu-bar-mode -1))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-to-list 'default-frame-alist '(font . "Monaco-13"))

(global-visual-line-mode 1)

(show-paren-mode 1)

(global-display-line-numbers-mode)

(setq inhibit-startup-screen t)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Saving place when previously visited the same file.
(require 'saveplace)
(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups.
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
(setq auto-save-default nil)

(setq ring-bell-function 'ignore)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(require 'smex)
(smex-initialize)

(require 'which-key)
(which-key-mode)

(require 'multiple-cursors)
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(move-text-default-bindings)

(require 'powerline)
(powerline-nano-theme)

(require 'editorconfig)
(editorconfig-mode 1)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'perspective)
(persp-mode)
(persp-turn-on-modestring)
