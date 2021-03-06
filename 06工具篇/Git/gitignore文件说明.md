##目录

1. [名称](1-名称)
2. [概要](2-概要)
3. [描述](3-描述)
4. [模式格式](4-模式格式)
5. [NOTE](5-NOTE)


### 1.名称
gitignore: 特意指定git忽略未跟踪的文件。

### 2.概要
在文件`${HOME}/.config/git/ignore`\\`${GIT_DIR}/info/exclude`\\`.gitignore`中配置。

### 3.描述
在`gitignore`文件中指定模式匹配的且未被跟踪的文件将会被git忽略，但是已经被跟踪的文件将不受影响。
`gitignore`文件中没一行指定一种模式,git一般会检查多个来源的匹配模式，按照如下的模式确定从高到低
的优先级，（从上到下优先级逐次降低，同一配置中如果匹配多个模式，则按照最后一个模式匹配）
- 从命令行中指定的模式
- 从当前目录或者父级目录中得到的`.gitignore`文件中寻找匹配的模式，如果存在多个，则按照就近原则，即当前目录下有的，按照当前目录下的`.gitignore`处理，否则向上一层的父目录下寻找。通常一个工程都会在代码仓库中包含`gitignore`这样一个文件，用来忽略工程构建(build)时产生的编译文件等。
- 从`$GIT_DIR/info/exclude`文件中读取到的模式
- 在由配置变量`core.excludesFile`指定的文件中读取到的模式

模式放在那个文件取决于该模式将被怎么使用。
- 模式如果是被版本控制的并将被通过克隆到其他仓库的，也就是说模式匹配到的文件将会被所有的开发者忽略的，应该放在`.gitignore`文件中。
- 模式被用来匹配莫以特定的仓库而不影响其他相关的仓库（例如，存储在仓库中的某一特定的用户的工作流的辅助文件应该放在`$GIT_DIR/info/exclude`中。
- 模式如果希望在所有的情况都忽略，例如备份文件或者是产生的临时文件等，应将模式配置在有`~/.gitconfig`中配置的`core.excludesFile`变量指定的文件中，这个文件默认是`$XDG_CONFIG_HOME/git/ignore`,如果`$XDG_CONFIG_HOME`不存在，则默认的是`$HOME/.config/git/ignore`。

**note**:底层git的管道工具，例如`git ls-files`,`git read-tree`,使用的是命令行选项指定的`gitignore`模式，或者是命令行选项指定的`gitignore`文件中的模式；而高层次的工具，例如`git status`,`git add`等则使用的是上述的方法指定的模式。

### 4.模式格式
- 空白行将不匹配任何文件，因此可以作为可读性的分隔符使用；
- 以`#`开头的是注释行；
- 行未的空格将被忽略，除非使用`\`转意；
- `！`前缀的模式是被否定的模式，将被再次的包含在git仓库版本管理中。如果该文件的父目录被排出了，那么该文件将不可能被再次的包含，出于性能考虑，Git不会列出所有的忽略目录，所以无论包含的文件是否被定义，都不会收到影响，在`！`之前放一个`\`代表是匹配以`！`开头的文件。
- 如果模式以`/`结尾，则代表的是忽略一个指定目录以及该目录下所有的路径，而不是匹配一个对应名的文件，例如`foo/`匹配的是`./foo/*`,而不能匹配`./foo`。
- 如果不包含`/`，则Git会将其是为shell glob模式，并检查相对当前的`.gitignore`文件的相对路径名中匹配的文件。（如果不是来自`.gitignore`文件，则相对于工作树的顶层。
- `*`代表除了`/`的任意字符（串），`?`代表除了`/`和`[]`的任一字符。
- 以`/`开头的是模式只匹配当前目录下的文件。   

与完整路径匹配时`**`(双星号)具有特殊的意义：
- 以`**`开头意味着匹配所有的目录，例如`**/foo`将匹配所有的文件名或者目录名为`foo`的，类似于模式`foo`。`**/foo/bar`则匹配所有的bar文件或者目录，该文件或者目录的父目录是`foo`。
- `/**`代表目录下任意的文件，例如：`abc/**`则匹配相对于`.gitignore`的目录abc下所有的文件和目录。
- `/**/`则匹配中间有0个或者多个目录，例如：`a/**/b`则匹配`a/x/b`,`a/x/y/b`。
- 其他连续的`*`将被认为是无效的。

### 5.NOTE：
gitignore是确保未被跟踪的文件继续不被跟踪，如果某个文件已经被跟踪，则可以使用`git rm --cache <file>`来取消跟踪。
