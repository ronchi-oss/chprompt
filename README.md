# chprompt

[![Shelly CI](https://github.com/ronchi-oss/chprompt/actions/workflows/shelly-ci.yml/badge.svg)](https://github.com/ronchi-oss/chprompt/actions/workflows/shelly-ci.yml)

`chprompt` is a POSIX shell function API for managing the prompt (PS1) of the current *bash* shell environment. You can build it from source with [shelly](https://github.com/ronchi-oss/shelly) or install it with Homebrew.

Try it (with Docker):

```sh
curl https://raw.githubusercontent.com/ronchi-oss/chprompt/main/bin/chprompt-alpine | sh
```

```
Usage: chprompt <command> [arguments]

Available commands:

	set        Set current token list
	edit       Edit current token list in a text editor buffer
	remove     Remove all matching tokens from token list
	list       List current token list
	lpop       Remove <count> tokens from left-hand side of token list
	rpop       Remove <count> tokens from right-hand side token list
	prepend    Insert tokens at left-hand side of token list
	append     Insert tokens at right-hand side of token list
	version    Print chprompt version

Run "chprompt help <command>" for further information about a command.
```
