(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-extra-snippets '(
                                (nil . (
                                        ("html5" . "<!DOCTYPE html>\n<html>\n<head>\n<title></title>\n<meta charset=\"utf-8\" />\n</head>\n<body>\n    |\n</body>\n</html>")
                                        )
                                     )
                                ))

(provide 'web-mode-config)
