### Pre-requisites

* git: https://git-scm.com/downloads
* cf-cli: https://pivotal.io/platform/pcf-tutorials/getting-started-with-pivotal-cloud-foundry/install-the-cf-cli
* PCF target to deply to

### Setup
* Login to PCF

`cf login -a <pcf_target_url> --skip-ssl-validation`

Provide username as 'Email' and the password to login. If you have access to more than one org/space, you will be prompted to choose which specific ones you would like to target.

Note: If PCF target is using a self-signed certificate, you need to specify `--skip-ssl-validation`.

* Check current target by running: `cf target`

### Push App
* `cd` to directory where git repo has been cloned.
* Modify `host` in `manifest.yml` to make sure it is unique enough (e.g. add your initials).
* Run `cf push`

### Create Service
* `cf marketplace`
* `cf marketplace -s p-rabbitmq`
* `cf create-service p-rabbitmq standard fufu`

### Bind App to Service
* Before binding check, app's env: `cf env pcfdemo`
* `cf bind-service pcfdemo fufu`
* `cf restage pcfdemo`
* `cf env pcfdemo`

### Scale
* `cf scale pcfdemo -i 2`

### Kill App Instance
* `cf events pcfdemo`
