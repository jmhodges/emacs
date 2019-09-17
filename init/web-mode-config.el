(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-extra-snippets '(
                                  (nil . (
                                          ("html5" . "<!DOCTYPE html>\n<html>\n<head>\n<title></title>\n<meta charset=\"utf-8\" />\n</head>\n<body>\n    |\n</body>\n</html>")
                                          )
                                       )
                                  )))


(use-package web-mode
  :hook
  (web-mode . my-web-mode-hook)
  :mode
  "\\.html?\\'"
  "\\.css\\'")

(provide 'web-mode-config)
