set args -parallel stdio -hda bin/ucore.img -drive file=bin/swap.img,media=disk,cache=writeback -serial null
break main
break cpu_x86_exec
