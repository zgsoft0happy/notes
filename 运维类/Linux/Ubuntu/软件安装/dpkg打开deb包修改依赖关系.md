##dpkg打开deb包修改依赖关系##

1. 首先打开deb包
	`dpkg -X *.deb dir`
2. 解压deb的control信息
	`dpkg -e *.deb dir/DEBIAN`
3. 修改control的信息
	`vim dir/DEBIAN/control`
4. 创建新生成deb的位置文件夹
	`mkdir newdir`
5. 重新打包
	`dpkg-deb -b  dir newdir/`