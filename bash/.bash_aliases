
alias vim8=/usr/local/bin/vim

alias g='git'

alias doco='docker-compose'
alias docu='docker-compose up -d'
alias docl='docker-compose logs'
alias docsh='docker-compose run --rm odoo odoo shell'
alias dood='docker-compose run --rm -p 80:8069 odoo odoo'
alias bro='firefox --private-window $(docker-compose port odoo 8069)'

