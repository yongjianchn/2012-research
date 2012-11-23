
-- File: config.lua
s2e = {
  kleeArgs = {
    -- Run each state for at least 1 second before
    -- switching to the other:
    "--use-batching-search=true", "--batch-time=1.0"
  }
}
plugins = {
	-- Enable a plugin that handles S2E custom opcode
 	"BaseInstructions",
	"TranslationBlockTracer",
	--TranslationBlockTracer依赖ExecutionTracer，ModuleExecutionDetector
	"ExecutionTracer",
	"ModuleExecutionDetector",
	--ModuleExecutionDetector依赖Intercepter（RawMonitor/WindowsMonitor）
	"RawMonitor",
}
pluginsConfig = {
}
pluginsConfig.TranslationBlockTracer = {
	manualTrigger=false,
	--如果置为 true,跟踪的开始和结束将有特殊的用户指令决定,这对于将追踪限制在特定的代码段中是有用的
	flushTbCache=true,
	--在跟踪被 enable 时,有的 translationblock 是被翻译过的,如果是按照顺序执行翻译模块的话,这些被翻译过的 translationblock 就不能被跟追,开启 flushTbCache 就可以跟踪这些模块。

	
}
pluginsConfig.ExecutionTracer = {
}

pluginsConfig.ModuleExecutionDetector = {
	trackAllModules=true,
	--configAllModules=false,--若增加这项配置，则出以下错误
	--**错误**
	--You must specifiy pluginsConfig['ModuleExecutionDetector'].configAllModules.moduleName
	--**END**
	myprogram = {
		moduleName = "myprogram",--模块名字
		kernelMode=false,
	}
}

pluginsConfig.RawMonitor = {
	kernelStart=0xc0100000,
	interestmodule = {
		delay=true,
		name="myprogram",--模块name
		size=0xffff0000,
		start=0x0,--模块start地址
		nativebase = 0x8048000,
		kernelmode=false,
	}
}
