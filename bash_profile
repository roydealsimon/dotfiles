
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export LANG=en_US.UTF-8
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

alias rc='rake cucumber'
alias rco='rake cucumber:ok'
alias rcw='rake cucumber:wip'
alias rcn='rails console'
alias rdb='rake db:migrate; rake db:test:prepare'
alias rdbc='rails dbconsole'
alias rg='rails generate'
alias rgc='rails generate controller'
alias rgcf='rails generate cucumber:feature'
alias rgi='rails generate migration'
alias rgm='rails generate model'
alias rgs='rails generate scaffold'
alias rs='rails server'

alias ga='git add -A' # -A syncs index and working tree
alias gap='git add -p'
alias gar='git archive master --prefix="project/" --format=zip > `git describe master`.zip' # release
alias gb='git branch'  # see below
alias gbi='git bisect' # see below
alias gbl='git blame'  # see below
alias gc='git commit -a -m'
alias gca='git commit --amend'
alias gcf='cat ~/.gitconfig'
alias gcl='git clone'
alias gco='git count-objects'
alias gcp='git cherry-pick'
alias gd='git diff' # working tree vs index
alias gdh='git diff HEAD' # working tree vs repo
alias gdi='git diff --staged' # index vs repo
alias gds='git diff --stat'
alias gdw='git diff --word-diff' 
alias gfb='git filter-branch'
alias gg='git grep'
alias ggc='git grep --cached'
alias ggui='gitk --all'
alias gl='git log'  # --grep="fubar"
alias gm='git merge --no-ff' # no-ff:  generate a commit even if the merge is resolved as a fast-forward
alias gmf='git merge --ff'   # this is the default behavior
alias gms='git merge --squash'
alias gmt='git mergetool'
alias gne='git notes edit' # SHA
alias gnr='git name-rev --name-only' # SHA
alias gns='git notes show' # HEAD
alias go='git checkout'
alias gob='git checkout -b'
alias got='git checkout --track'
alias gotb='git checkout --track -b'
alias gpr='git pull --rebase'
alias gr='git reset'
alias grh='git reset --hard'
alias grm='git rm'
alias grmc='git rm --cached' # only remove from index, like git-reset
alias gro='git remote' # see below
alias grs='git reset --soft'
alias gs='git status'
alias gsb='git show-branch'
alias gsl='git shortlog'
alias gsls='git status -s -n' # count commits, the -n option sorts the list by number of commits.
alias gsrh='git show-ref --head'
alias gsrt='git show-ref --tags'
alias gss='git status -s'
alias gssb='git status -sb' # short + branch
alias gst='git stash'  # see below
alias gsub='git submodule'
alias gt='git tag'     # lightweight - only commit checksum is stored
alias gta='git tag -a' # annotated - full objects
alias gts='git tag -s' # signed
alias gtv='git tag -v' # verify signed tag
alias gv='git revert'

alias gba='git branch -a'
alias gbc='git branch --contains'
alias gbd='git branch -d'
alias gbdd='git branch -D'
alias gbm='git branch --merged'
alias gbn='git branch --no-merged'
alias gbr='git branch -r'

alias gld='git log --relative-date'
alias glf='git log --pretty=format:"%h added %ar by %ce: %s"'
alias glfg='git log --pretty=format:"%h : %s" --topo-order --graph'
alias glg='git log --graph'
alias glh='git log | git humin'
alias glmo='git log --oneline master ^origin/master'
alias glp='git log -p' # see file change history, use checkout to get it
alias glo='git log --oneline --date-order --all --decorate'
alias glog='git log --oneline --graph --date-order --all --decorate'
alias glome='git log --oneline --author="Roy Deal Simon"'
alias glon='git log --oneline --name-status' # or --name-only
alias glonme='git log --oneline --name-status --author="Roy Deal Simon"'
alias glos='git log --graph --date-order --all --decorate -S' # search
alias glno='git log --name-only'
alias glns='git log --name-status'
alias glr='git log -g' # reflog
alias gls='git log --stat'
alias glss='git log --shortstat'
alias glx='git log --name-status --relative-date --graph'
alias glxme='git log --name-status --relative-date --graph --author="Roy Deal Simon"'

alias gbib='git bisect bad'
alias gbig='git bisect good'
alias gbik='git bisect skip'
alias gbil='git bisect log'
alias gbip='git bisect replay' # that file
alias gbir='git bisect reset'
alias gbis='git bisect start' # between: HEAD v1.2 --
alias gbiv='git bisect visualize'
alias gbiu='git bisect run' # rake rspec or whatever

alias gbll='git blame -L' # lines: 40,60 40,+20
alias gblcc='git blame -C -C'
alias gblg='git gui blame'

alias groa='git remote add'
alias grop='git remote prune'
alias grorn='git remote rename'
alias grorm='git remote rm'
alias grosb='git remote set-branches'
alias grosh='git remote set-head'
alias grosu='git remote set-url'

alias gsta='git stash apply'
alias gstai='git stash apply --index' # restage files
alias gstb='git stash branch'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gsto='git stash show'
alias gstp='git stash pop'
alias gsts='git stash save'

alias gsuba='git submodule add'
alias gsubi='git submodule init'
alias gsubs='git submodule status'
alias gsubu='git submodule update'

alias git-alias='alias | grep git'
alias git-rm-file='git filter-branch --head --tree-filter' # 'rm filename' 
alias git-unapply='git stash show -p stash@{0} | git apply -R'
alias git-tmp-ignore='git update-index --assume-unchanged'
alias git-tmp-unignore='git update-index --no-assume-unchanged'
alias git-export='git archive HEAD --format=zip > archive.zip'
alias gpush='git push'
alias gpull='git pull'
alias gfetch='git fetch'

alias sb='source ~/.bash_profile'
alias eb='mate ~/.bash_profile'

source ~/.bashrc
