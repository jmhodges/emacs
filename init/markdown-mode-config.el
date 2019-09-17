(use-package markdown-mode
  ;; remove markdown-mode's not great M-<left> and M-<right> behavior and
  ;; instead let us move around word-by-word like normal.
  :bind (:map markdown-mode-map
              ("M-<left>" . nil)
              ("M-<right>" . nil)))

(provide 'markdown-mode-config)
