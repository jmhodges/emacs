(add-to-list 'load-path "~/.emacs.d/init")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize) ;; get access to ELPA packages here.
(add-to-list 'load-path "~/.emacs.d/modes")
(add-to-list 'load-path "~/.emacs.d/modes/go-mode")

;; Defined first so that M-x jmhodges-install will install packages.
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

;; Default width of tab characters to 4 spaces
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (lsp-mode typescript-mode go-guru go-mode yaml-mode web-mode protobuf-mode pig-mode mustache markdown-mode magit go-autocomplete exec-path-from-shell dockerfile-mode apache-mode)))
 '(tab-width 4))
;; Turn "yes or no" into "y or n"
(defalias 'yes-or-no-p 'y-or-n-p)
;; turn off the beeping
(setq visible-bell 1)
;; display column numbers in mode line
(setq column-number-mode t)
;; line wrap should happen at 80 because that's what most people do
(setq-default fill-column 80)

;; chill out, emacs. your scroll sensitivity is too much
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; scroll one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

(require 'markdown-mode-config)
(require 'css-mode-config)
(require 'web-mode)
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
