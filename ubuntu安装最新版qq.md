安装QQ最新版
1. 由于本人的系统是64位版本的，所以需要首先安装对32位的支持：
```
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install lib32zl lib32ncurses5
```
2. 下载三个deb文件，在百度网盘中保存的：
```
crossover-15_15.0.3-1_all.deb
crossover-15_15.0.3-1_all-free.deb
deepin-crossover-helper_1.0deepin0_all.deb
```
3. 下载完成后按照上述的顺序依次安装：
`sudo dpkg -i xxx`
这时不出意外已经安装好了Crossover了。
4. 在网盘中下载qq，并安装：
`sudo dpkg -i *qq*.deb`
注意：有两个bug，那就是关闭qq后再启动，提示文件被占用，这个未能解决。
另外一个是中文乱码的问题，下面给出解决方案。

解决qq的乱码
1. wine下中文的配置方案
步骤：
1. 初始设置
运行 winecfg，把模拟的 Windows 系统设置为 Windows XP 或者 Windows 2000。
2. 准备字体
为了让 Windows 应用程序看上去更美观，所以需要 Windows 下面的字体。
由于我已经将 simsun.ttc 复制到 /usr/share/fonts/windows/ 目录中了。所以我只需要在
~/.wine/drive_c/windows/Fonts/ 目录中为 simsun.ttc 创建一个符号连接：
cd ~/.wine/drive_c/windows/Fonts(如果不是Fonts那可能是fonts)
ln -s /usr/share/fonts/windows/simsun.ttc simsun.ttc
ln -s /usr/share/fonts/windows/simsun.ttc simfang.ttc
创建一个 simfang.ttc 是许多 Windows 应用默认使用 simfang.ttc 字体。
3. 修改 ~/.wine/system.reg
装好字体后，还要修改一下 Wine 的注册表设置，指定与字体相关的设置：
gedit ~/.wine/system.reg
（一定要使用 gedit 或其他支持 gb2312/utf8 编码的编辑器修改这些文件，否则文件中的中文
可能变乱码）
搜索： LogPixels
找到的行应该是：[System\\CurrentControlSet\\Hardware Profiles\\Current\\Software\\Fonts]
将其中的：
"LogPixels"=dword:00000060
改为：
"LogPixels"=dword:00000070
搜索： FontSubstitutes
找到的行应该是：[Software\\Microsoft\\Windows NT\\CurrentVersion\\FontSubstitutes]
将其中的：
"MS Shell Dlg"="Tahoma"
"MS Shell Dlg 2″="Tahoma"
改为：
"MS Shell Dlg"="SimSun"
"MS Shell Dlg 2″="SimSun"
4. 修改 ~/.wine/drive_c/windows/win.ini
gedit ~/.wine/drive_c/windows/win.ini
在文件末尾加入：
[Desktop]
menufontsize=13
messagefontsize=13
statusfontsize=13
IconTitleSize=13
5. 最关键的一步，网上很多文章中没有提到的一步──把下面的代码保存为zh.reg，然后终
端执行regedit zh.reg。
代码:
REGEDIT4
[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\FontSubstitutes]
"Arial"="simsun"
"Arial CE,238"="simsun"
"Arial CYR,204"="simsun"
"Arial Greek,161"="simsun"
"Arial TUR,162"="simsun"
"Courier New"="simsun"
"Courier New CE,238"="simsun"
"Courier New CYR,204"="simsun"
"Courier New Greek,161"="simsun"
"Courier New TUR,162"="simsun"
"FixedSys"="simsun"
"Helv"="simsun"
"Helvetica"="simsun"
"MS Sans Serif"="simsun"
"MS Shell Dlg"="simsun"
"MS Shell Dlg 2"="simsun"
"System"="simsun"
"Tahoma"="simsun"
"Times"="simsun"
"Times New Roman CE,238"="simsun"
"Times New Roman CYR,204"="simsun"
"Times New Roman Greek,161"="simsun"
"Times New Roman TUR,162"="simsun"
"Tms Rmn"="simsun"
好了好了，之后 你会发现中文是多么的美丽。。。
这个连kugoo的乱码也解决了