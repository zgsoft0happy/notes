名称
gitignore: 特意指定git忽略未跟踪的文件。

概要
在文件`${HOME}/.config/git/ignore`\\`${GIT_DIR}/info/exclude`\\`.gitignore`中配置。

描述
在`gitignore`文件中指定模式匹配的且未被跟踪的文件将会被git忽略，但是已经被跟踪的文件将不受影响。
`gitignore`文件中没一行指定一种模式,git一般会检查多个来源的
