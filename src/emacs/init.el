(org-babel-load-file 
  (expand-file-name 
    "config.org"
    user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5ad2725fbc822a617a00fabfae5ec188bff508b03f05b84079803fd31153d03a" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" default))
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-readtheorg\\.setup\\'"))
 '(package-selected-packages
   '(typescript-mode org-modern yasnippet-snippets yasnippet-classic-snippets rust-mode dap-mode lsp-ui smartparens projectile treemacs magit format-all highlight-indent-guides dashboard doom-modeline doom-themes hungry-delete all-the-icons marginalia wgrep embark-consult embark consult orderless vertico eglot)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.25))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.225))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.15))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.125))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.1)))))
