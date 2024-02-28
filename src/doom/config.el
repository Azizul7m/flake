;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Azizul Islam"
      user-mail-address "azizul7m@gmail.com")



(setq doom-font (font-spec :family "Iosevka" :size 12 :weight 'Regular)
      doom-variable-pitch-font (font-spec :family "Iosevka" :size 14))
(set-fontset-font t 'bengali (font-spec :family "Hind Siliguri" :size 14))
(setq doom-theme 'doom-one)
(setq doom-themes-treemacs-theme "doom-colors")
(setq display-line-numbers-type :relative)

(setq +doom-dashboard-banner-file "~/.face")



(setq user-full-name "Azizul Islam"
      user-mail-address "azizul7m@gmail.com")
;; ;; Configure fill width
(setq visual-fill-column-width 180
      visual-fill-column-center-text t)

(require 'org-present)
(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (setq header-line-format " ");; Set a blank header line string to create blank space at the top
                 (visual-fill-column-mode 1)
                 (visual-line-mode 1)
                 (display-line-numbers-mode 0)
                 (org-display-inline-images)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (setq header-line-format nil) ;; Clear the header line string so that it isn't displayed
                 ;; (visual-fill-column-mode 0)
                 ;; (visual-line-mode 0)
                 (org-remove-inline-images)
                 (display-line-numbers-mode 1)
                 ))))

(require 'org-modern)
(with-eval-after-load 'org (global-org-modern-mode))



;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq deft-directory "~/.notes/org/deft"
      deft-extensions '("org" "txt")
      deft-recursive t)

(setq org-roam-directory "~/.notes/org/roam")


;; Journal config
(setq
 org-journal-dir "~/.notes/org/journal"
 org-journal-date-prefix "#+TITLE: "
 org-journal-time-format "%I:%M %p "
 org-journal-time-prefix "* "
 org-journal-date-format "%A, %d/%m/%Y"
 org-journal-file-format "%d-%m-%Y.org")




(after! yasnippet
  :config
  (setq yas-snippet-dirs '("~/.notes/org/snippets"))
  (yas-global-mode 1))



(after! org
  (setq org-agenda-files '("~/.notes/org/agenda.org")))



(use-package popup-kill-ring
  :bind("M-y" . popup-kill-ring))
;; (setq ispell-alternate-dictionary "$HOME/.local/share/dictionaries/en")

;; TODO: heighlight config
(use-package hl-todo
  :hook ((prog-mode . hl-todo-mode)
         (org-mode . hl-todo-mode))
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"     warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("START"      error bold)
          ("END"        error bold)
          ("DEPRECATED" font-lock-doc-face bold))))


;; ;; Diagram flowchart mermaid
(setq ob-mermaid-cli-path "/usr/bin/mmdc")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((mermaid . t)
   (scheme . t)
   ))



;; Translate
(setq google-translate-default-source-language "auto")  ; Auto detect language.
(setq google-translate-default-target-language "bn")    ; Set your target language.
(setq define-it-output-choice 'view)  ; Output with buffer.
(global-set-key (kbd "C-c s") 'define-it-at-point)
(global-set-key (kbd "C-c W") 'define-it)


(global-set-key (kbd "<f12>") '+vterm/here)

;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
