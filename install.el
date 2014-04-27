;; Used to maintain consistency of package installation between my machines.
;; Should be first require in init.el, but after package-initialize.

(defvar jmhodges-necessary-packages (list 'auto-complete
                                          'go-autocomplete
                                          'magit
                                          'markdown-mode
                                          'mustache
                                          'pig-mode
                                          'protobuf-mode
                                          'yaml-mode))

(defun jmhodges-install ()
  "Install all ELPA/MELPA packages needed to boot"
  (interactive)
  (unless package-archive-contents (package-refresh-contents))
  (dolist (package jmhodges-necessary-packages)
    (unless (or (member package package-activated-list)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

(provide 'install)
