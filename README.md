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

## References

* <http://wiki.archlinux.org/index.php/zsh#Prompt_themes>
* <http://zsh.sourceforge.net/Doc/Release/Functions.html>
* <http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Prompt-Expansion>
* <http://zsh.sourceforge.net/Doc/Release/Expansion.html#Expansion>
* <http://zsh.sourceforge.net/Doc/Release/User-Contributions.html>
* <https://linux.die.net/man/3/strftime>
