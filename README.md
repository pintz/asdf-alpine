# List of docker / woodpecker plugins

/!\ Unfortunately containers must be builded as root as woodpecker git plugni is clongin as root :'(

```bash
ghcr.io/pintz-org/asdf-poetry 
ghcr.io/pintz-org/asdf-terraform 
```

## Poetry

Didn't work much on it, was first test (not really need it for the moment)
You can pull it and use it 

```bash

```

## Terraform
The command should be passed with variable : PLUGIN_COMMAND

For direct use 

```bash
docker run --env PLUGIN_COMMAND=plan ghcr.io/pintz-org/asdf-terraform:1.8.2
```

For multiple commands this should work 

```bash
docker run --env PLUGIN_COMMAND="plan --help" ghcr.io/pintz-org/asdf-terraform:1.8.2 
```

### Terraform Todo 

* [X] Test multiple commands like : docker run --env PLUGIN_COMMAND="apply -auto-approve" ghcr.io/pintz-org/asdf-terraform:1.8.2
* [ ] Should manage command with several parameters the [complex settings](https://woodpecker-ci.org/docs/usage/plugins/creating-plugins#complex-settings)


# Useful link 
[Stephane-Robert](https://blog.stephane-robert.info/docs/conteneurs/images-conteneurs/optimiser-taille-image/)
