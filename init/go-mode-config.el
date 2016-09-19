(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") #'godef-jump)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-x 4 .") #'godef-jump-other-window)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-(") #'go-rename)))

(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

(provide 'go-mode-config)
