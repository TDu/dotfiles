alias cdd='cd ../..'
alias j='jobs -l'
alias g='git'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# To open a file in the gui from bash
alias open=xdg-open

# Docker
alias de='env | grep DOCKER_'
alias doco='docker-compose'
alias docu='docker-compose up -d'
alias docl='docker-compose logs'

# Odoo with docker
alias docsh='docker-compose run --rm odoo odoo shell'
alias do-clean='docker rmi $(docker images -q -f dangling=true)'
alias dood='docker-compose run --rm -p 80:8069 odoo odoo'
alias bro='firefox --private-window $(docker-compose port odoo 8069)'
alias docsql='PGPASSWORD=odoo psql -h localhost -p $(docker-compose port db 5432 | cut -d':' -f 2) -U odoo'
# setup test database. Just run `dood_test_setup`
alias dood_test_setup='docker-compose run --rm -e DB_NAME=testdb odoo testdb-gen -i base'
# reuse testdb and install or update modules on demand. Just run `dood_test_update -i/u something`
alias dood_test_update='docker-compose run --rm -e DB_NAME=testdb odoo testdb-update'
# run tests using pytest. Just run `dood_test_run path/to/your/module`
# NOTE: you need to run dood_test_update 1st IF xml or models have been updated
alias dood_test_run='docker-compose run --rm -e DB_NAME=testdb odoo pytest -s'
# run tests using std odoo test machinery (eg: you need an HttpCase). Just run `dood_test_run_odoo -u module`
alias dood_test_run_odoo='docker-compose run --rm -e DEMO=True -e DB_NAME=testdb -e MIGRATE=False odoo odoo --workers=0 --test-enable --stop-after-init'

# Docker Machine
alias dm='docker-machine'
