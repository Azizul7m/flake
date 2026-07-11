;; ~/.emacs.d/init.el
;; Prefer loading a pre-tangled `config.el` for faster startup.
(let ((config-el (expand-file-name "config.el" user-emacs-directory))
	  (config-org (expand-file-name "config.org" user-emacs-directory)))
  (require 'org)
  (cond
   ((file-exists-p config-el)
	(load-file config-el))
   ((file-exists-p config-org)
	(org-babel-load-file config-org))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(dash go-mode rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
