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
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     docker
     nginx
     lua
     rust
     javascript
     yaml
     search-engine
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     (python :variables python-test-runner 'pytest)
     cmake
     (c-c++ :variables
            c-c++-enable-clang-support t
            c-c++-backend 'rtags)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     (syntax-checking :variables syntax-checking-enable-tooltips nil)
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t)
     ;; better-defaults
     emacs-lisp
     git
     dash
     (dash :variables helm-dash-browser-func 'eww)
     ;; markdown
     (org :variables org-want-todo-bindings t)
     (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)
     eterm-256color
     ;; spell-checking
     ;; version-control
     osx-dictionary
     neotree
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ;; (vterm :location "~/.emacs.d/private/local/emacs-libvterm/")
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unsed))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((agenda . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Menlo"
                               :size 12
                               :height 14
                               :weight normal
                               :ascent 11
                               :descent 3
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Bind "Emacs Mac port" keys the same as Emacs NS/Cocoa
  (cua-mode t)
  (when (symbolp 'mac-control-modifier)
    (setq mac-control-modifier 'control
          mac-option-modifier 'meta
          mac-command-modifier 'super)
    (global-set-key (kbd "s-s") 'save-buffer)
    (global-set-key (kbd "s-z") 'undo)
    (global-set-key (kbd "s-x") 'cua-cut-region)
    (global-set-key (kbd "s-c") 'cua-copy-region)
    (global-set-key (kbd "s-v") 'cua-paste)
    (global-set-key (kbd "s-w") 'delete-frame)
    (global-set-key (kbd "s-q") 'save-buffers-kill-emacs)
    (global-set-key (kbd "s-k") 'kill-this-buffer)
    (global-set-key (kbd "s-u") 'revert-buffer)
    (global-set-key (kbd "s-a") 'mark-whole-buffer)
    (global-set-key (kbd "s-l") 'goto-line)
    (global-set-key (kbd "s-'") 'switch-window)
    )

  ;; copy & paste with osx clipboard, defualt for gui but not defualt in terminal
  ;; https://emacs.stackexchange.com/questions/10900/copy-text-from-emacs-to-os-x-clipboard
  (when (eq system-type 'darwin)
    (defun copy-from-osx ()
      (shell-command-to-string "pbpaste"))

    (defun paste-to-osx (text &optional push)
      (let ((process-connection-type nil))
        (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
          (process-send-string proc text)
          (process-send-eof proc))))

    (setq interprogram-cut-function 'paste-to-osx)
    (setq interprogram-paste-function 'copy-from-osx))

  ;; modify evil insert mode
  (bind-keys :map evil-insert-state-map
             ("C-a" . move-beginning-of-line)
             ("C-e" . move-end-of-line)
             ("C-f" . forward-char)
             ("C-b" . backward-char)
             ("C-d" . delete-char)
             ("C-w" . backward-kill-word)
             ("C-p" . previous-line)
             ("C-n" . next-line)
             ("C-k" . kill-line))

  ;; org
  (with-eval-after-load 'org
    (push "~/org/agenda" org-agenda-files))

  ;; mod line
  (setq powerline-default-separator 'utf-8)
  (which-function-mode t)
  (spaceline-toggle-which-function-on)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-hud-off)

  ;; set startup frame size & position
  (if (display-graphic-p)
      (setq initial-frame-alist
	          '((top . 0) (left . 760)
              (width . 150) (height . 54)
              )))

  ;; disable default snippets
  ;; (setq-default yas-snippet-dirs '("~/.spacemacs.d/snippets"))

  ;; y or n
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; auto reload changed file
  (global-auto-revert-mode t)
  (setq auto-revert-verbose nil)

  ;; disable backup file & auto save
  (setq make-backup-files nil)
  (setq auto-save-default nil)

  ;; leader key for workspace control
  (spacemacs/set-leader-keys ";" 'spacemacs/workspaces-transient-state/body)

  ;; term
  (evil-define-key 'insert term-raw-map
    (kbd "C-a") '(lambda () (interactive) (term-send-raw-string "\C-a"))
    (kbd "C-e") '(lambda () (interactive) (term-send-raw-string "\C-e"))
    (kbd "C-f") '(lambda () (interactive) (term-send-raw-string "\C-f"))
    (kbd "C-b") '(lambda () (interactive) (term-send-raw-string "\C-b"))
    (kbd "C-d") '(lambda () (interactive) (term-send-raw-string "\C-d"))
    (kbd "C-w") '(lambda () (interactive) (term-send-raw-string "\C-w"))
    (kbd "C-r") '(lambda () (interactive) (term-send-raw-string "\C-r"))
    (kbd "C-n") '(lambda () (interactive) (term-send-raw-string "\C-n"))
    (kbd "C-p") '(lambda () (interactive) (term-send-raw-string "\C-p"))
    (kbd "C-k") '(lambda () (interactive) (term-send-raw-string "\C-k"))
    (kbd "C-v") '(lambda () (interactive) (term-paste))
    (kbd "s-v") '(lambda () (interactive) (term-paste))
    (kbd "C-]") '(lambda () (interactive) (term-send-raw-string "\C-[")))

  (add-hook 'term-mode-hook 'ansi-term-handle-close)
  (add-hook 'term-mode-hook (lambda () (setq bidi-paragraph-direction 'left-to-right)))

  ;; https://github.com/syl20bnr/spacemacs/issues/10779
  (setq term-char-mode-point-at-process-mark nil)

  (defun cth/found-latest-term-buffer ()
    "Found latest live term buffer, returns buffer or nil if not found"
    (let ((term-buffer-found nil)
          (buffers-to-search (buffer-list)))
      (while (and (not term-buffer-found) buffers-to-search)
        (let ((buffer (car buffers-to-search))
              (rest-buffers (cdr buffers-to-search)))
          (if (and (buffer-live-p buffer)
                   (eq 'term-mode (with-current-buffer buffer major-mode))
                   (get-buffer-process buffer))
              (setq term-buffer-found buffer))
          (setq buffers-to-search rest-buffers)))
      term-buffer-found))

  (defun cth/send-current-line-to-term ()
    "Send current line at point to latest active term buffer, do nothing if no buffer found"
    (interactive)
    (let ((buffer (cth/found-latest-term-buffer))
          (content (string-trim-left (thing-at-point 'line t))))
      (if buffer
          (with-current-buffer buffer (term-send-raw-string content))
        (message "No active term buffer found"))))

  (defun cth/send-active-region-to-term ()
    "Send active region to latest active term buffer, do nothing if no buffer or active region found"
    (interactive)
    (if (use-region-p)
        (let ((buffer (cth/found-latest-term-buffer))
               (content (buffer-substring (region-beginning) (region-end))))
           (if buffer
               (progn
                 (with-current-buffer buffer (term-send-raw-string content))
                 (deactivate-mark))
             (message "No active term buffer found"))))
      (message "No active region found"))

  (spacemacs/set-leader-keys "it" 'cth/send-current-line-to-term)
  (define-key evil-visual-state-map (kbd "t") 'cth/send-active-region-to-term)

 ;; vterm
  ;; (require 'vterm)
  ;; (evil-define-key 'insert vterm-mode-map
  ;;   (kbd "C-a") '(lambda () (interactive) (vterm-send-string "\C-a"))
  ;;   (kbd "C-e") '(lambda () (interactive) (vterm-send-string "\C-e"))
  ;;   (kbd "C-f") '(lambda () (interactive) (vterm-send-string "\C-f"))
  ;;   (kbd "C-b") '(lambda () (interactive) (vterm-send-string "\C-b"))
  ;;   (kbd "C-d") '(lambda () (interactive) (vterm-send-string "\C-d"))
  ;;   (kbd "C-w") '(lambda () (interactive) (vterm-send-string "\C-w"))
  ;;   (kbd "C-r") '(lambda () (interactive) (vterm-send-string "\C-r"))
  ;;   (kbd "C-n") '(lambda () (interactive) (vterm-send-string "\C-n"))
  ;;   (kbd "C-p") '(lambda () (interactive) (vterm-send-string "\C-p"))
  ;;   (kbd "C-k") '(lambda () (interactive) (vterm-send-string "\C-k"))
  ;;   (kbd "C-v") '(lambda () (interactive) (vterm-yank))
  ;;   (kbd "s-v") '(lambda () (interactive) (vterm-yank))
  ;;   (kbd "C-]") '(lambda () (interactive) (vterm-send-string "\C-[")))

  ;; python
  (pyvenv-tracking-mode)

  ;; magit
  (add-hook 'git-commit-mode-hook 'evil-insert-state)

  (global-company-mode)
  (global-flycheck-mode)

  ;; search engine
  (spacemacs/set-leader-keys "ag" 'engine/search-google)

  ;; projectile
  (spacemacs/set-leader-keys
    "psi" 'projectile-run-ielm
    "pss" 'projectile-run-shell
    "pst" 'projectile-run-term
    "pse" 'projectile-run-eshell
    "psm" 'projectile-multi-term-in-root)

  ;; fix C-k not working in company : https://github.com/syl20bnr/spacemacs/issues/2974
  (add-hook
   'company-completion-started-hook
   (lambda (&rest ignore)
     (when evil-mode
       (when (evil-insert-state-p)
         (define-key evil-insert-state-map (kbd "C-k") nil)))))
)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (disaster company-c-headers cmake-mode clang-format vterm lua-mode eterm-256color nginx-mode org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot ibuffer-projectile osx-dictionary engine-mode toml-mode racer flycheck-rust cargo markdown-mode rust-mode helm-dash dash-at-point git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl company-quickhelp flycheck-pos-tip pos-tip flycheck web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode yaml-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help ac-ispell helm-company helm-c-yasnippet fuzzy company-statistics company-anaconda company auto-yasnippet yasnippet auto-complete evil-magit smeargle orgit magit-gitflow magit-popup magit transient helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-commit with-editor lv yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(safe-local-variable-values (quote ((pyvenv-workon . "ats3")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (phpunit phpcbf php-extras php-auto-yasnippets helm-gtags ggtags drupal-mode counsel-gtags company-php ac-php-core php-mode disaster company-c-headers cmake-mode clang-format vterm lua-mode eterm-256color nginx-mode org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download htmlize gnuplot ibuffer-projectile osx-dictionary engine-mode toml-mode racer flycheck-rust cargo markdown-mode rust-mode helm-dash dash-at-point git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl company-quickhelp flycheck-pos-tip pos-tip flycheck web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode yaml-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help ac-ispell helm-company helm-c-yasnippet fuzzy company-statistics company-anaconda company auto-yasnippet yasnippet auto-complete evil-magit smeargle orgit magit-gitflow magit-popup magit transient helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-commit with-editor lv yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(safe-local-variable-values (quote ((pyvenv-workon . "ats3")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
