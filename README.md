# 前言
本项目是一个练习makefile的项目，主要目的有两个
>1.实现多级文件编译
>2.实现静态库和动态库编译，并将器链接至项目中

因此本项目适用于对makefile基本语法有所了解、想要事项上述两个功能的读者

# 使用
## 使用前提
使用项目前需要将 opensource/makefile 中的
cpjuulib:
	$(shell echo "xxx" | sudo -S cp $(JUU_LIB)  /usr/lib/)

rmjuulib:
	$(shell echo "xxx" | sudo -S rm -rf /usr/lib/libjuu.so)
其中的xxx改为自己的系统密码

## 使用方法
在当前路径执行
make
可实现全项目编译

在当前路径执行
make clean
可实现全项目清理，清理掉所有的生成文件


在opensource路径执行
make
可单独生成库文件

在opensource路径执行
make clean_opensource
可单独清理掉所有库相关的生成文件

# 项目结构
.
├── build
├── inc
│   └── header.h
├── makefile
├── obj
├── opensource
│   ├── include
│   │   ├── juu.h
│   │   └── lhhadd.h
│   ├── juu
│   │   ├── juu.cpp
│   │   └── juu.h
│   ├── lhhadd
│   │   ├── lhhadd.cpp
│   │   └── lhhadd.h
│   ├── lib
│   ├── makefile
│   └── obj
└── src
    └── main.cpp

## 文件结构说明
|  路径    |  说明 |
|:------: | :----- |
|build  | 最终生成的可执行文件的存放路径 |
| inc  | 项目代码头文件存放路径 |
| src  | 项目代码cpp文件存放路径 |
| obj  | 项目生成的中间产物(.o文件)的存放目录 |
| opensource  | 库相关文件存放目录 |
| makefile  | 主makefile[外层makefile]，用于生成整个项目的最终产物 |

其中，opensource用于存放静态库和动态库相关的文件
|  路径    |  说明 |
|:------: | :----- |
| opensource/include  | 存放各个静态库的头文件(本demo仅有lhhadd一个静态库+juu一个动态库，所以仅放了两个头文件) |
| opensource/lhhadd  | lhhadd这个静态库的源代码路径 |
| opensource/juu  | juu这个动态库的源代码路径 |
| opensource/lib  | 存放生成的静态库文件(.a文件)+动态库文件(.so文件) |
| opensource/obj | 存放生成库过程中的中间文件(.o文件) |
| opensource/makefile  | 内层makefile，用于生成静态库文件(.a文件)+动态库文件(.so文件) |