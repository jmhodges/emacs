(add-to-list 'load-path "~/.emacs.d")

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize) ;; get access to ELPA packages here.

;; Defined first so that M-x jmhodges-install will install packages.
(require 'install)


(require 'better-defaults)
(require 'key-bindings)
(require 'font-config)
(require 'rename-file-and-buffer)

(add-to-list 'load-path "~/.emacs.d/modes")
(add-to-list 'load-path "~/.emacs.d/modes/go-mode")

(require 'go-mode-load)

(require 'auto-complete)
(require 'go-autocomplete)
;; Required for go-autocomplete
(require 'auto-complete-config)
(ac-config-default)

(server-start)
