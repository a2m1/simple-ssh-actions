# Slim SSH Action

[GitHub Action](https://github.com/features/actions) for executing remote SSH commands using debian-slim container

## Usage

Executing remote SSH commands.

```yaml
on: [push]
jobs:
  build:
    name: Checkout and Test
    runs-on: ubuntu-latest
    steps:
    - name: Test SSH Command using key
      uses: a2m1/slim-ssh-action@master
      with:
        username: ${{ secrets.REMOTE_USER }}
        host: ${{ secrets.REMOTE_HOST }}
        fingerprint: ${{ secrets.REMOTE_FINGERPRINT }}
        key: ${{ secrets.KEY }}
        script: whoami
```

output:

```sh
### Prepare the environment ###


### Command to execute ###

whoami

### Output ###

***

### Cleanup the environemnt ###

```

## Input variables

See [action.yml](./action.yml) for more information.

* host - Remote host for SSH connection
* username - Username for SSH connection
* fingerprint - Fingerprint of the remote host
* key - Content of the private SSH key
* script - Command to be executed on the remote host
* debug - enable debug mode, default is `false`