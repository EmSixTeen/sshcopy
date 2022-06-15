# SSH Copy
A small function for zsh but should work in Bash too.

Copies your RSA public key's contents to your clipboard.

## Usage
Just add the contents of `sshcopy.zsh` to your `.zshrc` or `.bashrc` file. 

You can then use `sshcopy` to copy your RSA key to your clipboard, if it's in the standard `~/.ssh/id_rsa.pub`. If you've got stuff in another place, just adjust the variables in the function.

You may need to reload your terminal.

Expected output:
```zsh
$ sshcopy

-> File exists, copying it to clipboard
-> Don't forget you can add an alias to your SSH config to easily access
   the site via SSH (/Users/username/.ssh/config)
```

### Config file
The script also checks to see if you have an SSH config file at ~/.ssh/config`.

If the config file doesn't exist, there's a text reminder you can set one up:

```zsh
-> You don't seem to have an SSH config file - Maybe set one up?
   (/Users/username/.ssh/config)
```

### Parameters
Will show output the clipboard's contents to terminal if you pass any of the following flags:

- `-s` or `--show`
- `-e`or `--echo`

Output should look like the following: 

```zsh
sshcopy -s 

-> File exists, copying it to clipboard
-> Parameter passed to show clipboard contents:

ssh-rsa YOUR_SSH_PUBLIC_KEY_HERE

-> Don't forget you can add an alias to your SSH config to easily access
   the site via SSH (/Users/username/.ssh/config)
```