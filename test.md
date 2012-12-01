* **OSMonitor**： 提供一系列接口   
    1. **RawMonitor**： OSMonitor的子类，提供OS无关的模拟环境，甚至可以用来分析BIOS、firmware。   
	注册信号及依赖关系：CorePlugin的onTranslateInstructionStart, onCustomInstruction.   
    2. **WindowsMonitor**：OSMonitor的子类，实现了对Windows下的module加（卸）载、process加（卸）载以及线程的监控、探测。   
	注册信号及依赖关系：CorePlugin的onTranslateInstructionStart，onPageDirectoryChange。   
*注：RawMonitor和WindowsMonitor都被称为Interceptor*
* **ModuleExecutionDetector**：能够在进入或离开某个插件感兴趣的模块时，通知该插件。   它需要依赖某个具体的OS。   
	注册信号及依赖关系：Interceptor的[1,2,3], CorePlugin的[1,2,7,8]。
