#Git 命令

1. 给当前状态打标签：
`git tag -m "comment" tag_name`

2. 将文件添加到暂存区
`git add file_name`

3. 将当前暂存区内容提交（除了暂存区内容没有其他修改）
`git commit -m "comment"`

4. 可以将修改的文件的添加暂存区和提交合并为一个命令
`git commit file_name`

5. 删除一个或者移动一个文件，则不能合并
`git rm filename`
`git commit [-m "comment"]`