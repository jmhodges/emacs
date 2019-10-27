(add-to-list 'load-path "~/.emacs.d/init")

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("MELPA Stable" . "https://stable.melpa.org/packages/")
      ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 0)
        ("MELPA"        . 10))) ;; MELPA goes first, then look up Stable
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Default width of tab characters to 4 spaces
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (use-package lsp-mode typescript-mode go-guru go-mode yaml-mode web-mode protobuf-mode pig-mode mustache markdown-mode magit go-autocomplete exec-path-from-shell dockerfile-mode apache-mode)))
 '(tab-width 4))

(require 'install)
(require 'better-defaults)
(require 'key-bindings)

;; Copy the shell PATH to emacs if on OS X.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PYTHONPATH")
  (exec-path-from-shell-copy-env "JAVA_HOME")
  (exec-path-from-shell-copy-env "GOPATH")
  )

(require 'font-config)
(require 'rename-file-and-buffer)
(require 'sudo-edit)

;; Turn "yes or no" into "y or n"
(defalias 'yes-or-no-p 'y-or-n-p)
;; turn off the beeping
(setq visible-bell 1)

;; don't set off the bell when we scroll to the end of a buffer
(defun my-bell-function ()
  (unless (memq this-command
        '(isearch-abort abort-recursive-edit exit-minibuffer
              keyboard-quit mwheel-scroll down up next-line previous-line
              backward-char forward-char))
    (ding)))
(setq ring-bell-function 'my-bell-function)

;; display column numbers in mode line
(setq column-number-mode t)
;; line wrap should happen at 80 because that's what most people do
(setq-default fill-column 80)

;; chill out, emacs. your scroll sensitivity is too much
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; scroll one line at a time
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(eval-when-compile
  (require 'use-package))
(require 'bind-key)                ;; if you use any :bind variant

(require 'markdown-mode-config)
(require 'web-mode-config)
(require 'go-guru)
(require 'go-mode-config)
(require 'js-mode-config)
(require 'sh-mode-config)
(require 'dockerfile-mode-config)
(require 'python-mode-config)
(require 'auto-complete)
(require 'go-autocomplete)

;; Required for go-autocomplete
(require 'auto-complete-config)
(ac-config-default)

(server-start)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
