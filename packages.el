(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; This variable contains list of packages that installed to this emacs
;; Modify the list if you want to install another package from melpa repository
;; (defvar required-packages
;;   '(
;;     clojure-mode
;;     cider
;;     clojure-snippets
;;     clj-refactor
;;     paredit
;;     clojure-mode-extra-font-locking
;;     ) "A list of packages to ensure are installed at launch.")

(defvar required-packages
  '(
    monokai-theme
    dracula-theme
    magit
    yasnippet
    yasnippet-snippets
    which-key
    restart-emacs
    smex
    ido-vertical-mode
    multiple-cursors
    exec-path-from-shell
    move-text
    powerline
    rainbow-delimiters
    projectile
    company
    org
    editorconfig
    perspective
    smartparens
    lsp-mode
    lsp-ui
    json-mode
    dap-mode
    typescript-mode
    web-mode
    emmet-mode
    flycheck
    markdown-mode
    clojure-mode
    cider
    clojure-snippets
    clj-refactor
    paredit
    clojure-mode-extra-font-locking
    ) "A list of packages to ensure are installed at launch.")

(defun packages-installed-p ()
  "Check packages is installed from list of packages."
  (loop for p in required-packages
	when (not (package-installed-p p)) do (return nil)
	finally (return t)))

;; if not all packages not installed, check one by one and install the missing ones.
(unless (packages-installed-p)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
