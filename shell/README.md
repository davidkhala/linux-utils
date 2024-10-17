# Syntax
- 箭头符号 `>` 与 `<` （Ref: https://blog.csdn.net/dapeng1994/article/details/84311357）
  - <<<: 字符串作为命令的标准输入
  - <<: EOF标记关键字
  - < : 将一个文件的内容作为命令的标准输入 (替换式)
- 字符串大小写转换
  - 从大写转化到小写`ORG=echo ${ORG} | tr '[:upper:]' '[:lower:]'`
- `$@` is all of the parameters passed to the script.
    - For instance, if you call `./someScript.sh foo bar` then `$@` will be equal to `foo bar`.
- Basically, `$PWD` is just where the shell thinks you are, not necessarily where you really are
  - https://unix.stackexchange.com/questions/295495/ls-pwd-and-ls-get-different-files-strange-caching-perhaps/295497#295497
- `curl <url> | bash -s <function>`
  - Your target function cannot inherit STDIN of the caller context.
  - Thus if your function include interactive command like `expect`, `passwd`, then can only be executed in local.
# Native Tools
- [Date formatter in shell](https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/)
### `rm`
- To remove all the contents of the folder but not the folder itself:
  ```
  rm -rf /path/to/directory/*
  ```
### `ping`
- `ping -c <count of try times> <ip>`  

## text editor & viewer
### `cat`
## Vim
$ vi
### `tail`
- follow and attach to current terminal: `tail -f`
- get last line: `tail -1`

### [more](https://man7.org/linux/man-pages/man1/more.1.html)
- exit: `q`
- page down: `<SPACE>`
- one line down: `<ENTER>`
- page up: `b`
- no way to one line up


### [cut](https://man7.org/linux/man-pages/man1/cut.1.html)
Print selected parts of lines from each FILE(or standard input) to standard output.
- Similar to `awk` in some use cases.
- Required: Use one, and only one of `-b`, `-c` or `-f`
- `-d`: --delimiter. Use specified delimiter instead of TAB for field delimiter
- `-b`: --bytes. Select only these bytes
- `-f`: --fields. Select only these fields
  - Also print any line that contains no delimiter character, unless the `-s` option is specified
  - Example: `echo a-b-c | cut -d"-" -f1,3` will stdout `a-c`

