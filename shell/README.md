# Syntax
- 箭头符号 `>` 与 `<` （Ref: https://blog.csdn.net/dapeng1994/article/details/84311357）
  - <<<: 字符串作为命令的标准输入
  - <<: EOF标记关键字
  - < : 将一个文件的内容作为命令的标准输入 (替换式)
- 字符串大小写转换
  - 从大写转化到小写`ORG=echo ${ORG} | tr '[:upper:]' '[:lower:]'`

# Tools

## native tools
- [Date formatter in shell](https://www.cyberciti.biz/faq/linux-unix-formatting-dates-for-display/)
- To remove all the contents of the folder but not the folder itself:
  ```
  rm -rf /path/to/directory/*
  ```


