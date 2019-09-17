;; Used to maintain consistency of package installation between my machines.
;; Should be first require in init.el, but after package-initialize and the
;; custom variables set up because we want package-selected-packages to be set.

(defun jmhodges-install ()
  "Install all ELPA/MELPA packages needed to boot"
  (interactive)
  (unless package-archive-contents (package-refresh-contents))
  (dolist (package package-selected-packages)
    (unless (or (member package package-activated-list)
                (functionp package))
      (message "Installing %s" (symbol-name package))
      (package-install package))))

(provide 'install)
