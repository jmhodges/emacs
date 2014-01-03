;; See better-config.el for a few more.

; Avoiding backspace
(global-set-key "\C-w" 'backward-kill-word)

;; M-x without meta (phones, etc)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)


(provide 'key-bindings)
