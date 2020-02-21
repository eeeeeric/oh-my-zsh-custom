# Short for 'compose-clean', this wipes the local compose environment
alias cc='docker-compose kill && docker-compose rm -f'

# Clean up all docker containers
alias docker-clean='docker container stop $(docker container ls -aq) && docker container rm $(docker container ls -aq)'

