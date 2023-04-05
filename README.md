# linux-utils
Linux Distro agnostic utils


## Notes
- `bash -s`
    If this option is present, or if no arguments remain after option processing, then commands are read from the standard input. This option allows the positional parameters to be set when invoking an interactive shell or when reading input through a pipe.
- Date formatter in shell  
https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/
- To remove all the contents of the folder but not the folder itself:
  ```
  rm -rf /path/to/directory/*
  ```
- `$@` is all of the parameters passed to the script.
    - For instance, if you call `./someScript.sh foo bar` then `$@` will be equal to `foo bar`.
- `tail`
  - follow and attach to current terminal: `tail -f`
  - get last line: `tail -1`
- `ping`
  - `ping -c <count of try times> <ip>`
- [cut](https://man7.org/linux/man-pages/man1/cut.1.html): Print selected parts of lines from each FILE(or standard input) to standard output.
  - Required: Use one, and only one of `-b`, `-c` or `-f`
  - `-d`: --delimiter. Use specified delimiter instead of TAB for field delimiter
  - `-b`: --bytes. Select only these bytes
  - `-f`: --fields. Select only these fields
    - Also print any line that contains no delimiter character, unless the `-s` option is specified
    - Example: `echo a-b-c | cut -d"-" -f1,3` will stdout `a-c`
  
- [manage linux processes](https://www.howtogeek.com/107217/how-to-manage-processes-from-the-linux-terminal-10-commands-you-need-to-know/)
- Basically, `$PWD` is just where the shell thinks you are, not necessarily where you really are
  - https://unix.stackexchange.com/questions/295495/ls-pwd-and-ls-get-different-files-strange-caching-perhaps/295497#295497
