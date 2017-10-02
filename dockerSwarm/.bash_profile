# Python 3.4.5 with iot tools
alias python3='docker run -ti --rm --net=host -v $(pwd):/work -w /work docker.ittools.cfahome.com/python:3.4.5-iot python'

# Serve static files via nginx 1.11.6 over 8080
alias nginx='docker run -d -p 8080:80 -v $(pwd):/usr/share/nginx/html nginx:1.11.6'

# Maven 3.3.9 utilizing a local cache
alias mvn='docker run -ti --rm -p 8080:8080 -p 8443:8443 -p 443:8443 -p 1883:1883 -v ~/.m2:/root/.m2 -v $(pwd):/work -w /work maven:3.3.9 mvn'

# npm 6.9.4 as a non-root user
#alias npm='docker run -ti --rm --net=host -u 1 -v ~/.config:/usr/sbin/.config -v ~/.npm:/usr/sbin/.npm -v $(pwd):/work -w /work node:6.9.4 npm'
#alias npm='docker run -ti --rm -p 1883:1883 -p 8883:8883 -u 1 -v ~/.config:/usr/sbin/.config -v ~/.npm:/usr/sbin/.npm -v $(pwd):/work -w /work node:6.10.1 npm'

# node 6.9.4
#alias node='docker run -ti --rm --net=host -v $(pwd):/work -w /work node:6.9.4 node'
#alias node='docker run -ti --rm -p 1883:1883 -p 8883:8883 -v $(pwd):/work -w /work node:6.10.1 node'

# Code completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
