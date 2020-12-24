# `autoexec` 
A simple Perl script that automatically executes commands across 
multiple `iocage`-managed jails.

Document last updated 23nd December, 2020 (8 Tevet 5781);

### Table of Contents
- [About `autoexec`](#about-autoexec)
- [How to use `autoexec`](#how-to-use-autoexec)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

### About `autoexec`

`autoexec` is a simple Perl script that automatically executes commands
across multiple `iocage`-managed jails. 

### How to use `autoexec`

You must have `iocage` installed and configured to manage your jails for 
`autoexec` to work.

To use `autoexec` without installing it, the following steps are
required.
1. Download the `autoexec.pl` file from this repository;
2. Run the script via `./avmerge.pl` as root with your desired command
as an argument wrapped in quotes.

Full example:
```
perl autoexec.pl "pkg upgrade -y"
```

To use `autoexec` globally, the following steps are required.
1. Download `autoexec.pl`, `autoexec.8`, and `install.sh`;
2. Run `install.sh` as root;
3. Run the script via `autoexec` as root with your desired command
as an argument wrapped in quotes.

Full example:
```
autoexec "pkg upgrade -y"
```

Read the man page `autoexec(8)` for more details, including information 
on additional options and arguments.

### Contributing

Contributions can be made in the form of pull requests, or via bug 
reports and suggestions in the repository issues.

All contributors must assign the copyright of their contribution to the 
author of the project. This is to avoid the myraid of issues caused by 
having multiple intellectual property holders in a single project.

### License

Copyright &copy; 2020 Rachel Michaela Bradley.

`autoexec` is released in its entirety under the BSD 2-Clause License. 
The full text of this license is available in the COPYING file.

### Acknowledgements

- Thanks to the iocage project team for their useful utility.
