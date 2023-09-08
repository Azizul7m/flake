;;;
;;;
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Azizul Islam"
      user-mail-address "azizul7m@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 14 :weight 'Regular)
     doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 12))

;; JetBrains Mono
;; (setq doom-font (font-spec :family "Iosevka" :size 14 :weight 'regular))

(set-fontset-font t 'bengali (font-spec :family "Hind Siliguri" :size 13))



(setq doom-theme 'doom-one)
;;(setq doom-theme 'github-modern)

(smooth-scrolling-mode 1)
(display-battery-mode 't)
(display-time-mode 't)
(setq doom-themes-treemacs-theme "doom-colors")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; babel
(setq org-src-tab-acts-natively t)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; org-mode
(setq org-directory "~/.org/")
(setq org-hide-emphasis-markers t)
(setq org-roam-directory "~/.org/roam")
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; deft

(setq deft-directory "~/.org"
      deft-extensions '("org" "txt")
      deft-recursive t)


;; Journal config
(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-format "%I:%M %p "
      org-journal-time-prefix "* "
      org-journal-date-format "%A, %d/%m/%Y"
      org-journal-file-format "%d-%m-%Y.org")

;; cash memory
(setq gc-cons-threshold (* 1024 1024 100))

(after! company
  (setq company-idle-delay 0.5)
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-minimum-prefix-length 0)
  (setq company-show-quick-access t)
  (setq company-tooltip-align-annotations t)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case t)
  (setq +lsp-company-backends '(  company-capf  :separate company-yasnippet :separate company-files  :separate company-dabbrev :separate company-wordfreq))
  (setq  company-frontends '(company-pseudo-tooltip-frontend company-preview-frontend))
)


(use-package company-lsp
  :ensure t
  :commands company-lsp
  :custom
  (company-lsp-cache-candidate 'auto))
;; (global-set-key (kbd "M-.") #'company-complete)
;;lsp
(setq lsp-enable-file-watchers nil)



(after! yasnippet
  :config
  (setq yas-snippet-dirs '("~/.org/snippets"))
  (yas-global-mode 1))



;; codium
(use-package! codeium)

;; Latex
(setq +latex-viewers 'nil)



(setq
 browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
 shr-use-fonts  nil                          ; No special fonts
 shr-use-colors nil                          ; No colours
 shr-indentation 2                           ; Left-side margin
 shr-width 70                                ; Fold text to 70 columns
 eww-search-prefix "https://google.com/search?q=%s")    ; Use another engine for searching
(global-set-key (kbd "C-c w") 'eww-search-words)


;; Translate
(setq google-translate-default-source-language "auto")  ; Auto detect language.
(setq google-translate-default-target-language "bn")    ; Set your target language.
(setq define-it-output-choice 'view)  ; Output with buffer.
(global-set-key (kbd "C-c s") 'define-it-at-point)
(global-set-key (kbd "C-c W") 'define-it)





;; ;; Diagram flowchart mermaid
(setq ob-mermaid-cli-path "/usr/bin/mmdc")
(org-babel-do-load-languages
    'org-babel-load-languages
    '((mermaid . t)
      (scheme . t)
      ))



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

