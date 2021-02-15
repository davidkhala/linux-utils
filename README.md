# linux-utils
Linux Distro agnostic command 


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
- tail
  - follow and attach to current terminal: `tail -f`
  - get last line: `tail -1`
