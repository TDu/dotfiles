
alias vim8=/usr/local/bin/vim

# Some ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias g='git'

#Alias for dockers
alias de='env | grep DOCKER_'
alias doco='docker-compose'
alias docu='docker-compose up -d'
alias docl='docker-compose logs'
alias docsh='docker-compose run --rm odoo odoo shell'
alias dood='docker-compose run --rm -p 80:8069 odoo odoo'
alias bro='firefox --private-window $(docker-compose port odoo 8069)'

#Alias to open a file in the gui from bash
alias open=xdg-open

