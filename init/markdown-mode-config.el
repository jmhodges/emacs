(eval-after-load "markdown-mode"
  '(progn
     (define-key markdown-mode-map (kbd "M-<left>") nil)
     (define-key markdown-mode-map (kbd "M-<right>") nil)))

(provide 'markdown-mode-config)
