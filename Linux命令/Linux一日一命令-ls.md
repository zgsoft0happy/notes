#<center>**Linux命令之**<span color="red">**ls**</span></center>

<p align="right">作者：乾坤智林	时间：星期五, 23. 六月 2017 04:19下午 </p>

	声明：本文主要是依据命令`man ls`整理所得，由于作者水平有限，不足之处请多指教。

#1.名字(name)
	简写：ls
	全名：list
	描述：列表显示目录内容
	
#2.概要(synopsis)
	ls  [OPTION]...  [FILE]...
	ls  [选项]... [文件]
	说明：当选项为空时，现实文件(夹)下的所有可见文件和文件夹；当文件为空时，默认显示当前目录下的文件。
	
#3.描述
	列出目录(默认的是当前目录)的文件信息，在没有选项`-cftuvSUX`和`--sort`的情况下，默认安装字母排序。
	长选项必须用的参数在使用短选项时也是必须的。
	
|参数选项|描述|实例|
|:--|:--|:--|
|-a,--all|不用隐藏以.开始文件或文件夹，即显示所有的文件|`ls -a` or `ls --all`<br> ![ls-a](/home/yang/Works/notes/Linux命令/image/ls/la-a.png) |
|-A ,--almost-all|同-a，但是不显示隐藏的./和../文件夹|`ls -A` or `ls --almost-all`<br>![ls-A](/home/yang/Works/notes/Linux命令/image/ls/la-A.png) |
|--author|与`-l`一起使用，用以显示文件的拥有者(或用户，或作者)|`ls -l --author`<br>![ls--author](/home/yang/Works/notes/Linux命令/image/ls/ls--author.png) 
|-b,--escape|以无图形的C风格(不太明白)显示，请和`ls`的结果对比|`ls -b` or `ls --excape`<br>![ls-b](/home/yang/Works/notes/Linux命令/image/ls/ls-b.png) |
|--block-size=SIZE|与`-l`一起使用，在显示文件大小时，以指定的大小单位显示|`ls --block-size=M`<br>![ls--block-size](/home/yang/Works/notes/Linux命令/image/ls/ls--block-size.png) 
|-B,--ignore-backups|不显示以`~`结尾的和隐藏文件|`ls -lB` or `ls --ignore-backups -l`<br>![ls-lB](/home/yang/Works/notes/Linux命令/image/ls/ls-lB.png) |
|-c|与`-lt`一起使用时，以最后一次修改时间进行排序，并显示；<br>与`-l`一起使用时，以name进行排序；<br>单独使用默认的是以最后一次修改时间进行排序|`ls -clt`<br>![ls-clt](/home/yang/Works/notes/Linux命令/image/ls/ls-clt.png) <br>`ls -cl`<br>![ls-cl](/home/yang/Works/notes/Linux命令/image/ls/ls-cl.png) <br>`ls -c`<br>![ls-c](/home/yang/Works/notes/Linux命令/image/ls/ls-c.png) |
|-C|多列显示，默认选项|`ls -C`<br>![ls-C](/home/yang/Works/notes/Linux命令/image/ls/ls-C.png) |
|--color=[WHEN]|彩色显示，`always`默认选项；`auto`自动；`never`从不|`ls --color=never`<br>![ls--color-never](/home/yang/Works/notes/Linux命令/image/ls/ls-color-never.png) |
|-d,--directory|显示自当前的目录自身，不包括其他内容`.`|`ls -d` or `ls --directory`<br>![ls-d](/home/yang/Works/notes/Linux命令/image/ls/ls-d.png) |
|-D,--dired|以Emac的dired模式输出|`ls -D` or `ls --dired`<br>![ls-D](/home/yang/Works/notes/Linux命令/image/ls/ls-D.png) |
|-f|不排序，和参数`-aU`的效果基本一样，只是不带颜色显示|`ls -f`<br>![ls -f](/home/yang/Works/notes/Linux命令/image/ls/ls-f.png) |
|-F,--classify|在末端加上识别符|`ls -F` or `ls --classify`<br>![ls -F](/home/yang/Works/notes/Linux命令/image/ls/ls-F.png) |
|--file-type|同上，只是文件末端不加`*`|`ls --file-type`<br>![ls --file-type](/home/yang/Works/notes/Linux命令/image/ls/ls--file-type.png) |
|--format=WORD|以指定的格式隔开各个文件，常用选项：`across`,`commas`,`horizontal`,`long`,`single-column`,`verbose`,`vertical`|`ls --format=commas`<br>![ls --format=commas](/home/yang/Works/notes/Linux命令/image/ls/ls--format-commas.png) |
|--full-time|类似`-l`，显示详细的时间|`ls --full-time`<br>![ls --full-time](/home/yang/Works/notes/Linux命令/image/ls/ls--full-time.png) |
|-g|类似`-l`，但不显示拥有者(owner)|`ls -g`<br>![ls -g](/home/yang/Works/notes/Linux命令/image/ls/ls-g.png) |
|--group-directories-first|目录放在前边显示|`ls --group-directories-first`<br>![ls --group-directories-first](/home/yang/Works/notes/Linux命令/image/ls/ls--group-directories-firsr.png) |
|-G,--no-group|在显示长信息(`-l`)时，不显示所数组的名字|`ls -G` or `ls --no-group`<br>![ls -G](/home/yang/Works/notes/Linux命令/image/ls/ls-G.png) |
|-h,--human-readable|配合`-l`或(和)`-s`一起使用，文件大小以人类可读的方式显示|`ls -lh` or `ls --human-readable -l`<br>![ls -sh](/home/yang/Works/notes/Linux命令/image/ls/ls-sh.png) |
|--si|同上，只是进制是`1000`，而不是`1024`|`ls --si -l`<br>![ls --si -s](/home/yang/Works/notes/Linux命令/image/ls/ls--si-s.png) |
|-H,--dereference-command-line|遵循命令行中列出的符号链接(并没有发现有什么不同)|`ls -H`<br>![ls -H](/home/yang/Works/notes/Linux命令/image/ls/ls -H.png) |
|--dereference-command-line-symlink-to-dir|遵循指向目录的每个命令行符号链接(并不明白)|`ls --dereference-command-line-symlink-to-dir`|
|--hide=PATTERN|不显示隐藏的文件中和shell指定模式匹配的，覆盖`-a` 或者`-A`的和功能|`ls --hide=　-a`|
|--indicator-style=WORD|用指定的WORD标识符连接在文件名上|`ls --indicator-style=slash`|
|-i,--inode|显示每个文件的索引号|`ls -i`or `ls --inode`<br>![ls -i](/home/yang/Works/notes/Linux命令/image/ls/ls-i.png) |
|-I,--ignore|不显示匹配指定的shell模式的隐藏文件|`ls -I=*.*` or `ls --ignore=*.*`<br>![ls -I=*.*](/home/yang/Works/notes/Linux命令/image/ls/ls-I_ss.png) |
|-k,--kibibytes|默认以1024byte的块(并不知道有什么区别)|`ls -k` or `ls --kibibytes`|
|-l|利用长的格式输出|`ls -l`<br>![ls -l](/home/yang/Works/notes/Linux命令/image/ls/ls-l.png) |
|-L,--dereference|当显示符号链接的文件信息时，显示链接引用的文件的信息，而不是链接本身|`ls -L` or `ls --dereference`<br>![ls -L](/home/yang/Works/notes/Linux命令/image/ls/ls-L.png) <br>这里没有明显差别的原因是，没有link文件|
|-m|文件之间以逗号隔开|`ls -m`<br>![ls -m](/home/yang/Works/notes/Linux命令/image/ls/ls-m.png) |
|-n,--numeric-uid-gid|同`-l`，只是用户和用户组，以数字ID的形式显示|`ls -n` or `ls --numeric-uid-gid`<br>![ls -n](/home/yang/Works/notes/Linux命令/image/ls/ls-n.png) |
|-N,--iteral|打印原始条目名称（不要特别对待例如控制字符）|`ls -N` or `ls --iteral`|
|-o|同`-l`,但是不列出组的信息|`ls -o`<br>![ls -o](/home/yang/Works/notes/Linux命令/image/ls/ls-o.png) |
|-p,--indicator-style=slash|目录后附加`/`识别|`ls -p` or `ls --indicator-style=slash`<br>![ls -p](/home/yang/Works/notes/Linux命令/image/ls/ls-p.png) |
|-q,--hide-control-chars|用`?`代替非图形字母(没太理解)|`ls -q` or `ls --hide-control-chars`|
|--show-control-chars|显示图形化文字(除了`ls`程序和终端中)|`ls --show-control-chars`|
|-Q,--quote-name|用双引号将文件名环绕|`ls -Q` or `ls --quote-name`<br>![ls -Q](/home/yang/Works/notes/Linux命令/image/ls/ls-Q.png) |
|--quoting-style=WORD利用WORD指定的风格显示文件名|`ls --quoting-style=c`<br>![ls --quoting-style=c](/home/yang/Works/notes/Linux命令/image/ls/ls--quoting-style_c.png) |
|-r,--reverse|在排序显示时倒叙|`ls -r` or `ls --reverse`<br>![ls -r](/home/yang/Works/notes/Linux命令/image/ls/ls-r.png) |
|-R,--resursive|递归的显示目录，以及文件|`ls -R` or `ls --recursive`<br>由于显示太多，所以自己尝试(文件多的有点吓人)|
|-s,--size|显示文件占用的大小，默认是块数|`ls -s` or `ls --size`<br>![ls -s](/home/yang/Works/notes/Linux命令/image/ls/ls-s.png) |
|-S|以文件大小排序，越大排序越靠前，见`--sort=WORD`|`ls -S`<br>![ls -Sl](/home/yang/Works/notes/Linux命令/image/ls/ls-Sl.png) |
|--sort=WORD|按照指定的方式对文件对应排序；`none(-U)`,`size(-S)`,`time(-t)`,`version(-v)`,`extension(-X)`|`ls --sort=size`<br>![ls --sort=size](/home/yang/Works/notes/Linux命令/image/ls/ls--sort_size.png) |
|--time=WORD|与`-l`一起使用，指定的时间排序，`atime` or `access` or `use` `(-u)`代表最后修改时间；`ctime` or `status` `(-c)`代表创建的时间|`ls --time=ctime`<br>![ls --time=ctime](/home/yang/Works/notes/Linux命令/image/ls/ls--time_ctime.png) |
|--time-style=WORD|与`-l`一起使用，以特定的方式显示|`ls --time-style=locale -l`<br>![ls --time-style=locale -l`](/home/yang/Works/notes/Linux命令/image/ls/ls--time-style_locale.png) |
|-t|按照时间排序，最新最优先，见`--sort`|`ls -t`<br>![ls -t](/home/yang/Works/notes/Linux命令/image/ls/ls-t.png) |
|-T,--tabsize=COLS|以指定的tab大小隔开各个文件|`ls -T4` or `ls --tabsize=4`<br>![ls -T4](/home/yang/Works/notes/Linux命令/image/ls/ls-T4.png) |
|-U|不排序|`ls -U`<br>![ls -U](/home/yang/Works/notes/Linux命令/image/ls/ls-U.png) |
|-w,--width=COLS|指定列宽|`ls -w60`or `ls --width=60`<br>![ls -w60](/home/yang/Works/notes/Linux命令/image/ls/ls-w60.png) |
|-x|以行显示代替以列显示|`ls -x`<br>![ls -x](/home/yang/Works/notes/Linux命令/image/ls/ls-x.png) |
|-Z,--context|打印任何文件的安全内容|`ls -Z` or `ls --context`<br>![ls -Z](/home/yang/Works/notes/Linux命令/image/ls/ls-Z.png) |
|-1|一个文件占用一行|`ls -1`<br>![ls -1](/home/yang/Works/notes/Linux命令/image/ls/ls-1.png) |
|--help|显示帮助|`ls --help`|
|--version|输出版本信息|`ls --version`<br>![ls --version](/home/yang/Works/notes/Linux命令/image/ls/ls--version.png) |

注意：文件大小是整数，单位是`K`,`M`,`G`,`T`,`P`,`E`,`Z`,`Y`，之间的进制是`1024`。

#4.个人总结
	ls是一个非常基础的linux命令，只要是用来显示目录下的文件(或者单个文件)信息，一般常用的参数是`-al`等，相对比较简单的命令，一般初学者也应该掌握的命令。
	
	