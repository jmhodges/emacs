(add-hook 'sh-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-hook 'sh-mode-hook (lambda () (setq sh-basic-offset 2)))
(add-hook 'sh-mode-hook (lambda () (setq sh-indentation 2)))

(provide 'sh-mode-config)
