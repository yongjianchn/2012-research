# 使用s2e测试Ucore下的自编写用户程序

## 一：buid s2e【摘自s2e_setup_usage_guide.md】

#### 环境 ubuntu 12.04 x86-64
#### 步骤
 1. 环境准备

    $ sudo apt-get install build-essential subversion git gettext liblua5.1-dev libsdl1.2-dev libsigc++-2.0-dev binutils-dev python-docutils python-pygments  nasm

    $ sudo apt-get build-dep llvm-default qemu

    $ git clone git@dslabgit.epfl.ch:s2e/s2e.git（最新s2e）

 2. 开始编译

    $ mkdir build

    $ cd build

    $ ln -s ../s2e/Makefile .

    $ make

#### 遇到问题和解决方法
  1. 问题1： 在编译 ./stp/bin/stp时报错，大致错误信息是找不到Minisat::Solver::simplify()等实现
   * 解决办法：

    $ find stp  -name "lib_release.a"

     stp/src/sat/core/lib_release.a
     stp/src/sat/simp/lib_release.a`
     stp/src/sat/utils/lib_release.a
     stp/src/sat/core_prop/lib_release.a

    $ rm stp/src/sat/core/lib_release.a

    $ rm stp/src/sat/simp/lib_release.a

    $ rm stp/src/sat/utils/lib_release.a

    $ rm stp/src/sat/core_prop/lib_release.a
`    
    然后重新 make

    $ make

    则./stp/bin/stp 可正常生成

  1. 问题2：编译qemu出错，找不到SDL.h
   * 解决办法：
    $ cd qemu-release

    $ make  //通过后

    $ cd ..

    $ make  //就可以了

## 二：使用s2e测试ucore下的用户程序


### build ucore（lab5_result为例）

```
cd lab5_result;make
```

### 如何选择运行ucore下的哪个用户程序

在`lab5_result/kern/process/proc.c` 中找到`KERNEL_EXECVE(tests2e);`

其中的tests2e就是用户程序的`.c`文件的名字。在`lab5_result/user/`文件夹中添加用户的程序，比如test_xuyongjian.c，

然后将`KERNEL_EXECVE(tests2e);` 改成`KERNEL_EXECVE(test_xuyongjian);`

然后	cd lab5_result

	make

**注意事项** ：我发现如果用户程序名为`tests2e-1.c`等有`-`的名字时，make ucore会出错。可用`_`就不会出错。

### 测试

编写运行脚本：`runlab5.sh`

脚本内容：

	/home/xyj/s2e/build/qemu-release/i386-s2e-softmmu/qemu-system-i386 -hda lab5_result/bin/ucore.img -drive file=lab5_result/bin/swap.img,media=disk,cache=writeback -serial null -s2e-config-file config.lua -s2e-verbose 

修改上述脚本中的路径为自己的qemu（s2e）以及ucore镜像等文件的路径。

运行脚本，即可启动qemu虚拟运行ucore。ucore启动自动运行用户程序。

