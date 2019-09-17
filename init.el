(add-to-list 'load-path "~/.emacs.d/init")

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;; (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

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
