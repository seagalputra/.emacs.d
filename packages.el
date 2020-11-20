(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; This variable contains list of packages that installed to this emacs
;; Modify the list if you want to install another package from melpa repository
(defvar required-packages
  '(
    magit
    yasnippet
    which-key
    restart-emacs
    helm
    multiple-cursors
    format-all
    exec-path-from-shell
    nyan-mode
    ) "a list of packages to ensure are installed at launch.")

(defun packages-installed-p ()
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
