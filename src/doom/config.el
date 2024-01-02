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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

(setq doom-themes-treemacs-theme "doom-colors")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type :relative)


(setq +doom-dashboard-banner-file "~/.face")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!





(setq deft-directory "~/.org/deft"
      deft-extensions '("org" "txt")
      deft-recursive t)

(setq org-roam-directory "~/.org/roam")

;; Journal config
(setq
 org-journal-dir "~/.org/journal"
 org-journal-date-prefix "#+TITLE: "
 org-journal-time-format "%I:%M %p "
 org-journal-time-prefix "* "
 org-journal-date-format "%A, %d/%m/%Y"
 org-journal-file-format "%d-%m-%Y.org")



(after! company
  (setq company-idle-delay 0.0
        company-tooltip-limit 20
        company-minimum-prefix-length 2
        company-begin-commands '(self-insert-command)
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above t
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t))

(add-hook 'org-mode-hook 'company-mode)
(setq company-backends '(company-org))
(setq company-minimum-prefix-length 0)

(after! yasnippet
  :config
  (setq yas-snippet-dirs '(
                           "~/.org/snippets" ;; personal snippets
                           "~/.config/emacs/plugins/snippets"
                           ))
  (yas-global-mode 1))



(after! org
  (setq org-agenda-files '("~/.org/agenda.org")))


(setq pdf-viewer 'sioyek)

(use-package popup-kill-ring
  :bind("M-y" . popup-kill-ring))
(setq ispell-alternate-dictionary "$HOME/.local/share/dictionaries/en")

(use-package codeium
  :init
  ;; (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
  ;; (setq codeium/metadata/api_key "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")
  (setq codeium-mode-line-enable
        (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
  (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
  )



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


;;Telega


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

;; Telega
(setq telega-emoji-company-backend 'telega-company-emoji)

(defun my-telega-chat-mode ()
  (set (make-local-variable 'company-backends)
       (append (list telega-emoji-company-backend
                     'telega-company-username
                     'telega-company-hashtag
                     'telega-company-markdown-precode)
               (when (telega-chat-bot-p telega-chatbuf--chat)
                 '(telega-company-botcmd))))
  (setq company-idle-delay 0.2)
  (company-mode 1))
(add-hook 'telega-chat-mode-hook 'my-telega-chat-mode)
(add-hook 'telega-load-hook 'telega-notifications-mode)


;; mastododn
(setq mastodon-instance-url "https://mastodon.social/" mastodon-active-user "@azizul7m")


;; elfeed
(setq elfeed-goodies/entry-pane-size 0.5)
(global-set-key (kbd "C-x w") 'elfeed)
(setq elfeed-feeds
      '(
        "https://planet.emacslife.com/atom.xml"
        "https://www.brsoftech.com/blog/feed/"
        "https://www.smashingmagazine.com/feed"
        "https://www.sitepoint.com/feed/"
        "https://tympanus.net/codrops/feed/"
        "https://feeds.dzone.com/webdev"
        "https://css-tricks.com/feed/"
        "https://blog.codepen.io/feed/"
        "https://webkul.com/blog/feed/"
        "https://feeds.feedburner.com/ProgrammableWeb"
        "https://cssauthor.com/feed/"
        "https://codeconvey.com/feed/"
        "https://www.inexture.com/feed/"
        "http://javascriptweekly.com/rss"
        "https://www.echojs.com/rss"
        "https://www.uplogictech.com/blog/feed/"
        "https://wdrl.info/feed"
        "https://developerstroop.com/feed/"
        "https://reactjs.org/feed.xml"
        "http://davidwalsh.name/feed"
        "http://dailynerd.nl/feed/"
        "http://rss1.smashingmagazine.com/feed/"))



;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
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
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
