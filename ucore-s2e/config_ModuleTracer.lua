
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
	--ModuleExecutionDetecor依赖Interceptor（包括RawMonitor和WindowsMonitor）
	"RawMonitor",
	--ModuleTracer依赖ExecutionTracer和ModuleExecutionDetector
	"ExecutionTracer",
	"ModuleExecutionDetector",
	--测试插件ModuleTracer
	"ModuleTracer",
}
pluginsConfig = {
}
pluginsConfig.RawMonitor = {
	kernelStart=0xc0100000,
	myprogram = {
		delay=true,
		name="myprogram",--模块name
		size=0x100000,
		start=0x100000,--模块start地址
		nativebase = 0x8048000,
		kernelmode=false,
	}
}
pluginsConfig.ModuleExecutionDetector = {
	trackAllModules=true,
	--configAllModules=false,--若增加这项配置，则出以下错误
	--**错误**
	--You must specifiy pluginsConfig['ModuleExecutionDetector'].configAllModules.moduleName
	--**END**
	Test = {
		moduleName = "myprogram",--模块名字
		kernelMode=false,
	}
}
pluginsConfig.ModuleTracer = {
}
