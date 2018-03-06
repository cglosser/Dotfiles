alias bc='bc -l'
alias getwd='pwd | tr -d "\n" | pbcopy'
alias grep='grep --color=auto'
alias ipython='ipython3 --pylab'
alias la='ls -a'
alias ll='ls -lh'
alias lmk='latexmk -pdf -pvc'
alias ls='ls --color=auto'
alias open='xdg-open'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias ssh-add='ssh-add -t 1h'
alias units='units --exponential'
alias clangify='export CC=/usr/bin/clang && export CXX=/usr/bin/clang++'

export PATH=/home/connor/.anaconda3/bin:$PATH
