;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     yaml
     csv
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; better-defaults
     git
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     git
     smex
     gtags
     html
     (python :variables python-sort-imports-on-save t
             python-enable-yapf-format-on-save t)

     (shell :variables
            shell-default-shell 'multi-term
            shell-default-height 50
            shell-default-term-shell "/bin/zsh"
            shell-default-position 'bottom
            shell-enable-smart-eshell t
            )

     version-control
     (colors :variables colors-colorize-identifiers 'all)
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            )
     shell-scripts
     org
     markdown
     deft
     sql
     lua
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory "~/go/src/github.com/AndreaCrotti/yasnippet-snippets/snippets")

     (go :variables
         go-tab-width 4
         gofmt-command "goimports"
         go-use-gometalinter t
         )
     syntax-checking
     fasd
     ranger
     dash
     gnus
     (restclient :variables restclient-use-org t)
     imenu-list
     java
     scala
     scheme
     speed-reading
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(paredit)
   ;; A list of packages and/or extensions that will not be install and loaded.
   ;; smartparens
   dotspacemacs-excluded-packages '(ensime sbt-mode)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         solarized-dark
                         leuven
                         solarized-light
                         spacemacs-dark
                         spacemacs-light
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;; 解决org mode table中英文混排时不能对齐的方法
   ;; 1. 字体统一改成: Ubuntu Mono derivative Powerline(Ubuntu Mono), 大小偶数
   ;; 2. 英文Monaco 14，中文STFangsong 16
   dotspacemacs-default-font '("Ubuntu Mono derivative Powerline"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ))

(defun my-setup-indent (n)
  (setq-default javascript-indent-level n) ; javascript-mode
  (setq-default js-indent-level n) ; js-mode
  (setq-default js2-basic-offset n) ; js2-mode
  (setq-default c-default-style '((java-mode . "java")
     (awk-mode . "awk")
     (other . "ellemtel"))
  )
  (setq-default c-basic-offset n)
  (setq-default tab-width n)
  (setq-default indent-tabs-mode nil) ; use space instead of tab
  )

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
    (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
    (my-setup-indent 4)
    (setq org-emphasis-regexp-components
          ;; markup 记号前后允许中文
          (list (concat " \t('\"{"            "[:nonascii:]")
                (concat "- \t.,:!?;'\")}\\["  "[:nonascii:]")
                " \t\r\n,\"'"
                "."
                1))
    (with-eval-after-load 'org
      (setq org-match-substring-regexp
            (concat
             ;; 限制上标和下标的匹配范围，org 中对其的介绍见：(org) Subscripts and superscripts
             "\\([0-9a-zA-Zα-γΑ-Ω]\\)\\([_^]\\)\\("
             "\\(?:" (org-create-multibrace-regexp "{" "}" org-match-sexp-depth) "\\)"
             "\\|"
             "\\(?:" (org-create-multibrace-regexp "(" ")" org-match-sexp-depth) "\\)"
             "\\|"
             "\\(?:\\*\\|[+-]?[[:alnum:].,\\]*[[:alnum:]]\\)\\)")))

    ;; Get email, and store in nnml
    (setq gnus-secondary-select-methods
          '(
            (nnimap "gmail"
                    (nnimap-address
                     "imap.gmail.com")
                    (nnimap-server-port 993)
                    (nnimap-stream ssl))
            ))

    ;; Send email via Gmail:
    (setq message-send-mail-function 'smtpmail-send-it
          smtpmail-default-smtp-server "smtp.gmail.com")

    ;; Archive outgoing email in Sent folder on imap.gmail.com:
    (setq gnus-message-archive-method '(nnimap "imap.gmail.com")
          gnus-message-archive-group "[Gmail]/Sent Mail")

    ;; set return email address based on incoming email address
    (setq gnus-posting-styles
          '(((header "to" "address@outlook.com")
             (address "address@outlook.com"))
            ((header "to" "address@gmail.com")
             (address "address@gmail.com"))))

    ;; store email in ~/gmail directory
    (setq nnml-directory "~/gmail")
    (setq message-directory "~/gmail")
    (setq ensime-startup-notification nil)
 )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (global-linum-mode)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; 解决org table中英文混排不对齐问题。需要配合英文字体Monaco 14
  ;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;   (set-fontset-font (frame-parameter nil 'font)
  ;;                     charset (font-spec :family "STFangsong"
  ;;                                        :size 16)))


  ;deft
  (setq deft-directory "~/note/")
  (setq deft-use-filename-as-title t)
  (setq deft-use-filter-string-for-filename t)
  (setq deft-org-mode-title-prefix t)
  (setq deft-new-file-format "note-%Y%m%d%H%M%S")
  (setq deft-extensions '("org", "http"))

  (setq save-interprogram-paste-before-kill t)
  (setq helm-buffer-max-length nil)

  (defun w32-restore-frame ()
    "Restore a minimized frame"
    (interactive)
    (w32-send-sys-command 61728))
  (defun w32-maximize-frame ()
    "Maximize the current frame"
    (interactive)
    (w32-send-sys-command 61488))
  ;;(w32-maximize-frame)

  ;; (folding-mode)
  ;; (folding-mode-add-find-file-hook)
  (prefer-coding-system 'gbk)
  (prefer-coding-system 'utf-8)
  (setq-default flycheck-scalastylerc "~/.config/scalastyle/scalastyle_config.xml")

  (setq org-html-table-default-attributes '(:rules "all" :frame "border" :border "2"))
  ;; (setq org-html-table-default-attributes
  ;;       (plist-put org-html-table-default-attributes :rules "all"))

  (setq eclim-eclipse-dirs '("/Application/Eclipse.App")
        eclim-executable "/Applications/Eclipse.app//Contents/Eclipse/plugins/org.eclim_2.8.0/bin/eclim")

  ;; (setq ranger-cleanup-eagerly t)
  (setq ranger-ignored-extensions '("mkv" "iso" "mp4" "pdf" "gz"))

  (autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook           #'enable-paredit-mode)

)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/notes/agenda.org")))
 '(package-selected-packages
   (quote
    (flycheck-rust flycheck-gometalinter yaml-mode spray paredit geiser company-emacs-eclim eclim imenu-list groovy-mode restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well yasnippet-snippets toml-mode racer cargo rust-mode helm-dash dash-at-point ranger fasd flycheck-pos-tip pos-tip flycheck noflet ensime sbt-mode scala-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup ghub go-guru go-eldoc company-go go-mode yapfify xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit sql-indent spaceline powerline smex slim-mode shell-pop scss-mode sass-mode restart-emacs request rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements phpunit phpcbf php-extras php-auto-yasnippets persp-mode pcre2el paradox spinner pandoc-mode ox-pandoc ht org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc markdown-mode lua-mode lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang indent-guide hydra hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-gtags helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gnuplot git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter gh-md ggtags fuzzy folding flx-ido flx fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-snipe evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help emmet-mode dumb-jump drupal-mode php-mode disaster diminish diff-hl deft define-word cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-c-headers company-anaconda company column-enforce-mode color-identifiers-mode coffee-mode cmake-mode clean-aindent-mode clang-format bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol anaconda-mode pythonic f s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup solarized-theme dash))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
