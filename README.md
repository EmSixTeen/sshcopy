# SSH Copy
A small function for zsh but should work in Bash too.

Copies your RSA public key's contents to your clipboard.

## Usage
Just add the contents of `sshcopy.zsh` to your `.zshrc` or `.bashrc` file. 

You can then use `sshcopy` to copy your RSA key to your clipboard, if it's in the standard `~/.ssh/id_rsa.pub`. If you've got stuff in another place, just adjust the variables in the function.

You may need to reload your terminal.

## Parameters
Will show output the clipboard's contents to terminal if you pass any of the following flags:

```zsh
-s
-e
--show
--echo
```