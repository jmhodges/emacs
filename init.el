(add-to-list 'load-path "~/.emacs.d/init")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
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
(custom-set-variables '(tab-width 4))
;; Turn "yes or no" into "y or n"
(defalias 'yes-or-no-p 'y-or-n-p)
;; turn off the beeping
(setq visible-bell 1)
;; display column numbers in mode line
(setq column-number-mode t)

(require 'markdown-mode-config)
(require 'web-mode-config)
(require 'web-mode)
(require 'go-mode-autoloads)
(require 'rename)
(require 'go-mode-config)
(require 'js-mode-config)
(require 'sh-mode-config)

(require 'auto-complete)
(require 'go-autocomplete)


;; Required for go-autocomplete
(require 'auto-complete-config)
(ac-config-default)

(server-start)
