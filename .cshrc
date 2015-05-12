# .cshrc

# User specific aliases and functions
setenv EDITOR vim        # エディタをvimに設定
setenv LANG ja_JP.UTF-8  # 文字コードをUTF-8に設定
setenv LC_MESSAGES ja_JP.UTF-8
setenv KCODE u           # KCODEにUTF-8を設定
setenv AUTOFEATURE true  # autotestでfeatureを動かす
#set history = 100 # history保存の数
set savehist = (100 merge) # ファイルにセーブするヒストリの数
set autolist = ambiguous # 1文字も保管されなかった時は一覧表示
set fignore = (\~ .aux .log) # 補完したくないファイル名
set filec # ESCキーでファイル名の補完
set notify # ジョブの終了をすぐに知らせる
set rmstar # rm * とした時に確認する
set autocorrect # 補完前にスペル訂正
set correct = cmd # コマンド実行時にコマンド修正
set autoexpand # ヒストリの補完展開
set nobeep # ビープを鳴らさない
set color # tab補完時もカラー表示
set showdots # ドットファイルも補完対象にする
set complete = enhance # 補完時に大文字小文字を区別しない
### Key binding ###
#bindkey ^R  i-search-back   # [C-r]:コマンドヒストリから検索
bindkey ^P  history-search-backward # [C-p]:打ち込んだ部分まで同一なコマンドを検索
bindkey ^N  history-search-forward  # [C-n]:同上、ただし順方向検索
#bindkey ^?  delete-char-or-list # [Del]:コマンドライン右端[Del]で補完候補の表示
#bindkey ^[[2~ overwrite-mode    # [Ins]:で上書きモード切り替え
#bindkey ^[[5~ history-search-backward # [PgUp]:打ち込んだ部分まで同一なコマンドを検索
#bindkey ^[[6~ history-search-forward  # [PgDn]:同上、ただし順方向
#bindkey ^[^[[D  vi-word-back    # [ESC]←:単語単位でカーソル位置を左へ
#bindkey ^[^[[C  vi-word-fwd   # [ESC]→:単語単位でカーソル位置を右へ
#stty  erase ^H      # どの端末でも[C-h]でBackSpaceにするおまじない
### Prompt ###
set prompt="%{\e[00;36m%}[%n%%%m@%T@%c]\n%{\e[0m%}> "
### aliases ###
alias rm 'rm -i'
alias rr 'rm -riv'
alias cp 'cp -i'
alias mv 'mv -i'
alias vi 'vim'
alias ls 'ls -F'
alias la 'ls -a'
alias ll 'ls -l'
alias lla 'ls -la'
alias -s java 'runjava'
alias cd 'cd \!*; ls -Fa'
### Path ###
set path=(/bin $path)
set path=(/sbin $path)
set path=(/usr/local/bin $path)
set path=(/usr/local/sbin $path)
set path=(/usr/bin $path)
set path=(/usr/local/gprolog-1.4.0/bin $path)
set path=(~/local/bin $path)
set path=(~/freefem/usr/local/bin $path)
