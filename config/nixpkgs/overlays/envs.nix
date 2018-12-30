self: super:
{
  waf-helm-make = super.stdenv.mkDerivation rec {
    name = "helm-make";
    version = "20181126";

    src = super.fetchFromGitHub {
      owner = "bhipple";
      repo = name;
      rev = "master";
      sha256 = "12vwbircndqhwdvk506yy9lhg4mj60d8yghimrc3s6jfwc7z08yh";
    };

    phases = [ "unpackPhase" "installPhase" ];

    # TODO: Figure out how to pass helm to this for byte compilation
    # buildInputs = [ super.emacs super.emacsPackagesNg.helm ];
    # buildPhase = ''
    #   emacs -L . -L ${super.emacsPackagesNg.helm}/share/emacs/site-lisp \
    #       --batch -f batch-byte-compile *.el
    # '';
    installPhase = ''
      install -d $out/share/emacs/site-lisp
      install *.el *.elc $out/share/emacs/site-lisp/
    '';

  };

  spacemacs = super.emacsWithPackages (ep: (with ep.melpaPackages; [
    # there's a bug in the current source of evil-escape that causes it to
    # fail to build. We'll patch it out for now and hope it gets fixed in a
    # future version.
    (ep.evil-escape.overrideAttrs (old: {
      patches = (old.patches or []) ++ [
        (super.fetchpatch {
          url = https://github.com/BrianHicks/evil-escape/commit/b548e8450570a0c8dea47b47221b728c047a9baf.patch;
          sha256 = "1a2qrf4bpj7wm84qa3haqdg3pd9d8nh5vrj8v1sc0j1a9jifsbf6";
        })
      ];
    }))

    self.waf-helm-make

    # company-rtags
    # doom-modeline # TODO: Has a dependency that fails (shrink-path.el)
    # ep.font-lock-plus # TODO: Fails with mismatched package name font-lock+
    # evil-unimpaired # TODO: Not packaged
    # flycheck-rtags
    # haskell-snippets
    # helm-rtags
    # magit-svn # TODO: No such file or directory, git
    # rtags
    # shrink-path # TODO: 404 not found on src tarball download
    # sql-indent
    # yasnippet
    # yasnippet-snippets

    ac-ispell
    ace-jump-helm-line
    ace-link
    ace-window
    adoc-mode
    aggressive-indent
    alert
    all-the-icons
    anaconda-mode
    ansible
    ansible-doc
    anzu
    async
    auto-compile
    auto-complete
    auto-dictionary
    auto-highlight-symbol
    auto-yasnippet
    avy
    bind-key
    bind-map
    browse-at-remote
    bundler
    cargo
    centered-cursor-mode
    chruby
    clang-format
    clean-aindent-mode
    cmm-mode
    column-enforce-mode
    company
    company-anaconda
    company-ansible
    company-c-headers
    company-cabal
    company-emacs-eclim
    company-ghc
    company-go
    company-lua
    company-nixos-options
    company-php
    company-plsense
    company-quickhelp
    company-restclient
    company-shell
    company-statistics
    company-tern
    company-terraform
    company-web
    company-ycmd
    concurrent
    confluence
    copy-as-format
    counsel
    counsel-gtags
    counsel-projectile
    ctable
    cython-mode
    dactyl-mode
    dash
    dash-functional
    deferred
    define-word
    diff-hl
    diminish
    disaster
    docker
    docker-tramp
    dockerfile-mode
    dotenv-mode
    dracula-theme
    dumb-jump
    eclim
    editorconfig
    eldoc-eval
    elisp-slime-nav
    emmet-mode
    engine-mode
    ensime
    ep.csv-mode
    ep.mmm-mode
    ep.orgPackages.org
    ep.orgPackages.org-plus-contrib
    ep.undo-tree
    epc
    epl
    esh-help
    eshell-prompt-extras
    eshell-z
    eval-sexp-fu
    evil
    evil-anzu
    evil-args
    evil-cleverparens
    evil-ediff
    evil-exchange
    evil-goggles
    evil-iedit-state
    evil-indent-plus
    evil-ledger
    evil-lion
    evil-lisp-state
    evil-magit
    evil-matchit
    evil-mc
    evil-nerd-commenter
    evil-numbers
    evil-org
    evil-surround
    evil-tutor
    evil-visual-mark-mode
    evil-visualstar
    expand-region
    eyebrowse
    f
    fancy-battery
    fill-column-indicator
    fish-mode
    flx
    flx-ido
    flycheck
    flycheck-bashate
    flycheck-haskell
    flycheck-ledger
    flycheck-pos-tip
    flycheck-ycmd
    flyspell-correct
    flyspell-correct-helm
    fringe-helper
    fuzzy
    ggtags
    gh-md
    ghc
    git-commit
    git-gutter
    git-gutter-fringe
    git-gutter-fringe-plus
    git-gutter-plus
    git-link
    git-messenger
    git-timemachine
    gitattributes-mode
    gitconfig-mode
    gitignore-mode
    gitignore-templates
    gntp
    gnuplot
    go-eldoc
    go-fill-struct
    go-gen-test
    go-guru
    go-impl
    go-mode
    go-rename
    go-tag
    godoctor
    golden-ratio
    google-c-style
    google-translate
    goto-chg
    gradle-mode
    graphviz-dot-mode
    groovy-imports
    groovy-mode
    haml-mode
    haskell-mode
    hcl-mode
    helm
    helm-ag
    helm-c-yasnippet
    helm-company
    helm-core
    helm-css-scss
    helm-dash
    helm-descbinds
    helm-flx
    helm-git-grep
    helm-gitignore
    helm-gtags
    helm-hoogle
    helm-mode-manager
    helm-nixos-options
    helm-org-rifle
    helm-projectile
    helm-purpose
    helm-pydoc
    helm-swoop
    helm-themes
    helm-xref
    hierarchy
    highlight
    highlight-indentation
    highlight-numbers
    highlight-parentheses
    hindent
    hl-todo
    hlint-refactor
    ht
    htmlize
    hungry-delete
    hydra
    ibuffer-projectile
    iedit
    imenu-list
    impatient-mode
    importmagic
    indent-guide
    inf-ruby
    insert-shebang
    ivy
    jenkins
    jinja2-mode
    js-doc
    js2-mode
    js2-refactor
    json-mode
    json-navigator
    json-reformat
    json-snatcher
    know-your-http-well
    ledger-mode
    link-hint
    live-py-mode
    livid-mode
    log4e
    lorem-ipsum
    lsp-mode
    lsp-rust
    lua-mode
    macrostep
    magit
    magit-gitflow
    magit-popup
    magit-svn
    markdown-mode
    markdown-toc
    markup-faces
    maven-test-mode
    meghanada
    memoize
    minitest
    mmm-jinja2
    move-text
    multi-term
    multiple-cursors
    mvn
    mwim
    nameless
    nginx-mode
    nix-mode
    nix-update
    nixos-options
    ob-http
    ob-restclient
    open-junk-file
    org-brain
    org-bullets
    org-category-capture
    org-download
    org-journal
    org-mime
    org-pomodoro
    org-present
    org-projectile
    orgit
    overseer
    ox-gfm
    ox-pandoc
    ox-twbs
    p4
    package-lint
    packed
    pandoc-mode
    paradox
    paredit
    parent-mode
    password-generator
    pcache
    pcre2el
    persp-mode
    pfuture
    pip-requirements
    pipenv
    pippel
    pkg-info
    popup
    popwin
    pos-tip
    powerline
    prettier-js
    projectile
    pug-mode
    py-isort
    pyenv-mode
    pytest
    pythonic
    pyvenv
    rainbow-delimiters
    rake
    rbenv
    request
    request-deferred
    restart-emacs
    restclient
    restclient-helm
    robe
    rpm-spec-mode
    rspec-mode
    rubocop
    ruby-hash-syntax
    ruby-refactor
    ruby-test-mode
    ruby-tools
    rvm
    s
    salt-mode
    sass-mode
    sbt-mode
    scala-mode
    scss-mode
    seeing-is-believing
    shell-pop
    simple-httpd
    skewer-mode
    slim-mode
    smartparens
    smeargle
    spaceline
    spaceline-all-the-icons
    string-inflection
    swiper
    symon
    systemd
    tablist
    tagedit
    tern
    terraform-mode
    toc-org
    toml-mode
    treemacs
    treemacs-evil
    treemacs-projectile
    treepy
    unfill
    use-package
    uuidgen
    vi-tilde-fringe
    vimrc-mode
    visual-fill-column
    volatile-highlights
    web-beautify
    web-completion-data
    web-mode
    which-key
    window-purpose
    winum
    with-editor
    writeroom-mode
    ws-butler
    xcscope
    xml-rpc
    xterm-color
    yaml-mode
    yapfify
    ycmd
    zeal-at-point
  ] ++ [
    # Many emacs packages may pull in dependencies on things they need
    # automatically, but for those that don't, here are nix pkgs.

    # Needed for ycmd
    self.python2

    # Not pulled in by the emacs package
    self.ycmd

  ]));

  # Minimal set of packages to install everywhere
  minEnv = super.hiPrio (super.buildEnv {
    name = "minEnv";
    paths = [
      self.alacritty
      self.bashInteractive
      self.bat
      self.bc
      self.coreutils
      self.curl
      self.feh
      self.file
      self.fzf
      self.git-crypt
      self.gitAndTools.hub
      self.global
      self.gnused
      self.gnutar
      self.htop
      self.jq
      self.ledger
      self.nox
      self.par
      self.pass
      self.pinentry
      self.procps
      self.ripgrep
      self.rlwrap
      # This should be installed automatically, but I want to use the nixpkgs channel instead of the nixos channel.
      # self.spacemacs
      self.tmux
      self.tree
      self.unzip
      self.wget
      self.zsh
    ];
  });

  # For "permanent" systems
  bigEnv = super.hiPrio (super.buildEnv {
    name = "bigEnv";
    paths = [
      self.alsaUtils
      self.aspell
      self.bind
      self.calibre
      self.chromium
      self.cmake
      self.firefox
      self.gnumake
      self.gnupg
      self.gnutls
      self.graphviz
      self.icu
      self.imagemagick
      self.irssi
      self.lftp
      self.mupdf
      self.nethogs
      self.nixops
      self.pandoc
      self.pdsh
      self.shellcheck
      self.sloc
      self.source-code-pro
      self.truecrypt
      self.upower
      self.vagrant
      self.vimPlugins.youcompleteme
      self.vlc
      self.xclip
      self.xsel
      self.zeal
      self.zlib
    ];
  });

  pyEnv = super.hiPrio (self.python2.withPackages (ps: with ps; [
    flake8
    isort
    pep8
    pylint
    setuptools
    toolz
    yamllint
    yapf
  ]));
}
