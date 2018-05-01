#!/usr/bin/env bash

########################
# include the magic
########################
. ../demo-magic/demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
TYPE_SPEED=15

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${CYAN}\W \t${GREEN}➜ "

# hide the evidence
clear


# put your demo awesomeness here
pe "cf target"

#push the app
pe "cf push"

pe "clear"

#list available services
pe "cf services"

#list services platform team can provision/offer
#pe "cf marketplace"

# Bind app to RabbitMQ service
pe "cf bind-service pcfdemo myrabbitmq"

pe "cf restage pcfdemo"

# Scale pcfdemo to 0 to stay within quota
pe "cf scale pcfdemo -i 0"

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
