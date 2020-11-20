;; Remove scrollbars, menu bars, and toolbars
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-hook 'after-save-hook 'format-all-buffer)

;; No need for ~ files when edition
(setq create-lockfiles nil)

;; Show line number
(global-linum-mode)

;; Stop cursor blinking
(blink-cursor-mode 0)

;; Keybindings
;; Below line is for defining custom key-bindings

;; Wind-move
(global-set-key (kbd "C-c C-j") 'windmove-left)
(global-set-key (kbd "C-c C-k") 'windmove-down)
(global-set-key (kbd "C-c C-l") 'windmove-up)
(global-set-key (kbd "C-c C-;") 'windmove-right)

;; restart-emacs
(global-set-key (kbd "C-c C-r") 'restart-emacs)

;; Helm
(global-set-key (kbd "C-c f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
