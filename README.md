# Dotfiles Light

Light, deployable dotfiles. v0.5.

Alternative to Bryan Stitt / Ryan Bates originals.

## Usage

### Install dotfiles.

```shell
./install.sh
```

### Gather dotfiles.

```shell
./gather.sh
```

## Notes

#### Root user prompt in .bashrc.

For root user, uncomment line 33 in `/root/.bashrc`.

```shell
export PS1="\[$COLOR_RED\][\u@\h \W]# \[${COLOR_NC}\]"
```
