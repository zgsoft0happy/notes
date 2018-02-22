#Git 应用技巧#

##1.设置用户配置##
设置全局配置
	`git config --global propname "prop"`
例如：`git config --global user.name "杨××"`
特定项目设置特定的配置
	`git config propname "prop"`
例如：`git config user.name "yang"`

##2.查看Git配置##
查看全局配置
	`git config --list`
查看全局配置的某一项
	`git config --global propname `
例如：`git config --global user.name`
查看特定项目的配置项只能看单项（也许也可以看全部，暂时不知道）
	`git config propname`
例如：`git config user.name`

##3.设置终端中文编码问题  
问题描述：在Linux终端中使用命令git status时，中文字符被转为了编码，需要设置git后才可以正确显示，设置全局配置：`git config --global core.quotepath false`;
问题描述：在终端中使用命令git log时，中文字符（作者名称）被转为了编码，需要设置git后才可以正确显示，设置全局配置：`git config --global core.pager more`;
