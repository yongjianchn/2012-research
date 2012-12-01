#[CorePlugin类型] 类的初步分析
##CorePlugin

**是所有插件的基础**

其中定义了一系列信号，用于在检测到指令时给插件们发送信号（emit），相应的插件会进行连接（connect）并且调用相应的函数。

CorePlugin中定义的信号在CorePlugin.h中：

由于信号极多，此处不再列举。

> 参见曹鼎插件分析1.1，其大部分篇幅用于列举各种CorePlugin定义的信号，这些信号提供给其他插件使用

>	> 各种信号的分析参考signal.md(fwl/whq负责分析部分)

=================>非常重要

#[选择类型] 类的初步分析
##BaseInstructions
**关于符号化、分支执行、具体执行等重要操作如何进行；**

此插件在收到CorePlugin的onCustomInstruction信号之后开始根据opcode进行相应的各种操作。

	switch((opcode>>8) & 0xFF) {
		case 0: { /* s2e_check */
			uint32_t v = 1;
			state->writeCpuRegisterConcrete(CPU_OFFSET(regs[R_EAX]), &v, 4);
		}
		break;
		case 1: state->enableSymbolicExecution(); break;
		case 2: state->disableSymbolicExecution(); break;
		
		case 3: { /* s2e_make_symbolic */
			makeSymbolic(state, false);
			break;
		}
		
		case 4: { /* s2e_is_symbolic */
			isSymbolic(state);
			break;
		}
		case ……

还有很多操作，主要用于符号化、分支执行还是只能具体执行、输出提示信息、sleep等操作

===============>非常重要

##EdgeKiller
此插件根据Interceptor提供的onModuleLoad、onModuleUnload信号进行一些操作，这些操作期间会根据ModuleExecutionDetector的onModuleTranslateBlockEnd信号，调用onEdge()函数

此插件的具体功能不是很清楚，但是本身不发射信号，只是在模块load、unload的时候进行一些简单操作.

=============>应该不需要深入研究。

##CodeSelector
**用于从code角度限定符号执行的范围。**

CodeSelector插件取得目标程序(或者库，驱动)的名称和程序计数器的范围。在这个范围内的代码在多路模式下扩展，当代码在计数器范围外时，将被运行在单路径模式下.CodeSelector通常和data-base selector一起应用，来限制data-selected在感兴趣的代码段中进行多路径执行。

##SysmbolicHardware
**用于从data角度限定符号执行的范围。**

符号数据能从各种来源进入系统，S2E为每一个符号数据提供一个Selector，从命令行参数，通过SymbolicHardware插件来传递给硬件输入。

##Annotation
**S2E annotation 是由S2E用户编写的代码，用于观察和操作执行状态。**

Annotations能够用于实现不同**执行一致性模型**。

例如，annnotations 能实现RC-LC一致性，通过使用符号值小心的替代一些功能参数和返回值。

##StateManager
**对删除、暂停states进行控制（重要&分析工作量较大）**

代码量较大，未仔细阅读。从函数名看，基本用于读取状态空间，并进行暂停、删除等操作。

##DataSelector含有子类WindowsService、GenericDataSelector
**DataSelector类定义了几个MakeSymbolic的操作**

如：

	DataSelector::makeUnicodeStringSymbolic(S2EExecutionState *s, uint64_t address)；
	DataSelector::makeStringSymbolic(S2EExecutionState *s, uint64_t address)；

此外，此类还有几个关于获取一些关于符号化变量过程的一些信息。

===============>对于理解对路径状态的控制十分重要。

###（子类1）GenericDataSelector
大概功能是在Module load、unload时以及TB start、end时进行一些判断，然后进行一些指定的关于mkeSymbolic以及其它功能的一些操作。代码量大，具体操作未仔细研究。

===============>较为重要

###（子类2）WindowsService
大概功能是接受到ModuleExecutionDetector的onModuleTranslateBlockStart信号之后进行一些判断、输出一些信息，其中也有makeSymbolic有关的函数，但是不明白其具体执行什么操作。

===============>与GenericDataSelector部分相似，代码少，暂时不用重点分析


