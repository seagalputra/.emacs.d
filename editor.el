;; Remove scrollbars, menu bars, and toolbars
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(global-visual-line-mode 1)

(setq-default tab-width 4)

(show-paren-mode 1)

(add-to-list 'default-frame-alist '(font . "Monaco-13"))

(add-hook 'after-save-hook 'format-all-buffer)

(setq inhibit-startup-screen t)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Show line number
(global-linum-mode)

(setq-default cursor-type 'bar)

;; Saving place when previously visited the same file.
(require 'saveplace)
(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups.
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

;; Setting full path in title bar
(setq-default frame-title-format "%b (%f)")

;; Keybindings
;; Below line is for defining custom key-bindings

;; Wind-move
(global-set-key (kbd "C-c C-j") 'windmove-left)
(global-set-key (kbd "C-c C-k") 'windmove-down)
(global-set-key (kbd "C-c C-l") 'windmove-up)
(global-set-key (kbd "C-c C-;") 'windmove-right)

;; restart-emacs
(global-set-key (kbd "C-c C-r") 'restart-emacs)

;; Configuring comments when editing file
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'togglpe-comment-on-line)

;; Key binding to use "hippie expand" for text autocompletion
(global-set-key (kbd "M-/") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
		try-expand-dabbrev-all-buffers
		try-expand-dabbrev-from-kill
		try-complete-lisp-symbol-partially
		try-complete-lisp-symbol))

(setq js-indent-level 2)
(setq typescript-indent-level 2)

(setq ring-bell-function 'ignore)
