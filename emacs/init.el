(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(setq-default tab-width 4 indent-tabs-mode nil)

(setq display-line-numbers-type 'relative
      make-backup-files nil
      auto-save-default nil
      ring-bell-function 'ignore
      use-short-answers t)

(global-display-line-numbers-mode t)
(global-hl-line-mode t)
(electric-pair-mode t)
(show-paren-mode t)
(column-number-mode t)
(delete-selection-mode t)
(global-auto-revert-mode t)

(set-face-attribute 'default nil :font "Iosevka Term" :height 110)

(use-package modus-themes
  :config
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-mixed-fonts nil)
  (load-theme 'modus-vivendi-tinted t))

(use-package mood-line
  :config (mood-line-mode))

(use-package vertico
  :init (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil))

(use-package marginalia
  :init (marginalia-mode))

(use-package php-mode)
(use-package kotlin-mode)
(use-package rust-mode)

(use-package eglot
  :straight nil
  :hook
  ((python-mode     . eglot-ensure)
   (js-mode         . eglot-ensure)
   (js-ts-mode      . eglot-ensure)
   (typescript-mode . eglot-ensure)
   (tsx-ts-mode     . eglot-ensure)
   (c-mode          . eglot-ensure)
   (c++-mode        . eglot-ensure)
   (c-ts-mode       . eglot-ensure)
   (c++-ts-mode     . eglot-ensure)
   (rust-mode       . eglot-ensure)
   (rust-ts-mode    . eglot-ensure)
   (php-mode        . eglot-ensure)
   (kotlin-mode     . eglot-ensure)
   (java-mode       . eglot-ensure)
   (html-mode       . eglot-ensure)
   (css-mode        . eglot-ensure)
   (asm-mode        . eglot-ensure))
  :config
  (setq eglot-autoshutdown t)
  (add-to-list 'eglot-server-programs
    '(kotlin-mode . ("~/.local/share/kotlin-language-server/bin/kotlin-language-server")))
  (add-to-list 'eglot-server-programs
    '(php-mode . ("intelephense" "--stdio")))
  (add-to-list 'eglot-server-programs
    '(asm-mode . ("asm-lsp"))))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-auto-prefix 2)
  :init (global-corfu-mode))

(use-package which-key
  :init (which-key-mode)
  :config (setq which-key-idle-delay 0.5))
