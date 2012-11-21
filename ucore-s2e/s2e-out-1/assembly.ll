; ModuleID = 'tcg-llvm'
target datalayout = "e-p:64:64:64-S128-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-f128:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.CPUX86State = type { [8 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [6 x %struct.SegmentCache], %struct.SegmentCache, %struct.SegmentCache, %struct.SegmentCache, %struct.SegmentCache, [5 x i32], i32, i32, i16, i16, [8 x i8], [8 x i8], [8 x %u
%struct.SegmentCache = type { i32, i32, i32, i32 }
%union.FPReg = type { %struct.floatx80 }
%struct.floatx80 = type { i64, i16 }
%struct.float_status = type { i8, i8, i8, i8, i8, i8, i8 }
%union.XMMReg = type { [2 x i64] }
%union.MMXReg = type { i64 }
%union.anon = type { [4 x %struct.CPUBreakpoint*] }
%struct.CPUBreakpoint = type { i32, i32, %struct.anon }
%struct.anon = type { %struct.CPUBreakpoint*, %struct.CPUBreakpoint** }
%struct.TranslationBlock = type { i32, i32, i64, i16, i16, i8*, %struct.TranslationBlock*, [2 x %struct.TranslationBlock*], [2 x i64], [2 x i16], [2 x i16], [2 x %struct.TranslationBlock*], %struct.TranslationBlock*, i32, %struct.TCGLLVMContext*, %struct
%struct.TCGLLVMContext = type opaque
%struct.Function = type opaque
%struct.S2ETranslationBlock = type opaque
%struct.CPUTLBEntry = type { i32, i32, i32, i64, [8 x i8] }
%struct.S2ETLBEntry = type { i8*, i64 }
%union.anon.1 = type { i32 }
%struct.breakpoints_head = type { %struct.CPUBreakpoint*, %struct.CPUBreakpoint** }
%struct.watchpoints_head = type { %struct.CPUWatchpoint*, %struct.CPUWatchpoint** }
%struct.CPUWatchpoint = type { i32, i32, i32, %struct.anon.0 }
%struct.anon.0 = type { %struct.CPUWatchpoint*, %struct.CPUWatchpoint** }
%struct.GDBRegisterState = type opaque
%struct._s2e_jmpbuf_t = type { [16 x i64], i64 }
%struct.QemuThread = type opaque
%struct.QemuCond = type opaque
%struct.qemu_work_item = type { %struct.qemu_work_item*, void (i8*)*, i8*, i32 }
%struct.KVMState = type opaque
%struct.kvm_run = type opaque
%struct.MTRRVar = type { i64, i64 }
%struct.DeviceState = type opaque
%struct.S2E = type opaque
%struct.S2EExecutionState = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.MemoryRegion = type { %struct.MemoryRegionOps*, i8*, %struct.MemoryRegion*, %struct.Int128, i64, void (%struct.MemoryRegion*)*, i64, i8, i8, i8, i8, i8, i8, i8, i8, %struct.MemoryRegion*, i64, i32, i8, %struct.subregions, %struct.anon.11, %struct
%struct.MemoryRegionOps = type { i64 (i8*, i64, i32)*, void (i8*, i64, i64, i32)*, i32, %struct.anon.9, %struct.anon.10, %struct.MemoryRegionPortio*, %struct.MemoryRegionMmio }
%struct.anon.9 = type { i32, i32, i8, i1 (i8*, i64, i32, i1)* }
%struct.anon.10 = type { i32, i32, i8 }
%struct.MemoryRegionPortio = type { i32, i32, i32, i32 (i8*, i32)*, void (i8*, i32, i32)* }
%struct.MemoryRegionMmio = type { [3 x i32 (i8*, i64)*], [3 x void (i8*, i64, i32)*] }
%struct.Int128 = type { i64, i64 }
%struct.subregions = type { %struct.MemoryRegion*, %struct.MemoryRegion** }
%struct.anon.11 = type { %struct.MemoryRegion*, %struct.MemoryRegion** }
%struct.coalesced_ranges = type { %struct.CoalescedMemoryRange*, %struct.CoalescedMemoryRange** }
%struct.CoalescedMemoryRange = type opaque
%struct.MemoryRegionIoeventfd = type opaque
%union.anon.12 = type { i64 }

@env = global %struct.CPUX86State* null, align 8
@hextable = internal unnamed_addr constant [16 x i8] c"0123456789abcdef", align 16
@g_s2e_concretize_io_addresses = external global i32
@g_s2e = external global %struct.S2E*
@g_s2e_state = external global %struct.S2EExecutionState*
@g_s2e_concretize_io_writes = external global i32
@.str = private unnamed_addr constant [4 x i8] c"inb\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"inw\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"inl\00", align 1
@loglevel = external global i32
@s2e_do_interrupt_all.count = internal unnamed_addr global i32 0, align 4
@logfile = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant [65 x i8] c"%6d: v=%02x e=%04x i=%d cpl=%d IP=%04x:%08x pc=%08x SP=%04x:%08x\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c" CR2=%08x\00", align 1
@.str5 = private unnamed_addr constant [10 x i8] c" EAX=%08x\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str7 = private unnamed_addr constant [12 x i8] c"SMM: enter\0A\00", align 1
@.str8 = private unnamed_addr constant [16 x i8] c"SMM: after RSM\0A\00", align 1
@parity_table = external constant [256 x i8]
@fcom_ccval = internal unnamed_addr constant [4 x i32] [i32 256, i32 16384, i32 0, i32 17664], align 16
@fcomi_ccval = internal unnamed_addr constant [4 x i32] [i32 1, i32 64, i32 0, i32 69], align 16
@.str9 = private unnamed_addr constant [11 x i8] c"iommuread_\00", align 1
@io_mem_ram = external global %struct.MemoryRegion
@io_mem_rom = external global %struct.MemoryRegion
@io_mem_unassigned = external global %struct.MemoryRegion
@io_mem_notdirty = external global %struct.MemoryRegion
@g_s2e_fork_on_symbolic_address = external global i32
@.str10 = private unnamed_addr constant [13 x i8] c"vmrun! %08x\0A\00", align 1
@.str11 = private unnamed_addr constant [18 x i8] c"Injecting(%#hx): \00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"INTR\00", align 1
@.str13 = private unnamed_addr constant [4 x i8] c"NMI\00", align 1
@.str14 = private unnamed_addr constant [6 x i8] c"EXEPT\00", align 1
@.str15 = private unnamed_addr constant [5 x i8] c"SOFT\00", align 1
@.str16 = private unnamed_addr constant [10 x i8] c" %#x %#x\0A\00", align 1
@.str17 = private unnamed_addr constant [32 x i8] c"vmload! %08x\0AFS: %016lx | %08x\0A\00", align 1
@.str18 = private unnamed_addr constant [32 x i8] c"vmsave! %08x\0AFS: %016lx | %08x\0A\00", align 1
@.str19 = private unnamed_addr constant [37 x i8] c"vmexit(%08x, %016lx, %016lx, %08x)!\0A\00", align 1
@rclb_table = external constant [32 x i8]
@rclw_table = external constant [32 x i8]
@use_icount = external global i32
@.str20 = private unnamed_addr constant [12 x i8] c"invalid tss\00", align 1
@.str21 = private unnamed_addr constant [17 x i8] c"invalid tss type\00", align 1
@.str22 = private unnamed_addr constant [36 x i8] c"check_exception old: 0x%x new 0x%x\0A\00", align 1
@.str23 = private unnamed_addr constant [14 x i8] c"Triple fault\0A\00", align 1

define i1 @uadds(i16* nocapture, i16, i16) nounwind {
  %4 = add i16 %2, %1
  store i16 %4, i16* %0, align 2
  %5 = icmp ugt i16 %1, %2
  %6 = select i1 %5, i16 %1, i16 %2
  %7 = icmp ult i16 %4, %6
  ret i1 %7
}

define i1 @uadd(i32* nocapture, i32, i32) nounwind {
  %4 = add i32 %2, %1
  store i32 %4, i32* %0, align 4
  %5 = icmp ugt i32 %1, %2
  %6 = select i1 %5, i32 %1, i32 %2
  %7 = icmp ult i32 %4, %6
  ret i1 %7
}

define i1 @uaddl(i64* nocapture, i64, i64) nounwind {
  %4 = add i64 %2, %1
  store i64 %4, i64* %0, align 8
  %5 = icmp ugt i64 %1, %2
  %6 = select i1 %5, i64 %1, i64 %2
  %7 = icmp ult i64 %4, %6
  ret i1 %7
}

define zeroext i8 @klee_int8(i8* %name) nounwind uwtable sspreq {
  %ret = alloca i8, align 1
  call void @klee_make_symbolic(i8* %ret, i32 1, i8* %name) nounwind
  %1 = load i8* %ret, align 1
  ret i8 %1
}

declare void @klee_make_symbolic(i8*, i32, i8*)

define zeroext i16 @klee_int16(i8* %name) nounwind uwtable sspreq {
  %ret = alloca i16, align 2
  %1 = bitcast i16* %ret to i8*
  call void @klee_make_symbolic(i8* %1, i32 2, i8* %name) nounwind
  %2 = load i16* %ret, align 2
  ret i16 %2
}

define i32 @klee_int32(i8* %name) nounwind uwtable sspreq {
  %ret = alloca i32, align 4
  %1 = bitcast i32* %ret to i8*
  call void @klee_make_symbolic(i8* %1, i32 4, i8* %name) nounwind
  %2 = load i32* %ret, align 4
  ret i32 %2
}

define void @uint32_to_string(i32 %n, i8* nocapture %str) nounwind uwtable sspreq {
  %1 = lshr i32 %n, 28
  %2 = zext i32 %1 to i64
  %3 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %2
  %4 = load i8* %3, align 1
  store i8 %4, i8* %str, align 1
  %5 = lshr i32 %n, 24
  %6 = and i32 %5, 15
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = getelementptr inbounds i8* %str, i64 1
  store i8 %9, i8* %10, align 1
  %11 = lshr i32 %n, 20
  %12 = and i32 %11, 15
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %13
  %15 = load i8* %14, align 1
  %16 = getelementptr inbounds i8* %str, i64 2
  store i8 %15, i8* %16, align 1
  %17 = lshr i32 %n, 16
  %18 = and i32 %17, 15
  %19 = zext i32 %18 to i64
  %20 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %19
  %21 = load i8* %20, align 1
  %22 = getelementptr inbounds i8* %str, i64 3
  store i8 %21, i8* %22, align 1
  %23 = lshr i32 %n, 12
  %24 = and i32 %23, 15
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %25
  %27 = load i8* %26, align 1
  %28 = getelementptr inbounds i8* %str, i64 4
  store i8 %27, i8* %28, align 1
  %29 = lshr i32 %n, 8
  %30 = and i32 %29, 15
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %31
  %33 = load i8* %32, align 1
  %34 = getelementptr inbounds i8* %str, i64 5
  store i8 %33, i8* %34, align 1
  %35 = lshr i32 %n, 4
  %36 = and i32 %35, 15
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %37
  %39 = load i8* %38, align 1
  %40 = getelementptr inbounds i8* %str, i64 6
  store i8 %39, i8* %40, align 1
  %41 = and i32 %n, 15
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %42
  %44 = load i8* %43, align 1
  %45 = getelementptr inbounds i8* %str, i64 7
  store i8 %44, i8* %45, align 1
  ret void
}

define void @trace_port(i8* nocapture %buf, i8* nocapture %prefix, i32 %port, i32 %pc) nounwind uwtable sspreq {
  %1 = load i8* %prefix, align 1
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %0
  %3 = phi i8 [ %6, %.lr.ph ], [ %1, %0 ]
  %.03 = phi i8* [ %4, %.lr.ph ], [ %buf, %0 ]
  %.012 = phi i8* [ %5, %.lr.ph ], [ %prefix, %0 ]
  store i8 %3, i8* %.03, align 1
  %4 = getelementptr inbounds i8* %.03, i64 1
  %5 = getelementptr inbounds i8* %.012, i64 1
  %6 = load i8* %5, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph, %0
  %.0.lcssa = phi i8* [ %buf, %0 ], [ %4, %.lr.ph ]
  %8 = lshr i32 %port, 28
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %9
  %11 = load i8* %10, align 1
  store i8 %11, i8* %.0.lcssa, align 1
  %12 = lshr i32 %port, 24
  %13 = and i32 %12, 15
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %14
  %16 = load i8* %15, align 1
  %17 = getelementptr inbounds i8* %.0.lcssa, i64 1
  store i8 %16, i8* %17, align 1
  %18 = lshr i32 %port, 20
  %19 = and i32 %18, 15
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %20
  %22 = load i8* %21, align 1
  %23 = getelementptr inbounds i8* %.0.lcssa, i64 2
  store i8 %22, i8* %23, align 1
  %24 = lshr i32 %port, 16
  %25 = and i32 %24, 15
  %26 = zext i32 %25 to i64
  %27 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %26
  %28 = load i8* %27, align 1
  %29 = getelementptr inbounds i8* %.0.lcssa, i64 3
  store i8 %28, i8* %29, align 1
  %30 = lshr i32 %port, 12
  %31 = and i32 %30, 15
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %32
  %34 = load i8* %33, align 1
  %35 = getelementptr inbounds i8* %.0.lcssa, i64 4
  store i8 %34, i8* %35, align 1
  %36 = lshr i32 %port, 8
  %37 = and i32 %36, 15
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %38
  %40 = load i8* %39, align 1
  %41 = getelementptr inbounds i8* %.0.lcssa, i64 5
  store i8 %40, i8* %41, align 1
  %42 = lshr i32 %port, 4
  %43 = and i32 %42, 15
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %44
  %46 = load i8* %45, align 1
  %47 = getelementptr inbounds i8* %.0.lcssa, i64 6
  store i8 %46, i8* %47, align 1
  %48 = and i32 %port, 15
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %49
  %51 = load i8* %50, align 1
  %52 = getelementptr inbounds i8* %.0.lcssa, i64 7
  store i8 %51, i8* %52, align 1
  %53 = getelementptr inbounds i8* %.0.lcssa, i64 8
  store i8 95, i8* %53, align 1
  %54 = getelementptr inbounds i8* %.0.lcssa, i64 9
  %55 = lshr i32 %pc, 28
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %56
  %58 = load i8* %57, align 1
  store i8 %58, i8* %54, align 1
  %59 = lshr i32 %pc, 24
  %60 = and i32 %59, 15
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %61
  %63 = load i8* %62, align 1
  %64 = getelementptr inbounds i8* %.0.lcssa, i64 10
  store i8 %63, i8* %64, align 1
  %65 = lshr i32 %pc, 20
  %66 = and i32 %65, 15
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %67
  %69 = load i8* %68, align 1
  %70 = getelementptr inbounds i8* %.0.lcssa, i64 11
  store i8 %69, i8* %70, align 1
  %71 = lshr i32 %pc, 16
  %72 = and i32 %71, 15
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %73
  %75 = load i8* %74, align 1
  %76 = getelementptr inbounds i8* %.0.lcssa, i64 12
  store i8 %75, i8* %76, align 1
  %77 = lshr i32 %pc, 12
  %78 = and i32 %77, 15
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %79
  %81 = load i8* %80, align 1
  %82 = getelementptr inbounds i8* %.0.lcssa, i64 13
  store i8 %81, i8* %82, align 1
  %83 = lshr i32 %pc, 8
  %84 = and i32 %83, 15
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %85
  %87 = load i8* %86, align 1
  %88 = getelementptr inbounds i8* %.0.lcssa, i64 14
  store i8 %87, i8* %88, align 1
  %89 = lshr i32 %pc, 4
  %90 = and i32 %89, 15
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %91
  %93 = load i8* %92, align 1
  %94 = getelementptr inbounds i8* %.0.lcssa, i64 15
  store i8 %93, i8* %94, align 1
  %95 = and i32 %pc, 15
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds [16 x i8]* @hextable, i64 0, i64 %96
  %98 = load i8* %97, align 1
  %99 = getelementptr inbounds i8* %.0.lcssa, i64 16
  store i8 %98, i8* %99, align 1
  %100 = getelementptr inbounds i8* %.0.lcssa, i64 17
  store i8 0, i8* %100, align 1
  ret void
}

define void @helper_write_eflags(i32 %t0, i32 %update_mask) nounwind uwtable sspreq {
  %1 = and i32 %t0, 2261
  %2 = load %struct.CPUX86State** @env, align 8
  %3 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 1
  store i32 %1, i32* %3, align 4
  %4 = lshr i32 %t0, 9
  %5 = and i32 %4, 2
  %6 = xor i32 %5, 2
  %7 = add i32 %6, -1
  %8 = load %struct.CPUX86State** @env, align 8
  %9 = getelementptr inbounds %struct.CPUX86State* %8, i64 0, i32 5
  store i32 %7, i32* %9, align 4
  %10 = load %struct.CPUX86State** @env, align 8
  %11 = getelementptr inbounds %struct.CPUX86State* %10, i64 0, i32 6
  %12 = load i32* %11, align 4
  %13 = xor i32 %update_mask, -1
  %14 = and i32 %12, %13
  %15 = and i32 %t0, -3286
  %16 = and i32 %15, %update_mask
  %17 = or i32 %14, %16
  store i32 %17, i32* %11, align 4
  ret void
}

define i32 @helper_read_eflags() nounwind uwtable readonly sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 5
  %6 = load i32* %5, align 4
  %7 = and i32 %6, 1024
  %8 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 6
  %9 = load i32* %8, align 4
  %10 = and i32 %9, -196609
  %11 = or i32 %7, %4
  %12 = or i32 %11, %10
  ret i32 %12
}

define i32 @helper_cc_compute_all(i32 %op) nounwind uwtable readonly sspreq {
  switch i32 %op, label %827 [
    i32 1, label %1
    i32 2, label %5
    i32 3, label %26
    i32 4, label %50
    i32 6, label %73
    i32 7, label %106
    i32 8, label %140
    i32 10, label %172
    i32 11, label %206
    i32 12, label %241
    i32 14, label %274
    i32 15, label %306
    i32 16, label %341
    i32 18, label %374
    i32 19, label %407
    i32 20, label %443
    i32 22, label %476
    i32 23, label %490
    i32 24, label %507
    i32 26, label %523
    i32 27, label %548
    i32 28, label %576
    i32 30, label %603
    i32 31, label %628
    i32 32, label %656
    i32 34, label %683
    i32 35, label %706
    i32 36, label %732
    i32 38, label %756
    i32 39, label %778
    i32 40, label %803
  ]

; <label>:1                                       ; preds = %0
  %2 = load %struct.CPUX86State** @env, align 8
  %3 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 1
  %4 = load i32* %3, align 4
  br label %827

; <label>:5                                       ; preds = %0
  %6 = load %struct.CPUX86State** @env, align 8
  %7 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 1
  %8 = load i32* %7, align 4
  %9 = icmp ne i32 %8, 0
  %10 = zext i1 %9 to i32
  %11 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 2
  %12 = load i32* %11, align 4
  %.mask.i7 = and i32 %12, 255
  %13 = zext i32 %.mask.i7 to i64
  %14 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %13
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = icmp eq i32 %.mask.i7, 0
  %18 = zext i1 %17 to i32
  %19 = shl nuw nsw i32 %18, 6
  %20 = and i32 %12, 128
  %21 = shl nuw nsw i32 %10, 11
  %22 = or i32 %10, %20
  %23 = or i32 %22, %21
  %24 = or i32 %23, %16
  %25 = or i32 %24, %19
  br label %827

; <label>:26                                      ; preds = %0
  %27 = load %struct.CPUX86State** @env, align 8
  %28 = getelementptr inbounds %struct.CPUX86State* %27, i64 0, i32 1
  %29 = load i32* %28, align 4
  %30 = icmp ne i32 %29, 0
  %31 = zext i1 %30 to i32
  %32 = getelementptr inbounds %struct.CPUX86State* %27, i64 0, i32 2
  %33 = load i32* %32, align 4
  %34 = zext i32 %33 to i64
  %35 = and i64 %34, 255
  %36 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = and i32 %33, 65535
  %40 = icmp eq i32 %39, 0
  %41 = zext i1 %40 to i32
  %42 = shl nuw nsw i32 %41, 6
  %43 = lshr i32 %33, 8
  %44 = and i32 %43, 128
  %45 = shl nuw nsw i32 %31, 11
  %46 = or i32 %45, %31
  %47 = or i32 %46, %44
  %48 = or i32 %47, %38
  %49 = or i32 %48, %42
  br label %827

; <label>:50                                      ; preds = %0
  %51 = load %struct.CPUX86State** @env, align 8
  %52 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 1
  %53 = load i32* %52, align 4
  %54 = icmp ne i32 %53, 0
  %55 = zext i1 %54 to i32
  %56 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 2
  %57 = load i32* %56, align 4
  %58 = zext i32 %57 to i64
  %59 = and i64 %58, 255
  %60 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %59
  %61 = load i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = icmp eq i32 %57, 0
  %64 = zext i1 %63 to i32
  %65 = shl nuw nsw i32 %64, 6
  %66 = lshr i32 %57, 24
  %67 = and i32 %66, 128
  %68 = shl nuw nsw i32 %55, 11
  %69 = or i32 %68, %55
  %70 = or i32 %69, %67
  %71 = or i32 %70, %62
  %72 = or i32 %71, %65
  br label %827

; <label>:73                                      ; preds = %0
  %74 = load %struct.CPUX86State** @env, align 8
  %75 = getelementptr inbounds %struct.CPUX86State* %74, i64 0, i32 1
  %76 = load i32* %75, align 4
  %77 = getelementptr inbounds %struct.CPUX86State* %74, i64 0, i32 2
  %78 = load i32* %77, align 4
  %79 = sub i32 %78, %76
  %80 = zext i32 %78 to i64
  %81 = and i32 %78, 255
  %82 = and i32 %76, 255
  %83 = icmp ult i32 %81, %82
  %84 = zext i1 %83 to i32
  %85 = and i64 %80, 255
  %86 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %85
  %87 = load i8* %86, align 1
  %88 = zext i8 %87 to i32
  %89 = xor i32 %78, %76
  %90 = xor i32 %89, %79
  %91 = and i32 %90, 16
  %92 = icmp eq i32 %81, 0
  %93 = zext i1 %92 to i32
  %94 = shl nuw nsw i32 %93, 6
  %95 = and i32 %78, 128
  %96 = xor i32 %76, 128
  %97 = xor i32 %96, %79
  %98 = and i32 %97, %89
  %99 = shl i32 %98, 4
  %100 = and i32 %99, 2048
  %101 = or i32 %88, %95
  %102 = or i32 %101, %91
  %103 = or i32 %102, %84
  %104 = or i32 %103, %94
  %105 = or i32 %104, %100
  br label %827

; <label>:106                                     ; preds = %0
  %107 = load %struct.CPUX86State** @env, align 8
  %108 = getelementptr inbounds %struct.CPUX86State* %107, i64 0, i32 1
  %109 = load i32* %108, align 4
  %110 = getelementptr inbounds %struct.CPUX86State* %107, i64 0, i32 2
  %111 = load i32* %110, align 4
  %112 = sub i32 %111, %109
  %113 = and i32 %111, 65535
  %114 = and i32 %109, 65535
  %115 = icmp ult i32 %113, %114
  %116 = zext i1 %115 to i32
  %117 = zext i32 %111 to i64
  %118 = and i64 %117, 255
  %119 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %118
  %120 = load i8* %119, align 1
  %121 = zext i8 %120 to i32
  %122 = xor i32 %111, %109
  %123 = xor i32 %122, %112
  %124 = and i32 %123, 16
  %125 = icmp eq i32 %113, 0
  %126 = zext i1 %125 to i32
  %127 = shl nuw nsw i32 %126, 6
  %128 = lshr i32 %111, 8
  %129 = and i32 %128, 128
  %130 = xor i32 %109, 32768
  %131 = xor i32 %130, %112
  %132 = and i32 %131, %122
  %133 = lshr i32 %132, 4
  %134 = and i32 %133, 2048
  %135 = or i32 %121, %129
  %136 = or i32 %135, %124
  %137 = or i32 %136, %116
  %138 = or i32 %137, %127
  %139 = or i32 %138, %134
  br label %827

; <label>:140                                     ; preds = %0
  %141 = load %struct.CPUX86State** @env, align 8
  %142 = getelementptr inbounds %struct.CPUX86State* %141, i64 0, i32 1
  %143 = load i32* %142, align 4
  %144 = getelementptr inbounds %struct.CPUX86State* %141, i64 0, i32 2
  %145 = load i32* %144, align 4
  %146 = sub i32 %145, %143
  %147 = icmp ult i32 %145, %143
  %148 = zext i1 %147 to i32
  %149 = zext i32 %145 to i64
  %150 = and i64 %149, 255
  %151 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %150
  %152 = load i8* %151, align 1
  %153 = zext i8 %152 to i32
  %154 = xor i32 %145, %143
  %155 = xor i32 %154, %146
  %156 = and i32 %155, 16
  %157 = icmp eq i32 %145, 0
  %158 = zext i1 %157 to i32
  %159 = shl nuw nsw i32 %158, 6
  %160 = lshr i32 %145, 24
  %161 = and i32 %160, 128
  %162 = xor i32 %143, -2147483648
  %163 = xor i32 %162, %146
  %164 = and i32 %163, %154
  %165 = lshr i32 %164, 20
  %166 = and i32 %165, 2048
  %167 = or i32 %148, %153
  %168 = or i32 %167, %161
  %169 = or i32 %168, %159
  %170 = or i32 %169, %156
  %171 = or i32 %170, %166
  br label %827

; <label>:172                                     ; preds = %0
  %173 = load %struct.CPUX86State** @env, align 8
  %174 = getelementptr inbounds %struct.CPUX86State* %173, i64 0, i32 1
  %175 = load i32* %174, align 4
  %176 = getelementptr inbounds %struct.CPUX86State* %173, i64 0, i32 2
  %177 = load i32* %176, align 4
  %178 = sub i32 %177, %175
  %179 = add i32 %178, -1
  %180 = zext i32 %177 to i64
  %181 = and i32 %177, 255
  %182 = and i32 %175, 255
  %183 = icmp ule i32 %181, %182
  %184 = zext i1 %183 to i32
  %185 = and i64 %180, 255
  %186 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %185
  %187 = load i8* %186, align 1
  %188 = zext i8 %187 to i32
  %189 = xor i32 %177, %175
  %190 = xor i32 %179, %189
  %191 = and i32 %190, 16
  %192 = icmp eq i32 %181, 0
  %193 = zext i1 %192 to i32
  %194 = shl nuw nsw i32 %193, 6
  %195 = and i32 %177, 128
  %196 = xor i32 %175, 128
  %197 = xor i32 %196, %179
  %198 = and i32 %197, %189
  %199 = shl i32 %198, 4
  %200 = and i32 %199, 2048
  %201 = or i32 %188, %195
  %202 = or i32 %201, %184
  %203 = or i32 %202, %194
  %204 = or i32 %203, %191
  %205 = or i32 %204, %200
  br label %827

; <label>:206                                     ; preds = %0
  %207 = load %struct.CPUX86State** @env, align 8
  %208 = getelementptr inbounds %struct.CPUX86State* %207, i64 0, i32 1
  %209 = load i32* %208, align 4
  %210 = getelementptr inbounds %struct.CPUX86State* %207, i64 0, i32 2
  %211 = load i32* %210, align 4
  %212 = sub i32 %211, %209
  %213 = add i32 %212, -1
  %214 = and i32 %211, 65535
  %215 = and i32 %209, 65535
  %216 = icmp ule i32 %214, %215
  %217 = zext i1 %216 to i32
  %218 = zext i32 %211 to i64
  %219 = and i64 %218, 255
  %220 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %219
  %221 = load i8* %220, align 1
  %222 = zext i8 %221 to i32
  %223 = xor i32 %211, %209
  %224 = xor i32 %213, %223
  %225 = and i32 %224, 16
  %226 = icmp eq i32 %214, 0
  %227 = zext i1 %226 to i32
  %228 = shl nuw nsw i32 %227, 6
  %229 = lshr i32 %211, 8
  %230 = and i32 %229, 128
  %231 = xor i32 %209, 32768
  %232 = xor i32 %231, %213
  %233 = and i32 %232, %223
  %234 = lshr i32 %233, 4
  %235 = and i32 %234, 2048
  %236 = or i32 %222, %230
  %237 = or i32 %236, %217
  %238 = or i32 %237, %228
  %239 = or i32 %238, %225
  %240 = or i32 %239, %235
  br label %827

; <label>:241                                     ; preds = %0
  %242 = load %struct.CPUX86State** @env, align 8
  %243 = getelementptr inbounds %struct.CPUX86State* %242, i64 0, i32 1
  %244 = load i32* %243, align 4
  %245 = getelementptr inbounds %struct.CPUX86State* %242, i64 0, i32 2
  %246 = load i32* %245, align 4
  %247 = sub i32 %246, %244
  %248 = add i32 %247, -1
  %249 = icmp ule i32 %246, %244
  %250 = zext i1 %249 to i32
  %251 = zext i32 %246 to i64
  %252 = and i64 %251, 255
  %253 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %252
  %254 = load i8* %253, align 1
  %255 = zext i8 %254 to i32
  %256 = xor i32 %246, %244
  %257 = xor i32 %248, %256
  %258 = and i32 %257, 16
  %259 = icmp eq i32 %246, 0
  %260 = zext i1 %259 to i32
  %261 = shl nuw nsw i32 %260, 6
  %262 = lshr i32 %246, 24
  %263 = and i32 %262, 128
  %264 = xor i32 %244, -2147483648
  %265 = xor i32 %264, %248
  %266 = and i32 %265, %256
  %267 = lshr i32 %266, 20
  %268 = and i32 %267, 2048
  %269 = or i32 %250, %255
  %270 = or i32 %269, %263
  %271 = or i32 %270, %261
  %272 = or i32 %271, %258
  %273 = or i32 %272, %268
  br label %827

; <label>:274                                     ; preds = %0
  %275 = load %struct.CPUX86State** @env, align 8
  %276 = getelementptr inbounds %struct.CPUX86State* %275, i64 0, i32 2
  %277 = load i32* %276, align 4
  %278 = getelementptr inbounds %struct.CPUX86State* %275, i64 0, i32 1
  %279 = load i32* %278, align 4
  %280 = add i32 %279, %277
  %281 = and i32 %280, 255
  %282 = and i32 %279, 255
  %283 = icmp ult i32 %281, %282
  %284 = zext i1 %283 to i32
  %.mask.i6 = and i32 %277, 255
  %285 = zext i32 %.mask.i6 to i64
  %286 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %285
  %287 = load i8* %286, align 1
  %288 = zext i8 %287 to i32
  %289 = xor i32 %279, %277
  %290 = xor i32 %289, %280
  %291 = and i32 %290, 16
  %292 = icmp eq i32 %.mask.i6, 0
  %293 = zext i1 %292 to i32
  %294 = shl nuw nsw i32 %293, 6
  %295 = and i32 %277, 128
  %296 = xor i32 %280, %279
  %297 = xor i32 %280, %277
  %298 = and i32 %296, %297
  %299 = shl i32 %298, 4
  %300 = and i32 %299, 2048
  %301 = or i32 %288, %295
  %302 = or i32 %301, %294
  %303 = or i32 %302, %291
  %304 = or i32 %303, %284
  %305 = or i32 %304, %300
  br label %827

; <label>:306                                     ; preds = %0
  %307 = load %struct.CPUX86State** @env, align 8
  %308 = getelementptr inbounds %struct.CPUX86State* %307, i64 0, i32 2
  %309 = load i32* %308, align 4
  %310 = getelementptr inbounds %struct.CPUX86State* %307, i64 0, i32 1
  %311 = load i32* %310, align 4
  %312 = add i32 %311, %309
  %313 = and i32 %312, 65535
  %314 = and i32 %311, 65535
  %315 = icmp ult i32 %313, %314
  %316 = zext i1 %315 to i32
  %317 = zext i32 %309 to i64
  %318 = and i64 %317, 255
  %319 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %318
  %320 = load i8* %319, align 1
  %321 = zext i8 %320 to i32
  %322 = xor i32 %311, %309
  %323 = xor i32 %322, %312
  %324 = and i32 %323, 16
  %325 = and i32 %309, 65535
  %326 = icmp eq i32 %325, 0
  %327 = zext i1 %326 to i32
  %328 = shl nuw nsw i32 %327, 6
  %329 = lshr i32 %309, 8
  %330 = and i32 %329, 128
  %331 = xor i32 %312, %311
  %332 = xor i32 %312, %309
  %333 = and i32 %331, %332
  %334 = lshr i32 %333, 4
  %335 = and i32 %334, 2048
  %336 = or i32 %321, %330
  %337 = or i32 %336, %328
  %338 = or i32 %337, %324
  %339 = or i32 %338, %316
  %340 = or i32 %339, %335
  br label %827

; <label>:341                                     ; preds = %0
  %342 = load %struct.CPUX86State** @env, align 8
  %343 = getelementptr inbounds %struct.CPUX86State* %342, i64 0, i32 2
  %344 = load i32* %343, align 4
  %345 = getelementptr inbounds %struct.CPUX86State* %342, i64 0, i32 1
  %346 = load i32* %345, align 4
  %347 = alloca i32, align 4
  %348 = call i1 @uadd(i32* %347, i32 %344, i32 %346)
  %349 = load i32* %347, align 4
  %350 = zext i1 %348 to i32
  %351 = zext i32 %344 to i64
  %352 = and i64 %351, 255
  %353 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %352
  %354 = load i8* %353, align 1
  %355 = zext i8 %354 to i32
  %356 = xor i32 %346, %344
  %357 = xor i32 %356, %349
  %358 = and i32 %357, 16
  %359 = icmp eq i32 %344, 0
  %360 = zext i1 %359 to i32
  %361 = shl nuw nsw i32 %360, 6
  %362 = lshr i32 %344, 24
  %363 = and i32 %362, 128
  %364 = xor i32 %349, %346
  %365 = xor i32 %349, %344
  %366 = and i32 %364, %365
  %367 = lshr i32 %366, 20
  %368 = and i32 %367, 2048
  %369 = or i32 %361, %363
  %370 = or i32 %369, %355
  %371 = or i32 %370, %350
  %372 = or i32 %371, %358
  %373 = or i32 %372, %368
  br label %827

; <label>:374                                     ; preds = %0
  %375 = load %struct.CPUX86State** @env, align 8
  %376 = getelementptr inbounds %struct.CPUX86State* %375, i64 0, i32 2
  %377 = load i32* %376, align 4
  %378 = getelementptr inbounds %struct.CPUX86State* %375, i64 0, i32 1
  %379 = load i32* %378, align 4
  %380 = add i32 %377, 1
  %381 = add i32 %380, %379
  %382 = and i32 %381, 255
  %383 = and i32 %379, 255
  %384 = icmp ule i32 %382, %383
  %385 = zext i1 %384 to i32
  %.mask.i5 = and i32 %377, 255
  %386 = zext i32 %.mask.i5 to i64
  %387 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %386
  %388 = load i8* %387, align 1
  %389 = zext i8 %388 to i32
  %390 = xor i32 %379, %377
  %391 = xor i32 %390, %381
  %392 = and i32 %391, 16
  %393 = icmp eq i32 %.mask.i5, 0
  %394 = zext i1 %393 to i32
  %395 = shl nuw nsw i32 %394, 6
  %396 = and i32 %377, 128
  %397 = xor i32 %381, %379
  %398 = xor i32 %381, %377
  %399 = and i32 %397, %398
  %400 = shl i32 %399, 4
  %401 = and i32 %400, 2048
  %402 = or i32 %389, %396
  %403 = or i32 %402, %395
  %404 = or i32 %403, %392
  %405 = or i32 %404, %385
  %406 = or i32 %405, %401
  br label %827

; <label>:407                                     ; preds = %0
  %408 = load %struct.CPUX86State** @env, align 8
  %409 = getelementptr inbounds %struct.CPUX86State* %408, i64 0, i32 2
  %410 = load i32* %409, align 4
  %411 = getelementptr inbounds %struct.CPUX86State* %408, i64 0, i32 1
  %412 = load i32* %411, align 4
  %413 = add i32 %410, 1
  %414 = add i32 %413, %412
  %415 = and i32 %414, 65535
  %416 = and i32 %412, 65535
  %417 = icmp ule i32 %415, %416
  %418 = zext i1 %417 to i32
  %419 = zext i32 %410 to i64
  %420 = and i64 %419, 255
  %421 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %420
  %422 = load i8* %421, align 1
  %423 = zext i8 %422 to i32
  %424 = xor i32 %412, %410
  %425 = xor i32 %424, %414
  %426 = and i32 %425, 16
  %427 = and i32 %410, 65535
  %428 = icmp eq i32 %427, 0
  %429 = zext i1 %428 to i32
  %430 = shl nuw nsw i32 %429, 6
  %431 = lshr i32 %410, 8
  %432 = and i32 %431, 128
  %433 = xor i32 %414, %412
  %434 = xor i32 %414, %410
  %435 = and i32 %433, %434
  %436 = lshr i32 %435, 4
  %437 = and i32 %436, 2048
  %438 = or i32 %423, %432
  %439 = or i32 %438, %430
  %440 = or i32 %439, %426
  %441 = or i32 %440, %418
  %442 = or i32 %441, %437
  br label %827

; <label>:443                                     ; preds = %0
  %444 = load %struct.CPUX86State** @env, align 8
  %445 = getelementptr inbounds %struct.CPUX86State* %444, i64 0, i32 2
  %446 = load i32* %445, align 4
  %447 = getelementptr inbounds %struct.CPUX86State* %444, i64 0, i32 1
  %448 = load i32* %447, align 4
  %449 = add i32 %446, 1
  %450 = add i32 %449, %448
  %451 = icmp ule i32 %450, %448
  %452 = zext i1 %451 to i32
  %453 = zext i32 %446 to i64
  %454 = and i64 %453, 255
  %455 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %454
  %456 = load i8* %455, align 1
  %457 = zext i8 %456 to i32
  %458 = xor i32 %448, %446
  %459 = xor i32 %458, %450
  %460 = and i32 %459, 16
  %461 = icmp eq i32 %446, 0
  %462 = zext i1 %461 to i32
  %463 = shl nuw nsw i32 %462, 6
  %464 = lshr i32 %446, 24
  %465 = and i32 %464, 128
  %466 = xor i32 %450, %448
  %467 = xor i32 %450, %446
  %468 = and i32 %466, %467
  %469 = lshr i32 %468, 20
  %470 = and i32 %469, 2048
  %471 = or i32 %463, %465
  %472 = or i32 %471, %457
  %473 = or i32 %472, %460
  %474 = or i32 %473, %452
  %475 = or i32 %474, %470
  br label %827

; <label>:476                                     ; preds = %0
  %477 = load %struct.CPUX86State** @env, align 8
  %478 = getelementptr inbounds %struct.CPUX86State* %477, i64 0, i32 2
  %479 = load i32* %478, align 4
  %.mask.i4 = and i32 %479, 255
  %480 = zext i32 %.mask.i4 to i64
  %481 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %480
  %482 = load i8* %481, align 1
  %483 = zext i8 %482 to i32
  %484 = icmp eq i32 %.mask.i4, 0
  %485 = zext i1 %484 to i32
  %486 = shl nuw nsw i32 %485, 6
  %487 = and i32 %479, 128
  %488 = or i32 %483, %487
  %489 = or i32 %488, %486
  br label %827

; <label>:490                                     ; preds = %0
  %491 = load %struct.CPUX86State** @env, align 8
  %492 = getelementptr inbounds %struct.CPUX86State* %491, i64 0, i32 2
  %493 = load i32* %492, align 4
  %494 = zext i32 %493 to i64
  %495 = and i64 %494, 255
  %496 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %495
  %497 = load i8* %496, align 1
  %498 = zext i8 %497 to i32
  %499 = and i32 %493, 65535
  %500 = icmp eq i32 %499, 0
  %501 = zext i1 %500 to i32
  %502 = shl nuw nsw i32 %501, 6
  %503 = lshr i32 %493, 8
  %504 = and i32 %503, 128
  %505 = or i32 %498, %504
  %506 = or i32 %505, %502
  br label %827

; <label>:507                                     ; preds = %0
  %508 = load %struct.CPUX86State** @env, align 8
  %509 = getelementptr inbounds %struct.CPUX86State* %508, i64 0, i32 2
  %510 = load i32* %509, align 4
  %511 = zext i32 %510 to i64
  %512 = and i64 %511, 255
  %513 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %512
  %514 = load i8* %513, align 1
  %515 = zext i8 %514 to i32
  %516 = icmp eq i32 %510, 0
  %517 = zext i1 %516 to i32
  %518 = shl nuw nsw i32 %517, 6
  %519 = lshr i32 %510, 24
  %520 = and i32 %519, 128
  %521 = or i32 %515, %520
  %522 = or i32 %521, %518
  br label %827

; <label>:523                                     ; preds = %0
  %524 = load %struct.CPUX86State** @env, align 8
  %525 = getelementptr inbounds %struct.CPUX86State* %524, i64 0, i32 2
  %526 = load i32* %525, align 4
  %527 = add i32 %526, 31
  %528 = getelementptr inbounds %struct.CPUX86State* %524, i64 0, i32 1
  %529 = load i32* %528, align 4
  %.mask.i3 = and i32 %526, 255
  %530 = zext i32 %.mask.i3 to i64
  %531 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %530
  %532 = load i8* %531, align 1
  %533 = zext i8 %532 to i32
  %534 = xor i32 %527, %526
  %535 = and i32 %534, 16
  %536 = icmp eq i32 %.mask.i3, 0
  %537 = zext i1 %536 to i32
  %538 = shl nuw nsw i32 %537, 6
  %539 = and i32 %526, 128
  %540 = icmp eq i32 %.mask.i3, 128
  %541 = zext i1 %540 to i32
  %542 = shl nuw nsw i32 %541, 11
  %543 = or i32 %529, %539
  %544 = or i32 %543, %535
  %545 = or i32 %544, %533
  %546 = or i32 %545, %542
  %547 = or i32 %546, %538
  br label %827

; <label>:548                                     ; preds = %0
  %549 = load %struct.CPUX86State** @env, align 8
  %550 = getelementptr inbounds %struct.CPUX86State* %549, i64 0, i32 2
  %551 = load i32* %550, align 4
  %552 = add i32 %551, 31
  %553 = getelementptr inbounds %struct.CPUX86State* %549, i64 0, i32 1
  %554 = load i32* %553, align 4
  %555 = zext i32 %551 to i64
  %556 = and i64 %555, 255
  %557 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %556
  %558 = load i8* %557, align 1
  %559 = zext i8 %558 to i32
  %560 = xor i32 %552, %551
  %561 = and i32 %560, 16
  %562 = and i32 %551, 65535
  %563 = icmp eq i32 %562, 0
  %564 = zext i1 %563 to i32
  %565 = shl nuw nsw i32 %564, 6
  %566 = lshr i32 %551, 8
  %567 = and i32 %566, 128
  %568 = icmp eq i32 %562, 32768
  %569 = zext i1 %568 to i32
  %570 = shl nuw nsw i32 %569, 11
  %571 = or i32 %567, %554
  %572 = or i32 %571, %561
  %573 = or i32 %572, %559
  %574 = or i32 %573, %570
  %575 = or i32 %574, %565
  br label %827

; <label>:576                                     ; preds = %0
  %577 = load %struct.CPUX86State** @env, align 8
  %578 = getelementptr inbounds %struct.CPUX86State* %577, i64 0, i32 2
  %579 = load i32* %578, align 4
  %580 = add i32 %579, 31
  %581 = getelementptr inbounds %struct.CPUX86State* %577, i64 0, i32 1
  %582 = load i32* %581, align 4
  %583 = zext i32 %579 to i64
  %584 = and i64 %583, 255
  %585 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %584
  %586 = load i8* %585, align 1
  %587 = zext i8 %586 to i32
  %588 = xor i32 %580, %579
  %589 = and i32 %588, 16
  %590 = icmp eq i32 %579, 0
  %591 = zext i1 %590 to i32
  %592 = shl nuw nsw i32 %591, 6
  %593 = lshr i32 %579, 24
  %594 = and i32 %593, 128
  %595 = icmp eq i32 %579, -2147483648
  %596 = zext i1 %595 to i32
  %597 = shl nuw nsw i32 %596, 11
  %598 = or i32 %594, %582
  %599 = or i32 %598, %597
  %600 = or i32 %599, %592
  %601 = or i32 %600, %589
  %602 = or i32 %601, %587
  br label %827

; <label>:603                                     ; preds = %0
  %604 = load %struct.CPUX86State** @env, align 8
  %605 = getelementptr inbounds %struct.CPUX86State* %604, i64 0, i32 2
  %606 = load i32* %605, align 4
  %607 = add i32 %606, 1
  %608 = getelementptr inbounds %struct.CPUX86State* %604, i64 0, i32 1
  %609 = load i32* %608, align 4
  %.mask.i2 = and i32 %606, 255
  %610 = zext i32 %.mask.i2 to i64
  %611 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %610
  %612 = load i8* %611, align 1
  %613 = zext i8 %612 to i32
  %614 = xor i32 %607, %606
  %615 = and i32 %614, 16
  %616 = icmp eq i32 %.mask.i2, 0
  %617 = zext i1 %616 to i32
  %618 = shl nuw nsw i32 %617, 6
  %619 = and i32 %606, 128
  %620 = icmp eq i32 %.mask.i2, 127
  %621 = zext i1 %620 to i32
  %622 = shl nuw nsw i32 %621, 11
  %623 = or i32 %609, %619
  %624 = or i32 %623, %615
  %625 = or i32 %624, %613
  %626 = or i32 %625, %622
  %627 = or i32 %626, %618
  br label %827

; <label>:628                                     ; preds = %0
  %629 = load %struct.CPUX86State** @env, align 8
  %630 = getelementptr inbounds %struct.CPUX86State* %629, i64 0, i32 2
  %631 = load i32* %630, align 4
  %632 = add i32 %631, 1
  %633 = getelementptr inbounds %struct.CPUX86State* %629, i64 0, i32 1
  %634 = load i32* %633, align 4
  %635 = zext i32 %631 to i64
  %636 = and i64 %635, 255
  %637 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %636
  %638 = load i8* %637, align 1
  %639 = zext i8 %638 to i32
  %640 = xor i32 %632, %631
  %641 = and i32 %640, 16
  %642 = and i32 %631, 65535
  %643 = icmp eq i32 %642, 0
  %644 = zext i1 %643 to i32
  %645 = shl nuw nsw i32 %644, 6
  %646 = lshr i32 %631, 8
  %647 = and i32 %646, 128
  %648 = icmp eq i32 %642, 32767
  %649 = zext i1 %648 to i32
  %650 = shl nuw nsw i32 %649, 11
  %651 = or i32 %647, %634
  %652 = or i32 %651, %641
  %653 = or i32 %652, %639
  %654 = or i32 %653, %650
  %655 = or i32 %654, %645
  br label %827

; <label>:656                                     ; preds = %0
  %657 = load %struct.CPUX86State** @env, align 8
  %658 = getelementptr inbounds %struct.CPUX86State* %657, i64 0, i32 2
  %659 = load i32* %658, align 4
  %660 = add i32 %659, 1
  %661 = getelementptr inbounds %struct.CPUX86State* %657, i64 0, i32 1
  %662 = load i32* %661, align 4
  %663 = zext i32 %659 to i64
  %664 = and i64 %663, 255
  %665 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %664
  %666 = load i8* %665, align 1
  %667 = zext i8 %666 to i32
  %668 = xor i32 %660, %659
  %669 = and i32 %668, 16
  %670 = icmp eq i32 %659, 0
  %671 = zext i1 %670 to i32
  %672 = shl nuw nsw i32 %671, 6
  %673 = lshr i32 %659, 24
  %674 = and i32 %673, 128
  %675 = icmp eq i32 %659, 2147483647
  %676 = zext i1 %675 to i32
  %677 = shl nuw nsw i32 %676, 11
  %678 = or i32 %674, %662
  %679 = or i32 %678, %677
  %680 = or i32 %679, %672
  %681 = or i32 %680, %669
  %682 = or i32 %681, %667
  br label %827

; <label>:683                                     ; preds = %0
  %684 = load %struct.CPUX86State** @env, align 8
  %685 = getelementptr inbounds %struct.CPUX86State* %684, i64 0, i32 1
  %686 = load i32* %685, align 4
  %687 = lshr i32 %686, 7
  %688 = and i32 %687, 1
  %689 = getelementptr inbounds %struct.CPUX86State* %684, i64 0, i32 2
  %690 = load i32* %689, align 4
  %.mask.i1 = and i32 %690, 255
  %691 = zext i32 %.mask.i1 to i64
  %692 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %691
  %693 = load i8* %692, align 1
  %694 = zext i8 %693 to i32
  %695 = icmp eq i32 %.mask.i1, 0
  %696 = zext i1 %695 to i32
  %697 = shl nuw nsw i32 %696, 6
  %698 = and i32 %690, 128
  %699 = xor i32 %690, %686
  %700 = shl i32 %699, 4
  %701 = and i32 %700, 2048
  %702 = or i32 %688, %698
  %703 = or i32 %702, %694
  %704 = or i32 %703, %701
  %705 = or i32 %704, %697
  br label %827

; <label>:706                                     ; preds = %0
  %707 = load %struct.CPUX86State** @env, align 8
  %708 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 1
  %709 = load i32* %708, align 4
  %710 = lshr i32 %709, 15
  %711 = and i32 %710, 1
  %712 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 2
  %713 = load i32* %712, align 4
  %714 = zext i32 %713 to i64
  %715 = and i64 %714, 255
  %716 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %715
  %717 = load i8* %716, align 1
  %718 = zext i8 %717 to i32
  %719 = and i32 %713, 65535
  %720 = icmp eq i32 %719, 0
  %721 = zext i1 %720 to i32
  %722 = shl nuw nsw i32 %721, 6
  %723 = lshr i32 %713, 8
  %724 = and i32 %723, 128
  %725 = xor i32 %713, %709
  %726 = lshr i32 %725, 4
  %727 = and i32 %726, 2048
  %728 = or i32 %724, %711
  %729 = or i32 %728, %718
  %730 = or i32 %729, %727
  %731 = or i32 %730, %722
  br label %827

; <label>:732                                     ; preds = %0
  %733 = load %struct.CPUX86State** @env, align 8
  %734 = getelementptr inbounds %struct.CPUX86State* %733, i64 0, i32 1
  %735 = load i32* %734, align 4
  %736 = lshr i32 %735, 31
  %737 = getelementptr inbounds %struct.CPUX86State* %733, i64 0, i32 2
  %738 = load i32* %737, align 4
  %739 = zext i32 %738 to i64
  %740 = and i64 %739, 255
  %741 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %740
  %742 = load i8* %741, align 1
  %743 = zext i8 %742 to i32
  %744 = icmp eq i32 %738, 0
  %745 = zext i1 %744 to i32
  %746 = shl nuw nsw i32 %745, 6
  %747 = lshr i32 %738, 24
  %748 = and i32 %747, 128
  %749 = xor i32 %738, %735
  %750 = lshr i32 %749, 20
  %751 = and i32 %750, 2048
  %752 = or i32 %748, %736
  %753 = or i32 %752, %743
  %754 = or i32 %753, %751
  %755 = or i32 %754, %746
  br label %827

; <label>:756                                     ; preds = %0
  %757 = load %struct.CPUX86State** @env, align 8
  %758 = getelementptr inbounds %struct.CPUX86State* %757, i64 0, i32 1
  %759 = load i32* %758, align 4
  %760 = and i32 %759, 1
  %761 = getelementptr inbounds %struct.CPUX86State* %757, i64 0, i32 2
  %762 = load i32* %761, align 4
  %.mask.i = and i32 %762, 255
  %763 = zext i32 %.mask.i to i64
  %764 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %763
  %765 = load i8* %764, align 1
  %766 = zext i8 %765 to i32
  %767 = icmp eq i32 %.mask.i, 0
  %768 = zext i1 %767 to i32
  %769 = shl nuw nsw i32 %768, 6
  %770 = and i32 %762, 128
  %771 = xor i32 %762, %759
  %772 = shl i32 %771, 4
  %773 = and i32 %772, 2048
  %774 = or i32 %770, %760
  %775 = or i32 %774, %766
  %776 = or i32 %775, %773
  %777 = or i32 %776, %769
  br label %827

; <label>:778                                     ; preds = %0
  %779 = load %struct.CPUX86State** @env, align 8
  %780 = getelementptr inbounds %struct.CPUX86State* %779, i64 0, i32 1
  %781 = load i32* %780, align 4
  %782 = and i32 %781, 1
  %783 = getelementptr inbounds %struct.CPUX86State* %779, i64 0, i32 2
  %784 = load i32* %783, align 4
  %785 = zext i32 %784 to i64
  %786 = and i64 %785, 255
  %787 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %786
  %788 = load i8* %787, align 1
  %789 = zext i8 %788 to i32
  %790 = and i32 %784, 65535
  %791 = icmp eq i32 %790, 0
  %792 = zext i1 %791 to i32
  %793 = shl nuw nsw i32 %792, 6
  %794 = lshr i32 %784, 8
  %795 = and i32 %794, 128
  %796 = xor i32 %784, %781
  %797 = lshr i32 %796, 4
  %798 = and i32 %797, 2048
  %799 = or i32 %795, %782
  %800 = or i32 %799, %789
  %801 = or i32 %800, %798
  %802 = or i32 %801, %793
  br label %827

; <label>:803                                     ; preds = %0
  %804 = load %struct.CPUX86State** @env, align 8
  %805 = getelementptr inbounds %struct.CPUX86State* %804, i64 0, i32 1
  %806 = load i32* %805, align 4
  %807 = and i32 %806, 1
  %808 = getelementptr inbounds %struct.CPUX86State* %804, i64 0, i32 2
  %809 = load i32* %808, align 4
  %810 = zext i32 %809 to i64
  %811 = and i64 %810, 255
  %812 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %811
  %813 = load i8* %812, align 1
  %814 = zext i8 %813 to i32
  %815 = icmp eq i32 %809, 0
  %816 = zext i1 %815 to i32
  %817 = shl nuw nsw i32 %816, 6
  %818 = lshr i32 %809, 24
  %819 = and i32 %818, 128
  %820 = xor i32 %809, %806
  %821 = lshr i32 %820, 20
  %822 = and i32 %821, 2048
  %823 = or i32 %819, %807
  %824 = or i32 %823, %814
  %825 = or i32 %824, %822
  %826 = or i32 %825, %817
  br label %827

; <label>:827                                     ; preds = %803, %778, %756, %732, %706, %683, %656, %628, %603, %576, %548, %523, %507, %490, %476, %443, %407, %374, %341, %306, %274, %241, %206, %172, %140, %106, %73, %50, %26, %5, %1, %0
  %.0 = phi i32 [ %826, %803 ], [ %802, %778 ], [ %777, %756 ], [ %755, %732 ], [ %731, %706 ], [ %705, %683 ], [ %682, %656 ], [ %655, %628 ], [ %627, %603 ], [ %602, %576 ], [ %575, %548 ], [ %547, %523 ], [ %522, %507 ], [ %506, %490 ], [ %489, %476 ]
  ret i32 %.0
}

define void @helper_check_iob(i32 %t0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 11, i32 3
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 36608
  %5 = icmp eq i32 %4, 35072
  br i1 %5, label %6, label %31

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 11, i32 2
  %8 = load i32* %7, align 4
  %9 = icmp ult i32 %8, 103
  br i1 %9, label %31, label %10

; <label>:10                                      ; preds = %6
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 11, i32 1
  %12 = load i32* %11, align 4
  %13 = add i32 %12, 102
  %14 = tail call fastcc i32 @lduw_kernel(i32 %13) nounwind
  %15 = ashr i32 %t0, 3
  %16 = add nsw i32 %14, %15
  %17 = add nsw i32 %16, 1
  %18 = load %struct.CPUX86State** @env, align 8
  %19 = getelementptr inbounds %struct.CPUX86State* %18, i64 0, i32 11, i32 2
  %20 = load i32* %19, align 4
  %21 = icmp ugt i32 %17, %20
  br i1 %21, label %31, label %22

; <label>:22                                      ; preds = %10
  %23 = getelementptr inbounds %struct.CPUX86State* %18, i64 0, i32 11, i32 1
  %24 = load i32* %23, align 4
  %25 = add i32 %24, %16
  %26 = tail call fastcc i32 @lduw_kernel(i32 %25) nounwind
  %27 = and i32 %t0, 7
  %28 = shl i32 1, %27
  %29 = and i32 %26, %28
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %check_io.exit, label %31

; <label>:31                                      ; preds = %22, %10, %6, %0
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn nounwind
  unreachable

check_io.exit:                                    ; preds = %22
  ret void
}

define void @helper_check_iow(i32 %t0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 11, i32 3
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 36608
  %5 = icmp eq i32 %4, 35072
  br i1 %5, label %6, label %31

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 11, i32 2
  %8 = load i32* %7, align 4
  %9 = icmp ult i32 %8, 103
  br i1 %9, label %31, label %10

; <label>:10                                      ; preds = %6
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 11, i32 1
  %12 = load i32* %11, align 4
  %13 = add i32 %12, 102
  %14 = tail call fastcc i32 @lduw_kernel(i32 %13) nounwind
  %15 = ashr i32 %t0, 3
  %16 = add nsw i32 %14, %15
  %17 = add nsw i32 %16, 1
  %18 = load %struct.CPUX86State** @env, align 8
  %19 = getelementptr inbounds %struct.CPUX86State* %18, i64 0, i32 11, i32 2
  %20 = load i32* %19, align 4
  %21 = icmp ugt i32 %17, %20
  br i1 %21, label %31, label %22

; <label>:22                                      ; preds = %10
  %23 = getelementptr inbounds %struct.CPUX86State* %18, i64 0, i32 11, i32 1
  %24 = load i32* %23, align 4
  %25 = add i32 %24, %16
  %26 = tail call fastcc i32 @lduw_kernel(i32 %25) nounwind
  %27 = and i32 %t0, 7
  %28 = ashr i32 %26, %27
  %29 = and i32 %28, 3
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %check_io.exit, label %31

; <label>:31                                      ; preds = %22, %10, %6, %0
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn nounwind
  unreachable

check_io.exit:                                    ; preds = %22
  ret void
}

define void @helper_check_iol(i32 %t0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 11, i32 3
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 36608
  %5 = icmp eq i32 %4, 35072
  br i1 %5, label %6, label %31

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 11, i32 2
  %8 = load i32* %7, align 4
  %9 = icmp ult i32 %8, 103
  br i1 %9, label %31, label %10

; <label>:10                                      ; preds = %6
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 11, i32 1
  %12 = load i32* %11, align 4
  %13 = add i32 %12, 102
  %14 = tail call fastcc i32 @lduw_kernel(i32 %13) nounwind
  %15 = ashr i32 %t0, 3
  %16 = add nsw i32 %14, %15
  %17 = add nsw i32 %16, 1
  %18 = load %struct.CPUX86State** @env, align 8
  %19 = getelementptr inbounds %struct.CPUX86State* %18, i64 0, i32 11, i32 2
  %20 = load i32* %19, align 4
  %21 = icmp ugt i32 %17, %20
  br i1 %21, label %31, label %22

; <label>:22                                      ; preds = %10
  %23 = getelementptr inbounds %struct.CPUX86State* %18, i64 0, i32 11, i32 1
  %24 = load i32* %23, align 4
  %25 = add i32 %24, %16
  %26 = tail call fastcc i32 @lduw_kernel(i32 %25) nounwind
  %27 = and i32 %t0, 7
  %28 = ashr i32 %26, %27
  %29 = and i32 %28, 15
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %check_io.exit, label %31

; <label>:31                                      ; preds = %22, %10, %6, %0
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn nounwind
  unreachable

check_io.exit:                                    ; preds = %22
  ret void
}

define void @helper_outb(i32 %port, i32 %data) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_concretize_io_addresses, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %5, label %3

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @klee_get_value(i32 %port) nounwind
  br label %5

; <label>:5                                       ; preds = %3, %0
  %.0 = phi i32 [ %4, %3 ], [ %port, %0 ]
  %6 = zext i32 %.0 to i64
  %7 = zext i32 %data to i64
  tail call void @tcg_llvm_trace_port_access(i64 %6, i64 %7, i32 8, i32 1) nounwind
  %8 = load %struct.S2E** @g_s2e, align 8
  %9 = load %struct.S2EExecutionState** @g_s2e_state, align 8
  %10 = tail call i32 @s2e_is_port_symbolic(%struct.S2E* %8, %struct.S2EExecutionState* %9, i64 %6) nounwind
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %20

; <label>:12                                      ; preds = %5
  %13 = load i32* @g_s2e_concretize_io_writes, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %18, label %15

; <label>:15                                      ; preds = %12
  %16 = and i32 %data, 255
  %17 = tail call i32 @klee_get_value(i32 %16) nounwind
  br label %18

; <label>:18                                      ; preds = %15, %12
  %.01 = phi i32 [ %17, %15 ], [ %data, %12 ]
  %19 = trunc i32 %.01 to i8
  tail call void @cpu_outb(i32 %.0, i8 zeroext %19) nounwind
  br label %20

; <label>:20                                      ; preds = %18, %5
  ret void
}

declare i32 @klee_get_value(i32)

declare void @tcg_llvm_trace_port_access(i64, i64, i32, i32)

declare i32 @s2e_is_port_symbolic(%struct.S2E*, %struct.S2EExecutionState*, i64)

declare void @cpu_outb(i32, i8 zeroext)

define i32 @helper_inb(i32 %port) nounwind uwtable sspreq {
  %ret.i = alloca i8, align 1
  %label = alloca [64 x i8], align 16
  %1 = load i32* @g_s2e_concretize_io_addresses, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %5, label %3

; <label>:3                                       ; preds = %0
  %4 = call i32 @klee_get_value(i32 %port) nounwind
  br label %5

; <label>:5                                       ; preds = %3, %0
  %.02 = phi i32 [ %4, %3 ], [ %port, %0 ]
  %6 = load %struct.S2E** @g_s2e, align 8
  %7 = load %struct.S2EExecutionState** @g_s2e_state, align 8
  %8 = zext i32 %.02 to i64
  %9 = call i32 @s2e_is_port_symbolic(%struct.S2E* %6, %struct.S2EExecutionState* %7, i64 %8) nounwind
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %18, label %11

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 4
  %15 = load i32* %14, align 4
  call void @trace_port(i8* %12, i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %.02, i32 %15)
  call void @klee_make_symbolic(i8* %ret.i, i32 1, i8* %12) nounwind
  %16 = load i8* %ret.i, align 1
  %17 = zext i8 %16 to i64
  call void @tcg_llvm_trace_port_access(i64 %8, i64 %17, i32 8, i32 0) nounwind
  br label %21

; <label>:18                                      ; preds = %5
  %19 = call zeroext i8 @cpu_inb(i32 %.02) nounwind
  %20 = zext i8 %19 to i64
  call void @tcg_llvm_trace_port_access(i64 %8, i64 %20, i32 8, i32 0) nounwind
  br label %21

; <label>:21                                      ; preds = %18, %11
  %.0.in = phi i8 [ %16, %11 ], [ %19, %18 ]
  %.0 = zext i8 %.0.in to i32
  ret i32 %.0
}

declare zeroext i8 @cpu_inb(i32)

define void @helper_outw(i32 %port, i32 %data) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_concretize_io_addresses, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %5, label %3

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @klee_get_value(i32 %port) nounwind
  br label %5

; <label>:5                                       ; preds = %3, %0
  %.0 = phi i32 [ %4, %3 ], [ %port, %0 ]
  %6 = zext i32 %.0 to i64
  %7 = zext i32 %data to i64
  tail call void @tcg_llvm_trace_port_access(i64 %6, i64 %7, i32 16, i32 1) nounwind
  %8 = load %struct.S2E** @g_s2e, align 8
  %9 = load %struct.S2EExecutionState** @g_s2e_state, align 8
  %10 = tail call i32 @s2e_is_port_symbolic(%struct.S2E* %8, %struct.S2EExecutionState* %9, i64 %6) nounwind
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %20

; <label>:12                                      ; preds = %5
  %13 = load i32* @g_s2e_concretize_io_writes, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %18, label %15

; <label>:15                                      ; preds = %12
  %16 = and i32 %data, 65535
  %17 = tail call i32 @klee_get_value(i32 %16) nounwind
  br label %18

; <label>:18                                      ; preds = %15, %12
  %.01 = phi i32 [ %17, %15 ], [ %data, %12 ]
  %19 = trunc i32 %.01 to i16
  tail call void @cpu_outw(i32 %.0, i16 zeroext %19) nounwind
  br label %20

; <label>:20                                      ; preds = %18, %5
  ret void
}

declare void @cpu_outw(i32, i16 zeroext)

define i32 @helper_inw(i32 %port) nounwind uwtable sspreq {
  %ret.i = alloca i16, align 2
  %label = alloca [64 x i8], align 16
  %1 = load i32* @g_s2e_concretize_io_addresses, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %5, label %3

; <label>:3                                       ; preds = %0
  %4 = call i32 @klee_get_value(i32 %port) nounwind
  br label %5

; <label>:5                                       ; preds = %3, %0
  %.02 = phi i32 [ %4, %3 ], [ %port, %0 ]
  %6 = load %struct.S2E** @g_s2e, align 8
  %7 = load %struct.S2EExecutionState** @g_s2e_state, align 8
  %8 = zext i32 %.02 to i64
  %9 = call i32 @s2e_is_port_symbolic(%struct.S2E* %6, %struct.S2EExecutionState* %7, i64 %8) nounwind
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %19, label %11

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 4
  %15 = load i32* %14, align 4
  call void @trace_port(i8* %12, i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %.02, i32 %15)
  %16 = bitcast i16* %ret.i to i8*
  call void @klee_make_symbolic(i8* %16, i32 2, i8* %12) nounwind
  %17 = load i16* %ret.i, align 2
  %18 = zext i16 %17 to i64
  call void @tcg_llvm_trace_port_access(i64 %8, i64 %18, i32 16, i32 0) nounwind
  br label %22

; <label>:19                                      ; preds = %5
  %20 = call zeroext i16 @cpu_inw(i32 %.02) nounwind
  %21 = zext i16 %20 to i64
  call void @tcg_llvm_trace_port_access(i64 %8, i64 %21, i32 16, i32 0) nounwind
  br label %22

; <label>:22                                      ; preds = %19, %11
  %.0.in = phi i16 [ %17, %11 ], [ %20, %19 ]
  %.0 = zext i16 %.0.in to i32
  ret i32 %.0
}

declare zeroext i16 @cpu_inw(i32)

define void @helper_outl(i32 %port, i32 %data) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_concretize_io_addresses, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %5, label %3

; <label>:3                                       ; preds = %0
  %4 = tail call i32 @klee_get_value(i32 %port) nounwind
  br label %5

; <label>:5                                       ; preds = %3, %0
  %.0 = phi i32 [ %4, %3 ], [ %port, %0 ]
  %6 = zext i32 %.0 to i64
  %7 = zext i32 %data to i64
  tail call void @tcg_llvm_trace_port_access(i64 %6, i64 %7, i32 32, i32 1) nounwind
  %8 = load %struct.S2E** @g_s2e, align 8
  %9 = load %struct.S2EExecutionState** @g_s2e_state, align 8
  %10 = tail call i32 @s2e_is_port_symbolic(%struct.S2E* %8, %struct.S2EExecutionState* %9, i64 %6) nounwind
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %18

; <label>:12                                      ; preds = %5
  %13 = load i32* @g_s2e_concretize_io_writes, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %17, label %15

; <label>:15                                      ; preds = %12
  %16 = tail call i32 @klee_get_value(i32 %data) nounwind
  br label %17

; <label>:17                                      ; preds = %15, %12
  %.01 = phi i32 [ %16, %15 ], [ %data, %12 ]
  tail call void @cpu_outl(i32 %.0, i32 %.01) nounwind
  br label %18

; <label>:18                                      ; preds = %17, %5
  ret void
}

declare void @cpu_outl(i32, i32)

define i32 @helper_inl(i32 %port) nounwind uwtable sspreq {
  %ret.i = alloca i32, align 4
  %label = alloca [64 x i8], align 16
  %1 = load i32* @g_s2e_concretize_io_addresses, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %5, label %3

; <label>:3                                       ; preds = %0
  %4 = call i32 @klee_get_value(i32 %port) nounwind
  br label %5

; <label>:5                                       ; preds = %3, %0
  %.02 = phi i32 [ %4, %3 ], [ %port, %0 ]
  %6 = load %struct.S2E** @g_s2e, align 8
  %7 = load %struct.S2EExecutionState** @g_s2e_state, align 8
  %8 = zext i32 %.02 to i64
  %9 = call i32 @s2e_is_port_symbolic(%struct.S2E* %6, %struct.S2EExecutionState* %7, i64 %8) nounwind
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %19, label %11

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 4
  %15 = load i32* %14, align 4
  call void @trace_port(i8* %12, i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i32 %.02, i32 %15)
  %16 = bitcast i32* %ret.i to i8*
  call void @klee_make_symbolic(i8* %16, i32 4, i8* %12) nounwind
  %17 = load i32* %ret.i, align 4
  %18 = zext i32 %17 to i64
  call void @tcg_llvm_trace_port_access(i64 %8, i64 %18, i32 32, i32 0) nounwind
  br label %22

; <label>:19                                      ; preds = %5
  %20 = call i32 @cpu_inl(i32 %.02) nounwind
  %21 = zext i32 %20 to i64
  call void @tcg_llvm_trace_port_access(i64 %8, i64 %21, i32 32, i32 0) nounwind
  br label %22

; <label>:22                                      ; preds = %19, %11
  %.0 = phi i32 [ %17, %11 ], [ %20, %19 ]
  ret i32 %.0
}

declare i32 @cpu_inl(i32)

define void @s2e_do_interrupt_all(i32 %intno, i32 %is_int, i32 %error_code, i32 %next_eip, i32 %is_hw) nounwind uwtable sspreq {
  %1 = load i32* @loglevel, align 4
  %2 = and i32 %1, 16
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %._crit_edge, label %4

; <label>:4                                       ; preds = %0
  %5 = load %struct.CPUX86State** @env, align 8
  %6 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 14, i64 0
  %7 = load i32* %6, align 4
  %8 = and i32 %7, 1
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %._crit_edge, label %10

; <label>:10                                      ; preds = %4
  %11 = load %struct._IO_FILE** @logfile, align 8
  %12 = icmp eq %struct._IO_FILE* %11, null
  br i1 %12, label %30, label %13

; <label>:13                                      ; preds = %10
  %14 = load i32* @s2e_do_interrupt_all.count, align 4
  %15 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 7
  %16 = load i32* %15, align 4
  %17 = and i32 %16, 3
  %18 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 9, i64 1, i32 0
  %19 = load i32* %18, align 4
  %20 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 4
  %21 = load i32* %20, align 4
  %22 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 9, i64 1, i32 1
  %23 = load i32* %22, align 4
  %24 = add i32 %23, %21
  %25 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 9, i64 2, i32 0
  %26 = load i32* %25, align 4
  %27 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 0, i64 4
  %28 = load i32* %27, align 4
  %29 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %11, i32 1, i8* getelementptr inbounds ([65 x i8]* @.str3, i64 0, i64 0), i32 %14, i32 %intno, i32 %error_code, i32 %is_int, i32 %17, i32 %19, i32 %21, i32 %24, i3
  %.pr = load %struct._IO_FILE** @logfile, align 8
  br label %30

; <label>:30                                      ; preds = %13, %10
  %31 = phi %struct._IO_FILE* [ null, %10 ], [ %.pr, %13 ]
  %32 = icmp eq i32 %intno, 14
  %33 = icmp ne %struct._IO_FILE* %31, null
  br i1 %32, label %34, label %40

; <label>:34                                      ; preds = %30
  br i1 %33, label %35, label %46

; <label>:35                                      ; preds = %34
  %36 = load %struct.CPUX86State** @env, align 8
  %37 = getelementptr inbounds %struct.CPUX86State* %36, i64 0, i32 14, i64 2
  %38 = load i32* %37, align 4
  %39 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %31, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str4, i64 0, i64 0), i32 %38) nounwind
  br label %46

; <label>:40                                      ; preds = %30
  br i1 %33, label %41, label %46

; <label>:41                                      ; preds = %40
  %42 = load %struct.CPUX86State** @env, align 8
  %43 = getelementptr inbounds %struct.CPUX86State* %42, i64 0, i32 0, i64 0
  %44 = load i32* %43, align 4
  %45 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %31, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str5, i64 0, i64 0), i32 %44) nounwind
  br label %46

; <label>:46                                      ; preds = %41, %40, %35, %34
  %47 = load %struct._IO_FILE** @logfile, align 8
  %48 = icmp eq %struct._IO_FILE* %47, null
  br i1 %48, label %51, label %49

; <label>:49                                      ; preds = %46
  %50 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %47, i32 1, i8* getelementptr inbounds ([2 x i8]* @.str6, i64 0, i64 0)) nounwind
  br label %51

; <label>:51                                      ; preds = %49, %46
  %52 = load i32* @s2e_do_interrupt_all.count, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* @s2e_do_interrupt_all.count, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %51, %4, %0
  %54 = load %struct.CPUX86State** @env, align 8
  %55 = getelementptr inbounds %struct.CPUX86State* %54, i64 0, i32 14, i64 0
  %56 = load i32* %55, align 4
  %57 = and i32 %56, 1
  %58 = icmp eq i32 %57, 0
  %59 = getelementptr inbounds %struct.CPUX86State* %54, i64 0, i32 7
  %60 = load i32* %59, align 4
  %61 = and i32 %60, 2097152
  %62 = icmp ne i32 %61, 0
  br i1 %58, label %769, label %63

; <label>:63                                      ; preds = %._crit_edge
  br i1 %62, label %64, label %handle_even_inj.exit

; <label>:64                                      ; preds = %63
  %65 = getelementptr inbounds %struct.CPUX86State* %54, i64 0, i32 40
  %66 = load i64* %65, align 8
  %67 = add i64 %66, 168
  %68 = tail call i32 @ldl_phys(i64 %67) nounwind
  %69 = icmp slt i32 %68, 0
  br i1 %69, label %handle_even_inj.exit, label %70

; <label>:70                                      ; preds = %64
  %71 = icmp eq i32 %is_int, 0
  %..i = select i1 %71, i32 768, i32 1024
  %72 = or i32 %..i, %intno
  %73 = or i32 %72, -2147483648
  switch i32 %intno, label %exeption_has_error_code.exit.thread.i [
    i32 8, label %74
    i32 10, label %74
    i32 11, label %74
    i32 12, label %74
    i32 13, label %74
    i32 14, label %74
    i32 17, label %74
  ]

; <label>:74                                      ; preds = %70, %70, %70, %70, %70, %70, %70
  %75 = or i32 %72, -2147481600
  %76 = load %struct.CPUX86State** @env, align 8
  %77 = getelementptr inbounds %struct.CPUX86State* %76, i64 0, i32 40
  %78 = load i64* %77, align 8
  %79 = add i64 %78, 172
  tail call void @stl_phys(i64 %79, i32 %error_code) nounwind
  br label %exeption_has_error_code.exit.thread.i

exeption_has_error_code.exit.thread.i:            ; preds = %74, %70
  %event_inj.0.i = phi i32 [ %75, %74 ], [ %73, %70 ]
  %80 = load %struct.CPUX86State** @env, align 8
  %81 = getelementptr inbounds %struct.CPUX86State* %80, i64 0, i32 40
  %82 = load i64* %81, align 8
  %83 = add i64 %82, 168
  tail call void @stl_phys(i64 %83, i32 %event_inj.0.i) nounwind
  br label %handle_even_inj.exit

handle_even_inj.exit:                             ; preds = %exeption_has_error_code.exit.thread.i, %64, %63
  %84 = icmp ne i32 %is_int, 0
  %.not.i = xor i1 %84, true
  %85 = icmp eq i32 %is_hw, 0
  %or.cond.i = and i1 %85, %.not.i
  br i1 %or.cond.i, label %86, label %exeption_has_error_code.exit.i

; <label>:86                                      ; preds = %handle_even_inj.exit
  switch i32 %intno, label %87 [
    i32 8, label %exeption_has_error_code.exit.i
    i32 10, label %exeption_has_error_code.exit.i
    i32 11, label %exeption_has_error_code.exit.i
    i32 12, label %exeption_has_error_code.exit.i
    i32 13, label %exeption_has_error_code.exit.i
    i32 14, label %exeption_has_error_code.exit.i
    i32 17, label %exeption_has_error_code.exit.i
  ]

; <label>:87                                      ; preds = %86
  br label %exeption_has_error_code.exit.i

exeption_has_error_code.exit.i:                   ; preds = %87, %86, %86, %86, %86, %86, %86, %86, %handle_even_inj.exit
  %has_error_code.0.i = phi i32 [ 0, %87 ], [ 0, %handle_even_inj.exit ], [ 1, %86 ], [ 1, %86 ], [ 1, %86 ], [ 1, %86 ], [ 1, %86 ], [ 1, %86 ], [ 1, %86 ]
  %.pre41.i = load %struct.CPUX86State** @env, align 8
  br i1 %84, label %exeption_has_error_code.exit._crit_edge.i, label %88

; <label>:88                                      ; preds = %exeption_has_error_code.exit.i
  %89 = getelementptr inbounds %struct.CPUX86State* %.pre41.i, i64 0, i32 4
  %90 = load i32* %89, align 4
  br label %exeption_has_error_code.exit._crit_edge.i

exeption_has_error_code.exit._crit_edge.i:        ; preds = %88, %exeption_has_error_code.exit.i
  %old_eip.0.i = phi i32 [ %90, %88 ], [ %next_eip, %exeption_has_error_code.exit.i ]
  %91 = shl nsw i32 %intno, 3
  %92 = or i32 %91, 7
  %93 = getelementptr inbounds %struct.CPUX86State* %.pre41.i, i64 0, i32 13, i32 2
  %94 = load i32* %93, align 4
  %95 = icmp ugt i32 %92, %94
  br i1 %95, label %96, label %98

; <label>:96                                      ; preds = %exeption_has_error_code.exit._crit_edge.i
  %97 = or i32 %91, 2
  tail call fastcc void @raise_exception_err(i32 13, i32 %97) noreturn nounwind
  unreachable

; <label>:98                                      ; preds = %exeption_has_error_code.exit._crit_edge.i
  %99 = getelementptr inbounds %struct.CPUX86State* %.pre41.i, i64 0, i32 13, i32 1
  %100 = load i32* %99, align 4
  %101 = add i32 %100, %91
  %102 = tail call fastcc i32 @ldl_kernel(i32 %101) nounwind
  %103 = add i32 %101, 4
  %104 = tail call fastcc i32 @ldl_kernel(i32 %103) nounwind
  %105 = lshr i32 %104, 8
  %106 = and i32 %105, 31
  switch i32 %106, label %144 [
    i32 5, label %107
    i32 6, label %146
    i32 7, label %146
    i32 14, label %146
    i32 15, label %146
  ]

; <label>:107                                     ; preds = %98
  %108 = and i32 %104, 32768
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %112

; <label>:110                                     ; preds = %107
  %111 = or i32 %91, 2
  tail call fastcc void @raise_exception_err(i32 11, i32 %111) noreturn nounwind
  unreachable

; <label>:112                                     ; preds = %107
  tail call fastcc void @switch_tss(i32 %91, i32 %102, i32 %104, i32 2, i32 %old_eip.0.i) nounwind
  %113 = icmp eq i32 %has_error_code.0.i, 0
  br i1 %113, label %do_interrupt_protected.exit, label %114

; <label>:114                                     ; preds = %112
  %115 = load %struct.CPUX86State** @env, align 8
  %116 = getelementptr inbounds %struct.CPUX86State* %115, i64 0, i32 11, i32 3
  %117 = load i32* %116, align 4
  %118 = lshr i32 %117, 11
  %119 = and i32 %118, 1
  %120 = getelementptr inbounds %struct.CPUX86State* %115, i64 0, i32 9, i64 2, i32 3
  %121 = load i32* %120, align 4
  %122 = lshr i32 %121, 6
  %123 = and i32 %122, 65536
  %124 = xor i32 %123, 65536
  %125 = add i32 %124, -1
  %126 = getelementptr inbounds %struct.CPUX86State* %115, i64 0, i32 0, i64 4
  %127 = load i32* %126, align 4
  %128 = shl i32 2, %119
  %129 = sub i32 %127, %128
  %130 = and i32 %125, %129
  %131 = getelementptr inbounds %struct.CPUX86State* %115, i64 0, i32 9, i64 2, i32 1
  %132 = load i32* %131, align 4
  %133 = add i32 %130, %132
  %134 = icmp eq i32 %119, 0
  br i1 %134, label %136, label %135

; <label>:135                                     ; preds = %114
  tail call fastcc void @stl_kernel(i32 %133, i32 %error_code) nounwind
  br label %137

; <label>:136                                     ; preds = %114
  tail call fastcc void @stw_kernel(i32 %133, i32 %error_code) nounwind
  br label %137

; <label>:137                                     ; preds = %136, %135
  %138 = load %struct.CPUX86State** @env, align 8
  %139 = getelementptr inbounds %struct.CPUX86State* %138, i64 0, i32 0, i64 4
  %140 = load i32* %139, align 4
  %141 = sub i32 0, %124
  %142 = and i32 %140, %141
  %143 = or i32 %142, %130
  store i32 %143, i32* %139, align 4
  br label %do_interrupt_protected.exit

; <label>:144                                     ; preds = %98
  %145 = or i32 %91, 2
  tail call fastcc void @raise_exception_err(i32 13, i32 %145) noreturn nounwind
  unreachable

; <label>:146                                     ; preds = %98, %98, %98, %98
  %147 = load %struct.CPUX86State** @env, align 8
  %148 = getelementptr inbounds %struct.CPUX86State* %147, i64 0, i32 7
  %149 = load i32* %148, align 4
  %150 = and i32 %149, 3
  br i1 %84, label %151, label %157

; <label>:151                                     ; preds = %146
  %152 = lshr i32 %104, 13
  %153 = and i32 %152, 3
  %154 = icmp ult i32 %153, %150
  br i1 %154, label %155, label %157

; <label>:155                                     ; preds = %151
  %156 = or i32 %91, 2
  tail call fastcc void @raise_exception_err(i32 13, i32 %156) noreturn nounwind
  unreachable

; <label>:157                                     ; preds = %151, %146
  %158 = and i32 %104, 32768
  %159 = icmp eq i32 %158, 0
  br i1 %159, label %160, label %162

; <label>:160                                     ; preds = %157
  %161 = or i32 %91, 2
  tail call fastcc void @raise_exception_err(i32 11, i32 %161) noreturn nounwind
  unreachable

; <label>:162                                     ; preds = %157
  %163 = lshr i32 %102, 16
  %164 = and i32 %104, -65536
  %165 = and i32 %102, 65535
  %166 = or i32 %164, %165
  %167 = and i32 %163, 65532
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %169, label %170

; <label>:169                                     ; preds = %162
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn nounwind
  unreachable

; <label>:170                                     ; preds = %162
  %171 = and i32 %163, 4
  %172 = icmp eq i32 %171, 0
  %173 = getelementptr inbounds %struct.CPUX86State* %147, i64 0, i32 10
  %174 = getelementptr inbounds %struct.CPUX86State* %147, i64 0, i32 12
  %dt.0.i.i = select i1 %172, %struct.SegmentCache* %174, %struct.SegmentCache* %173
  %175 = or i32 %163, 7
  %176 = getelementptr inbounds %struct.SegmentCache* %dt.0.i.i, i64 0, i32 2
  %177 = load i32* %176, align 4
  %178 = icmp ugt i32 %175, %177
  br i1 %178, label %179, label %180

; <label>:179                                     ; preds = %170
  tail call fastcc void @raise_exception_err(i32 13, i32 %167) noreturn nounwind
  unreachable

; <label>:180                                     ; preds = %170
  %181 = and i32 %163, 65528
  %182 = getelementptr inbounds %struct.SegmentCache* %dt.0.i.i, i64 0, i32 1
  %183 = load i32* %182, align 4
  %184 = add i32 %183, %181
  %185 = tail call fastcc i32 @ldl_kernel(i32 %184) nounwind
  %186 = add i32 %184, 4
  %187 = tail call fastcc i32 @ldl_kernel(i32 %186) nounwind
  %188 = and i32 %187, 6144
  %189 = icmp eq i32 %188, 6144
  br i1 %189, label %191, label %190

; <label>:190                                     ; preds = %180
  tail call fastcc void @raise_exception_err(i32 13, i32 %167) noreturn nounwind
  unreachable

; <label>:191                                     ; preds = %180
  %192 = lshr i32 %187, 13
  %193 = and i32 %192, 3
  %194 = icmp ugt i32 %193, %150
  br i1 %194, label %195, label %196

; <label>:195                                     ; preds = %191
  tail call fastcc void @raise_exception_err(i32 13, i32 %167) noreturn nounwind
  unreachable

; <label>:196                                     ; preds = %191
  %197 = and i32 %187, 32768
  %198 = icmp eq i32 %197, 0
  br i1 %198, label %199, label %200

; <label>:199                                     ; preds = %196
  tail call fastcc void @raise_exception_err(i32 11, i32 %167) noreturn nounwind
  unreachable

; <label>:200                                     ; preds = %196
  %201 = and i32 %187, 1024
  %202 = icmp eq i32 %201, 0
  %203 = icmp ult i32 %193, %150
  %or.cond4.i = and i1 %202, %203
  br i1 %or.cond4.i, label %204, label %298

; <label>:204                                     ; preds = %200
  %205 = load %struct.CPUX86State** @env, align 8
  %206 = getelementptr inbounds %struct.CPUX86State* %205, i64 0, i32 11, i32 3
  %207 = load i32* %206, align 4
  %208 = and i32 %207, 32768
  %209 = icmp eq i32 %208, 0
  br i1 %209, label %210, label %211

; <label>:210                                     ; preds = %204
  tail call void (%struct.CPUX86State*, i8*, ...)* @cpu_abort(%struct.CPUX86State* %205, i8* getelementptr inbounds ([12 x i8]* @.str20, i64 0, i64 0)) noreturn nounwind
  unreachable

; <label>:211                                     ; preds = %204
  %212 = and i32 %207, 1792
  %213 = icmp eq i32 %212, 256
  br i1 %213, label %215, label %214

; <label>:214                                     ; preds = %211
  tail call void (%struct.CPUX86State*, i8*, ...)* @cpu_abort(%struct.CPUX86State* %205, i8* getelementptr inbounds ([17 x i8]* @.str21, i64 0, i64 0)) noreturn nounwind
  unreachable

; <label>:215                                     ; preds = %211
  %216 = lshr i32 %207, 11
  %217 = and i32 %216, 1
  %218 = shl nuw nsw i32 %193, 2
  %219 = or i32 %218, 2
  %220 = shl i32 %219, %217
  %221 = shl i32 4, %217
  %222 = add i32 %220, -1
  %223 = add i32 %222, %221
  %224 = getelementptr inbounds %struct.CPUX86State* %205, i64 0, i32 11, i32 2
  %225 = load i32* %224, align 4
  %226 = icmp ugt i32 %223, %225
  br i1 %226, label %227, label %231

; <label>:227                                     ; preds = %215
  %228 = getelementptr inbounds %struct.CPUX86State* %205, i64 0, i32 11, i32 0
  %229 = load i32* %228, align 4
  %230 = and i32 %229, 65532
  tail call fastcc void @raise_exception_err(i32 10, i32 %230) noreturn nounwind
  unreachable

; <label>:231                                     ; preds = %215
  %232 = icmp eq i32 %217, 0
  %233 = getelementptr inbounds %struct.CPUX86State* %205, i64 0, i32 11, i32 1
  %234 = load i32* %233, align 4
  %235 = add i32 %234, %220
  br i1 %232, label %236, label %244

; <label>:236                                     ; preds = %231
  %237 = tail call fastcc i32 @lduw_kernel(i32 %235) nounwind
  %238 = load %struct.CPUX86State** @env, align 8
  %239 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 11, i32 1
  %240 = load i32* %239, align 4
  %241 = add i32 %220, 2
  %242 = add i32 %241, %240
  %243 = tail call fastcc i32 @lduw_kernel(i32 %242) nounwind
  br label %get_ss_esp_from_tss.exit.i

; <label>:244                                     ; preds = %231
  %245 = tail call fastcc i32 @ldl_kernel(i32 %235) nounwind
  %246 = load %struct.CPUX86State** @env, align 8
  %247 = getelementptr inbounds %struct.CPUX86State* %246, i64 0, i32 11, i32 1
  %248 = load i32* %247, align 4
  %249 = add i32 %220, 4
  %250 = add i32 %249, %248
  %251 = tail call fastcc i32 @lduw_kernel(i32 %250) nounwind
  br label %get_ss_esp_from_tss.exit.i

get_ss_esp_from_tss.exit.i:                       ; preds = %244, %236
  %252 = phi i32 [ %237, %236 ], [ %245, %244 ]
  %storemerge.i.i = phi i32 [ %243, %236 ], [ %251, %244 ]
  %253 = and i32 %storemerge.i.i, 65532
  %254 = icmp eq i32 %253, 0
  br i1 %254, label %255, label %256

; <label>:255                                     ; preds = %get_ss_esp_from_tss.exit.i
  tail call fastcc void @raise_exception_err(i32 10, i32 0) noreturn nounwind
  unreachable

; <label>:256                                     ; preds = %get_ss_esp_from_tss.exit.i
  %257 = and i32 %storemerge.i.i, 3
  %258 = icmp eq i32 %257, %193
  br i1 %258, label %260, label %259

; <label>:259                                     ; preds = %256
  tail call fastcc void @raise_exception_err(i32 10, i32 %253) noreturn nounwind
  unreachable

; <label>:260                                     ; preds = %256
  %261 = and i32 %storemerge.i.i, 4
  %262 = icmp eq i32 %261, 0
  %263 = load %struct.CPUX86State** @env, align 8
  %264 = getelementptr inbounds %struct.CPUX86State* %263, i64 0, i32 10
  %265 = getelementptr inbounds %struct.CPUX86State* %263, i64 0, i32 12
  %dt.0.i11.i = select i1 %262, %struct.SegmentCache* %265, %struct.SegmentCache* %264
  %266 = or i32 %storemerge.i.i, 7
  %267 = getelementptr inbounds %struct.SegmentCache* %dt.0.i11.i, i64 0, i32 2
  %268 = load i32* %267, align 4
  %269 = icmp ugt i32 %266, %268
  br i1 %269, label %270, label %271

; <label>:270                                     ; preds = %260
  tail call fastcc void @raise_exception_err(i32 10, i32 %253) noreturn nounwind
  unreachable

; <label>:271                                     ; preds = %260
  %272 = and i32 %storemerge.i.i, -8
  %273 = getelementptr inbounds %struct.SegmentCache* %dt.0.i11.i, i64 0, i32 1
  %274 = load i32* %273, align 4
  %275 = add i32 %274, %272
  %276 = tail call fastcc i32 @ldl_kernel(i32 %275) nounwind
  %277 = add i32 %275, 4
  %278 = tail call fastcc i32 @ldl_kernel(i32 %277) nounwind
  %279 = lshr i32 %278, 13
  %280 = and i32 %279, 3
  %281 = icmp eq i32 %280, %193
  br i1 %281, label %283, label %282

; <label>:282                                     ; preds = %271
  tail call fastcc void @raise_exception_err(i32 10, i32 %253) noreturn nounwind
  unreachable

; <label>:283                                     ; preds = %271
  %284 = and i32 %278, 6656
  %285 = icmp eq i32 %284, 4608
  br i1 %285, label %287, label %286

; <label>:286                                     ; preds = %283
  tail call fastcc void @raise_exception_err(i32 10, i32 %253) noreturn nounwind
  unreachable

; <label>:287                                     ; preds = %283
  %288 = and i32 %278, 32768
  %289 = icmp eq i32 %288, 0
  br i1 %289, label %290, label %291

; <label>:290                                     ; preds = %287
  tail call fastcc void @raise_exception_err(i32 10, i32 %253) noreturn nounwind
  unreachable

; <label>:291                                     ; preds = %287
  %292 = lshr i32 %276, 16
  %293 = shl i32 %278, 16
  %294 = and i32 %293, 16711680
  %295 = and i32 %278, -16777216
  %296 = or i32 %295, %292
  %297 = or i32 %296, %294
  %phitmp.i = and i32 %276, 65535
  br label %316

; <label>:298                                     ; preds = %200
  %299 = icmp ne i32 %201, 0
  %300 = icmp eq i32 %193, %150
  %or.cond9.i = or i1 %299, %300
  br i1 %or.cond9.i, label %301, label %315

; <label>:301                                     ; preds = %298
  %302 = load %struct.CPUX86State** @env, align 8
  %303 = getelementptr inbounds %struct.CPUX86State* %302, i64 0, i32 6
  %304 = load i32* %303, align 4
  %305 = and i32 %304, 131072
  %306 = icmp eq i32 %305, 0
  br i1 %306, label %308, label %307

; <label>:307                                     ; preds = %301
  tail call fastcc void @raise_exception_err(i32 13, i32 %167) noreturn nounwind
  unreachable

; <label>:308                                     ; preds = %301
  %309 = getelementptr inbounds %struct.CPUX86State* %302, i64 0, i32 9, i64 2, i32 3
  %310 = load i32* %309, align 4
  %311 = getelementptr inbounds %struct.CPUX86State* %302, i64 0, i32 9, i64 2, i32 1
  %312 = load i32* %311, align 4
  %313 = getelementptr inbounds %struct.CPUX86State* %302, i64 0, i32 0, i64 4
  %314 = load i32* %313, align 4
  br label %316

; <label>:315                                     ; preds = %298
  tail call fastcc void @raise_exception_err(i32 13, i32 %167) noreturn nounwind
  unreachable

; <label>:316                                     ; preds = %308, %291
  %317 = phi i32 [ 0, %308 ], [ %278, %291 ]
  %318 = phi i32 [ 0, %308 ], [ %phitmp.i, %291 ]
  %319 = phi i32 [ %314, %308 ], [ %252, %291 ]
  %storemerge.i34.i = phi i32 [ 0, %308 ], [ %storemerge.i.i, %291 ]
  %dpl.0.i = phi i32 [ %150, %308 ], [ %193, %291 ]
  %320 = phi i32 [ %312, %308 ], [ %297, %291 ]
  %new_stack.0.i = phi i1 [ false, %308 ], [ true, %291 ]
  %sp_mask.0.in.in.in.in.i = phi i32 [ %310, %308 ], [ %278, %291 ]
  %sp_mask.0.in.in.in.i = lshr i32 %sp_mask.0.in.in.in.in.i, 6
  %sp_mask.0.in.in.i = and i32 %sp_mask.0.in.in.in.i, 65536
  %sp_mask.0.in.i = xor i32 %sp_mask.0.in.in.i, 65536
  %sp_mask.0.i = add i32 %sp_mask.0.in.i, -1
  %.mask.i = and i32 %105, 24
  %321 = icmp eq i32 %.mask.i, 8
  br i1 %321, label %322, label %396

; <label>:322                                     ; preds = %316
  br i1 %new_stack.0.i, label %323, label %._crit_edge40.i

; <label>:323                                     ; preds = %322
  %324 = load %struct.CPUX86State** @env, align 8
  %325 = getelementptr inbounds %struct.CPUX86State* %324, i64 0, i32 6
  %326 = load i32* %325, align 4
  %327 = and i32 %326, 131072
  %328 = icmp eq i32 %327, 0
  br i1 %328, label %353, label %329

; <label>:329                                     ; preds = %323
  %330 = add i32 %319, -4
  %331 = and i32 %sp_mask.0.i, %330
  %332 = add i32 %331, %320
  %333 = getelementptr inbounds %struct.CPUX86State* %324, i64 0, i32 9, i64 5, i32 0
  %334 = load i32* %333, align 4
  tail call fastcc void @stl_kernel(i32 %332, i32 %334) nounwind
  %335 = add i32 %319, -8
  %336 = and i32 %sp_mask.0.i, %335
  %337 = add i32 %336, %320
  %338 = load %struct.CPUX86State** @env, align 8
  %339 = getelementptr inbounds %struct.CPUX86State* %338, i64 0, i32 9, i64 4, i32 0
  %340 = load i32* %339, align 4
  tail call fastcc void @stl_kernel(i32 %337, i32 %340) nounwind
  %341 = add i32 %319, -12
  %342 = and i32 %sp_mask.0.i, %341
  %343 = add i32 %342, %320
  %344 = load %struct.CPUX86State** @env, align 8
  %345 = getelementptr inbounds %struct.CPUX86State* %344, i64 0, i32 9, i64 3, i32 0
  %346 = load i32* %345, align 4
  tail call fastcc void @stl_kernel(i32 %343, i32 %346) nounwind
  %347 = add i32 %319, -16
  %348 = and i32 %sp_mask.0.i, %347
  %349 = add i32 %348, %320
  %350 = load %struct.CPUX86State** @env, align 8
  %351 = getelementptr inbounds %struct.CPUX86State* %350, i64 0, i32 9, i64 0, i32 0
  %352 = load i32* %351, align 4
  tail call fastcc void @stl_kernel(i32 %349, i32 %352) nounwind
  %.pre.i = load %struct.CPUX86State** @env, align 8
  br label %353

; <label>:353                                     ; preds = %329, %323
  %354 = phi %struct.CPUX86State* [ %324, %323 ], [ %.pre.i, %329 ]
  %355 = phi i32 [ %319, %323 ], [ %347, %329 ]
  %356 = add i32 %355, -4
  %357 = and i32 %356, %sp_mask.0.i
  %358 = add i32 %357, %320
  %359 = getelementptr inbounds %struct.CPUX86State* %354, i64 0, i32 9, i64 2, i32 0
  %360 = load i32* %359, align 4
  tail call fastcc void @stl_kernel(i32 %358, i32 %360) nounwind
  %361 = add i32 %355, -8
  %362 = and i32 %361, %sp_mask.0.i
  %363 = add i32 %362, %320
  %364 = load %struct.CPUX86State** @env, align 8
  %365 = getelementptr inbounds %struct.CPUX86State* %364, i64 0, i32 0, i64 4
  %366 = load i32* %365, align 4
  tail call fastcc void @stl_kernel(i32 %363, i32 %366) nounwind
  br label %._crit_edge40.i

._crit_edge40.i:                                  ; preds = %353, %322
  %367 = phi i32 [ %361, %353 ], [ %319, %322 ]
  %368 = add i32 %367, -4
  %369 = and i32 %368, %sp_mask.0.i
  %370 = add i32 %369, %320
  %371 = load %struct.CPUX86State** @env, align 8
  %372 = getelementptr inbounds %struct.CPUX86State* %371, i64 0, i32 6
  %373 = load i32* %372, align 4
  %374 = getelementptr inbounds %struct.CPUX86State* %371, i64 0, i32 3
  %375 = load i32* %374, align 4
  %376 = tail call i32 @helper_cc_compute_all(i32 %375) nounwind
  %377 = getelementptr inbounds %struct.CPUX86State* %371, i64 0, i32 5
  %378 = load i32* %377, align 4
  %379 = and i32 %378, 1024
  %380 = or i32 %376, %373
  %381 = or i32 %380, %379
  tail call fastcc void @stl_kernel(i32 %370, i32 %381) nounwind
  %382 = add i32 %367, -8
  %383 = and i32 %382, %sp_mask.0.i
  %384 = add i32 %383, %320
  %385 = load %struct.CPUX86State** @env, align 8
  %386 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 9, i64 1, i32 0
  %387 = load i32* %386, align 4
  tail call fastcc void @stl_kernel(i32 %384, i32 %387) nounwind
  %388 = add i32 %367, -12
  %389 = and i32 %388, %sp_mask.0.i
  %390 = add i32 %389, %320
  tail call fastcc void @stl_kernel(i32 %390, i32 %old_eip.0.i) nounwind
  %391 = icmp eq i32 %has_error_code.0.i, 0
  br i1 %391, label %470, label %392

; <label>:392                                     ; preds = %._crit_edge40.i
  %393 = add i32 %367, -16
  %394 = and i32 %393, %sp_mask.0.i
  %395 = add i32 %394, %320
  tail call fastcc void @stl_kernel(i32 %395, i32 %error_code) nounwind
  br label %470

; <label>:396                                     ; preds = %316
  br i1 %new_stack.0.i, label %397, label %._crit_edge.i

; <label>:397                                     ; preds = %396
  %398 = load %struct.CPUX86State** @env, align 8
  %399 = getelementptr inbounds %struct.CPUX86State* %398, i64 0, i32 6
  %400 = load i32* %399, align 4
  %401 = and i32 %400, 131072
  %402 = icmp eq i32 %401, 0
  br i1 %402, label %427, label %403

; <label>:403                                     ; preds = %397
  %404 = add i32 %319, -2
  %405 = and i32 %sp_mask.0.i, %404
  %406 = add i32 %405, %320
  %407 = getelementptr inbounds %struct.CPUX86State* %398, i64 0, i32 9, i64 5, i32 0
  %408 = load i32* %407, align 4
  tail call fastcc void @stw_kernel(i32 %406, i32 %408) nounwind
  %409 = add i32 %319, -4
  %410 = and i32 %sp_mask.0.i, %409
  %411 = add i32 %410, %320
  %412 = load %struct.CPUX86State** @env, align 8
  %413 = getelementptr inbounds %struct.CPUX86State* %412, i64 0, i32 9, i64 4, i32 0
  %414 = load i32* %413, align 4
  tail call fastcc void @stw_kernel(i32 %411, i32 %414) nounwind
  %415 = add i32 %319, -6
  %416 = and i32 %sp_mask.0.i, %415
  %417 = add i32 %416, %320
  %418 = load %struct.CPUX86State** @env, align 8
  %419 = getelementptr inbounds %struct.CPUX86State* %418, i64 0, i32 9, i64 3, i32 0
  %420 = load i32* %419, align 4
  tail call fastcc void @stw_kernel(i32 %417, i32 %420) nounwind
  %421 = add i32 %319, -8
  %422 = and i32 %sp_mask.0.i, %421
  %423 = add i32 %422, %320
  %424 = load %struct.CPUX86State** @env, align 8
  %425 = getelementptr inbounds %struct.CPUX86State* %424, i64 0, i32 9, i64 0, i32 0
  %426 = load i32* %425, align 4
  tail call fastcc void @stw_kernel(i32 %423, i32 %426) nounwind
  %.pre39.i = load %struct.CPUX86State** @env, align 8
  br label %427

; <label>:427                                     ; preds = %403, %397
  %428 = phi %struct.CPUX86State* [ %398, %397 ], [ %.pre39.i, %403 ]
  %429 = phi i32 [ %319, %397 ], [ %421, %403 ]
  %430 = add i32 %429, -2
  %431 = and i32 %430, %sp_mask.0.i
  %432 = add i32 %431, %320
  %433 = getelementptr inbounds %struct.CPUX86State* %428, i64 0, i32 9, i64 2, i32 0
  %434 = load i32* %433, align 4
  tail call fastcc void @stw_kernel(i32 %432, i32 %434) nounwind
  %435 = add i32 %429, -4
  %436 = and i32 %435, %sp_mask.0.i
  %437 = add i32 %436, %320
  %438 = load %struct.CPUX86State** @env, align 8
  %439 = getelementptr inbounds %struct.CPUX86State* %438, i64 0, i32 0, i64 4
  %440 = load i32* %439, align 4
  tail call fastcc void @stw_kernel(i32 %437, i32 %440) nounwind
  br label %._crit_edge.i

._crit_edge.i:                                    ; preds = %427, %396
  %441 = phi i32 [ %435, %427 ], [ %319, %396 ]
  %442 = add i32 %441, -2
  %443 = and i32 %442, %sp_mask.0.i
  %444 = add i32 %443, %320
  %445 = load %struct.CPUX86State** @env, align 8
  %446 = getelementptr inbounds %struct.CPUX86State* %445, i64 0, i32 6
  %447 = load i32* %446, align 4
  %448 = getelementptr inbounds %struct.CPUX86State* %445, i64 0, i32 3
  %449 = load i32* %448, align 4
  %450 = tail call i32 @helper_cc_compute_all(i32 %449) nounwind
  %451 = getelementptr inbounds %struct.CPUX86State* %445, i64 0, i32 5
  %452 = load i32* %451, align 4
  %453 = and i32 %452, 1024
  %454 = or i32 %450, %447
  %455 = or i32 %454, %453
  tail call fastcc void @stw_kernel(i32 %444, i32 %455) nounwind
  %456 = add i32 %441, -4
  %457 = and i32 %456, %sp_mask.0.i
  %458 = add i32 %457, %320
  %459 = load %struct.CPUX86State** @env, align 8
  %460 = getelementptr inbounds %struct.CPUX86State* %459, i64 0, i32 9, i64 1, i32 0
  %461 = load i32* %460, align 4
  tail call fastcc void @stw_kernel(i32 %458, i32 %461) nounwind
  %462 = add i32 %441, -6
  %463 = and i32 %462, %sp_mask.0.i
  %464 = add i32 %463, %320
  tail call fastcc void @stw_kernel(i32 %464, i32 %old_eip.0.i) nounwind
  %465 = icmp eq i32 %has_error_code.0.i, 0
  br i1 %465, label %470, label %466

; <label>:466                                     ; preds = %._crit_edge.i
  %467 = add i32 %441, -8
  %468 = and i32 %467, %sp_mask.0.i
  %469 = add i32 %468, %320
  tail call fastcc void @stw_kernel(i32 %469, i32 %error_code) nounwind
  br label %470

; <label>:470                                     ; preds = %466, %._crit_edge.i, %392, %._crit_edge40.i
  %471 = phi i32 [ %388, %._crit_edge40.i ], [ %462, %._crit_edge.i ], [ %467, %466 ], [ %393, %392 ]
  br i1 %new_stack.0.i, label %472, label %682

; <label>:472                                     ; preds = %470
  %473 = load %struct.CPUX86State** @env, align 8
  %474 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 6
  %475 = load i32* %474, align 4
  %476 = and i32 %475, 131072
  %477 = icmp eq i32 %476, 0
  br i1 %477, label %634, label %478

; <label>:478                                     ; preds = %472
  %479 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 9, i64 0, i32 0
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 7
  %480 = bitcast i32* %479 to i8*
  br label %481

; <label>:481                                     ; preds = %484, %478
  %482 = phi i64 [ 0, %478 ], [ %486, %484 ]
  %483 = icmp ult i64 %482, 16
  br i1 %483, label %484, label %487

; <label>:484                                     ; preds = %481
  %485 = getelementptr i8* %480, i64 %482
  store i8 0, i8* %485, align 1
  %486 = add i64 %482, 1
  br label %481

; <label>:487                                     ; preds = %481
  %.pre.i.i = load i32* %.phi.trans.insert.i.i, align 4
  %488 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 9, i64 2, i32 3
  %489 = load i32* %488, align 4
  %490 = lshr i32 %489, 17
  %491 = and i32 %490, 32
  %492 = and i32 %.pre.i.i, 32768
  %493 = icmp eq i32 %492, 0
  %494 = or i32 %491, 64
  %new_hflags.0.i.i = select i1 %493, i32 %494, i32 %491
  %495 = and i32 %.pre.i.i, -97
  %496 = or i32 %new_hflags.0.i.i, %495
  store i32 %496, i32* %.phi.trans.insert.i.i, align 4
  %497 = load %struct.CPUX86State** @env, align 8
  %498 = getelementptr inbounds %struct.CPUX86State* %497, i64 0, i32 9, i64 3, i32 0
  %.phi.trans.insert.i14.i = getelementptr inbounds %struct.CPUX86State* %497, i64 0, i32 7
  %499 = bitcast i32* %498 to i8*
  br label %500

; <label>:500                                     ; preds = %503, %487
  %501 = phi i64 [ 0, %487 ], [ %505, %503 ]
  %502 = icmp ult i64 %501, 16
  br i1 %502, label %503, label %506

; <label>:503                                     ; preds = %500
  %504 = getelementptr i8* %499, i64 %501
  store i8 0, i8* %504, align 1
  %505 = add i64 %501, 1
  br label %500

; <label>:506                                     ; preds = %500
  %.pre.i15.i = load i32* %.phi.trans.insert.i14.i, align 4
  %507 = getelementptr inbounds %struct.CPUX86State* %497, i64 0, i32 9, i64 2, i32 3
  %508 = load i32* %507, align 4
  %509 = lshr i32 %508, 17
  %510 = and i32 %509, 32
  %511 = and i32 %.pre.i15.i, 32768
  %512 = icmp eq i32 %511, 0
  br i1 %512, label %513, label %538

; <label>:513                                     ; preds = %506
  %514 = getelementptr inbounds %struct.CPUX86State* %497, i64 0, i32 14, i64 0
  %515 = load i32* %514, align 4
  %516 = and i32 %515, 1
  %517 = icmp eq i32 %516, 0
  br i1 %517, label %526, label %518

; <label>:518                                     ; preds = %513
  %519 = getelementptr inbounds %struct.CPUX86State* %497, i64 0, i32 6
  %520 = load i32* %519, align 4
  %521 = and i32 %520, 131072
  %522 = icmp eq i32 %521, 0
  br i1 %522, label %523, label %526

; <label>:523                                     ; preds = %518
  %524 = and i32 %.pre.i15.i, 16
  %525 = icmp eq i32 %524, 0
  br i1 %525, label %526, label %528

; <label>:526                                     ; preds = %523, %518, %513
  %527 = or i32 %510, 64
  br label %538

; <label>:528                                     ; preds = %523
  %529 = getelementptr inbounds %struct.CPUX86State* %497, i64 0, i32 9, i64 0, i32 1
  %530 = load i32* %529, align 4
  %531 = getelementptr inbounds %struct.CPUX86State* %497, i64 0, i32 9, i64 2, i32 1
  %532 = load i32* %531, align 4
  %533 = or i32 %532, %530
  %534 = icmp ne i32 %533, 0
  %535 = zext i1 %534 to i32
  %536 = shl nuw nsw i32 %535, 6
  %537 = or i32 %536, %510
  br label %538

; <label>:538                                     ; preds = %528, %526, %506
  %new_hflags.0.i16.i = phi i32 [ %510, %506 ], [ %527, %526 ], [ %537, %528 ]
  %539 = and i32 %.pre.i15.i, -97
  %540 = or i32 %new_hflags.0.i16.i, %539
  store i32 %540, i32* %.phi.trans.insert.i14.i, align 4
  %541 = load %struct.CPUX86State** @env, align 8
  %542 = getelementptr inbounds %struct.CPUX86State* %541, i64 0, i32 9, i64 4, i32 0
  %.phi.trans.insert.i18.i = getelementptr inbounds %struct.CPUX86State* %541, i64 0, i32 7
  %543 = bitcast i32* %542 to i8*
  br label %544

; <label>:544                                     ; preds = %547, %538
  %545 = phi i64 [ 0, %538 ], [ %549, %547 ]
  %546 = icmp ult i64 %545, 16
  br i1 %546, label %547, label %550

; <label>:547                                     ; preds = %544
  %548 = getelementptr i8* %543, i64 %545
  store i8 0, i8* %548, align 1
  %549 = add i64 %545, 1
  br label %544

; <label>:550                                     ; preds = %544
  %.pre.i19.i = load i32* %.phi.trans.insert.i18.i, align 4
  %551 = getelementptr inbounds %struct.CPUX86State* %541, i64 0, i32 9, i64 2, i32 3
  %552 = load i32* %551, align 4
  %553 = lshr i32 %552, 17
  %554 = and i32 %553, 32
  %555 = and i32 %.pre.i19.i, 32768
  %556 = icmp eq i32 %555, 0
  br i1 %556, label %557, label %585

; <label>:557                                     ; preds = %550
  %558 = getelementptr inbounds %struct.CPUX86State* %541, i64 0, i32 14, i64 0
  %559 = load i32* %558, align 4
  %560 = and i32 %559, 1
  %561 = icmp eq i32 %560, 0
  br i1 %561, label %570, label %562

; <label>:562                                     ; preds = %557
  %563 = getelementptr inbounds %struct.CPUX86State* %541, i64 0, i32 6
  %564 = load i32* %563, align 4
  %565 = and i32 %564, 131072
  %566 = icmp eq i32 %565, 0
  br i1 %566, label %567, label %570

; <label>:567                                     ; preds = %562
  %568 = and i32 %.pre.i19.i, 16
  %569 = icmp eq i32 %568, 0
  br i1 %569, label %570, label %572

; <label>:570                                     ; preds = %567, %562, %557
  %571 = or i32 %554, 64
  br label %585

; <label>:572                                     ; preds = %567
  %573 = getelementptr inbounds %struct.CPUX86State* %541, i64 0, i32 9, i64 3, i32 1
  %574 = load i32* %573, align 4
  %575 = getelementptr inbounds %struct.CPUX86State* %541, i64 0, i32 9, i64 0, i32 1
  %576 = load i32* %575, align 4
  %577 = getelementptr inbounds %struct.CPUX86State* %541, i64 0, i32 9, i64 2, i32 1
  %578 = load i32* %577, align 4
  %579 = or i32 %576, %574
  %580 = or i32 %579, %578
  %581 = icmp ne i32 %580, 0
  %582 = zext i1 %581 to i32
  %583 = shl nuw nsw i32 %582, 6
  %584 = or i32 %583, %554
  br label %585

; <label>:585                                     ; preds = %572, %570, %550
  %new_hflags.0.i20.i = phi i32 [ %554, %550 ], [ %571, %570 ], [ %584, %572 ]
  %586 = and i32 %.pre.i19.i, -97
  %587 = or i32 %new_hflags.0.i20.i, %586
  store i32 %587, i32* %.phi.trans.insert.i18.i, align 4
  %588 = load %struct.CPUX86State** @env, align 8
  %589 = getelementptr inbounds %struct.CPUX86State* %588, i64 0, i32 9, i64 5, i32 0
  %.phi.trans.insert.i22.i = getelementptr inbounds %struct.CPUX86State* %588, i64 0, i32 7
  %590 = bitcast i32* %589 to i8*
  br label %591

; <label>:591                                     ; preds = %594, %585
  %592 = phi i64 [ 0, %585 ], [ %596, %594 ]
  %593 = icmp ult i64 %592, 16
  br i1 %593, label %594, label %597

; <label>:594                                     ; preds = %591
  %595 = getelementptr i8* %590, i64 %592
  store i8 0, i8* %595, align 1
  %596 = add i64 %592, 1
  br label %591

; <label>:597                                     ; preds = %591
  %.pre.i23.i = load i32* %.phi.trans.insert.i22.i, align 4
  %598 = getelementptr inbounds %struct.CPUX86State* %588, i64 0, i32 9, i64 2, i32 3
  %599 = load i32* %598, align 4
  %600 = lshr i32 %599, 17
  %601 = and i32 %600, 32
  %602 = and i32 %.pre.i23.i, 32768
  %603 = icmp eq i32 %602, 0
  br i1 %603, label %604, label %cpu_x86_load_seg_cache.exit25.i

; <label>:604                                     ; preds = %597
  %605 = getelementptr inbounds %struct.CPUX86State* %588, i64 0, i32 14, i64 0
  %606 = load i32* %605, align 4
  %607 = and i32 %606, 1
  %608 = icmp eq i32 %607, 0
  br i1 %608, label %617, label %609

; <label>:609                                     ; preds = %604
  %610 = getelementptr inbounds %struct.CPUX86State* %588, i64 0, i32 6
  %611 = load i32* %610, align 4
  %612 = and i32 %611, 131072
  %613 = icmp eq i32 %612, 0
  br i1 %613, label %614, label %617

; <label>:614                                     ; preds = %609
  %615 = and i32 %.pre.i23.i, 16
  %616 = icmp eq i32 %615, 0
  br i1 %616, label %617, label %619

; <label>:617                                     ; preds = %614, %609, %604
  %618 = or i32 %601, 64
  br label %cpu_x86_load_seg_cache.exit25.i

; <label>:619                                     ; preds = %614
  %620 = getelementptr inbounds %struct.CPUX86State* %588, i64 0, i32 9, i64 3, i32 1
  %621 = load i32* %620, align 4
  %622 = getelementptr inbounds %struct.CPUX86State* %588, i64 0, i32 9, i64 0, i32 1
  %623 = load i32* %622, align 4
  %624 = getelementptr inbounds %struct.CPUX86State* %588, i64 0, i32 9, i64 2, i32 1
  %625 = load i32* %624, align 4
  %626 = or i32 %623, %621
  %627 = or i32 %626, %625
  %628 = icmp ne i32 %627, 0
  %629 = zext i1 %628 to i32
  %630 = shl nuw nsw i32 %629, 6
  %631 = or i32 %630, %601
  br label %cpu_x86_load_seg_cache.exit25.i

cpu_x86_load_seg_cache.exit25.i:                  ; preds = %619, %617, %597
  %new_hflags.0.i24.i = phi i32 [ %601, %597 ], [ %618, %617 ], [ %631, %619 ]
  %632 = and i32 %.pre.i23.i, -97
  %633 = or i32 %new_hflags.0.i24.i, %632
  store i32 %633, i32* %.phi.trans.insert.i22.i, align 4
  %.pre38.i = load %struct.CPUX86State** @env, align 8
  br label %634

; <label>:634                                     ; preds = %cpu_x86_load_seg_cache.exit25.i, %472
  %635 = phi %struct.CPUX86State* [ %473, %472 ], [ %.pre38.i, %cpu_x86_load_seg_cache.exit25.i ]
  %636 = and i32 %storemerge.i34.i, -4
  %637 = or i32 %636, %dpl.0.i
  %638 = and i32 %317, 983040
  %639 = or i32 %638, %318
  %640 = and i32 %317, 8388608
  %641 = icmp eq i32 %640, 0
  br i1 %641, label %645, label %642

; <label>:642                                     ; preds = %634
  %643 = shl nuw i32 %639, 12
  %644 = or i32 %643, 4095
  br label %645

; <label>:645                                     ; preds = %642, %634
  %limit.0.i.i = phi i32 [ %644, %642 ], [ %639, %634 ]
  %646 = getelementptr inbounds %struct.CPUX86State* %635, i64 0, i32 9, i64 2, i32 0
  store i32 %637, i32* %646, align 4
  %647 = getelementptr inbounds %struct.CPUX86State* %635, i64 0, i32 9, i64 2, i32 1
  store i32 %320, i32* %647, align 4
  %648 = getelementptr inbounds %struct.CPUX86State* %635, i64 0, i32 9, i64 2, i32 2
  store i32 %limit.0.i.i, i32* %648, align 4
  %649 = getelementptr inbounds %struct.CPUX86State* %635, i64 0, i32 9, i64 2, i32 3
  store i32 %317, i32* %649, align 4
  %.phi.trans.insert.i26.i = getelementptr inbounds %struct.CPUX86State* %635, i64 0, i32 7
  %.pre.i27.i = load i32* %.phi.trans.insert.i26.i, align 4
  %650 = lshr i32 %317, 17
  %651 = and i32 %650, 32
  %652 = and i32 %.pre.i27.i, 32768
  %653 = icmp eq i32 %652, 0
  br i1 %653, label %654, label %cpu_x86_load_seg_cache.exit29.i

; <label>:654                                     ; preds = %645
  %655 = getelementptr inbounds %struct.CPUX86State* %635, i64 0, i32 14, i64 0
  %656 = load i32* %655, align 4
  %657 = and i32 %656, 1
  %658 = icmp eq i32 %657, 0
  br i1 %658, label %667, label %659

; <label>:659                                     ; preds = %654
  %660 = getelementptr inbounds %struct.CPUX86State* %635, i64 0, i32 6
  %661 = load i32* %660, align 4
  %662 = and i32 %661, 131072
  %663 = icmp eq i32 %662, 0
  br i1 %663, label %664, label %667

; <label>:664                                     ; preds = %659
  %665 = and i32 %.pre.i27.i, 16
  %666 = icmp eq i32 %665, 0
  br i1 %666, label %667, label %669

; <label>:667                                     ; preds = %664, %659, %654
  %668 = or i32 %651, 64
  br label %cpu_x86_load_seg_cache.exit29.i

; <label>:669                                     ; preds = %664
  %670 = getelementptr inbounds %struct.CPUX86State* %635, i64 0, i32 9, i64 3, i32 1
  %671 = load i32* %670, align 4
  %672 = getelementptr inbounds %struct.CPUX86State* %635, i64 0, i32 9, i64 0, i32 1
  %673 = load i32* %672, align 4
  %674 = or i32 %671, %320
  %675 = or i32 %674, %673
  %676 = icmp ne i32 %675, 0
  %677 = zext i1 %676 to i32
  %678 = shl nuw nsw i32 %677, 6
  %679 = or i32 %678, %651
  br label %cpu_x86_load_seg_cache.exit29.i

cpu_x86_load_seg_cache.exit29.i:                  ; preds = %669, %667, %645
  %new_hflags.0.i28.i = phi i32 [ %651, %645 ], [ %668, %667 ], [ %679, %669 ]
  %680 = and i32 %.pre.i27.i, -97
  %681 = or i32 %new_hflags.0.i28.i, %680
  store i32 %681, i32* %.phi.trans.insert.i26.i, align 4
  br label %682

; <label>:682                                     ; preds = %cpu_x86_load_seg_cache.exit29.i, %470
  %683 = load %struct.CPUX86State** @env, align 8
  %684 = getelementptr inbounds %struct.CPUX86State* %683, i64 0, i32 0, i64 4
  %685 = load i32* %684, align 4
  %686 = sub i32 0, %sp_mask.0.in.i
  %687 = and i32 %685, %686
  %688 = and i32 %471, %sp_mask.0.i
  %689 = or i32 %687, %688
  store i32 %689, i32* %684, align 4
  %690 = or i32 %dpl.0.i, %167
  %691 = load %struct.CPUX86State** @env, align 8
  %692 = lshr i32 %185, 16
  %693 = shl i32 %187, 16
  %694 = and i32 %693, 16711680
  %695 = and i32 %187, -16777216
  %696 = or i32 %695, %692
  %697 = or i32 %696, %694
  %698 = and i32 %185, 65535
  %699 = and i32 %187, 983040
  %700 = or i32 %699, %698
  %701 = and i32 %187, 8388608
  %702 = icmp eq i32 %701, 0
  br i1 %702, label %706, label %703

; <label>:703                                     ; preds = %682
  %704 = shl nuw i32 %700, 12
  %705 = or i32 %704, 4095
  br label %706

; <label>:706                                     ; preds = %703, %682
  %limit.0.i32.i = phi i32 [ %705, %703 ], [ %700, %682 ]
  %707 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 9, i64 1, i32 0
  store i32 %690, i32* %707, align 4
  %708 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 9, i64 1, i32 1
  store i32 %697, i32* %708, align 4
  %709 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 9, i64 1, i32 2
  store i32 %limit.0.i32.i, i32* %709, align 4
  %710 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 9, i64 1, i32 3
  store i32 %187, i32* %710, align 4
  %711 = lshr i32 %187, 18
  %712 = and i32 %711, 16
  %713 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 7
  %714 = load i32* %713, align 4
  %715 = and i32 %714, -32785
  %716 = or i32 %715, %712
  store i32 %716, i32* %713, align 4
  %717 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 9, i64 2, i32 3
  %718 = load i32* %717, align 4
  %719 = lshr i32 %718, 17
  %720 = and i32 %719, 32
  %721 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 14, i64 0
  %722 = load i32* %721, align 4
  %723 = and i32 %722, 1
  %724 = icmp eq i32 %723, 0
  br i1 %724, label %731, label %725

; <label>:725                                     ; preds = %706
  %726 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 6
  %727 = load i32* %726, align 4
  %728 = and i32 %727, 131072
  %729 = icmp ne i32 %728, 0
  %730 = icmp eq i32 %712, 0
  %or.cond37.i = or i1 %729, %730
  br i1 %or.cond37.i, label %731, label %733

; <label>:731                                     ; preds = %725, %706
  %732 = or i32 %720, 64
  br label %cpu_x86_load_seg_cache.exit31.i

; <label>:733                                     ; preds = %725
  %734 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 9, i64 3, i32 1
  %735 = load i32* %734, align 4
  %736 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 9, i64 0, i32 1
  %737 = load i32* %736, align 4
  %738 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 9, i64 2, i32 1
  %739 = load i32* %738, align 4
  %740 = or i32 %737, %735
  %741 = or i32 %740, %739
  %742 = icmp ne i32 %741, 0
  %743 = zext i1 %742 to i32
  %744 = shl nuw nsw i32 %743, 6
  %745 = or i32 %744, %720
  br label %cpu_x86_load_seg_cache.exit31.i

cpu_x86_load_seg_cache.exit31.i:                  ; preds = %733, %731
  %new_hflags.0.i30.i = phi i32 [ %732, %731 ], [ %745, %733 ]
  %746 = and i32 %716, -32865
  %747 = or i32 %new_hflags.0.i30.i, %746
  store i32 %747, i32* %713, align 4
  %748 = load %struct.CPUX86State** @env, align 8
  %749 = getelementptr inbounds %struct.CPUX86State* %748, i64 0, i32 7
  %750 = load i32* %749, align 4
  %751 = and i32 %750, 3
  tail call void @s2e_on_privilege_change(i32 %751, i32 %dpl.0.i) nounwind
  %752 = load i32* %749, align 4
  %753 = and i32 %752, -4
  %754 = or i32 %753, %dpl.0.i
  store i32 %754, i32* %749, align 4
  %755 = load %struct.CPUX86State** @env, align 8
  %756 = getelementptr inbounds %struct.CPUX86State* %755, i64 0, i32 4
  store i32 %166, i32* %756, align 4
  %757 = and i32 %105, 1
  %758 = icmp eq i32 %757, 0
  br i1 %758, label %759, label %764

; <label>:759                                     ; preds = %cpu_x86_load_seg_cache.exit31.i
  %760 = load %struct.CPUX86State** @env, align 8
  %761 = getelementptr inbounds %struct.CPUX86State* %760, i64 0, i32 6
  %762 = load i32* %761, align 4
  %763 = and i32 %762, -513
  store i32 %763, i32* %761, align 4
  br label %764

; <label>:764                                     ; preds = %759, %cpu_x86_load_seg_cache.exit31.i
  %765 = load %struct.CPUX86State** @env, align 8
  %766 = getelementptr inbounds %struct.CPUX86State* %765, i64 0, i32 6
  %767 = load i32* %766, align 4
  %768 = and i32 %767, -213249
  store i32 %768, i32* %766, align 4
  br label %do_interrupt_protected.exit

; <label>:769                                     ; preds = %._crit_edge
  br i1 %62, label %770, label %handle_even_inj.exit4

; <label>:770                                     ; preds = %769
  %771 = getelementptr inbounds %struct.CPUX86State* %54, i64 0, i32 40
  %772 = load i64* %771, align 8
  %773 = add i64 %772, 168
  %774 = tail call i32 @ldl_phys(i64 %773) nounwind
  %775 = icmp slt i32 %774, 0
  br i1 %775, label %handle_even_inj.exit4, label %exeption_has_error_code.exit.thread.i3

exeption_has_error_code.exit.thread.i3:           ; preds = %770
  %776 = icmp eq i32 %is_int, 0
  %..i1 = select i1 %776, i32 768, i32 1024
  %777 = or i32 %..i1, %intno
  %778 = or i32 %777, -2147483648
  %779 = load %struct.CPUX86State** @env, align 8
  %780 = getelementptr inbounds %struct.CPUX86State* %779, i64 0, i32 40
  %781 = load i64* %780, align 8
  %782 = add i64 %781, 168
  tail call void @stl_phys(i64 %782, i32 %778) nounwind
  br label %handle_even_inj.exit4

handle_even_inj.exit4:                            ; preds = %exeption_has_error_code.exit.thread.i3, %770, %769
  %783 = load %struct.CPUX86State** @env, align 8
  %784 = shl nsw i32 %intno, 2
  %785 = or i32 %784, 3
  %786 = getelementptr inbounds %struct.CPUX86State* %783, i64 0, i32 13, i32 2
  %787 = load i32* %786, align 4
  %788 = icmp ugt i32 %785, %787
  br i1 %788, label %789, label %792

; <label>:789                                     ; preds = %handle_even_inj.exit4
  %790 = shl nsw i32 %intno, 3
  %791 = or i32 %790, 2
  tail call fastcc void @raise_exception_err(i32 13, i32 %791) noreturn nounwind
  unreachable

; <label>:792                                     ; preds = %handle_even_inj.exit4
  %793 = getelementptr inbounds %struct.CPUX86State* %783, i64 0, i32 13, i32 1
  %794 = load i32* %793, align 4
  %795 = add i32 %794, %784
  %796 = tail call fastcc i32 @lduw_kernel(i32 %795) nounwind
  %797 = add i32 %795, 2
  %798 = tail call fastcc i32 @lduw_kernel(i32 %797) nounwind
  %799 = load %struct.CPUX86State** @env, align 8
  %800 = getelementptr inbounds %struct.CPUX86State* %799, i64 0, i32 0, i64 4
  %801 = load i32* %800, align 4
  %802 = getelementptr inbounds %struct.CPUX86State* %799, i64 0, i32 9, i64 2, i32 1
  %803 = load i32* %802, align 4
  %804 = icmp eq i32 %is_int, 0
  br i1 %804, label %805, label %do_interrupt_real.exit

; <label>:805                                     ; preds = %792
  %806 = getelementptr inbounds %struct.CPUX86State* %799, i64 0, i32 4
  %807 = load i32* %806, align 4
  br label %do_interrupt_real.exit

do_interrupt_real.exit:                           ; preds = %805, %792
  %old_eip.0.i5 = phi i32 [ %807, %805 ], [ %next_eip, %792 ]
  %808 = getelementptr inbounds %struct.CPUX86State* %799, i64 0, i32 9, i64 1, i32 0
  %809 = load i32* %808, align 4
  %810 = add i32 %801, 65534
  %811 = and i32 %810, 65535
  %812 = add i32 %811, %803
  %813 = getelementptr inbounds %struct.CPUX86State* %799, i64 0, i32 6
  %814 = load i32* %813, align 4
  %815 = getelementptr inbounds %struct.CPUX86State* %799, i64 0, i32 3
  %816 = load i32* %815, align 4
  %817 = tail call i32 @helper_cc_compute_all(i32 %816) nounwind
  %818 = getelementptr inbounds %struct.CPUX86State* %799, i64 0, i32 5
  %819 = load i32* %818, align 4
  %820 = and i32 %819, 1024
  %821 = or i32 %817, %814
  %822 = or i32 %821, %820
  tail call fastcc void @stw_kernel(i32 %812, i32 %822) nounwind
  %823 = add i32 %801, 65532
  %824 = and i32 %823, 65535
  %825 = add i32 %824, %803
  tail call fastcc void @stw_kernel(i32 %825, i32 %809) nounwind
  %826 = add i32 %801, 65530
  %827 = and i32 %826, 65535
  %828 = add i32 %827, %803
  tail call fastcc void @stw_kernel(i32 %828, i32 %old_eip.0.i5) nounwind
  %829 = load %struct.CPUX86State** @env, align 8
  %830 = getelementptr inbounds %struct.CPUX86State* %829, i64 0, i32 0, i64 4
  %831 = load i32* %830, align 4
  %832 = and i32 %831, -65536
  %833 = or i32 %832, %827
  store i32 %833, i32* %830, align 4
  %834 = load %struct.CPUX86State** @env, align 8
  %835 = getelementptr inbounds %struct.CPUX86State* %834, i64 0, i32 4
  store i32 %796, i32* %835, align 4
  %836 = load %struct.CPUX86State** @env, align 8
  %837 = getelementptr inbounds %struct.CPUX86State* %836, i64 0, i32 9, i64 1, i32 0
  store i32 %798, i32* %837, align 4
  %838 = shl i32 %798, 4
  %839 = load %struct.CPUX86State** @env, align 8
  %840 = getelementptr inbounds %struct.CPUX86State* %839, i64 0, i32 9, i64 1, i32 1
  store i32 %838, i32* %840, align 4
  %841 = load %struct.CPUX86State** @env, align 8
  %842 = getelementptr inbounds %struct.CPUX86State* %841, i64 0, i32 6
  %843 = load i32* %842, align 4
  %844 = and i32 %843, -328449
  store i32 %844, i32* %842, align 4
  br label %do_interrupt_protected.exit

do_interrupt_protected.exit:                      ; preds = %do_interrupt_real.exit, %764, %137, %112
  %845 = load %struct.CPUX86State** @env, align 8
  %846 = getelementptr inbounds %struct.CPUX86State* %845, i64 0, i32 7
  %847 = load i32* %846, align 4
  %848 = and i32 %847, 2097152
  %849 = icmp eq i32 %848, 0
  br i1 %849, label %860, label %850

; <label>:850                                     ; preds = %do_interrupt_protected.exit
  %851 = getelementptr inbounds %struct.CPUX86State* %845, i64 0, i32 40
  %852 = load i64* %851, align 8
  %853 = add i64 %852, 168
  %854 = tail call i32 @ldl_phys(i64 %853) nounwind
  %855 = load %struct.CPUX86State** @env, align 8
  %856 = getelementptr inbounds %struct.CPUX86State* %855, i64 0, i32 40
  %857 = load i64* %856, align 8
  %858 = add i64 %857, 168
  %859 = and i32 %854, 2147483647
  tail call void @stl_phys(i64 %858, i32 %859) nounwind
  br label %860

; <label>:860                                     ; preds = %850, %do_interrupt_protected.exit
  ret void
}

declare i32 @__fprintf_chk(%struct._IO_FILE*, i32, i8*, ...)

declare i32 @ldl_phys(i64)

declare void @stl_phys(i64, i32)

define void @do_interrupt(%struct.CPUX86State* %env1) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  store %struct.CPUX86State* %env1, %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %env1, i64 0, i32 93
  %3 = load i32* %2, align 4
  %4 = getelementptr inbounds %struct.CPUX86State* %env1, i64 0, i32 57
  %5 = load i32* %4, align 4
  %6 = getelementptr inbounds %struct.CPUX86State* %env1, i64 0, i32 56
  %7 = load i32* %6, align 4
  %8 = getelementptr inbounds %struct.CPUX86State* %env1, i64 0, i32 58
  %9 = load i32* %8, align 4
  tail call void @do_interrupt_all(i32 %3, i32 %5, i32 %7, i32 %9, i32 0) nounwind
  %10 = load %struct.CPUX86State** @env, align 8
  %11 = getelementptr inbounds %struct.CPUX86State* %10, i64 0, i32 62
  store i32 -1, i32* %11, align 4
  store %struct.CPUX86State* %1, %struct.CPUX86State** @env, align 8
  ret void
}

declare void @do_interrupt_all(i32, i32, i32, i32, i32)

define void @do_interrupt_x86_hardirq(%struct.CPUX86State* %env1, i32 %intno, i32 %is_hw) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  store %struct.CPUX86State* %env1, %struct.CPUX86State** @env, align 8
  tail call void @do_interrupt_all(i32 %intno, i32 0, i32 0, i32 0, i32 %is_hw) nounwind
  store %struct.CPUX86State* %1, %struct.CPUX86State** @env, align 8
  ret void
}

define void @raise_exception_err_env(%struct.CPUX86State* %nenv, i32 %exception_index, i32 %error_code) noreturn nounwind uwtable sspreq {
  store %struct.CPUX86State* %nenv, %struct.CPUX86State** @env, align 8
  tail call fastcc void @raise_interrupt(i32 %exception_index, i32 0, i32 %error_code, i32 0) noreturn
  unreachable
}

define internal fastcc void @raise_interrupt(i32 %intno, i32 %is_int, i32 %error_code, i32 %next_eip_addend) noreturn nounwind uwtable sspreq {
  %1 = icmp eq i32 %is_int, 0
  br i1 %1, label %2, label %55

; <label>:2                                       ; preds = %0
  %3 = add nsw i32 %intno, 64
  %4 = sext i32 %error_code to i64
  tail call void @helper_svm_check_intercept_param(i32 %3, i64 %4)
  %5 = load %struct.CPUX86State** @env, align 8
  %6 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 62
  %7 = load i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %2
  %10 = icmp sgt i32 %7, 9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %9
  %phitmp.i = icmp sgt i32 %7, 13
  br label %12

; <label>:12                                      ; preds = %11, %9, %2
  %13 = phi i1 [ false, %2 ], [ true, %9 ], [ %phitmp.i, %11 ]
  %14 = icmp eq i32 %intno, 0
  br i1 %14, label %19, label %15

; <label>:15                                      ; preds = %12
  %16 = icmp sgt i32 %intno, 9
  br i1 %16, label %17, label %19

; <label>:17                                      ; preds = %15
  %18 = icmp slt i32 %intno, 14
  br label %19

; <label>:19                                      ; preds = %17, %15, %12
  %20 = phi i1 [ true, %12 ], [ false, %15 ], [ %18, %17 ]
  %21 = load i32* @loglevel, align 4
  %22 = and i32 %21, 16
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %27, label %24

; <label>:24                                      ; preds = %19
  %25 = load %struct._IO_FILE** @logfile, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %25, i32 1, i8* getelementptr inbounds ([36 x i8]* @.str22, i64 0, i64 0), i32 %7, i32 %intno) nounwind
  %.pre.i = load %struct.CPUX86State** @env, align 8
  %.phi.trans.insert.i = getelementptr inbounds %struct.CPUX86State* %.pre.i, i64 0, i32 62
  %.pre5.i = load i32* %.phi.trans.insert.i, align 4
  br label %27

; <label>:27                                      ; preds = %24, %19
  %28 = phi i32 [ %7, %19 ], [ %.pre5.i, %24 ]
  %29 = phi %struct.CPUX86State* [ %5, %19 ], [ %.pre.i, %24 ]
  %30 = icmp eq i32 %28, 8
  br i1 %30, label %31, label %45

; <label>:31                                      ; preds = %27
  %32 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 7
  %33 = load i32* %32, align 4
  %34 = and i32 %33, 2097152
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %37, label %36

; <label>:36                                      ; preds = %31
  tail call void @helper_vmexit(i32 127, i64 0) nounwind
  unreachable

; <label>:37                                      ; preds = %31
  %38 = load i32* @loglevel, align 4
  %39 = and i32 %38, 512
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %44, label %41

; <label>:41                                      ; preds = %37
  %42 = load %struct._IO_FILE** @logfile, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %42, i32 1, i8* getelementptr inbounds ([14 x i8]* @.str23, i64 0, i64 0)) nounwind
  br label %44

; <label>:44                                      ; preds = %41, %37
  tail call void @qemu_system_reset_request() nounwind
  br label %check_exception.exit

; <label>:45                                      ; preds = %27
  %.not3.i = xor i1 %20, true
  %brmerge.i = or i1 %13, %.not3.i
  br i1 %brmerge.i, label %46, label %50

; <label>:46                                      ; preds = %45
  %47 = icmp eq i32 %28, 14
  br i1 %47, label %48, label %51

; <label>:48                                      ; preds = %46
  %49 = icmp eq i32 %intno, 14
  %or.cond4.i = or i1 %20, %49
  br i1 %or.cond4.i, label %50, label %51

; <label>:50                                      ; preds = %48, %45
  br label %51

; <label>:51                                      ; preds = %50, %48, %46
  %52 = phi i32 [ 0, %50 ], [ %error_code, %46 ], [ %error_code, %48 ]
  %.02.i = phi i32 [ 8, %50 ], [ %intno, %46 ], [ %intno, %48 ]
  br i1 %20, label %._crit_edge.i, label %53

; <label>:53                                      ; preds = %51
  switch i32 %.02.i, label %check_exception.exit [
    i32 14, label %._crit_edge.i
    i32 8, label %._crit_edge.i
  ]

._crit_edge.i:                                    ; preds = %53, %53, %51
  %54 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 62
  store i32 %.02.i, i32* %54, align 4
  br label %check_exception.exit

; <label>:55                                      ; preds = %0
  %56 = load %struct.CPUX86State** @env, align 8
  %57 = getelementptr inbounds %struct.CPUX86State* %56, i64 0, i32 7
  %58 = load i32* %57, align 4
  %.lobit.i = and i32 %58, 2097152
  %59 = icmp eq i32 %.lobit.i, 0
  br i1 %59, label %check_exception.exit, label %60, !prof !0

; <label>:60                                      ; preds = %55
  %61 = getelementptr inbounds %struct.CPUX86State* %56, i64 0, i32 42
  %62 = load i64* %61, align 8
  %63 = and i64 %62, 2097152
  %64 = icmp eq i64 %63, 0
  br i1 %64, label %check_exception.exit, label %65

; <label>:65                                      ; preds = %60
  tail call void @helper_vmexit(i32 117, i64 0) nounwind
  unreachable

check_exception.exit:                             ; preds = %60, %55, %._crit_edge.i, %53, %44
  %66 = phi i32 [ %error_code, %44 ], [ %52, %53 ], [ %52, %._crit_edge.i ], [ %error_code, %55 ], [ %error_code, %60 ]
  %.0 = phi i32 [ 65537, %44 ], [ %.02.i, %53 ], [ %.02.i, %._crit_edge.i ], [ %intno, %55 ], [ %intno, %60 ]
  %67 = load %struct.CPUX86State** @env, align 8
  %68 = getelementptr inbounds %struct.CPUX86State* %67, i64 0, i32 93
  store i32 %.0, i32* %68, align 4
  %69 = load %struct.CPUX86State** @env, align 8
  %70 = getelementptr inbounds %struct.CPUX86State* %69, i64 0, i32 56
  store i32 %66, i32* %70, align 4
  %71 = load %struct.CPUX86State** @env, align 8
  %72 = getelementptr inbounds %struct.CPUX86State* %71, i64 0, i32 57
  store i32 %is_int, i32* %72, align 4
  %73 = load %struct.CPUX86State** @env, align 8
  %74 = getelementptr inbounds %struct.CPUX86State* %73, i64 0, i32 4
  %75 = load i32* %74, align 4
  %76 = add i32 %75, %next_eip_addend
  %77 = getelementptr inbounds %struct.CPUX86State* %73, i64 0, i32 58
  store i32 %76, i32* %77, align 4
  %78 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_loop_exit(%struct.CPUX86State* %78) noreturn nounwind
  unreachable
}

define void @raise_exception_env(i32 %exception_index, %struct.CPUX86State* %nenv) noreturn nounwind uwtable sspreq {
  store %struct.CPUX86State* %nenv, %struct.CPUX86State** @env, align 8
  tail call fastcc void @raise_exception(i32 %exception_index) noreturn
  unreachable
}

define internal fastcc void @raise_exception(i32 %exception_index) noreturn nounwind uwtable sspreq {
  tail call fastcc void @raise_interrupt(i32 %exception_index, i32 0, i32 0, i32 0) noreturn
  unreachable
}

define void @do_smm_enter(%struct.CPUX86State* %env1) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  store %struct.CPUX86State* %env1, %struct.CPUX86State** @env, align 8
  %2 = load i32* @loglevel, align 4
  %3 = and i32 %2, 16
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load %struct._IO_FILE** @logfile, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %6, i32 1, i8* getelementptr inbounds ([12 x i8]* @.str7, i64 0, i64 0)) nounwind
  %.pre = load i32* @loglevel, align 4
  br label %8

; <label>:8                                       ; preds = %5, %0
  %9 = phi i32 [ %2, %0 ], [ %.pre, %5 ]
  %10 = and i32 %9, 16
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %._crit_edge, label %12

; <label>:12                                      ; preds = %8
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = load %struct._IO_FILE** @logfile, align 8
  tail call void @cpu_dump_state(%struct.CPUX86State* %13, %struct._IO_FILE* %14, i32 (%struct._IO_FILE*, i8*, ...)* @fprintf, i32 2) nounwind
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %12
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 7
  %17 = load i32* %16, align 4
  %18 = or i32 %17, 524288
  store i32 %18, i32* %16, align 4
  %19 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_smm_update(%struct.CPUX86State* %19) nounwind
  %20 = load %struct.CPUX86State** @env, align 8
  %21 = getelementptr inbounds %struct.CPUX86State* %20, i64 0, i32 61
  %22 = load i32* %21, align 4
  %23 = add i32 %22, 65532
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds %struct.CPUX86State* %20, i64 0, i32 14, i64 0
  %26 = load i32* %25, align 4
  tail call void @stl_phys(i64 %24, i32 %26) nounwind
  %27 = add i32 %22, 65528
  %28 = zext i32 %27 to i64
  %29 = load %struct.CPUX86State** @env, align 8
  %30 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 14, i64 3
  %31 = load i32* %30, align 4
  tail call void @stl_phys(i64 %28, i32 %31) nounwind
  %32 = add i32 %22, 65524
  %33 = zext i32 %32 to i64
  %34 = load %struct.CPUX86State** @env, align 8
  %35 = getelementptr inbounds %struct.CPUX86State* %34, i64 0, i32 6
  %36 = load i32* %35, align 4
  %37 = getelementptr inbounds %struct.CPUX86State* %34, i64 0, i32 3
  %38 = load i32* %37, align 4
  %39 = tail call i32 @helper_cc_compute_all(i32 %38) nounwind
  %40 = getelementptr inbounds %struct.CPUX86State* %34, i64 0, i32 5
  %41 = load i32* %40, align 4
  %42 = and i32 %41, 1024
  %43 = or i32 %39, %36
  %44 = or i32 %43, %42
  tail call void @stl_phys(i64 %33, i32 %44) nounwind
  %45 = add i32 %22, 65520
  %46 = zext i32 %45 to i64
  %47 = load %struct.CPUX86State** @env, align 8
  %48 = getelementptr inbounds %struct.CPUX86State* %47, i64 0, i32 4
  %49 = load i32* %48, align 4
  tail call void @stl_phys(i64 %46, i32 %49) nounwind
  %50 = add i32 %22, 65516
  %51 = zext i32 %50 to i64
  %52 = load %struct.CPUX86State** @env, align 8
  %53 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 0, i64 7
  %54 = load i32* %53, align 4
  tail call void @stl_phys(i64 %51, i32 %54) nounwind
  %55 = add i32 %22, 65512
  %56 = zext i32 %55 to i64
  %57 = load %struct.CPUX86State** @env, align 8
  %58 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 0, i64 6
  %59 = load i32* %58, align 4
  tail call void @stl_phys(i64 %56, i32 %59) nounwind
  %60 = add i32 %22, 65508
  %61 = zext i32 %60 to i64
  %62 = load %struct.CPUX86State** @env, align 8
  %63 = getelementptr inbounds %struct.CPUX86State* %62, i64 0, i32 0, i64 5
  %64 = load i32* %63, align 4
  tail call void @stl_phys(i64 %61, i32 %64) nounwind
  %65 = add i32 %22, 65504
  %66 = zext i32 %65 to i64
  %67 = load %struct.CPUX86State** @env, align 8
  %68 = getelementptr inbounds %struct.CPUX86State* %67, i64 0, i32 0, i64 4
  %69 = load i32* %68, align 4
  tail call void @stl_phys(i64 %66, i32 %69) nounwind
  %70 = add i32 %22, 65500
  %71 = zext i32 %70 to i64
  %72 = load %struct.CPUX86State** @env, align 8
  %73 = getelementptr inbounds %struct.CPUX86State* %72, i64 0, i32 0, i64 3
  %74 = load i32* %73, align 4
  tail call void @stl_phys(i64 %71, i32 %74) nounwind
  %75 = add i32 %22, 65496
  %76 = zext i32 %75 to i64
  %77 = load %struct.CPUX86State** @env, align 8
  %78 = getelementptr inbounds %struct.CPUX86State* %77, i64 0, i32 0, i64 2
  %79 = load i32* %78, align 4
  tail call void @stl_phys(i64 %76, i32 %79) nounwind
  %80 = add i32 %22, 65492
  %81 = zext i32 %80 to i64
  %82 = load %struct.CPUX86State** @env, align 8
  %83 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 0, i64 1
  %84 = load i32* %83, align 4
  tail call void @stl_phys(i64 %81, i32 %84) nounwind
  %85 = add i32 %22, 65488
  %86 = zext i32 %85 to i64
  %87 = load %struct.CPUX86State** @env, align 8
  %88 = getelementptr inbounds %struct.CPUX86State* %87, i64 0, i32 0, i64 0
  %89 = load i32* %88, align 4
  tail call void @stl_phys(i64 %86, i32 %89) nounwind
  %90 = add i32 %22, 65484
  %91 = zext i32 %90 to i64
  %92 = load %struct.CPUX86State** @env, align 8
  %93 = getelementptr inbounds %struct.CPUX86State* %92, i64 0, i32 59, i64 6
  %94 = load i32* %93, align 4
  tail call void @stl_phys(i64 %91, i32 %94) nounwind
  %95 = add i32 %22, 65480
  %96 = zext i32 %95 to i64
  %97 = load %struct.CPUX86State** @env, align 8
  %98 = getelementptr inbounds %struct.CPUX86State* %97, i64 0, i32 59, i64 7
  %99 = load i32* %98, align 4
  tail call void @stl_phys(i64 %96, i32 %99) nounwind
  %100 = add i32 %22, 65476
  %101 = zext i32 %100 to i64
  %102 = load %struct.CPUX86State** @env, align 8
  %103 = getelementptr inbounds %struct.CPUX86State* %102, i64 0, i32 11, i32 0
  %104 = load i32* %103, align 4
  tail call void @stl_phys(i64 %101, i32 %104) nounwind
  %105 = add i32 %22, 65380
  %106 = zext i32 %105 to i64
  %107 = load %struct.CPUX86State** @env, align 8
  %108 = getelementptr inbounds %struct.CPUX86State* %107, i64 0, i32 11, i32 1
  %109 = load i32* %108, align 4
  tail call void @stl_phys(i64 %106, i32 %109) nounwind
  %110 = add i32 %22, 65376
  %111 = zext i32 %110 to i64
  %112 = load %struct.CPUX86State** @env, align 8
  %113 = getelementptr inbounds %struct.CPUX86State* %112, i64 0, i32 11, i32 2
  %114 = load i32* %113, align 4
  tail call void @stl_phys(i64 %111, i32 %114) nounwind
  %115 = add i32 %22, 65372
  %116 = zext i32 %115 to i64
  %117 = load %struct.CPUX86State** @env, align 8
  %118 = getelementptr inbounds %struct.CPUX86State* %117, i64 0, i32 11, i32 3
  %119 = load i32* %118, align 4
  %120 = lshr i32 %119, 8
  %121 = and i32 %120, 61695
  tail call void @stl_phys(i64 %116, i32 %121) nounwind
  %122 = add i32 %22, 65472
  %123 = zext i32 %122 to i64
  %124 = load %struct.CPUX86State** @env, align 8
  %125 = getelementptr inbounds %struct.CPUX86State* %124, i64 0, i32 10, i32 0
  %126 = load i32* %125, align 4
  tail call void @stl_phys(i64 %123, i32 %126) nounwind
  %127 = add i32 %22, 65408
  %128 = zext i32 %127 to i64
  %129 = load %struct.CPUX86State** @env, align 8
  %130 = getelementptr inbounds %struct.CPUX86State* %129, i64 0, i32 10, i32 1
  %131 = load i32* %130, align 4
  tail call void @stl_phys(i64 %128, i32 %131) nounwind
  %132 = add i32 %22, 65404
  %133 = zext i32 %132 to i64
  %134 = load %struct.CPUX86State** @env, align 8
  %135 = getelementptr inbounds %struct.CPUX86State* %134, i64 0, i32 10, i32 2
  %136 = load i32* %135, align 4
  tail call void @stl_phys(i64 %133, i32 %136) nounwind
  %137 = add i32 %22, 65400
  %138 = zext i32 %137 to i64
  %139 = load %struct.CPUX86State** @env, align 8
  %140 = getelementptr inbounds %struct.CPUX86State* %139, i64 0, i32 10, i32 3
  %141 = load i32* %140, align 4
  %142 = lshr i32 %141, 8
  %143 = and i32 %142, 61695
  tail call void @stl_phys(i64 %138, i32 %143) nounwind
  %144 = add i32 %22, 65396
  %145 = zext i32 %144 to i64
  %146 = load %struct.CPUX86State** @env, align 8
  %147 = getelementptr inbounds %struct.CPUX86State* %146, i64 0, i32 12, i32 1
  %148 = load i32* %147, align 4
  tail call void @stl_phys(i64 %145, i32 %148) nounwind
  %149 = add i32 %22, 65392
  %150 = zext i32 %149 to i64
  %151 = load %struct.CPUX86State** @env, align 8
  %152 = getelementptr inbounds %struct.CPUX86State* %151, i64 0, i32 12, i32 2
  %153 = load i32* %152, align 4
  tail call void @stl_phys(i64 %150, i32 %153) nounwind
  %154 = add i32 %22, 65368
  %155 = zext i32 %154 to i64
  %156 = load %struct.CPUX86State** @env, align 8
  %157 = getelementptr inbounds %struct.CPUX86State* %156, i64 0, i32 13, i32 1
  %158 = load i32* %157, align 4
  tail call void @stl_phys(i64 %155, i32 %158) nounwind
  %159 = add i32 %22, 65364
  %160 = zext i32 %159 to i64
  %161 = load %struct.CPUX86State** @env, align 8
  %162 = getelementptr inbounds %struct.CPUX86State* %161, i64 0, i32 13, i32 2
  %163 = load i32* %162, align 4
  tail call void @stl_phys(i64 %160, i32 %163) nounwind
  br label %164

; <label>:164                                     ; preds = %164, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %164 ]
  %165 = load %struct.CPUX86State** @env, align 8
  %166 = trunc i64 %indvars.iv to i32
  %167 = icmp slt i32 %166, 3
  %168 = mul i64 %indvars.iv, 12
  %offset.0.v = select i1 %167, i32 32644, i32 32520
  %169 = shl i64 %indvars.iv, 2
  %170 = trunc i64 %169 to i32
  %171 = add i32 %22, 65448
  %172 = add i32 %171, %170
  %173 = zext i32 %172 to i64
  %174 = getelementptr inbounds %struct.CPUX86State* %165, i64 0, i32 9, i64 %indvars.iv, i32 0
  %175 = load i32* %174, align 4
  tail call void @stl_phys(i64 %173, i32 %175) nounwind
  %176 = trunc i64 %168 to i32
  %177 = add i32 %22, 32768
  %offset.0 = add i32 %177, %176
  %178 = add i32 %offset.0, %offset.0.v
  %179 = add i32 %178, 8
  %180 = zext i32 %179 to i64
  %181 = getelementptr inbounds %struct.CPUX86State* %165, i64 0, i32 9, i64 %indvars.iv, i32 1
  %182 = load i32* %181, align 4
  tail call void @stl_phys(i64 %180, i32 %182) nounwind
  %183 = add i32 %178, 4
  %184 = zext i32 %183 to i64
  %185 = getelementptr inbounds %struct.CPUX86State* %165, i64 0, i32 9, i64 %indvars.iv, i32 2
  %186 = load i32* %185, align 4
  tail call void @stl_phys(i64 %184, i32 %186) nounwind
  %187 = zext i32 %178 to i64
  %188 = getelementptr inbounds %struct.CPUX86State* %165, i64 0, i32 9, i64 %indvars.iv, i32 3
  %189 = load i32* %188, align 4
  %190 = lshr i32 %189, 8
  %191 = and i32 %190, 61695
  tail call void @stl_phys(i64 %187, i32 %191) nounwind
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 6
  br i1 %exitcond, label %192, label %164

; <label>:192                                     ; preds = %164
  %193 = add i32 %22, 65300
  %194 = zext i32 %193 to i64
  %195 = load %struct.CPUX86State** @env, align 8
  %196 = getelementptr inbounds %struct.CPUX86State* %195, i64 0, i32 14, i64 4
  %197 = load i32* %196, align 4
  tail call void @stl_phys(i64 %194, i32 %197) nounwind
  %198 = add i32 %22, 65276
  %199 = zext i32 %198 to i64
  tail call void @stl_phys(i64 %199, i32 131072) nounwind
  %200 = add i32 %22, 65272
  %201 = zext i32 %200 to i64
  %202 = load %struct.CPUX86State** @env, align 8
  %203 = getelementptr inbounds %struct.CPUX86State* %202, i64 0, i32 61
  %204 = load i32* %203, align 4
  tail call void @stl_phys(i64 %201, i32 %204) nounwind
  %205 = load %struct.CPUX86State** @env, align 8
  %206 = getelementptr inbounds %struct.CPUX86State* %205, i64 0, i32 1
  store i32 0, i32* %206, align 4
  %207 = load %struct.CPUX86State** @env, align 8
  %208 = getelementptr inbounds %struct.CPUX86State* %207, i64 0, i32 5
  store i32 1, i32* %208, align 4
  %209 = load %struct.CPUX86State** @env, align 8
  %210 = getelementptr inbounds %struct.CPUX86State* %209, i64 0, i32 6
  %211 = load i32* %210, align 4
  %212 = and i32 %211, 3285
  store i32 %212, i32* %210, align 4
  %213 = load %struct.CPUX86State** @env, align 8
  %214 = getelementptr inbounds %struct.CPUX86State* %213, i64 0, i32 4
  store i32 32768, i32* %214, align 4
  %215 = load %struct.CPUX86State** @env, align 8
  %216 = getelementptr inbounds %struct.CPUX86State* %215, i64 0, i32 61
  %217 = load i32* %216, align 4
  %218 = lshr i32 %217, 4
  %219 = and i32 %218, 65535
  %220 = getelementptr inbounds %struct.CPUX86State* %215, i64 0, i32 9, i64 1, i32 0
  store i32 %219, i32* %220, align 4
  %221 = getelementptr inbounds %struct.CPUX86State* %215, i64 0, i32 9, i64 1, i32 1
  store i32 %217, i32* %221, align 4
  %222 = getelementptr inbounds %struct.CPUX86State* %215, i64 0, i32 9, i64 1, i32 2
  store i32 -1, i32* %222, align 4
  %223 = getelementptr inbounds %struct.CPUX86State* %215, i64 0, i32 9, i64 1, i32 3
  store i32 0, i32* %223, align 4
  %224 = getelementptr inbounds %struct.CPUX86State* %215, i64 0, i32 7
  %225 = load i32* %224, align 4
  %226 = getelementptr inbounds %struct.CPUX86State* %215, i64 0, i32 9, i64 2, i32 3
  %227 = load i32* %226, align 4
  %228 = lshr i32 %227, 17
  %229 = and i32 %228, 32
  %230 = and i32 %225, -32881
  %231 = or i32 %230, %229
  %232 = or i32 %231, 64
  store i32 %232, i32* %224, align 4
  %233 = load %struct.CPUX86State** @env, align 8
  %234 = getelementptr inbounds %struct.CPUX86State* %233, i64 0, i32 9, i64 3, i32 0
  store i32 0, i32* %234, align 4
  %235 = getelementptr inbounds %struct.CPUX86State* %233, i64 0, i32 9, i64 3, i32 1
  store i32 0, i32* %235, align 4
  %236 = getelementptr inbounds %struct.CPUX86State* %233, i64 0, i32 9, i64 3, i32 2
  store i32 -1, i32* %236, align 4
  %237 = getelementptr inbounds %struct.CPUX86State* %233, i64 0, i32 9, i64 3, i32 3
  store i32 0, i32* %237, align 4
  %.phi.trans.insert.i13 = getelementptr inbounds %struct.CPUX86State* %233, i64 0, i32 7
  %.pre.i14 = load i32* %.phi.trans.insert.i13, align 4
  %238 = getelementptr inbounds %struct.CPUX86State* %233, i64 0, i32 9, i64 2, i32 3
  %239 = load i32* %238, align 4
  %240 = lshr i32 %239, 17
  %241 = and i32 %240, 32
  %242 = and i32 %.pre.i14, 32768
  %243 = icmp eq i32 %242, 0
  br i1 %243, label %244, label %269

; <label>:244                                     ; preds = %192
  %245 = getelementptr inbounds %struct.CPUX86State* %233, i64 0, i32 14, i64 0
  %246 = load i32* %245, align 4
  %247 = and i32 %246, 1
  %248 = icmp eq i32 %247, 0
  br i1 %248, label %257, label %249

; <label>:249                                     ; preds = %244
  %250 = getelementptr inbounds %struct.CPUX86State* %233, i64 0, i32 6
  %251 = load i32* %250, align 4
  %252 = and i32 %251, 131072
  %253 = icmp eq i32 %252, 0
  br i1 %253, label %254, label %257

; <label>:254                                     ; preds = %249
  %255 = and i32 %.pre.i14, 16
  %256 = icmp eq i32 %255, 0
  br i1 %256, label %257, label %259

; <label>:257                                     ; preds = %254, %249, %244
  %258 = or i32 %241, 64
  br label %269

; <label>:259                                     ; preds = %254
  %260 = getelementptr inbounds %struct.CPUX86State* %233, i64 0, i32 9, i64 0, i32 1
  %261 = load i32* %260, align 4
  %262 = getelementptr inbounds %struct.CPUX86State* %233, i64 0, i32 9, i64 2, i32 1
  %263 = load i32* %262, align 4
  %264 = or i32 %263, %261
  %265 = icmp ne i32 %264, 0
  %266 = zext i1 %265 to i32
  %267 = shl nuw nsw i32 %266, 6
  %268 = or i32 %267, %241
  br label %269

; <label>:269                                     ; preds = %259, %257, %192
  %new_hflags.0.i15 = phi i32 [ %241, %192 ], [ %258, %257 ], [ %268, %259 ]
  %270 = and i32 %.pre.i14, -97
  %271 = or i32 %new_hflags.0.i15, %270
  store i32 %271, i32* %.phi.trans.insert.i13, align 4
  %272 = load %struct.CPUX86State** @env, align 8
  %273 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 9, i64 0, i32 0
  store i32 0, i32* %273, align 4
  %274 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 9, i64 0, i32 1
  store i32 0, i32* %274, align 4
  %275 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 9, i64 0, i32 2
  store i32 -1, i32* %275, align 4
  %276 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 9, i64 0, i32 3
  store i32 0, i32* %276, align 4
  %.phi.trans.insert.i9 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 7
  %.pre.i10 = load i32* %.phi.trans.insert.i9, align 4
  %277 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 9, i64 2, i32 3
  %278 = load i32* %277, align 4
  %279 = lshr i32 %278, 17
  %280 = and i32 %279, 32
  %281 = and i32 %.pre.i10, 32768
  %282 = icmp eq i32 %281, 0
  br i1 %282, label %283, label %308

; <label>:283                                     ; preds = %269
  %284 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 14, i64 0
  %285 = load i32* %284, align 4
  %286 = and i32 %285, 1
  %287 = icmp eq i32 %286, 0
  br i1 %287, label %296, label %288

; <label>:288                                     ; preds = %283
  %289 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 6
  %290 = load i32* %289, align 4
  %291 = and i32 %290, 131072
  %292 = icmp eq i32 %291, 0
  br i1 %292, label %293, label %296

; <label>:293                                     ; preds = %288
  %294 = and i32 %.pre.i10, 16
  %295 = icmp eq i32 %294, 0
  br i1 %295, label %296, label %298

; <label>:296                                     ; preds = %293, %288, %283
  %297 = or i32 %280, 64
  br label %308

; <label>:298                                     ; preds = %293
  %299 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 9, i64 3, i32 1
  %300 = load i32* %299, align 4
  %301 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 9, i64 2, i32 1
  %302 = load i32* %301, align 4
  %303 = or i32 %302, %300
  %304 = icmp ne i32 %303, 0
  %305 = zext i1 %304 to i32
  %306 = shl nuw nsw i32 %305, 6
  %307 = or i32 %306, %280
  br label %308

; <label>:308                                     ; preds = %298, %296, %269
  %new_hflags.0.i11 = phi i32 [ %280, %269 ], [ %297, %296 ], [ %307, %298 ]
  %309 = and i32 %.pre.i10, -97
  %310 = or i32 %new_hflags.0.i11, %309
  store i32 %310, i32* %.phi.trans.insert.i9, align 4
  %311 = load %struct.CPUX86State** @env, align 8
  %312 = getelementptr inbounds %struct.CPUX86State* %311, i64 0, i32 9, i64 2, i32 0
  store i32 0, i32* %312, align 4
  %313 = getelementptr inbounds %struct.CPUX86State* %311, i64 0, i32 9, i64 2, i32 1
  store i32 0, i32* %313, align 4
  %314 = getelementptr inbounds %struct.CPUX86State* %311, i64 0, i32 9, i64 2, i32 2
  store i32 -1, i32* %314, align 4
  %315 = getelementptr inbounds %struct.CPUX86State* %311, i64 0, i32 9, i64 2, i32 3
  store i32 0, i32* %315, align 4
  %.phi.trans.insert.i5 = getelementptr inbounds %struct.CPUX86State* %311, i64 0, i32 7
  %.pre.i6 = load i32* %.phi.trans.insert.i5, align 4
  %316 = and i32 %.pre.i6, 32768
  %317 = icmp eq i32 %316, 0
  br i1 %317, label %318, label %340

; <label>:318                                     ; preds = %308
  %319 = getelementptr inbounds %struct.CPUX86State* %311, i64 0, i32 14, i64 0
  %320 = load i32* %319, align 4
  %321 = and i32 %320, 1
  %322 = icmp eq i32 %321, 0
  br i1 %322, label %340, label %323

; <label>:323                                     ; preds = %318
  %324 = getelementptr inbounds %struct.CPUX86State* %311, i64 0, i32 6
  %325 = load i32* %324, align 4
  %326 = and i32 %325, 131072
  %327 = icmp eq i32 %326, 0
  br i1 %327, label %328, label %340

; <label>:328                                     ; preds = %323
  %329 = and i32 %.pre.i6, 16
  %330 = icmp eq i32 %329, 0
  br i1 %330, label %340, label %331

; <label>:331                                     ; preds = %328
  %332 = getelementptr inbounds %struct.CPUX86State* %311, i64 0, i32 9, i64 3, i32 1
  %333 = load i32* %332, align 4
  %334 = getelementptr inbounds %struct.CPUX86State* %311, i64 0, i32 9, i64 0, i32 1
  %335 = load i32* %334, align 4
  %336 = or i32 %335, %333
  %337 = icmp ne i32 %336, 0
  %338 = zext i1 %337 to i32
  %339 = shl nuw nsw i32 %338, 6
  br label %340

; <label>:340                                     ; preds = %331, %328, %323, %318, %308
  %new_hflags.0.i7 = phi i32 [ 0, %308 ], [ %339, %331 ], [ 64, %328 ], [ 64, %323 ], [ 64, %318 ]
  %341 = and i32 %.pre.i6, -97
  %342 = or i32 %new_hflags.0.i7, %341
  store i32 %342, i32* %.phi.trans.insert.i5, align 4
  %343 = load %struct.CPUX86State** @env, align 8
  %344 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 9, i64 4, i32 0
  store i32 0, i32* %344, align 4
  %345 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 9, i64 4, i32 1
  store i32 0, i32* %345, align 4
  %346 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 9, i64 4, i32 2
  store i32 -1, i32* %346, align 4
  %347 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 9, i64 4, i32 3
  store i32 0, i32* %347, align 4
  %.phi.trans.insert.i1 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 7
  %.pre.i2 = load i32* %.phi.trans.insert.i1, align 4
  %348 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 9, i64 2, i32 3
  %349 = load i32* %348, align 4
  %350 = lshr i32 %349, 17
  %351 = and i32 %350, 32
  %352 = and i32 %.pre.i2, 32768
  %353 = icmp eq i32 %352, 0
  br i1 %353, label %354, label %382

; <label>:354                                     ; preds = %340
  %355 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 14, i64 0
  %356 = load i32* %355, align 4
  %357 = and i32 %356, 1
  %358 = icmp eq i32 %357, 0
  br i1 %358, label %367, label %359

; <label>:359                                     ; preds = %354
  %360 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 6
  %361 = load i32* %360, align 4
  %362 = and i32 %361, 131072
  %363 = icmp eq i32 %362, 0
  br i1 %363, label %364, label %367

; <label>:364                                     ; preds = %359
  %365 = and i32 %.pre.i2, 16
  %366 = icmp eq i32 %365, 0
  br i1 %366, label %367, label %369

; <label>:367                                     ; preds = %364, %359, %354
  %368 = or i32 %351, 64
  br label %382

; <label>:369                                     ; preds = %364
  %370 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 9, i64 3, i32 1
  %371 = load i32* %370, align 4
  %372 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 9, i64 0, i32 1
  %373 = load i32* %372, align 4
  %374 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 9, i64 2, i32 1
  %375 = load i32* %374, align 4
  %376 = or i32 %373, %371
  %377 = or i32 %376, %375
  %378 = icmp ne i32 %377, 0
  %379 = zext i1 %378 to i32
  %380 = shl nuw nsw i32 %379, 6
  %381 = or i32 %380, %351
  br label %382

; <label>:382                                     ; preds = %369, %367, %340
  %new_hflags.0.i3 = phi i32 [ %351, %340 ], [ %368, %367 ], [ %381, %369 ]
  %383 = and i32 %.pre.i2, -97
  %384 = or i32 %new_hflags.0.i3, %383
  store i32 %384, i32* %.phi.trans.insert.i1, align 4
  %385 = load %struct.CPUX86State** @env, align 8
  %386 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 9, i64 5, i32 0
  store i32 0, i32* %386, align 4
  %387 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 9, i64 5, i32 1
  store i32 0, i32* %387, align 4
  %388 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 9, i64 5, i32 2
  store i32 -1, i32* %388, align 4
  %389 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 9, i64 5, i32 3
  store i32 0, i32* %389, align 4
  %.phi.trans.insert.i = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 7
  %.pre.i = load i32* %.phi.trans.insert.i, align 4
  %390 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 9, i64 2, i32 3
  %391 = load i32* %390, align 4
  %392 = lshr i32 %391, 17
  %393 = and i32 %392, 32
  %394 = and i32 %.pre.i, 32768
  %395 = icmp eq i32 %394, 0
  br i1 %395, label %396, label %cpu_x86_load_seg_cache.exit

; <label>:396                                     ; preds = %382
  %397 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 14, i64 0
  %398 = load i32* %397, align 4
  %399 = and i32 %398, 1
  %400 = icmp eq i32 %399, 0
  br i1 %400, label %409, label %401

; <label>:401                                     ; preds = %396
  %402 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 6
  %403 = load i32* %402, align 4
  %404 = and i32 %403, 131072
  %405 = icmp eq i32 %404, 0
  br i1 %405, label %406, label %409

; <label>:406                                     ; preds = %401
  %407 = and i32 %.pre.i, 16
  %408 = icmp eq i32 %407, 0
  br i1 %408, label %409, label %411

; <label>:409                                     ; preds = %406, %401, %396
  %410 = or i32 %393, 64
  br label %cpu_x86_load_seg_cache.exit

; <label>:411                                     ; preds = %406
  %412 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 9, i64 3, i32 1
  %413 = load i32* %412, align 4
  %414 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 9, i64 0, i32 1
  %415 = load i32* %414, align 4
  %416 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 9, i64 2, i32 1
  %417 = load i32* %416, align 4
  %418 = or i32 %415, %413
  %419 = or i32 %418, %417
  %420 = icmp ne i32 %419, 0
  %421 = zext i1 %420 to i32
  %422 = shl nuw nsw i32 %421, 6
  %423 = or i32 %422, %393
  br label %cpu_x86_load_seg_cache.exit

cpu_x86_load_seg_cache.exit:                      ; preds = %411, %409, %382
  %new_hflags.0.i = phi i32 [ %393, %382 ], [ %410, %409 ], [ %423, %411 ]
  %424 = and i32 %.pre.i, -97
  %425 = or i32 %new_hflags.0.i, %424
  store i32 %425, i32* %.phi.trans.insert.i, align 4
  %426 = load %struct.CPUX86State** @env, align 8
  %427 = getelementptr inbounds %struct.CPUX86State* %426, i64 0, i32 14, i64 0
  %428 = load i32* %427, align 4
  %429 = and i32 %428, 2147483634
  tail call void @cpu_x86_update_cr0(%struct.CPUX86State* %426, i32 %429) nounwind
  %430 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_x86_update_cr4(%struct.CPUX86State* %430, i32 0) nounwind
  %431 = load %struct.CPUX86State** @env, align 8
  %432 = getelementptr inbounds %struct.CPUX86State* %431, i64 0, i32 59, i64 7
  store i32 1024, i32* %432, align 4
  %433 = load %struct.CPUX86State** @env, align 8
  %434 = getelementptr inbounds %struct.CPUX86State* %433, i64 0, i32 3
  store i32 1, i32* %434, align 4
  store %struct.CPUX86State* %1, %struct.CPUX86State** @env, align 8
  ret void
}

declare void @cpu_dump_state(%struct.CPUX86State*, %struct._IO_FILE*, i32 (%struct._IO_FILE*, i8*, ...)*, i32)

declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture, ...) nounwind

declare void @cpu_smm_update(%struct.CPUX86State*)

declare void @cpu_x86_update_cr0(%struct.CPUX86State*, i32)

declare void @cpu_x86_update_cr4(%struct.CPUX86State*, i32)

define void @helper_rsm() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 61
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 65532
  %5 = zext i32 %4 to i64
  %6 = tail call i32 @ldl_phys(i64 %5) nounwind
  tail call void @cpu_x86_update_cr0(%struct.CPUX86State* %1, i32 %6) nounwind
  %7 = load %struct.CPUX86State** @env, align 8
  %8 = add i32 %3, 65528
  %9 = zext i32 %8 to i64
  %10 = tail call i32 @ldl_phys(i64 %9) nounwind
  tail call void @cpu_x86_update_cr3(%struct.CPUX86State* %7, i32 %10) nounwind
  %11 = add i32 %3, 65524
  %12 = zext i32 %11 to i64
  %13 = tail call i32 @ldl_phys(i64 %12) nounwind
  %14 = and i32 %13, 2261
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 1
  store i32 %14, i32* %16, align 4
  %17 = lshr i32 %13, 9
  %18 = and i32 %17, 2
  %19 = xor i32 %18, 2
  %20 = add i32 %19, -1
  %21 = load %struct.CPUX86State** @env, align 8
  %22 = getelementptr inbounds %struct.CPUX86State* %21, i64 0, i32 5
  store i32 %20, i32* %22, align 4
  %23 = load %struct.CPUX86State** @env, align 8
  %24 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 6
  %25 = load i32* %24, align 4
  %26 = and i32 %25, 3285
  %27 = and i32 %13, -3286
  %28 = or i32 %26, %27
  store i32 %28, i32* %24, align 4
  %29 = add i32 %3, 65520
  %30 = zext i32 %29 to i64
  %31 = tail call i32 @ldl_phys(i64 %30) nounwind
  %32 = load %struct.CPUX86State** @env, align 8
  %33 = getelementptr inbounds %struct.CPUX86State* %32, i64 0, i32 4
  store i32 %31, i32* %33, align 4
  %34 = add i32 %3, 65516
  %35 = zext i32 %34 to i64
  %36 = tail call i32 @ldl_phys(i64 %35) nounwind
  %37 = load %struct.CPUX86State** @env, align 8
  %38 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 0, i64 7
  store i32 %36, i32* %38, align 4
  %39 = add i32 %3, 65512
  %40 = zext i32 %39 to i64
  %41 = tail call i32 @ldl_phys(i64 %40) nounwind
  %42 = load %struct.CPUX86State** @env, align 8
  %43 = getelementptr inbounds %struct.CPUX86State* %42, i64 0, i32 0, i64 6
  store i32 %41, i32* %43, align 4
  %44 = add i32 %3, 65508
  %45 = zext i32 %44 to i64
  %46 = tail call i32 @ldl_phys(i64 %45) nounwind
  %47 = load %struct.CPUX86State** @env, align 8
  %48 = getelementptr inbounds %struct.CPUX86State* %47, i64 0, i32 0, i64 5
  store i32 %46, i32* %48, align 4
  %49 = add i32 %3, 65504
  %50 = zext i32 %49 to i64
  %51 = tail call i32 @ldl_phys(i64 %50) nounwind
  %52 = load %struct.CPUX86State** @env, align 8
  %53 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 0, i64 4
  store i32 %51, i32* %53, align 4
  %54 = add i32 %3, 65500
  %55 = zext i32 %54 to i64
  %56 = tail call i32 @ldl_phys(i64 %55) nounwind
  %57 = load %struct.CPUX86State** @env, align 8
  %58 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 0, i64 3
  store i32 %56, i32* %58, align 4
  %59 = add i32 %3, 65496
  %60 = zext i32 %59 to i64
  %61 = tail call i32 @ldl_phys(i64 %60) nounwind
  %62 = load %struct.CPUX86State** @env, align 8
  %63 = getelementptr inbounds %struct.CPUX86State* %62, i64 0, i32 0, i64 2
  store i32 %61, i32* %63, align 4
  %64 = add i32 %3, 65492
  %65 = zext i32 %64 to i64
  %66 = tail call i32 @ldl_phys(i64 %65) nounwind
  %67 = load %struct.CPUX86State** @env, align 8
  %68 = getelementptr inbounds %struct.CPUX86State* %67, i64 0, i32 0, i64 1
  store i32 %66, i32* %68, align 4
  %69 = add i32 %3, 65488
  %70 = zext i32 %69 to i64
  %71 = tail call i32 @ldl_phys(i64 %70) nounwind
  %72 = load %struct.CPUX86State** @env, align 8
  %73 = getelementptr inbounds %struct.CPUX86State* %72, i64 0, i32 0, i64 0
  store i32 %71, i32* %73, align 4
  %74 = add i32 %3, 65484
  %75 = zext i32 %74 to i64
  %76 = tail call i32 @ldl_phys(i64 %75) nounwind
  %77 = load %struct.CPUX86State** @env, align 8
  %78 = getelementptr inbounds %struct.CPUX86State* %77, i64 0, i32 59, i64 6
  store i32 %76, i32* %78, align 4
  %79 = add i32 %3, 65480
  %80 = zext i32 %79 to i64
  %81 = tail call i32 @ldl_phys(i64 %80) nounwind
  %82 = load %struct.CPUX86State** @env, align 8
  %83 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 59, i64 7
  store i32 %81, i32* %83, align 4
  %84 = add i32 %3, 65476
  %85 = zext i32 %84 to i64
  %86 = tail call i32 @ldl_phys(i64 %85) nounwind
  %87 = and i32 %86, 65535
  %88 = load %struct.CPUX86State** @env, align 8
  %89 = getelementptr inbounds %struct.CPUX86State* %88, i64 0, i32 11, i32 0
  store i32 %87, i32* %89, align 4
  %90 = add i32 %3, 65380
  %91 = zext i32 %90 to i64
  %92 = tail call i32 @ldl_phys(i64 %91) nounwind
  %93 = load %struct.CPUX86State** @env, align 8
  %94 = getelementptr inbounds %struct.CPUX86State* %93, i64 0, i32 11, i32 1
  store i32 %92, i32* %94, align 4
  %95 = add i32 %3, 65376
  %96 = zext i32 %95 to i64
  %97 = tail call i32 @ldl_phys(i64 %96) nounwind
  %98 = load %struct.CPUX86State** @env, align 8
  %99 = getelementptr inbounds %struct.CPUX86State* %98, i64 0, i32 11, i32 2
  store i32 %97, i32* %99, align 4
  %100 = add i32 %3, 65372
  %101 = zext i32 %100 to i64
  %102 = tail call i32 @ldl_phys(i64 %101) nounwind
  %103 = shl i32 %102, 8
  %104 = and i32 %103, 15793920
  %105 = load %struct.CPUX86State** @env, align 8
  %106 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 11, i32 3
  store i32 %104, i32* %106, align 4
  %107 = add i32 %3, 65472
  %108 = zext i32 %107 to i64
  %109 = tail call i32 @ldl_phys(i64 %108) nounwind
  %110 = and i32 %109, 65535
  %111 = load %struct.CPUX86State** @env, align 8
  %112 = getelementptr inbounds %struct.CPUX86State* %111, i64 0, i32 10, i32 0
  store i32 %110, i32* %112, align 4
  %113 = add i32 %3, 65408
  %114 = zext i32 %113 to i64
  %115 = tail call i32 @ldl_phys(i64 %114) nounwind
  %116 = load %struct.CPUX86State** @env, align 8
  %117 = getelementptr inbounds %struct.CPUX86State* %116, i64 0, i32 10, i32 1
  store i32 %115, i32* %117, align 4
  %118 = add i32 %3, 65404
  %119 = zext i32 %118 to i64
  %120 = tail call i32 @ldl_phys(i64 %119) nounwind
  %121 = load %struct.CPUX86State** @env, align 8
  %122 = getelementptr inbounds %struct.CPUX86State* %121, i64 0, i32 10, i32 2
  store i32 %120, i32* %122, align 4
  %123 = add i32 %3, 65400
  %124 = zext i32 %123 to i64
  %125 = tail call i32 @ldl_phys(i64 %124) nounwind
  %126 = shl i32 %125, 8
  %127 = and i32 %126, 15793920
  %128 = load %struct.CPUX86State** @env, align 8
  %129 = getelementptr inbounds %struct.CPUX86State* %128, i64 0, i32 10, i32 3
  store i32 %127, i32* %129, align 4
  %130 = add i32 %3, 65396
  %131 = zext i32 %130 to i64
  %132 = tail call i32 @ldl_phys(i64 %131) nounwind
  %133 = load %struct.CPUX86State** @env, align 8
  %134 = getelementptr inbounds %struct.CPUX86State* %133, i64 0, i32 12, i32 1
  store i32 %132, i32* %134, align 4
  %135 = add i32 %3, 65392
  %136 = zext i32 %135 to i64
  %137 = tail call i32 @ldl_phys(i64 %136) nounwind
  %138 = load %struct.CPUX86State** @env, align 8
  %139 = getelementptr inbounds %struct.CPUX86State* %138, i64 0, i32 12, i32 2
  store i32 %137, i32* %139, align 4
  %140 = add i32 %3, 65368
  %141 = zext i32 %140 to i64
  %142 = tail call i32 @ldl_phys(i64 %141) nounwind
  %143 = load %struct.CPUX86State** @env, align 8
  %144 = getelementptr inbounds %struct.CPUX86State* %143, i64 0, i32 13, i32 1
  store i32 %142, i32* %144, align 4
  %145 = add i32 %3, 65364
  %146 = zext i32 %145 to i64
  %147 = tail call i32 @ldl_phys(i64 %146) nounwind
  %148 = load %struct.CPUX86State** @env, align 8
  %149 = getelementptr inbounds %struct.CPUX86State* %148, i64 0, i32 13, i32 2
  store i32 %147, i32* %149, align 4
  br label %150

; <label>:150                                     ; preds = %cpu_x86_load_seg_cache.exit, %0
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %cpu_x86_load_seg_cache.exit ]
  %151 = trunc i64 %indvars.iv to i32
  %152 = icmp slt i32 %151, 3
  %153 = mul i64 %indvars.iv, 12
  %offset.0.v = select i1 %152, i32 32644, i32 32520
  %154 = load %struct.CPUX86State** @env, align 8
  %155 = shl i64 %indvars.iv, 2
  %156 = trunc i64 %155 to i32
  %157 = add i32 %3, 65448
  %158 = add i32 %157, %156
  %159 = zext i32 %158 to i64
  %160 = tail call i32 @ldl_phys(i64 %159) nounwind
  %161 = and i32 %160, 65535
  %162 = trunc i64 %153 to i32
  %163 = add i32 %3, 32768
  %offset.0 = add i32 %163, %162
  %164 = add i32 %offset.0, %offset.0.v
  %165 = add i32 %164, 8
  %166 = zext i32 %165 to i64
  %167 = tail call i32 @ldl_phys(i64 %166) nounwind
  %168 = add i32 %164, 4
  %169 = zext i32 %168 to i64
  %170 = tail call i32 @ldl_phys(i64 %169) nounwind
  %171 = zext i32 %164 to i64
  %172 = tail call i32 @ldl_phys(i64 %171) nounwind
  %173 = shl i32 %172, 8
  %174 = and i32 %173, 15793920
  %175 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 %indvars.iv, i32 0
  store i32 %161, i32* %175, align 4
  %176 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 %indvars.iv, i32 1
  store i32 %167, i32* %176, align 4
  %177 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 %indvars.iv, i32 2
  store i32 %170, i32* %177, align 4
  %178 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 %indvars.iv, i32 3
  store i32 %174, i32* %178, align 4
  %179 = icmp eq i32 %151, 1
  br i1 %179, label %180, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %150
  %.phi.trans.insert.i = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 7
  %.pre.i = load i32* %.phi.trans.insert.i, align 4
  br label %189

; <label>:180                                     ; preds = %150
  %181 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 1, i32 3
  %182 = load i32* %181, align 4
  %183 = lshr i32 %182, 18
  %184 = and i32 %183, 16
  %185 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 7
  %186 = load i32* %185, align 4
  %187 = and i32 %186, -32785
  %188 = or i32 %187, %184
  store i32 %188, i32* %185, align 4
  br label %189

; <label>:189                                     ; preds = %180, %._crit_edge.i
  %190 = phi i32 [ %.pre.i, %._crit_edge.i ], [ %188, %180 ]
  %191 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 2, i32 3
  %192 = load i32* %191, align 4
  %193 = lshr i32 %192, 17
  %194 = and i32 %193, 32
  %195 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 7
  %196 = and i32 %190, 32768
  %197 = icmp eq i32 %196, 0
  br i1 %197, label %198, label %cpu_x86_load_seg_cache.exit

; <label>:198                                     ; preds = %189
  %199 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 14, i64 0
  %200 = load i32* %199, align 4
  %201 = and i32 %200, 1
  %202 = icmp eq i32 %201, 0
  br i1 %202, label %211, label %203

; <label>:203                                     ; preds = %198
  %204 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 6
  %205 = load i32* %204, align 4
  %206 = and i32 %205, 131072
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %208, label %211

; <label>:208                                     ; preds = %203
  %209 = and i32 %190, 16
  %210 = icmp eq i32 %209, 0
  br i1 %210, label %211, label %213

; <label>:211                                     ; preds = %208, %203, %198
  %212 = or i32 %194, 64
  br label %cpu_x86_load_seg_cache.exit

; <label>:213                                     ; preds = %208
  %214 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 3, i32 1
  %215 = load i32* %214, align 4
  %216 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 0, i32 1
  %217 = load i32* %216, align 4
  %218 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 2, i32 1
  %219 = load i32* %218, align 4
  %220 = or i32 %217, %215
  %221 = or i32 %220, %219
  %222 = icmp ne i32 %221, 0
  %223 = zext i1 %222 to i32
  %224 = shl nuw nsw i32 %223, 6
  %225 = or i32 %224, %194
  br label %cpu_x86_load_seg_cache.exit

cpu_x86_load_seg_cache.exit:                      ; preds = %213, %211, %189
  %new_hflags.0.i = phi i32 [ %194, %189 ], [ %212, %211 ], [ %225, %213 ]
  %226 = and i32 %190, -97
  %227 = or i32 %new_hflags.0.i, %226
  store i32 %227, i32* %195, align 4
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 6
  br i1 %exitcond, label %228, label %150

; <label>:228                                     ; preds = %cpu_x86_load_seg_cache.exit
  %229 = load %struct.CPUX86State** @env, align 8
  %230 = add i32 %3, 65300
  %231 = zext i32 %230 to i64
  %232 = tail call i32 @ldl_phys(i64 %231) nounwind
  tail call void @cpu_x86_update_cr4(%struct.CPUX86State* %229, i32 %232) nounwind
  %233 = add i32 %3, 65276
  %234 = zext i32 %233 to i64
  %235 = tail call i32 @ldl_phys(i64 %234) nounwind
  %236 = and i32 %235, 131072
  %237 = icmp eq i32 %236, 0
  br i1 %237, label %245, label %238

; <label>:238                                     ; preds = %228
  %239 = add i32 %3, 65272
  %240 = zext i32 %239 to i64
  %241 = tail call i32 @ldl_phys(i64 %240) nounwind
  %242 = and i32 %241, -32768
  %243 = load %struct.CPUX86State** @env, align 8
  %244 = getelementptr inbounds %struct.CPUX86State* %243, i64 0, i32 61
  store i32 %242, i32* %244, align 4
  br label %245

; <label>:245                                     ; preds = %238, %228
  %246 = load %struct.CPUX86State** @env, align 8
  %247 = getelementptr inbounds %struct.CPUX86State* %246, i64 0, i32 3
  store i32 1, i32* %247, align 4
  %248 = load %struct.CPUX86State** @env, align 8
  %249 = getelementptr inbounds %struct.CPUX86State* %248, i64 0, i32 7
  %250 = load i32* %249, align 4
  %251 = and i32 %250, -524289
  store i32 %251, i32* %249, align 4
  %252 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_smm_update(%struct.CPUX86State* %252) nounwind
  %253 = load i32* @loglevel, align 4
  %254 = and i32 %253, 16
  %255 = icmp eq i32 %254, 0
  br i1 %255, label %259, label %256

; <label>:256                                     ; preds = %245
  %257 = load %struct._IO_FILE** @logfile, align 8
  %258 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %257, i32 1, i8* getelementptr inbounds ([16 x i8]* @.str8, i64 0, i64 0)) nounwind
  br label %259

; <label>:259                                     ; preds = %256, %245
  ret void
}

declare void @cpu_x86_update_cr3(%struct.CPUX86State*, i32)

define void @helper_divb_AL(i32 %t0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 65535
  %5 = and i32 %t0, 255
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:8                                       ; preds = %0
  %9 = udiv i32 %4, %5
  %10 = icmp ugt i32 %9, 255
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:12                                      ; preds = %8
  %13 = and i32 %9, 255
  %14 = urem i32 %4, %5
  %15 = and i32 %3, -65536
  %16 = shl nuw nsw i32 %14, 8
  %17 = and i32 %16, 65280
  %18 = or i32 %13, %15
  %19 = or i32 %18, %17
  store i32 %19, i32* %2, align 4
  ret void
}

define void @helper_idivb_AL(i32 %t0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %3 = load i32* %2, align 4
  %sext = shl i32 %3, 16
  %4 = ashr exact i32 %sext, 16
  %sext1 = shl i32 %t0, 24
  %5 = ashr exact i32 %sext1, 24
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:8                                       ; preds = %0
  %9 = sdiv i32 %4, %5
  %sext2 = shl i32 %9, 24
  %10 = ashr exact i32 %sext2, 24
  %11 = icmp eq i32 %9, %10
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %8
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:13                                      ; preds = %8
  %14 = and i32 %9, 255
  %15 = srem i32 %4, %5
  %16 = and i32 %3, -65536
  %17 = shl i32 %15, 8
  %18 = and i32 %17, 65280
  %19 = or i32 %14, %16
  %20 = or i32 %19, %18
  store i32 %20, i32* %2, align 4
  ret void
}

define void @helper_divw_AX(i32 %t0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 65535
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 2
  %6 = load i32* %5, align 4
  %7 = shl i32 %6, 16
  %8 = or i32 %7, %4
  %9 = and i32 %t0, 65535
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:12                                      ; preds = %0
  %13 = udiv i32 %8, %9
  %14 = icmp ugt i32 %13, 65535
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %12
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:16                                      ; preds = %12
  %17 = and i32 %13, 65535
  %18 = urem i32 %8, %9
  %19 = and i32 %18, 65535
  %20 = and i32 %3, -65536
  %21 = or i32 %17, %20
  store i32 %21, i32* %2, align 4
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 0, i64 2
  %24 = load i32* %23, align 4
  %25 = and i32 %24, -65536
  %26 = or i32 %25, %19
  store i32 %26, i32* %23, align 4
  ret void
}

define void @helper_idivw_AX(i32 %t0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 65535
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 2
  %6 = load i32* %5, align 4
  %7 = shl i32 %6, 16
  %8 = or i32 %7, %4
  %sext = shl i32 %t0, 16
  %9 = ashr exact i32 %sext, 16
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:12                                      ; preds = %0
  %13 = sdiv i32 %8, %9
  %sext1 = shl i32 %13, 16
  %14 = ashr exact i32 %sext1, 16
  %15 = icmp eq i32 %13, %14
  br i1 %15, label %17, label %16

; <label>:16                                      ; preds = %12
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:17                                      ; preds = %12
  %18 = and i32 %13, 65535
  %19 = srem i32 %8, %9
  %20 = and i32 %19, 65535
  %21 = and i32 %3, -65536
  %22 = or i32 %18, %21
  store i32 %22, i32* %2, align 4
  %23 = load %struct.CPUX86State** @env, align 8
  %24 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 0, i64 2
  %25 = load i32* %24, align 4
  %26 = and i32 %25, -65536
  %27 = or i32 %26, %20
  store i32 %27, i32* %24, align 4
  ret void
}

define void @helper_divl_EAX(i32 %t0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 2
  %6 = load i32* %5, align 4
  %7 = zext i32 %6 to i64
  %8 = shl nuw i64 %7, 32
  %9 = or i64 %8, %4
  %10 = icmp eq i32 %t0, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:12                                      ; preds = %0
  %13 = zext i32 %t0 to i64
  %14 = udiv i64 %9, %13
  %15 = icmp ugt i64 %14, 4294967295
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %12
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:17                                      ; preds = %12
  %18 = urem i64 %9, %13
  %19 = trunc i64 %18 to i32
  %20 = trunc i64 %14 to i32
  store i32 %20, i32* %2, align 4
  %21 = load %struct.CPUX86State** @env, align 8
  %22 = getelementptr inbounds %struct.CPUX86State* %21, i64 0, i32 0, i64 2
  store i32 %19, i32* %22, align 4
  ret void
}

define void @helper_idivl_EAX(i32 %t0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 2
  %6 = load i32* %5, align 4
  %7 = zext i32 %6 to i64
  %8 = shl nuw i64 %7, 32
  %9 = or i64 %8, %4
  %10 = icmp eq i32 %t0, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:12                                      ; preds = %0
  %13 = sext i32 %t0 to i64
  %14 = sdiv i64 %9, %13
  %15 = trunc i64 %14 to i32
  %16 = sext i32 %15 to i64
  %17 = icmp eq i64 %14, %16
  br i1 %17, label %19, label %18

; <label>:18                                      ; preds = %12
  tail call fastcc void @raise_exception(i32 0) noreturn
  unreachable

; <label>:19                                      ; preds = %12
  %20 = srem i64 %9, %13
  %21 = trunc i64 %20 to i32
  store i32 %15, i32* %2, align 4
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 0, i64 2
  store i32 %21, i32* %23, align 4
  ret void
}

define void @helper_aam(i32 %base) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 255
  %5 = sdiv i32 %4, %base
  %6 = srem i32 %4, %base
  %7 = and i32 %3, -65536
  %8 = shl i32 %5, 8
  %9 = or i32 %6, %7
  %10 = or i32 %9, %8
  store i32 %10, i32* %2, align 4
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 2
  store i32 %6, i32* %12, align 4
  ret void
}

define void @helper_aad(i32 %base) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %3 = load i32* %2, align 4
  %4 = lshr i32 %3, 8
  %5 = and i32 %4, 255
  %6 = mul nsw i32 %5, %base
  %7 = add nsw i32 %6, %3
  %8 = and i32 %7, 255
  %9 = and i32 %3, -65536
  %10 = or i32 %8, %9
  store i32 %10, i32* %2, align 4
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 2
  store i32 %8, i32* %12, align 4
  ret void
}

define void @helper_aaa() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %6 = load i32* %5, align 4
  %7 = and i32 %6, 254
  %8 = lshr i32 %6, 8
  %9 = icmp ugt i32 %7, 249
  %10 = zext i1 %9 to i32
  %11 = and i32 %6, 15
  %12 = icmp ugt i32 %11, 9
  br i1 %12, label %16, label %13

; <label>:13                                      ; preds = %0
  %14 = and i32 %4, 16
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %22, label %16

; <label>:16                                      ; preds = %13, %0
  %17 = add nsw i32 %6, 6
  %18 = and i32 %17, 15
  %19 = add i32 %8, 1
  %20 = add i32 %19, %10
  %21 = or i32 %4, 17
  br label %24

; <label>:22                                      ; preds = %13
  %23 = and i32 %4, -18
  br label %24

; <label>:24                                      ; preds = %22, %16
  %ah.0.in = phi i32 [ %20, %16 ], [ %8, %22 ]
  %al.0 = phi i32 [ %18, %16 ], [ %11, %22 ]
  %eflags.0 = phi i32 [ %21, %16 ], [ %23, %22 ]
  %25 = and i32 %6, -65536
  %ah.0 = shl i32 %ah.0.in, 8
  %26 = and i32 %ah.0, 65280
  %27 = or i32 %al.0, %25
  %28 = or i32 %27, %26
  store i32 %28, i32* %5, align 4
  %29 = load %struct.CPUX86State** @env, align 8
  %30 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 1
  store i32 %eflags.0, i32* %30, align 4
  ret void
}

define void @helper_aas() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %6 = load i32* %5, align 4
  %7 = and i32 %6, 254
  %8 = lshr i32 %6, 8
  %9 = icmp ult i32 %7, 6
  %10 = and i32 %6, 15
  %11 = icmp ugt i32 %10, 9
  br i1 %11, label %15, label %12

; <label>:12                                      ; preds = %0
  %13 = and i32 %4, 16
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %21, label %15

; <label>:15                                      ; preds = %12, %0
  %16 = add nsw i32 %6, 10
  %17 = and i32 %16, 15
  %.neg = sext i1 %9 to i32
  %18 = add i32 %8, -1
  %19 = add i32 %18, %.neg
  %20 = or i32 %4, 17
  br label %23

; <label>:21                                      ; preds = %12
  %22 = and i32 %4, -18
  br label %23

; <label>:23                                      ; preds = %21, %15
  %ah.0.in = phi i32 [ %19, %15 ], [ %8, %21 ]
  %al.0 = phi i32 [ %17, %15 ], [ %10, %21 ]
  %eflags.0 = phi i32 [ %20, %15 ], [ %22, %21 ]
  %24 = and i32 %6, -65536
  %ah.0 = shl i32 %ah.0.in, 8
  %25 = and i32 %ah.0, 65280
  %26 = or i32 %al.0, %24
  %27 = or i32 %26, %25
  store i32 %27, i32* %5, align 4
  %28 = load %struct.CPUX86State** @env, align 8
  %29 = getelementptr inbounds %struct.CPUX86State* %28, i64 0, i32 1
  store i32 %eflags.0, i32* %29, align 4
  ret void
}

define void @helper_daa() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = and i32 %4, 1
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %7 = load i32* %6, align 4
  %8 = and i32 %7, 255
  %9 = and i32 %7, 14
  %10 = icmp ugt i32 %9, 9
  br i1 %10, label %14, label %11

; <label>:11                                      ; preds = %0
  %12 = and i32 %4, 16
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %17, label %14

; <label>:14                                      ; preds = %11, %0
  %15 = add nsw i32 %7, 6
  %16 = and i32 %15, 255
  br label %17

; <label>:17                                      ; preds = %14, %11
  %al.0 = phi i32 [ %16, %14 ], [ %8, %11 ]
  %eflags.0 = phi i32 [ 16, %14 ], [ 0, %11 ]
  %18 = icmp ult i32 %8, 154
  %19 = icmp eq i32 %5, 0
  %or.cond = and i1 %18, %19
  br i1 %or.cond, label %24, label %20

; <label>:20                                      ; preds = %17
  %21 = add nsw i32 %al.0, 96
  %22 = and i32 %21, 255
  %23 = or i32 %eflags.0, 1
  br label %24

; <label>:24                                      ; preds = %20, %17
  %al.1 = phi i32 [ %22, %20 ], [ %al.0, %17 ]
  %eflags.1 = phi i32 [ %23, %20 ], [ %eflags.0, %17 ]
  %25 = and i32 %7, -256
  %26 = or i32 %al.1, %25
  store i32 %26, i32* %6, align 4
  %27 = icmp eq i32 %al.1, 0
  %28 = zext i1 %27 to i32
  %29 = shl nuw nsw i32 %28, 6
  %30 = sext i32 %al.1 to i64
  %31 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %30
  %32 = load i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = and i32 %al.1, 128
  %35 = or i32 %eflags.1, %34
  %36 = or i32 %35, %33
  %37 = or i32 %36, %29
  %38 = load %struct.CPUX86State** @env, align 8
  %39 = getelementptr inbounds %struct.CPUX86State* %38, i64 0, i32 1
  store i32 %37, i32* %39, align 4
  ret void
}

define void @helper_das() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = and i32 %4, 1
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %7 = load i32* %6, align 4
  %8 = and i32 %7, 255
  %9 = and i32 %7, 14
  %10 = icmp ugt i32 %9, 9
  br i1 %10, label %14, label %11

; <label>:11                                      ; preds = %0
  %12 = and i32 %4, 16
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %._crit_edge, label %14

._crit_edge:                                      ; preds = %11
  %.pre = icmp eq i32 %5, 0
  br label %19

; <label>:14                                      ; preds = %11, %0
  %15 = icmp ugt i32 %8, 5
  %16 = icmp eq i32 %5, 0
  %or.cond = and i1 %15, %16
  %eflags.0 = select i1 %or.cond, i32 16, i32 17
  %17 = add nsw i32 %7, 250
  %18 = and i32 %17, 255
  br label %19

; <label>:19                                      ; preds = %14, %._crit_edge
  %.pre-phi = phi i1 [ %.pre, %._crit_edge ], [ %16, %14 ]
  %eflags.1 = phi i32 [ 0, %._crit_edge ], [ %eflags.0, %14 ]
  %al.0 = phi i32 [ %8, %._crit_edge ], [ %18, %14 ]
  %20 = icmp ult i32 %8, 154
  %or.cond1 = and i1 %20, %.pre-phi
  br i1 %or.cond1, label %25, label %21

; <label>:21                                      ; preds = %19
  %22 = add nsw i32 %al.0, 160
  %23 = and i32 %22, 255
  %24 = or i32 %eflags.1, 1
  br label %25

; <label>:25                                      ; preds = %21, %19
  %eflags.2 = phi i32 [ %24, %21 ], [ %eflags.1, %19 ]
  %al.1 = phi i32 [ %23, %21 ], [ %al.0, %19 ]
  %26 = and i32 %7, -256
  %27 = or i32 %al.1, %26
  store i32 %27, i32* %6, align 4
  %28 = icmp eq i32 %al.1, 0
  %29 = zext i1 %28 to i32
  %30 = shl nuw nsw i32 %29, 6
  %31 = sext i32 %al.1 to i64
  %32 = getelementptr inbounds [256 x i8]* @parity_table, i64 0, i64 %31
  %33 = load i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = and i32 %al.1, 128
  %36 = or i32 %35, %eflags.2
  %37 = or i32 %36, %34
  %38 = or i32 %37, %30
  %39 = load %struct.CPUX86State** @env, align 8
  %40 = getelementptr inbounds %struct.CPUX86State* %39, i64 0, i32 1
  store i32 %38, i32* %40, align 4
  ret void
}

define void @helper_into(i32 %next_eip_addend) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = and i32 %4, 2048
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  tail call fastcc void @raise_interrupt(i32 4, i32 1, i32 0, i32 %next_eip_addend) noreturn
  unreachable

; <label>:8                                       ; preds = %0
  ret void
}

define void @helper_cmpxchg8b(i32 %a0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = tail call fastcc i64 @ldq_data(i32 %a0)
  %6 = load %struct.CPUX86State** @env, align 8
  %7 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 0, i64 2
  %8 = load i32* %7, align 4
  %9 = zext i32 %8 to i64
  %10 = shl nuw i64 %9, 32
  %11 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 0, i64 0
  %12 = load i32* %11, align 4
  %13 = zext i32 %12 to i64
  %14 = or i64 %10, %13
  %15 = icmp eq i64 %5, %14
  br i1 %15, label %16, label %26

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 0, i64 1
  %18 = load i32* %17, align 4
  %19 = zext i32 %18 to i64
  %20 = shl nuw i64 %19, 32
  %21 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 0, i64 3
  %22 = load i32* %21, align 4
  %23 = zext i32 %22 to i64
  %24 = or i64 %20, %23
  tail call fastcc void @stq_data(i32 %a0, i64 %24)
  %25 = or i32 %4, 64
  br label %35

; <label>:26                                      ; preds = %0
  tail call fastcc void @stq_data(i32 %a0, i64 %5)
  %27 = lshr i64 %5, 32
  %28 = trunc i64 %27 to i32
  %29 = load %struct.CPUX86State** @env, align 8
  %30 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 0, i64 2
  store i32 %28, i32* %30, align 4
  %31 = trunc i64 %5 to i32
  %32 = load %struct.CPUX86State** @env, align 8
  %33 = getelementptr inbounds %struct.CPUX86State* %32, i64 0, i32 0, i64 0
  store i32 %31, i32* %33, align 4
  %34 = and i32 %4, -65
  br label %35

; <label>:35                                      ; preds = %26, %16
  %eflags.0 = phi i32 [ %25, %16 ], [ %34, %26 ]
  %36 = load %struct.CPUX86State** @env, align 8
  %37 = getelementptr inbounds %struct.CPUX86State* %36, i64 0, i32 1
  store i32 %eflags.0, i32* %37, align 4
  ret void
}

define internal fastcc i64 @ldq_data(i32 %ptr) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 7
  %16 = load i32* %15, align 4
  %17 = and i32 %16, 3
  %18 = icmp eq i32 %17, 3
  %19 = zext i1 %18 to i64
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 0
  %21 = load i32* %20, align 4
  %22 = and i32 %8, -4089
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %27, label %24, !prof !0

; <label>:24                                      ; preds = %6
  %25 = zext i1 %18 to i32
  %26 = tail call i64 @__ldq_mmu(i32 %8, i32 %25)
  br label %34

; <label>:27                                      ; preds = %6
  %28 = and i64 %7, 4294967295
  %29 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 3
  %30 = load i64* %29, align 8
  %31 = add i64 %30, %28
  %32 = inttoptr i64 %31 to i64*
  %33 = load i64* %32, align 8
  tail call void @tcg_llvm_trace_memory_access(i64 %28, i64 %31, i64 %33, i32 64, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %34

; <label>:34                                      ; preds = %27, %24
  %res.0 = phi i64 [ %26, %24 ], [ %33, %27 ]
  ret i64 %res.0
}

define internal fastcc void @stq_data(i32 %ptr, i64 %v) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 7
  %16 = load i32* %15, align 4
  %17 = and i32 %16, 3
  %18 = icmp eq i32 %17, 3
  %19 = zext i1 %18 to i64
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 1
  %21 = load i32* %20, align 4
  %22 = and i32 %8, -4089
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %26, label %24, !prof !0

; <label>:24                                      ; preds = %6
  %25 = zext i1 %18 to i32
  tail call void @__stq_mmu(i32 %8, i64 %v, i32 %25)
  br label %32

; <label>:26                                      ; preds = %6
  %27 = and i64 %7, 4294967295
  %28 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 3
  %29 = load i64* %28, align 8
  %30 = add i64 %29, %27
  %31 = inttoptr i64 %30 to i64*
  store i64 %v, i64* %31, align 8
  tail call void @tcg_llvm_trace_memory_access(i64 %27, i64 %30, i64 %v, i32 64, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %32

; <label>:32                                      ; preds = %26, %24
  ret void
}

define void @helper_single_step() noreturn nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = tail call i32 @check_hw_breakpoints(%struct.CPUX86State* %1, i32 1) nounwind
  %3 = load %struct.CPUX86State** @env, align 8
  %4 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 59, i64 6
  %5 = load i32* %4, align 4
  %6 = or i32 %5, 16384
  store i32 %6, i32* %4, align 4
  tail call fastcc void @raise_exception(i32 1) noreturn
  unreachable
}

declare i32 @check_hw_breakpoints(%struct.CPUX86State*, i32)

define void @helper_cpuid() nounwind uwtable sspreq {
  %eax = alloca i32, align 4
  %ebx = alloca i32, align 4
  %ecx = alloca i32, align 4
  %edx = alloca i32, align 4
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 262144
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  call void @helper_vmexit(i32 114, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %12 = load i32* %11, align 4
  %13 = icmp eq i32 %12, 4
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %helper_svm_check_intercept_param.exit
  %15 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 1
  %16 = load i32* %15, align 4
  call void @cpu_x86_cpuid(%struct.CPUX86State* %1, i32 4, i32 %16, i32* %eax, i32* %ebx, i32* %ecx, i32* %edx) nounwind
  br label %18

; <label>:17                                      ; preds = %helper_svm_check_intercept_param.exit
  call void @cpu_x86_cpuid(%struct.CPUX86State* %1, i32 %12, i32 0, i32* %eax, i32* %ebx, i32* %ecx, i32* %edx) nounwind
  br label %18

; <label>:18                                      ; preds = %17, %14
  %19 = load i32* %eax, align 4
  %20 = load %struct.CPUX86State** @env, align 8
  %21 = getelementptr inbounds %struct.CPUX86State* %20, i64 0, i32 0, i64 0
  store i32 %19, i32* %21, align 4
  %22 = load i32* %ebx, align 4
  %23 = load %struct.CPUX86State** @env, align 8
  %24 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 0, i64 3
  store i32 %22, i32* %24, align 4
  %25 = load i32* %ecx, align 4
  %26 = load %struct.CPUX86State** @env, align 8
  %27 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 0, i64 1
  store i32 %25, i32* %27, align 4
  %28 = load i32* %edx, align 4
  %29 = load %struct.CPUX86State** @env, align 8
  %30 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 0, i64 2
  store i32 %28, i32* %30, align 4
  ret void
}

define void @helper_svm_check_intercept_param(i32 %type, i64 %param) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit, 0
  br i1 %4, label %101, label %5, !prof !0

; <label>:5                                       ; preds = %0
  switch i32 %type, label %92 [
    i32 0, label %6
    i32 1, label %6
    i32 2, label %6
    i32 3, label %6
    i32 4, label %6
    i32 5, label %6
    i32 6, label %6
    i32 7, label %6
    i32 8, label %6
    i32 16, label %14
    i32 17, label %14
    i32 18, label %14
    i32 19, label %14
    i32 20, label %14
    i32 21, label %14
    i32 22, label %14
    i32 23, label %14
    i32 24, label %14
    i32 32, label %23
    i32 33, label %23
    i32 34, label %23
    i32 35, label %23
    i32 36, label %23
    i32 37, label %23
    i32 38, label %23
    i32 39, label %23
    i32 48, label %32
    i32 49, label %32
    i32 50, label %32
    i32 51, label %32
    i32 52, label %32
    i32 53, label %32
    i32 54, label %32
    i32 55, label %32
    i32 64, label %41
    i32 65, label %41
    i32 66, label %41
    i32 67, label %41
    i32 68, label %41
    i32 69, label %41
    i32 70, label %41
    i32 71, label %41
    i32 72, label %41
    i32 73, label %41
    i32 74, label %41
    i32 75, label %41
    i32 76, label %41
    i32 77, label %41
    i32 78, label %41
    i32 79, label %41
    i32 80, label %41
    i32 81, label %41
    i32 82, label %41
    i32 83, label %41
    i32 84, label %41
    i32 85, label %41
    i32 86, label %41
    i32 87, label %41
    i32 88, label %41
    i32 89, label %41
    i32 90, label %41
    i32 91, label %41
    i32 92, label %41
    i32 93, label %41
    i32 94, label %41
    i32 95, label %41
    i32 124, label %49
  ]

; <label>:6                                       ; preds = %5, %5, %5, %5, %5, %5, %5, %5, %5
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 43
  %8 = load i16* %7, align 2
  %9 = zext i16 %8 to i32
  %10 = shl i32 1, %type
  %11 = and i32 %9, %10
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %101, label %13

; <label>:13                                      ; preds = %6
  tail call void @helper_vmexit(i32 %type, i64 %param)
  unreachable

; <label>:14                                      ; preds = %5, %5, %5, %5, %5, %5, %5, %5, %5
  %15 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 44
  %16 = load i16* %15, align 2
  %17 = zext i16 %16 to i32
  %18 = add i32 %type, -16
  %19 = shl i32 1, %18
  %20 = and i32 %17, %19
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %101, label %22

; <label>:22                                      ; preds = %14
  tail call void @helper_vmexit(i32 %type, i64 %param)
  unreachable

; <label>:23                                      ; preds = %5, %5, %5, %5, %5, %5, %5, %5
  %24 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 45
  %25 = load i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = add i32 %type, -32
  %28 = shl i32 1, %27
  %29 = and i32 %26, %28
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %101, label %31

; <label>:31                                      ; preds = %23
  tail call void @helper_vmexit(i32 %type, i64 %param)
  unreachable

; <label>:32                                      ; preds = %5, %5, %5, %5, %5, %5, %5, %5
  %33 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 46
  %34 = load i16* %33, align 2
  %35 = zext i16 %34 to i32
  %36 = add i32 %type, -48
  %37 = shl i32 1, %36
  %38 = and i32 %35, %37
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %101, label %40

; <label>:40                                      ; preds = %32
  tail call void @helper_vmexit(i32 %type, i64 %param)
  unreachable

; <label>:41                                      ; preds = %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5, %5
  %42 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 47
  %43 = load i32* %42, align 4
  %44 = add i32 %type, -64
  %45 = shl i32 1, %44
  %46 = and i32 %43, %45
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %101, label %48

; <label>:48                                      ; preds = %41
  tail call void @helper_vmexit(i32 %type, i64 %param)
  unreachable

; <label>:49                                      ; preds = %5
  %50 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %51 = load i64* %50, align 8
  %52 = and i64 %51, 268435456
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %101, label %54

; <label>:54                                      ; preds = %49
  %55 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 40
  %56 = load i64* %55, align 8
  %57 = add i64 %56, 72
  %58 = tail call i64 @ldq_phys(i64 %57) nounwind
  %59 = load %struct.CPUX86State** @env, align 8
  %60 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 0, i64 1
  %61 = load i32* %60, align 4
  %62 = add i32 %61, 1073676288
  %63 = icmp ult i32 %62, 8192
  br i1 %63, label %77, label %74

; <label>:64                                      ; preds = %68
  %65 = shl i32 %61, 1
  %66 = lshr i32 %61, 2
  %67 = and i32 %66, 536870911
  br label %82

; <label>:68                                      ; preds = %74
  %69 = icmp ult i32 %61, 8192
  br i1 %69, label %64, label %81

; <label>:70                                      ; preds = %74
  %71 = shl i32 %61, 1
  %72 = add i32 %71, -2147467264
  %73 = lshr i32 %72, 3
  br label %82

; <label>:74                                      ; preds = %54
  %75 = add i32 %61, 1073741824
  %76 = icmp ult i32 %75, 8192
  br i1 %76, label %70, label %68

; <label>:77                                      ; preds = %54
  %78 = shl i32 %61, 1
  %79 = add i32 %78, 2147385344
  %80 = lshr i32 %79, 3
  br label %82

; <label>:81                                      ; preds = %68
  tail call void @helper_vmexit(i32 124, i64 %param)
  unreachable

; <label>:82                                      ; preds = %77, %70, %64
  %t0.0.in = phi i32 [ %79, %77 ], [ %72, %70 ], [ %65, %64 ]
  %t1.0 = phi i32 [ %80, %77 ], [ %73, %70 ], [ %67, %64 ]
  %t0.0 = and i32 %t0.0.in, 6
  %83 = zext i32 %t1.0 to i64
  %84 = add i64 %83, %58
  %85 = tail call i32 @ldub_phys(i64 %84) nounwind
  %86 = trunc i64 %param to i32
  %87 = shl i32 1, %86
  %88 = shl i32 %87, %t0.0
  %89 = and i32 %85, %88
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %101, label %91

; <label>:91                                      ; preds = %82
  tail call void @helper_vmexit(i32 124, i64 %param)
  unreachable

; <label>:92                                      ; preds = %5
  %93 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %94 = load i64* %93, align 8
  %95 = add i32 %type, -96
  %96 = zext i32 %95 to i64
  %97 = shl i64 1, %96
  %98 = and i64 %94, %97
  %99 = icmp eq i64 %98, 0
  br i1 %99, label %101, label %100

; <label>:100                                     ; preds = %92
  tail call void @helper_vmexit(i32 %type, i64 %param)
  unreachable

; <label>:101                                     ; preds = %92, %82, %49, %41, %32, %23, %14, %6, %0
  ret void
}

declare void @cpu_x86_cpuid(%struct.CPUX86State*, i32, i32, i32*, i32*, i32*, i32*)

define void @helper_enter_level(i32 %level, i32 %data32, i32 %t1) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 2, i32 3
  %3 = load i32* %2, align 4
  %4 = lshr i32 %3, 6
  %5 = and i32 %4, 65536
  %6 = xor i32 %5, 65536
  %7 = add i32 %6, -1
  %8 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 2, i32 1
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 5
  %11 = load i32* %10, align 4
  %12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 4
  %13 = load i32* %12, align 4
  %14 = icmp eq i32 %data32, 0
  %15 = add nsw i32 %level, -1
  %16 = icmp eq i32 %15, 0
  br i1 %14, label %37, label %17

; <label>:17                                      ; preds = %0
  %18 = add i32 %13, -8
  br i1 %16, label %34, label %.lr.ph

.lr.ph:                                           ; preds = %17
  %19 = shl i32 %level, 2
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph
  %21 = phi i32 [ %18, %.lr.ph ], [ %31, %20 ]
  %22 = phi i32 [ %15, %.lr.ph ], [ %29, %20 ]
  %ebp.01 = phi i32 [ %11, %.lr.ph ], [ %23, %20 ]
  %23 = add i32 %ebp.01, -4
  %24 = and i32 %21, %7
  %25 = add i32 %24, %9
  %26 = and i32 %23, %7
  %27 = add i32 %26, %9
  %28 = tail call fastcc i32 @ldl_data(i32 %27)
  tail call fastcc void @stl_data(i32 %25, i32 %28)
  %29 = add nsw i32 %22, -1
  %30 = icmp eq i32 %29, 0
  %31 = add i32 %21, -4
  br i1 %30, label %._crit_edge, label %20

._crit_edge:                                      ; preds = %20
  %32 = sub i32 -4, %19
  %33 = add i32 %32, %13
  br label %34

; <label>:34                                      ; preds = %._crit_edge, %17
  %.lcssa = phi i32 [ %33, %._crit_edge ], [ %18, %17 ]
  %35 = and i32 %.lcssa, %7
  %36 = add i32 %35, %9
  tail call fastcc void @stl_data(i32 %36, i32 %t1)
  br label %57

; <label>:37                                      ; preds = %0
  %38 = add i32 %13, -4
  br i1 %16, label %54, label %.lr.ph5

.lr.ph5:                                          ; preds = %37
  %39 = shl i32 %level, 1
  br label %40

; <label>:40                                      ; preds = %40, %.lr.ph5
  %41 = phi i32 [ %38, %.lr.ph5 ], [ %51, %40 ]
  %42 = phi i32 [ %15, %.lr.ph5 ], [ %49, %40 ]
  %ebp.13 = phi i32 [ %11, %.lr.ph5 ], [ %43, %40 ]
  %43 = add i32 %ebp.13, -2
  %44 = and i32 %41, %7
  %45 = add i32 %44, %9
  %46 = and i32 %43, %7
  %47 = add i32 %46, %9
  %48 = tail call fastcc i32 @lduw_data(i32 %47)
  tail call fastcc void @stw_data(i32 %45, i32 %48)
  %49 = add nsw i32 %42, -1
  %50 = icmp eq i32 %49, 0
  %51 = add i32 %41, -2
  br i1 %50, label %._crit_edge6, label %40

._crit_edge6:                                     ; preds = %40
  %52 = sub i32 -2, %39
  %53 = add i32 %52, %13
  br label %54

; <label>:54                                      ; preds = %._crit_edge6, %37
  %.lcssa2 = phi i32 [ %53, %._crit_edge6 ], [ %38, %37 ]
  %55 = and i32 %.lcssa2, %7
  %56 = add i32 %55, %9
  tail call fastcc void @stw_data(i32 %56, i32 %t1)
  br label %57

; <label>:57                                      ; preds = %54, %34
  ret void
}

define internal fastcc void @stl_data(i32 %ptr, i32 %v) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 7
  %16 = load i32* %15, align 4
  %17 = and i32 %16, 3
  %18 = icmp eq i32 %17, 3
  %19 = zext i1 %18 to i64
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 1
  %21 = load i32* %20, align 4
  %22 = and i32 %8, -4093
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %26, label %24, !prof !0

; <label>:24                                      ; preds = %6
  %25 = zext i1 %18 to i32
  tail call void @__stl_mmu(i32 %8, i32 %v, i32 %25)
  br label %33

; <label>:26                                      ; preds = %6
  %27 = and i64 %7, 4294967295
  %28 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 3
  %29 = load i64* %28, align 8
  %30 = add i64 %29, %27
  %31 = inttoptr i64 %30 to i32*
  store i32 %v, i32* %31, align 4
  %32 = zext i32 %v to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %27, i64 %30, i64 %32, i32 32, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %33

; <label>:33                                      ; preds = %26, %24
  ret void
}

define internal fastcc i32 @ldl_data(i32 %ptr) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 7
  %16 = load i32* %15, align 4
  %17 = and i32 %16, 3
  %18 = icmp eq i32 %17, 3
  %19 = zext i1 %18 to i64
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 0
  %21 = load i32* %20, align 4
  %22 = and i32 %8, -4093
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %27, label %24, !prof !0

; <label>:24                                      ; preds = %6
  %25 = zext i1 %18 to i32
  %26 = tail call i32 @__ldl_mmu(i32 %8, i32 %25)
  br label %35

; <label>:27                                      ; preds = %6
  %28 = and i64 %7, 4294967295
  %29 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 3
  %30 = load i64* %29, align 8
  %31 = add i64 %30, %28
  %32 = inttoptr i64 %31 to i32*
  %33 = load i32* %32, align 4
  %34 = zext i32 %33 to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %28, i64 %31, i64 %34, i32 32, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %35

; <label>:35                                      ; preds = %27, %24
  %res.0 = phi i32 [ %26, %24 ], [ %33, %27 ]
  ret i32 %res.0
}

define internal fastcc void @stw_data(i32 %ptr, i32 %v) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 7
  %16 = load i32* %15, align 4
  %17 = and i32 %16, 3
  %18 = icmp eq i32 %17, 3
  %19 = zext i1 %18 to i64
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 1
  %21 = load i32* %20, align 4
  %22 = and i32 %8, -4095
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %27, label %24, !prof !0

; <label>:24                                      ; preds = %6
  %25 = zext i1 %18 to i32
  %26 = trunc i32 %v to i16
  tail call void @__stw_mmu(i32 %8, i16 zeroext %26, i32 %25)
  br label %35

; <label>:27                                      ; preds = %6
  %28 = and i64 %7, 4294967295
  %29 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 3
  %30 = load i64* %29, align 8
  %31 = add i64 %30, %28
  %32 = trunc i32 %v to i16
  %33 = inttoptr i64 %31 to i16*
  store i16 %32, i16* %33, align 2
  %34 = zext i32 %v to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %28, i64 %31, i64 %34, i32 32, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %35

; <label>:35                                      ; preds = %27, %24
  ret void
}

define internal fastcc i32 @lduw_data(i32 %ptr) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 7
  %16 = load i32* %15, align 4
  %17 = and i32 %16, 3
  %18 = icmp eq i32 %17, 3
  %19 = zext i1 %18 to i64
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 0
  %21 = load i32* %20, align 4
  %22 = and i32 %8, -4095
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %27, label %24, !prof !0

; <label>:24                                      ; preds = %6
  %25 = zext i1 %18 to i32
  %26 = tail call zeroext i16 @__ldw_mmu(i32 %8, i32 %25)
  br label %35

; <label>:27                                      ; preds = %6
  %28 = and i64 %7, 4294967295
  %29 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 3
  %30 = load i64* %29, align 8
  %31 = add i64 %30, %28
  %32 = inttoptr i64 %31 to i16*
  %33 = load i16* %32, align 2
  %34 = zext i16 %33 to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %28, i64 %31, i64 %34, i32 32, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %35

; <label>:35                                      ; preds = %27, %24
  %res.0.in = phi i16 [ %26, %24 ], [ %33, %27 ]
  %res.0 = zext i16 %res.0.in to i32
  ret i32 %res.0
}

define void @helper_lldt(i32 %selector) nounwind uwtable sspreq {
  %1 = and i32 %selector, 65535
  %2 = and i32 %selector, 65532
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %0
  %5 = load %struct.CPUX86State** @env, align 8
  %6 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 10, i32 1
  store i32 0, i32* %6, align 4
  %7 = load %struct.CPUX86State** @env, align 8
  %8 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 10, i32 2
  store i32 0, i32* %8, align 4
  br label %54

; <label>:9                                       ; preds = %0
  %10 = and i32 %selector, 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %9
  tail call fastcc void @raise_exception_err(i32 13, i32 %2) noreturn
  unreachable

; <label>:13                                      ; preds = %9
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = and i32 %selector, 65528
  %16 = or i32 %15, 7
  %17 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 12, i32 2
  %18 = load i32* %17, align 4
  %19 = icmp ugt i32 %16, %18
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %13
  tail call fastcc void @raise_exception_err(i32 13, i32 %2) noreturn
  unreachable

; <label>:21                                      ; preds = %13
  %22 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 12, i32 1
  %23 = load i32* %22, align 4
  %24 = add i32 %23, %15
  %25 = tail call fastcc i32 @ldl_kernel(i32 %24)
  %26 = add i32 %24, 4
  %27 = tail call fastcc i32 @ldl_kernel(i32 %26)
  %28 = and i32 %27, 7936
  %29 = icmp eq i32 %28, 512
  br i1 %29, label %31, label %30

; <label>:30                                      ; preds = %21
  tail call fastcc void @raise_exception_err(i32 13, i32 %2) noreturn
  unreachable

; <label>:31                                      ; preds = %21
  %32 = and i32 %27, 32768
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %31
  tail call fastcc void @raise_exception_err(i32 11, i32 %2) noreturn
  unreachable

; <label>:35                                      ; preds = %31
  %36 = load %struct.CPUX86State** @env, align 8
  %37 = lshr i32 %25, 16
  %38 = shl i32 %27, 16
  %39 = and i32 %38, 16711680
  %40 = and i32 %27, -16777216
  %41 = or i32 %40, %37
  %42 = or i32 %41, %39
  %43 = getelementptr inbounds %struct.CPUX86State* %36, i64 0, i32 10, i32 1
  store i32 %42, i32* %43, align 4
  %44 = and i32 %25, 65535
  %45 = and i32 %27, 983040
  %46 = or i32 %45, %44
  %47 = and i32 %27, 8388608
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %load_seg_cache_raw_dt.exit, label %49

; <label>:49                                      ; preds = %35
  %50 = shl nuw i32 %46, 12
  %51 = or i32 %50, 4095
  br label %load_seg_cache_raw_dt.exit

load_seg_cache_raw_dt.exit:                       ; preds = %49, %35
  %limit.0.i.i = phi i32 [ %51, %49 ], [ %46, %35 ]
  %52 = getelementptr inbounds %struct.CPUX86State* %36, i64 0, i32 10, i32 2
  store i32 %limit.0.i.i, i32* %52, align 4
  %53 = getelementptr inbounds %struct.CPUX86State* %36, i64 0, i32 10, i32 3
  store i32 %27, i32* %53, align 4
  br label %54

; <label>:54                                      ; preds = %load_seg_cache_raw_dt.exit, %4
  %55 = load %struct.CPUX86State** @env, align 8
  %56 = getelementptr inbounds %struct.CPUX86State* %55, i64 0, i32 10, i32 0
  store i32 %1, i32* %56, align 4
  ret void
}

define internal fastcc void @raise_exception_err(i32 %exception_index, i32 %error_code) noreturn nounwind uwtable sspreq {
  tail call fastcc void @raise_interrupt(i32 %exception_index, i32 0, i32 %error_code, i32 0) noreturn
  unreachable
}

define internal fastcc i32 @ldl_kernel(i32 %ptr) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 0
  %16 = load i32* %15, align 4
  %17 = and i32 %8, -4093
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %21, label %19, !prof !0

; <label>:19                                      ; preds = %6
  %20 = tail call i32 @__ldl_mmu(i32 %8, i32 0)
  br label %29

; <label>:21                                      ; preds = %6
  %22 = and i64 %7, 4294967295
  %23 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 3
  %24 = load i64* %23, align 8
  %25 = add i64 %24, %22
  %26 = inttoptr i64 %25 to i32*
  %27 = load i32* %26, align 4
  %28 = zext i32 %27 to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %22, i64 %25, i64 %28, i32 32, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %29

; <label>:29                                      ; preds = %21, %19
  %res.0 = phi i32 [ %20, %19 ], [ %27, %21 ]
  ret i32 %res.0
}

define void @helper_ltr(i32 %selector) nounwind uwtable sspreq {
  %1 = and i32 %selector, 65535
  %2 = and i32 %selector, 65532
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %11

; <label>:4                                       ; preds = %0
  %5 = load %struct.CPUX86State** @env, align 8
  %6 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 11, i32 1
  store i32 0, i32* %6, align 4
  %7 = load %struct.CPUX86State** @env, align 8
  %8 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 11, i32 2
  store i32 0, i32* %8, align 4
  %9 = load %struct.CPUX86State** @env, align 8
  %10 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 11, i32 3
  store i32 0, i32* %10, align 4
  br label %60

; <label>:11                                      ; preds = %0
  %12 = and i32 %selector, 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %15, label %14

; <label>:14                                      ; preds = %11
  tail call fastcc void @raise_exception_err(i32 13, i32 %2) noreturn
  unreachable

; <label>:15                                      ; preds = %11
  %16 = load %struct.CPUX86State** @env, align 8
  %17 = and i32 %selector, 65528
  %18 = or i32 %17, 7
  %19 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 12, i32 2
  %20 = load i32* %19, align 4
  %21 = icmp ugt i32 %18, %20
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %15
  tail call fastcc void @raise_exception_err(i32 13, i32 %2) noreturn
  unreachable

; <label>:23                                      ; preds = %15
  %24 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 12, i32 1
  %25 = load i32* %24, align 4
  %26 = add i32 %25, %17
  %27 = tail call fastcc i32 @ldl_kernel(i32 %26)
  %28 = add i32 %26, 4
  %29 = tail call fastcc i32 @ldl_kernel(i32 %28)
  %30 = and i32 %29, 4096
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %35

; <label>:32                                      ; preds = %23
  %33 = lshr i32 %29, 8
  %34 = and i32 %33, 15
  switch i32 %34, label %35 [
    i32 9, label %36
    i32 1, label %36
  ]

; <label>:35                                      ; preds = %32, %23
  tail call fastcc void @raise_exception_err(i32 13, i32 %2) noreturn
  unreachable

; <label>:36                                      ; preds = %32, %32
  %37 = and i32 %29, 32768
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %36
  tail call fastcc void @raise_exception_err(i32 11, i32 %2) noreturn
  unreachable

; <label>:40                                      ; preds = %36
  %41 = load %struct.CPUX86State** @env, align 8
  %42 = lshr i32 %27, 16
  %43 = shl i32 %29, 16
  %44 = and i32 %43, 16711680
  %45 = and i32 %29, -16777216
  %46 = or i32 %45, %42
  %47 = or i32 %46, %44
  %48 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 11, i32 1
  store i32 %47, i32* %48, align 4
  %49 = and i32 %27, 65535
  %50 = and i32 %29, 983040
  %51 = or i32 %50, %49
  %52 = and i32 %29, 8388608
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %load_seg_cache_raw_dt.exit, label %54

; <label>:54                                      ; preds = %40
  %55 = shl nuw i32 %51, 12
  %56 = or i32 %55, 4095
  br label %load_seg_cache_raw_dt.exit

load_seg_cache_raw_dt.exit:                       ; preds = %54, %40
  %limit.0.i.i = phi i32 [ %56, %54 ], [ %51, %40 ]
  %57 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 11, i32 2
  store i32 %limit.0.i.i, i32* %57, align 4
  %58 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 11, i32 3
  store i32 %29, i32* %58, align 4
  %59 = or i32 %29, 512
  tail call fastcc void @stl_kernel(i32 %28, i32 %59)
  br label %60

; <label>:60                                      ; preds = %load_seg_cache_raw_dt.exit, %4
  %61 = load %struct.CPUX86State** @env, align 8
  %62 = getelementptr inbounds %struct.CPUX86State* %61, i64 0, i32 11, i32 0
  store i32 %1, i32* %62, align 4
  ret void
}

define internal fastcc void @stl_kernel(i32 %ptr, i32 %v) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 1
  %16 = load i32* %15, align 4
  %17 = and i32 %8, -4093
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %20, label %19, !prof !0

; <label>:19                                      ; preds = %6
  tail call void @__stl_mmu(i32 %8, i32 %v, i32 0)
  br label %27

; <label>:20                                      ; preds = %6
  %21 = and i64 %7, 4294967295
  %22 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 3
  %23 = load i64* %22, align 8
  %24 = add i64 %23, %21
  %25 = inttoptr i64 %24 to i32*
  store i32 %v, i32* %25, align 4
  %26 = zext i32 %v to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %21, i64 %24, i64 %26, i32 32, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %27

; <label>:27                                      ; preds = %20, %19
  ret void
}

define void @helper_load_seg(i32 %seg_reg, i32 %selector) nounwind uwtable sspreq {
  %1 = and i32 %selector, 65535
  %2 = load %struct.CPUX86State** @env, align 8
  %3 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 7
  %4 = load i32* %3, align 4
  %5 = and i32 %4, 3
  %6 = and i32 %selector, 65532
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %64

; <label>:8                                       ; preds = %0
  %9 = icmp eq i32 %seg_reg, 2
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %8
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn
  unreachable

; <label>:11                                      ; preds = %8
  %12 = sext i32 %seg_reg to i64
  %13 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 9, i64 %12, i32 0
  store i32 %1, i32* %13, align 4
  %14 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 9, i64 %12, i32 1
  store i32 0, i32* %14, align 4
  %15 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 9, i64 %12, i32 2
  store i32 0, i32* %15, align 4
  %16 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 9, i64 %12, i32 3
  store i32 0, i32* %16, align 4
  %17 = icmp eq i32 %seg_reg, 1
  br i1 %17, label %18, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %11
  %.pre.i = load i32* %3, align 4
  br label %26

; <label>:18                                      ; preds = %11
  %19 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 9, i64 1, i32 3
  %20 = load i32* %19, align 4
  %21 = lshr i32 %20, 18
  %22 = and i32 %21, 16
  %23 = load i32* %3, align 4
  %24 = and i32 %23, -32785
  %25 = or i32 %24, %22
  store i32 %25, i32* %3, align 4
  br label %26

; <label>:26                                      ; preds = %18, %._crit_edge.i
  %27 = phi i32 [ %.pre.i, %._crit_edge.i ], [ %25, %18 ]
  %28 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 9, i64 2, i32 3
  %29 = load i32* %28, align 4
  %30 = lshr i32 %29, 17
  %31 = and i32 %30, 32
  %32 = and i32 %27, 32768
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %cpu_x86_load_seg_cache.exit

; <label>:34                                      ; preds = %26
  %35 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 14, i64 0
  %36 = load i32* %35, align 4
  %37 = and i32 %36, 1
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %47, label %39

; <label>:39                                      ; preds = %34
  %40 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 6
  %41 = load i32* %40, align 4
  %42 = and i32 %41, 131072
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %47

; <label>:44                                      ; preds = %39
  %45 = and i32 %27, 16
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %49

; <label>:47                                      ; preds = %44, %39, %34
  %48 = or i32 %31, 64
  br label %cpu_x86_load_seg_cache.exit

; <label>:49                                      ; preds = %44
  %50 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 9, i64 3, i32 1
  %51 = load i32* %50, align 4
  %52 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 9, i64 0, i32 1
  %53 = load i32* %52, align 4
  %54 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 9, i64 2, i32 1
  %55 = load i32* %54, align 4
  %56 = or i32 %53, %51
  %57 = or i32 %56, %55
  %58 = icmp ne i32 %57, 0
  %59 = zext i1 %58 to i32
  %60 = shl nuw nsw i32 %59, 6
  %61 = or i32 %60, %31
  br label %cpu_x86_load_seg_cache.exit

cpu_x86_load_seg_cache.exit:                      ; preds = %49, %47, %26
  %new_hflags.0.i = phi i32 [ %31, %26 ], [ %48, %47 ], [ %61, %49 ]
  %62 = and i32 %27, -97
  %63 = or i32 %new_hflags.0.i, %62
  store i32 %63, i32* %3, align 4
  br label %189

; <label>:64                                      ; preds = %0
  %65 = and i32 %selector, 4
  %66 = icmp eq i32 %65, 0
  %67 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 10
  %68 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 12
  %dt.0 = select i1 %66, %struct.SegmentCache* %68, %struct.SegmentCache* %67
  %69 = and i32 %selector, 65528
  %70 = or i32 %69, 7
  %71 = getelementptr inbounds %struct.SegmentCache* %dt.0, i64 0, i32 2
  %72 = load i32* %71, align 4
  %73 = icmp ugt i32 %70, %72
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %64
  tail call fastcc void @raise_exception_err(i32 13, i32 %6) noreturn
  unreachable

; <label>:75                                      ; preds = %64
  %76 = getelementptr inbounds %struct.SegmentCache* %dt.0, i64 0, i32 1
  %77 = load i32* %76, align 4
  %78 = add i32 %77, %69
  %79 = tail call fastcc i32 @ldl_kernel(i32 %78)
  %80 = add i32 %78, 4
  %81 = tail call fastcc i32 @ldl_kernel(i32 %80)
  %82 = and i32 %81, 4096
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %75
  tail call fastcc void @raise_exception_err(i32 13, i32 %6) noreturn
  unreachable

; <label>:85                                      ; preds = %75
  %86 = and i32 %selector, 3
  %87 = lshr i32 %81, 13
  %88 = and i32 %87, 3
  %89 = icmp eq i32 %seg_reg, 2
  %90 = and i32 %81, 2560
  br i1 %89, label %91, label %98

; <label>:91                                      ; preds = %85
  %92 = icmp eq i32 %90, 512
  br i1 %92, label %94, label %93

; <label>:93                                      ; preds = %91
  tail call fastcc void @raise_exception_err(i32 13, i32 %6) noreturn
  unreachable

; <label>:94                                      ; preds = %91
  %95 = icmp eq i32 %86, %5
  %96 = icmp eq i32 %88, %5
  %or.cond2 = and i1 %95, %96
  br i1 %or.cond2, label %108, label %97

; <label>:97                                      ; preds = %94
  tail call fastcc void @raise_exception_err(i32 13, i32 %6) noreturn
  unreachable

; <label>:98                                      ; preds = %85
  %99 = icmp eq i32 %90, 2048
  br i1 %99, label %100, label %101

; <label>:100                                     ; preds = %98
  tail call fastcc void @raise_exception_err(i32 13, i32 %6) noreturn
  unreachable

; <label>:101                                     ; preds = %98
  %102 = and i32 %81, 3072
  %103 = icmp eq i32 %102, 3072
  br i1 %103, label %108, label %104

; <label>:104                                     ; preds = %101
  %105 = icmp ult i32 %88, %5
  %106 = icmp ult i32 %88, %86
  %or.cond5 = or i1 %105, %106
  br i1 %or.cond5, label %107, label %108

; <label>:107                                     ; preds = %104
  tail call fastcc void @raise_exception_err(i32 13, i32 %6) noreturn
  unreachable

; <label>:108                                     ; preds = %104, %101, %94
  %109 = and i32 %81, 32768
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %114

; <label>:111                                     ; preds = %108
  br i1 %89, label %112, label %113

; <label>:112                                     ; preds = %111
  tail call fastcc void @raise_exception_err(i32 12, i32 %6) noreturn
  unreachable

; <label>:113                                     ; preds = %111
  tail call fastcc void @raise_exception_err(i32 11, i32 %6) noreturn
  unreachable

; <label>:114                                     ; preds = %108
  %115 = and i32 %81, 256
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %117, label %119

; <label>:117                                     ; preds = %114
  %118 = or i32 %81, 256
  tail call fastcc void @stl_kernel(i32 %80, i32 %118)
  br label %119

; <label>:119                                     ; preds = %117, %114
  %e2.0 = phi i32 [ %81, %114 ], [ %118, %117 ]
  %120 = load %struct.CPUX86State** @env, align 8
  %121 = lshr i32 %79, 16
  %122 = shl i32 %e2.0, 16
  %123 = and i32 %122, 16711680
  %124 = and i32 %e2.0, -16777216
  %125 = or i32 %124, %121
  %126 = or i32 %125, %123
  %127 = and i32 %79, 65535
  %128 = and i32 %e2.0, 983040
  %129 = or i32 %128, %127
  %130 = and i32 %e2.0, 8388608
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %get_seg_limit.exit, label %132

; <label>:132                                     ; preds = %119
  %133 = shl nuw i32 %129, 12
  %134 = or i32 %133, 4095
  br label %get_seg_limit.exit

get_seg_limit.exit:                               ; preds = %132, %119
  %limit.0.i = phi i32 [ %134, %132 ], [ %129, %119 ]
  %135 = sext i32 %seg_reg to i64
  %136 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 9, i64 %135, i32 0
  store i32 %1, i32* %136, align 4
  %137 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 9, i64 %135, i32 1
  store i32 %126, i32* %137, align 4
  %138 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 9, i64 %135, i32 2
  store i32 %limit.0.i, i32* %138, align 4
  %139 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 9, i64 %135, i32 3
  store i32 %e2.0, i32* %139, align 4
  %140 = icmp eq i32 %seg_reg, 1
  br i1 %140, label %141, label %._crit_edge.i8

._crit_edge.i8:                                   ; preds = %get_seg_limit.exit
  %.phi.trans.insert.i6 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 7
  %.pre.i7 = load i32* %.phi.trans.insert.i6, align 4
  br label %150

; <label>:141                                     ; preds = %get_seg_limit.exit
  %142 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 9, i64 1, i32 3
  %143 = load i32* %142, align 4
  %144 = lshr i32 %143, 18
  %145 = and i32 %144, 16
  %146 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 7
  %147 = load i32* %146, align 4
  %148 = and i32 %147, -32785
  %149 = or i32 %148, %145
  store i32 %149, i32* %146, align 4
  br label %150

; <label>:150                                     ; preds = %141, %._crit_edge.i8
  %151 = phi i32 [ %.pre.i7, %._crit_edge.i8 ], [ %149, %141 ]
  %152 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 9, i64 2, i32 3
  %153 = load i32* %152, align 4
  %154 = lshr i32 %153, 17
  %155 = and i32 %154, 32
  %156 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 7
  %157 = and i32 %151, 32768
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %159, label %cpu_x86_load_seg_cache.exit10

; <label>:159                                     ; preds = %150
  %160 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 14, i64 0
  %161 = load i32* %160, align 4
  %162 = and i32 %161, 1
  %163 = icmp eq i32 %162, 0
  br i1 %163, label %172, label %164

; <label>:164                                     ; preds = %159
  %165 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 6
  %166 = load i32* %165, align 4
  %167 = and i32 %166, 131072
  %168 = icmp eq i32 %167, 0
  br i1 %168, label %169, label %172

; <label>:169                                     ; preds = %164
  %170 = and i32 %151, 16
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %172, label %174

; <label>:172                                     ; preds = %169, %164, %159
  %173 = or i32 %155, 64
  br label %cpu_x86_load_seg_cache.exit10

; <label>:174                                     ; preds = %169
  %175 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 9, i64 3, i32 1
  %176 = load i32* %175, align 4
  %177 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 9, i64 0, i32 1
  %178 = load i32* %177, align 4
  %179 = getelementptr inbounds %struct.CPUX86State* %120, i64 0, i32 9, i64 2, i32 1
  %180 = load i32* %179, align 4
  %181 = or i32 %178, %176
  %182 = or i32 %181, %180
  %183 = icmp ne i32 %182, 0
  %184 = zext i1 %183 to i32
  %185 = shl nuw nsw i32 %184, 6
  %186 = or i32 %185, %155
  br label %cpu_x86_load_seg_cache.exit10

cpu_x86_load_seg_cache.exit10:                    ; preds = %174, %172, %150
  %new_hflags.0.i9 = phi i32 [ %155, %150 ], [ %173, %172 ], [ %186, %174 ]
  %187 = and i32 %151, -97
  %188 = or i32 %new_hflags.0.i9, %187
  store i32 %188, i32* %156, align 4
  br label %189

; <label>:189                                     ; preds = %cpu_x86_load_seg_cache.exit10, %cpu_x86_load_seg_cache.exit
  ret void
}

define void @helper_ljmp_protected(i32 %new_cs, i32 %new_eip, i32 %next_eip_addend) nounwind uwtable sspreq {
  %1 = and i32 %new_cs, 65532
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn
  unreachable

; <label>:4                                       ; preds = %0
  %5 = and i32 %new_cs, 4
  %6 = icmp eq i32 %5, 0
  %7 = load %struct.CPUX86State** @env, align 8
  %8 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 10
  %9 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 12
  %dt.0.i = select i1 %6, %struct.SegmentCache* %9, %struct.SegmentCache* %8
  %10 = or i32 %new_cs, 7
  %11 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 2
  %12 = load i32* %11, align 4
  %13 = icmp ugt i32 %10, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %4
  tail call fastcc void @raise_exception_err(i32 13, i32 %1) noreturn
  unreachable

; <label>:15                                      ; preds = %4
  %16 = and i32 %new_cs, -8
  %17 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 1
  %18 = load i32* %17, align 4
  %19 = add i32 %18, %16
  %20 = tail call fastcc i32 @ldl_kernel(i32 %19) nounwind
  %21 = add i32 %19, 4
  %22 = tail call fastcc i32 @ldl_kernel(i32 %21) nounwind
  %23 = load %struct.CPUX86State** @env, align 8
  %24 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 7
  %25 = load i32* %24, align 4
  %26 = and i32 %25, 3
  %27 = and i32 %22, 4096
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %118, label %29

; <label>:29                                      ; preds = %15
  %30 = and i32 %22, 2048
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  tail call fastcc void @raise_exception_err(i32 13, i32 %1) noreturn
  unreachable

; <label>:33                                      ; preds = %29
  %34 = lshr i32 %22, 13
  %35 = and i32 %34, 3
  %36 = and i32 %22, 1024
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %41, label %38

; <label>:38                                      ; preds = %33
  %39 = icmp ugt i32 %35, %26
  br i1 %39, label %40, label %48

; <label>:40                                      ; preds = %38
  tail call fastcc void @raise_exception_err(i32 13, i32 %1) noreturn
  unreachable

; <label>:41                                      ; preds = %33
  %42 = and i32 %new_cs, 3
  %43 = icmp ugt i32 %42, %26
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  tail call fastcc void @raise_exception_err(i32 13, i32 %1) noreturn
  unreachable

; <label>:45                                      ; preds = %41
  %46 = icmp eq i32 %35, %26
  br i1 %46, label %48, label %47

; <label>:47                                      ; preds = %45
  tail call fastcc void @raise_exception_err(i32 13, i32 %1) noreturn
  unreachable

; <label>:48                                      ; preds = %45, %38
  %49 = and i32 %22, 32768
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %48
  tail call fastcc void @raise_exception_err(i32 11, i32 %1) noreturn
  unreachable

; <label>:52                                      ; preds = %48
  %53 = and i32 %20, 65535
  %54 = and i32 %22, 983040
  %55 = or i32 %54, %53
  %56 = and i32 %22, 8388608
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %get_seg_limit.exit, label %58

; <label>:58                                      ; preds = %52
  %59 = shl nuw i32 %55, 12
  %60 = or i32 %59, 4095
  br label %get_seg_limit.exit

get_seg_limit.exit:                               ; preds = %58, %52
  %limit.0.i = phi i32 [ %60, %58 ], [ %55, %52 ]
  %61 = icmp ult i32 %limit.0.i, %new_eip
  br i1 %61, label %62, label %69

; <label>:62                                      ; preds = %get_seg_limit.exit
  %63 = and i32 %25, 16384
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %69

; <label>:65                                      ; preds = %62
  %66 = and i32 %22, 2097152
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %65
  tail call fastcc void @raise_exception_err(i32 13, i32 %1) noreturn
  unreachable

; <label>:69                                      ; preds = %65, %62, %get_seg_limit.exit
  %70 = or i32 %26, %1
  %71 = lshr i32 %20, 16
  %72 = shl i32 %22, 16
  %73 = and i32 %72, 16711680
  %74 = and i32 %22, -16777216
  %75 = or i32 %74, %71
  %76 = or i32 %75, %73
  %77 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 9, i64 1, i32 0
  store i32 %70, i32* %77, align 4
  %78 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 9, i64 1, i32 1
  store i32 %76, i32* %78, align 4
  %79 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 9, i64 1, i32 2
  store i32 %limit.0.i, i32* %79, align 4
  %80 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 9, i64 1, i32 3
  store i32 %22, i32* %80, align 4
  %81 = lshr i32 %22, 18
  %82 = and i32 %81, 16
  %83 = and i32 %25, -32785
  %84 = or i32 %83, %82
  store i32 %84, i32* %24, align 4
  %85 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 9, i64 2, i32 3
  %86 = load i32* %85, align 4
  %87 = lshr i32 %86, 17
  %88 = and i32 %87, 32
  %89 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 14, i64 0
  %90 = load i32* %89, align 4
  %91 = and i32 %90, 1
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %99, label %93

; <label>:93                                      ; preds = %69
  %94 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 6
  %95 = load i32* %94, align 4
  %96 = and i32 %95, 131072
  %97 = icmp ne i32 %96, 0
  %98 = icmp eq i32 %82, 0
  %or.cond13 = or i1 %97, %98
  br i1 %or.cond13, label %99, label %101

; <label>:99                                      ; preds = %93, %69
  %100 = or i32 %88, 64
  br label %cpu_x86_load_seg_cache.exit

; <label>:101                                     ; preds = %93
  %102 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 9, i64 3, i32 1
  %103 = load i32* %102, align 4
  %104 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 9, i64 0, i32 1
  %105 = load i32* %104, align 4
  %106 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 9, i64 2, i32 1
  %107 = load i32* %106, align 4
  %108 = or i32 %105, %103
  %109 = or i32 %108, %107
  %110 = icmp ne i32 %109, 0
  %111 = zext i1 %110 to i32
  %112 = shl nuw nsw i32 %111, 6
  %113 = or i32 %112, %88
  br label %cpu_x86_load_seg_cache.exit

cpu_x86_load_seg_cache.exit:                      ; preds = %101, %99
  %new_hflags.0.i = phi i32 [ %100, %99 ], [ %113, %101 ]
  %114 = and i32 %84, -32865
  %115 = or i32 %new_hflags.0.i, %114
  store i32 %115, i32* %24, align 4
  %116 = load %struct.CPUX86State** @env, align 8
  %117 = getelementptr inbounds %struct.CPUX86State* %116, i64 0, i32 4
  store i32 %new_eip, i32* %117, align 4
  br label %251

; <label>:118                                     ; preds = %15
  %119 = lshr i32 %22, 13
  %120 = and i32 %119, 3
  %121 = and i32 %new_cs, 3
  %122 = lshr i32 %22, 8
  %123 = and i32 %122, 15
  switch i32 %123, label %250 [
    i32 1, label %124
    i32 9, label %124
    i32 5, label %124
    i32 4, label %134
    i32 12, label %134
  ]

; <label>:124                                     ; preds = %118, %118, %118
  %125 = icmp ult i32 %120, %26
  %126 = icmp ult i32 %120, %121
  %or.cond = or i1 %125, %126
  br i1 %or.cond, label %127, label %128

; <label>:127                                     ; preds = %124
  tail call fastcc void @raise_exception_err(i32 13, i32 %1) noreturn
  unreachable

; <label>:128                                     ; preds = %124
  %129 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 4
  %130 = load i32* %129, align 4
  %131 = add i32 %130, %next_eip_addend
  tail call fastcc void @switch_tss(i32 %new_cs, i32 %20, i32 %22, i32 0, i32 %131)
  %132 = load %struct.CPUX86State** @env, align 8
  %133 = getelementptr inbounds %struct.CPUX86State* %132, i64 0, i32 3
  store i32 1, i32* %133, align 4
  br label %251

; <label>:134                                     ; preds = %118, %118
  %135 = icmp ult i32 %120, %26
  %136 = icmp ult i32 %120, %121
  %or.cond1 = or i1 %135, %136
  br i1 %or.cond1, label %137, label %138

; <label>:137                                     ; preds = %134
  tail call fastcc void @raise_exception_err(i32 13, i32 %1) noreturn
  unreachable

; <label>:138                                     ; preds = %134
  %139 = and i32 %22, 32768
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %141, label %142

; <label>:141                                     ; preds = %138
  tail call fastcc void @raise_exception_err(i32 11, i32 %1) noreturn
  unreachable

; <label>:142                                     ; preds = %138
  %143 = lshr i32 %20, 16
  %144 = and i32 %20, 65535
  %145 = icmp eq i32 %123, 12
  br i1 %145, label %146, label %149

; <label>:146                                     ; preds = %142
  %147 = and i32 %22, -65536
  %148 = or i32 %147, %144
  br label %149

; <label>:149                                     ; preds = %146, %142
  %.0 = phi i32 [ %148, %146 ], [ %144, %142 ]
  %150 = and i32 %143, 4
  %151 = icmp eq i32 %150, 0
  %152 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 10
  %153 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 12
  %dt.0.i6 = select i1 %151, %struct.SegmentCache* %153, %struct.SegmentCache* %152
  %154 = or i32 %143, 7
  %155 = getelementptr inbounds %struct.SegmentCache* %dt.0.i6, i64 0, i32 2
  %156 = load i32* %155, align 4
  %157 = icmp ugt i32 %154, %156
  br i1 %157, label %158, label %160

; <label>:158                                     ; preds = %149
  %159 = and i32 %143, 65532
  tail call fastcc void @raise_exception_err(i32 13, i32 %159) noreturn
  unreachable

; <label>:160                                     ; preds = %149
  %161 = and i32 %143, 65528
  %162 = getelementptr inbounds %struct.SegmentCache* %dt.0.i6, i64 0, i32 1
  %163 = load i32* %162, align 4
  %164 = add i32 %163, %161
  %165 = tail call fastcc i32 @ldl_kernel(i32 %164) nounwind
  %166 = add i32 %164, 4
  %167 = tail call fastcc i32 @ldl_kernel(i32 %166) nounwind
  %168 = lshr i32 %167, 13
  %169 = and i32 %168, 3
  %170 = and i32 %167, 6144
  %171 = icmp eq i32 %170, 6144
  br i1 %171, label %174, label %172

; <label>:172                                     ; preds = %160
  %173 = and i32 %143, 65532
  tail call fastcc void @raise_exception_err(i32 13, i32 %173) noreturn
  unreachable

; <label>:174                                     ; preds = %160
  %175 = and i32 %167, 1024
  %176 = icmp ne i32 %175, 0
  %177 = icmp ugt i32 %169, %26
  %or.cond2 = and i1 %176, %177
  %178 = icmp eq i32 %169, %26
  %or.cond3 = or i1 %176, %178
  %or.cond14 = xor i1 %or.cond2, %or.cond3
  br i1 %or.cond14, label %181, label %179

; <label>:179                                     ; preds = %174
  %180 = and i32 %143, 65532
  tail call fastcc void @raise_exception_err(i32 13, i32 %180) noreturn
  unreachable

; <label>:181                                     ; preds = %174
  %182 = and i32 %167, 32768
  %183 = icmp eq i32 %182, 0
  br i1 %183, label %184, label %186

; <label>:184                                     ; preds = %181
  %185 = and i32 %143, 65532
  tail call fastcc void @raise_exception_err(i32 13, i32 %185) noreturn
  unreachable

; <label>:186                                     ; preds = %181
  %187 = and i32 %165, 65535
  %188 = and i32 %167, 983040
  %189 = or i32 %188, %187
  %190 = and i32 %167, 8388608
  %191 = icmp eq i32 %190, 0
  br i1 %191, label %get_seg_limit.exit10, label %192

; <label>:192                                     ; preds = %186
  %193 = shl nuw i32 %189, 12
  %194 = or i32 %193, 4095
  br label %get_seg_limit.exit10

get_seg_limit.exit10:                             ; preds = %192, %186
  %limit.0.i9 = phi i32 [ %194, %192 ], [ %189, %186 ]
  %195 = icmp ugt i32 %.0, %limit.0.i9
  br i1 %195, label %196, label %197

; <label>:196                                     ; preds = %get_seg_limit.exit10
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn
  unreachable

; <label>:197                                     ; preds = %get_seg_limit.exit10
  %198 = load %struct.CPUX86State** @env, align 8
  %199 = and i32 %143, 65532
  %200 = or i32 %26, %199
  %201 = lshr i32 %165, 16
  %202 = shl i32 %167, 16
  %203 = and i32 %202, 16711680
  %204 = and i32 %167, -16777216
  %205 = or i32 %204, %201
  %206 = or i32 %205, %203
  %207 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 9, i64 1, i32 0
  store i32 %200, i32* %207, align 4
  %208 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 9, i64 1, i32 1
  store i32 %206, i32* %208, align 4
  %209 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 9, i64 1, i32 2
  store i32 %limit.0.i9, i32* %209, align 4
  %210 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 9, i64 1, i32 3
  store i32 %167, i32* %210, align 4
  %211 = lshr i32 %167, 18
  %212 = and i32 %211, 16
  %213 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 7
  %214 = load i32* %213, align 4
  %215 = and i32 %214, -32785
  %216 = or i32 %215, %212
  store i32 %216, i32* %213, align 4
  %217 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 9, i64 2, i32 3
  %218 = load i32* %217, align 4
  %219 = lshr i32 %218, 17
  %220 = and i32 %219, 32
  %221 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 14, i64 0
  %222 = load i32* %221, align 4
  %223 = and i32 %222, 1
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %231, label %225

; <label>:225                                     ; preds = %197
  %226 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 6
  %227 = load i32* %226, align 4
  %228 = and i32 %227, 131072
  %229 = icmp ne i32 %228, 0
  %230 = icmp eq i32 %212, 0
  %or.cond15 = or i1 %229, %230
  br i1 %or.cond15, label %231, label %233

; <label>:231                                     ; preds = %225, %197
  %232 = or i32 %220, 64
  br label %cpu_x86_load_seg_cache.exit5

; <label>:233                                     ; preds = %225
  %234 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 9, i64 3, i32 1
  %235 = load i32* %234, align 4
  %236 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 9, i64 0, i32 1
  %237 = load i32* %236, align 4
  %238 = getelementptr inbounds %struct.CPUX86State* %198, i64 0, i32 9, i64 2, i32 1
  %239 = load i32* %238, align 4
  %240 = or i32 %237, %235
  %241 = or i32 %240, %239
  %242 = icmp ne i32 %241, 0
  %243 = zext i1 %242 to i32
  %244 = shl nuw nsw i32 %243, 6
  %245 = or i32 %244, %220
  br label %cpu_x86_load_seg_cache.exit5

cpu_x86_load_seg_cache.exit5:                     ; preds = %233, %231
  %new_hflags.0.i4 = phi i32 [ %232, %231 ], [ %245, %233 ]
  %246 = and i32 %216, -32865
  %247 = or i32 %new_hflags.0.i4, %246
  store i32 %247, i32* %213, align 4
  %248 = load %struct.CPUX86State** @env, align 8
  %249 = getelementptr inbounds %struct.CPUX86State* %248, i64 0, i32 4
  store i32 %.0, i32* %249, align 4
  br label %251

; <label>:250                                     ; preds = %118
  tail call fastcc void @raise_exception_err(i32 13, i32 %1) noreturn
  unreachable

; <label>:251                                     ; preds = %cpu_x86_load_seg_cache.exit5, %128, %cpu_x86_load_seg_cache.exit
  ret void
}

define internal fastcc void @switch_tss(i32 %tss_selector, i32 %e1, i32 %e2, i32 %source, i32 %next_eip) nounwind uwtable sspreq {
  %new_regs = alloca [8 x i32], align 16
  %new_segs = alloca [6 x i32], align 16
  %1 = lshr i32 %e2, 8
  %2 = and i32 %1, 15
  %3 = icmp eq i32 %2, 5
  br i1 %3, label %4, label %42

; <label>:4                                       ; preds = %0
  %5 = and i32 %e2, 32768
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %4
  %8 = and i32 %tss_selector, 65532
  call fastcc void @raise_exception_err(i32 11, i32 %8) noreturn
  unreachable

; <label>:9                                       ; preds = %4
  %10 = lshr i32 %e1, 16
  %11 = and i32 %10, 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %15, label %13

; <label>:13                                      ; preds = %9
  %14 = and i32 %10, 65532
  call fastcc void @raise_exception_err(i32 10, i32 %14) noreturn
  unreachable

; <label>:15                                      ; preds = %9
  %16 = load %struct.CPUX86State** @env, align 8
  %17 = or i32 %10, 7
  %18 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 12, i32 2
  %19 = load i32* %18, align 4
  %20 = icmp ugt i32 %17, %19
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %15
  %22 = and i32 %10, 65532
  call fastcc void @raise_exception_err(i32 13, i32 %22) noreturn
  unreachable

; <label>:23                                      ; preds = %15
  %24 = and i32 %10, 65528
  %25 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 12, i32 1
  %26 = load i32* %25, align 4
  %27 = add i32 %26, %24
  %28 = call fastcc i32 @ldl_kernel(i32 %27) nounwind
  %29 = add i32 %27, 4
  %30 = call fastcc i32 @ldl_kernel(i32 %29) nounwind
  %31 = and i32 %30, 4096
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %35, label %33

; <label>:33                                      ; preds = %23
  %34 = and i32 %10, 65532
  call fastcc void @raise_exception_err(i32 13, i32 %34) noreturn
  unreachable

; <label>:35                                      ; preds = %23
  %36 = lshr i32 %30, 8
  %37 = and i32 %36, 15
  %38 = and i32 %36, 7
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %42, label %40

; <label>:40                                      ; preds = %35
  %41 = and i32 %10, 65532
  call fastcc void @raise_exception_err(i32 13, i32 %41) noreturn
  unreachable

; <label>:42                                      ; preds = %35, %0
  %43 = phi i32 [ %30, %35 ], [ %e2, %0 ]
  %44 = phi i32 [ %28, %35 ], [ %e1, %0 ]
  %type.0 = phi i32 [ %37, %35 ], [ %2, %0 ]
  %.0 = phi i32 [ %10, %35 ], [ %tss_selector, %0 ]
  %45 = and i32 %43, 32768
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %49

; <label>:47                                      ; preds = %42
  %48 = and i32 %.0, 65532
  call fastcc void @raise_exception_err(i32 11, i32 %48) noreturn
  unreachable

; <label>:49                                      ; preds = %42
  %50 = and i32 %type.0, 8
  %51 = icmp ne i32 %50, 0
  %. = select i1 %51, i32 103, i32 43
  %52 = and i32 %44, 65535
  %53 = and i32 %43, 983040
  %54 = or i32 %52, %53
  %55 = and i32 %43, 8388608
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %get_seg_limit.exit, label %57

; <label>:57                                      ; preds = %49
  %58 = shl nuw i32 %54, 12
  %59 = or i32 %58, 4095
  br label %get_seg_limit.exit

get_seg_limit.exit:                               ; preds = %57, %49
  %limit.0.i = phi i32 [ %59, %57 ], [ %54, %49 ]
  %60 = lshr i32 %44, 16
  %61 = shl i32 %43, 16
  %62 = and i32 %61, 16711680
  %63 = and i32 %43, -16777216
  %64 = or i32 %60, %63
  %65 = or i32 %64, %62
  %66 = and i32 %.0, 4
  %67 = icmp ne i32 %66, 0
  %68 = icmp slt i32 %limit.0.i, %.
  %or.cond = or i1 %67, %68
  br i1 %or.cond, label %69, label %71

; <label>:69                                      ; preds = %get_seg_limit.exit
  %70 = and i32 %.0, 65532
  call fastcc void @raise_exception_err(i32 10, i32 %70) noreturn
  unreachable

; <label>:71                                      ; preds = %get_seg_limit.exit
  %72 = load %struct.CPUX86State** @env, align 8
  %73 = getelementptr inbounds %struct.CPUX86State* %72, i64 0, i32 11, i32 3
  %74 = load i32* %73, align 4
  %75 = and i32 %74, 2048
  %76 = icmp eq i32 %75, 0
  %.8 = select i1 %76, i32 43, i32 103
  br i1 %51, label %.preheader27, label %.preheader

.preheader27:                                     ; preds = %71
  %77 = add i32 %65, 28
  %78 = call fastcc i32 @ldl_kernel(i32 %77)
  %79 = add i32 %65, 32
  %80 = call fastcc i32 @ldl_kernel(i32 %79)
  %81 = add i32 %65, 36
  %82 = call fastcc i32 @ldl_kernel(i32 %81)
  %83 = add i32 %65, 40
  %84 = call fastcc i32 @ldl_kernel(i32 %83)
  %85 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 0
  store i32 %84, i32* %85, align 16
  %86 = add i32 %65, 44
  %87 = call fastcc i32 @ldl_kernel(i32 %86)
  %88 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 1
  store i32 %87, i32* %88, align 4
  %89 = add i32 %65, 48
  %90 = call fastcc i32 @ldl_kernel(i32 %89)
  %91 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 2
  store i32 %90, i32* %91, align 8
  %92 = add i32 %65, 52
  %93 = call fastcc i32 @ldl_kernel(i32 %92)
  %94 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 3
  store i32 %93, i32* %94, align 4
  %95 = add i32 %65, 56
  %96 = call fastcc i32 @ldl_kernel(i32 %95)
  %97 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 4
  store i32 %96, i32* %97, align 16
  %98 = add i32 %65, 60
  %99 = call fastcc i32 @ldl_kernel(i32 %98)
  %100 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 5
  store i32 %99, i32* %100, align 4
  %101 = add i32 %65, 64
  %102 = call fastcc i32 @ldl_kernel(i32 %101)
  %103 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 6
  store i32 %102, i32* %103, align 8
  %104 = add i32 %65, 68
  %105 = call fastcc i32 @ldl_kernel(i32 %104)
  %106 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 7
  store i32 %105, i32* %106, align 4
  %107 = add i32 %65, 72
  %108 = call fastcc i32 @lduw_kernel(i32 %107)
  %109 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 0
  store i32 %108, i32* %109, align 16
  %110 = add i32 %65, 76
  %111 = call fastcc i32 @lduw_kernel(i32 %110)
  %112 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 1
  store i32 %111, i32* %112, align 4
  %113 = add i32 %65, 80
  %114 = call fastcc i32 @lduw_kernel(i32 %113)
  %115 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 2
  store i32 %114, i32* %115, align 8
  %116 = add i32 %65, 84
  %117 = call fastcc i32 @lduw_kernel(i32 %116)
  %118 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 3
  store i32 %117, i32* %118, align 4
  %119 = add i32 %65, 88
  %120 = call fastcc i32 @lduw_kernel(i32 %119)
  %121 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 4
  store i32 %120, i32* %121, align 16
  %122 = add i32 %65, 92
  %123 = call fastcc i32 @lduw_kernel(i32 %122)
  %124 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 5
  store i32 %123, i32* %124, align 4
  %125 = add i32 %65, 96
  %126 = call fastcc i32 @lduw_kernel(i32 %125)
  %127 = add i32 %65, 100
  %128 = call fastcc i32 @ldl_kernel(i32 %127)
  br label %180

.preheader:                                       ; preds = %71
  %129 = add i32 %65, 14
  %130 = call fastcc i32 @lduw_kernel(i32 %129)
  %131 = add i32 %65, 16
  %132 = call fastcc i32 @lduw_kernel(i32 %131)
  %133 = add i32 %65, 18
  %134 = call fastcc i32 @lduw_kernel(i32 %133)
  %135 = or i32 %134, -65536
  %136 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 0
  store i32 %135, i32* %136, align 16
  %137 = add i32 %65, 20
  %138 = call fastcc i32 @lduw_kernel(i32 %137)
  %139 = or i32 %138, -65536
  %140 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 1
  store i32 %139, i32* %140, align 4
  %141 = add i32 %65, 22
  %142 = call fastcc i32 @lduw_kernel(i32 %141)
  %143 = or i32 %142, -65536
  %144 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 2
  store i32 %143, i32* %144, align 8
  %145 = add i32 %65, 24
  %146 = call fastcc i32 @lduw_kernel(i32 %145)
  %147 = or i32 %146, -65536
  %148 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 3
  store i32 %147, i32* %148, align 4
  %149 = add i32 %65, 26
  %150 = call fastcc i32 @lduw_kernel(i32 %149)
  %151 = or i32 %150, -65536
  %152 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 4
  store i32 %151, i32* %152, align 16
  %153 = add i32 %65, 28
  %154 = call fastcc i32 @lduw_kernel(i32 %153)
  %155 = or i32 %154, -65536
  %156 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 5
  store i32 %155, i32* %156, align 4
  %157 = add i32 %65, 30
  %158 = call fastcc i32 @lduw_kernel(i32 %157)
  %159 = or i32 %158, -65536
  %160 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 6
  store i32 %159, i32* %160, align 8
  %161 = add i32 %65, 32
  %162 = call fastcc i32 @lduw_kernel(i32 %161)
  %163 = or i32 %162, -65536
  %164 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 7
  store i32 %163, i32* %164, align 4
  %165 = add i32 %65, 34
  %166 = call fastcc i32 @lduw_kernel(i32 %165)
  %167 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 0
  store i32 %166, i32* %167, align 16
  %168 = add i32 %65, 38
  %169 = call fastcc i32 @lduw_kernel(i32 %168)
  %170 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 1
  store i32 %169, i32* %170, align 4
  %171 = add i32 %65, 42
  %172 = call fastcc i32 @lduw_kernel(i32 %171)
  %173 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 2
  store i32 %172, i32* %173, align 8
  %174 = add i32 %65, 46
  %175 = call fastcc i32 @lduw_kernel(i32 %174)
  %176 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 3
  store i32 %175, i32* %176, align 4
  %177 = call fastcc i32 @lduw_kernel(i32 %171)
  %178 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 4
  store i32 0, i32* %178, align 16
  %179 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 5
  store i32 0, i32* %179, align 4
  br label %180

; <label>:180                                     ; preds = %.preheader, %.preheader27
  %new_eflags.0 = phi i32 [ %82, %.preheader27 ], [ %132, %.preheader ]
  %new_eip.0 = phi i32 [ %80, %.preheader27 ], [ %130, %.preheader ]
  %new_cr3.0 = phi i32 [ %78, %.preheader27 ], [ 0, %.preheader ]
  %new_ldt.0 = phi i32 [ %126, %.preheader27 ], [ %177, %.preheader ]
  %181 = load %struct.CPUX86State** @env, align 8
  %182 = getelementptr inbounds %struct.CPUX86State* %181, i64 0, i32 11, i32 1
  %183 = load i32* %182, align 4
  %184 = call fastcc i32 @ldub_kernel(i32 %183)
  %185 = load %struct.CPUX86State** @env, align 8
  %186 = getelementptr inbounds %struct.CPUX86State* %185, i64 0, i32 11, i32 1
  %187 = load i32* %186, align 4
  %188 = add i32 %187, %.8
  %189 = call fastcc i32 @ldub_kernel(i32 %188)
  %190 = load %struct.CPUX86State** @env, align 8
  %191 = getelementptr inbounds %struct.CPUX86State* %190, i64 0, i32 11, i32 1
  %192 = load i32* %191, align 4
  call fastcc void @stb_kernel(i32 %192, i32 %184)
  %193 = load %struct.CPUX86State** @env, align 8
  %194 = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 11, i32 1
  %195 = load i32* %194, align 4
  %196 = add i32 %195, %.8
  call fastcc void @stb_kernel(i32 %196, i32 %189)
  %197 = icmp eq i32 %source, 1
  %198 = icmp ult i32 %source, 2
  br i1 %198, label %199, label %210

; <label>:199                                     ; preds = %180
  %200 = load %struct.CPUX86State** @env, align 8
  %201 = getelementptr inbounds %struct.CPUX86State* %200, i64 0, i32 12, i32 1
  %202 = load i32* %201, align 4
  %203 = getelementptr inbounds %struct.CPUX86State* %200, i64 0, i32 11, i32 0
  %204 = load i32* %203, align 4
  %205 = and i32 %204, -8
  %206 = add i32 %202, 4
  %207 = add i32 %206, %205
  %208 = call fastcc i32 @ldl_kernel(i32 %207)
  %209 = and i32 %208, -513
  call fastcc void @stl_kernel(i32 %207, i32 %209)
  br label %210

; <label>:210                                     ; preds = %199, %180
  %211 = load %struct.CPUX86State** @env, align 8
  %212 = getelementptr inbounds %struct.CPUX86State* %211, i64 0, i32 6
  %213 = load i32* %212, align 4
  %214 = getelementptr inbounds %struct.CPUX86State* %211, i64 0, i32 3
  %215 = load i32* %214, align 4
  %216 = call i32 @helper_cc_compute_all(i32 %215) nounwind
  %217 = getelementptr inbounds %struct.CPUX86State* %211, i64 0, i32 5
  %218 = load i32* %217, align 4
  %219 = and i32 %218, 1024
  %220 = or i32 %216, %213
  %221 = or i32 %220, %219
  %222 = and i32 %221, -16385
  %old_eflags.0 = select i1 %197, i32 %222, i32 %221
  %223 = getelementptr inbounds %struct.CPUX86State* %211, i64 0, i32 11, i32 1
  %224 = load i32* %223, align 4
  br i1 %51, label %.loopexit25, label %.loopexit

.loopexit25:                                      ; preds = %210
  %225 = add i32 %224, 32
  call fastcc void @stl_kernel(i32 %225, i32 %next_eip)
  %226 = load %struct.CPUX86State** @env, align 8
  %227 = getelementptr inbounds %struct.CPUX86State* %226, i64 0, i32 11, i32 1
  %228 = load i32* %227, align 4
  %229 = add i32 %228, 36
  call fastcc void @stl_kernel(i32 %229, i32 %old_eflags.0)
  %230 = load %struct.CPUX86State** @env, align 8
  %231 = getelementptr inbounds %struct.CPUX86State* %230, i64 0, i32 11, i32 1
  %232 = load i32* %231, align 4
  %233 = add i32 %232, 40
  %234 = getelementptr inbounds %struct.CPUX86State* %230, i64 0, i32 0, i64 0
  %235 = load i32* %234, align 4
  call fastcc void @stl_kernel(i32 %233, i32 %235)
  %236 = load %struct.CPUX86State** @env, align 8
  %237 = getelementptr inbounds %struct.CPUX86State* %236, i64 0, i32 11, i32 1
  %238 = load i32* %237, align 4
  %239 = add i32 %238, 44
  %240 = getelementptr inbounds %struct.CPUX86State* %236, i64 0, i32 0, i64 1
  %241 = load i32* %240, align 4
  call fastcc void @stl_kernel(i32 %239, i32 %241)
  %242 = load %struct.CPUX86State** @env, align 8
  %243 = getelementptr inbounds %struct.CPUX86State* %242, i64 0, i32 11, i32 1
  %244 = load i32* %243, align 4
  %245 = add i32 %244, 48
  %246 = getelementptr inbounds %struct.CPUX86State* %242, i64 0, i32 0, i64 2
  %247 = load i32* %246, align 4
  call fastcc void @stl_kernel(i32 %245, i32 %247)
  %248 = load %struct.CPUX86State** @env, align 8
  %249 = getelementptr inbounds %struct.CPUX86State* %248, i64 0, i32 11, i32 1
  %250 = load i32* %249, align 4
  %251 = add i32 %250, 52
  %252 = getelementptr inbounds %struct.CPUX86State* %248, i64 0, i32 0, i64 3
  %253 = load i32* %252, align 4
  call fastcc void @stl_kernel(i32 %251, i32 %253)
  %254 = load %struct.CPUX86State** @env, align 8
  %255 = getelementptr inbounds %struct.CPUX86State* %254, i64 0, i32 11, i32 1
  %256 = load i32* %255, align 4
  %257 = add i32 %256, 56
  %258 = getelementptr inbounds %struct.CPUX86State* %254, i64 0, i32 0, i64 4
  %259 = load i32* %258, align 4
  call fastcc void @stl_kernel(i32 %257, i32 %259)
  %260 = load %struct.CPUX86State** @env, align 8
  %261 = getelementptr inbounds %struct.CPUX86State* %260, i64 0, i32 11, i32 1
  %262 = load i32* %261, align 4
  %263 = add i32 %262, 60
  %264 = getelementptr inbounds %struct.CPUX86State* %260, i64 0, i32 0, i64 5
  %265 = load i32* %264, align 4
  call fastcc void @stl_kernel(i32 %263, i32 %265)
  %266 = load %struct.CPUX86State** @env, align 8
  %267 = getelementptr inbounds %struct.CPUX86State* %266, i64 0, i32 11, i32 1
  %268 = load i32* %267, align 4
  %269 = add i32 %268, 64
  %270 = getelementptr inbounds %struct.CPUX86State* %266, i64 0, i32 0, i64 6
  %271 = load i32* %270, align 4
  call fastcc void @stl_kernel(i32 %269, i32 %271)
  %272 = load %struct.CPUX86State** @env, align 8
  %273 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 11, i32 1
  %274 = load i32* %273, align 4
  %275 = add i32 %274, 68
  %276 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 0, i64 7
  %277 = load i32* %276, align 4
  call fastcc void @stl_kernel(i32 %275, i32 %277)
  %278 = load %struct.CPUX86State** @env, align 8
  %279 = getelementptr inbounds %struct.CPUX86State* %278, i64 0, i32 11, i32 1
  %280 = load i32* %279, align 4
  %281 = add i32 %280, 72
  %282 = getelementptr inbounds %struct.CPUX86State* %278, i64 0, i32 9, i64 0, i32 0
  %283 = load i32* %282, align 4
  call fastcc void @stw_kernel(i32 %281, i32 %283)
  %284 = load %struct.CPUX86State** @env, align 8
  %285 = getelementptr inbounds %struct.CPUX86State* %284, i64 0, i32 11, i32 1
  %286 = load i32* %285, align 4
  %287 = add i32 %286, 76
  %288 = getelementptr inbounds %struct.CPUX86State* %284, i64 0, i32 9, i64 1, i32 0
  %289 = load i32* %288, align 4
  call fastcc void @stw_kernel(i32 %287, i32 %289)
  %290 = load %struct.CPUX86State** @env, align 8
  %291 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 11, i32 1
  %292 = load i32* %291, align 4
  %293 = add i32 %292, 80
  %294 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 9, i64 2, i32 0
  %295 = load i32* %294, align 4
  call fastcc void @stw_kernel(i32 %293, i32 %295)
  %296 = load %struct.CPUX86State** @env, align 8
  %297 = getelementptr inbounds %struct.CPUX86State* %296, i64 0, i32 11, i32 1
  %298 = load i32* %297, align 4
  %299 = add i32 %298, 84
  %300 = getelementptr inbounds %struct.CPUX86State* %296, i64 0, i32 9, i64 3, i32 0
  %301 = load i32* %300, align 4
  call fastcc void @stw_kernel(i32 %299, i32 %301)
  %302 = load %struct.CPUX86State** @env, align 8
  %303 = getelementptr inbounds %struct.CPUX86State* %302, i64 0, i32 11, i32 1
  %304 = load i32* %303, align 4
  %305 = add i32 %304, 88
  %306 = getelementptr inbounds %struct.CPUX86State* %302, i64 0, i32 9, i64 4, i32 0
  %307 = load i32* %306, align 4
  call fastcc void @stw_kernel(i32 %305, i32 %307)
  %308 = load %struct.CPUX86State** @env, align 8
  %309 = getelementptr inbounds %struct.CPUX86State* %308, i64 0, i32 11, i32 1
  %310 = load i32* %309, align 4
  %311 = add i32 %310, 92
  %312 = getelementptr inbounds %struct.CPUX86State* %308, i64 0, i32 9, i64 5, i32 0
  %313 = load i32* %312, align 4
  call fastcc void @stw_kernel(i32 %311, i32 %313)
  br label %391

.loopexit:                                        ; preds = %210
  %314 = add i32 %224, 14
  call fastcc void @stw_kernel(i32 %314, i32 %next_eip)
  %315 = load %struct.CPUX86State** @env, align 8
  %316 = getelementptr inbounds %struct.CPUX86State* %315, i64 0, i32 11, i32 1
  %317 = load i32* %316, align 4
  %318 = add i32 %317, 16
  call fastcc void @stw_kernel(i32 %318, i32 %old_eflags.0)
  %319 = load %struct.CPUX86State** @env, align 8
  %320 = getelementptr inbounds %struct.CPUX86State* %319, i64 0, i32 11, i32 1
  %321 = load i32* %320, align 4
  %322 = add i32 %321, 18
  %323 = getelementptr inbounds %struct.CPUX86State* %319, i64 0, i32 0, i64 0
  %324 = load i32* %323, align 4
  call fastcc void @stw_kernel(i32 %322, i32 %324)
  %325 = load %struct.CPUX86State** @env, align 8
  %326 = getelementptr inbounds %struct.CPUX86State* %325, i64 0, i32 11, i32 1
  %327 = load i32* %326, align 4
  %328 = add i32 %327, 20
  %329 = getelementptr inbounds %struct.CPUX86State* %325, i64 0, i32 0, i64 1
  %330 = load i32* %329, align 4
  call fastcc void @stw_kernel(i32 %328, i32 %330)
  %331 = load %struct.CPUX86State** @env, align 8
  %332 = getelementptr inbounds %struct.CPUX86State* %331, i64 0, i32 11, i32 1
  %333 = load i32* %332, align 4
  %334 = add i32 %333, 22
  %335 = getelementptr inbounds %struct.CPUX86State* %331, i64 0, i32 0, i64 2
  %336 = load i32* %335, align 4
  call fastcc void @stw_kernel(i32 %334, i32 %336)
  %337 = load %struct.CPUX86State** @env, align 8
  %338 = getelementptr inbounds %struct.CPUX86State* %337, i64 0, i32 11, i32 1
  %339 = load i32* %338, align 4
  %340 = add i32 %339, 24
  %341 = getelementptr inbounds %struct.CPUX86State* %337, i64 0, i32 0, i64 3
  %342 = load i32* %341, align 4
  call fastcc void @stw_kernel(i32 %340, i32 %342)
  %343 = load %struct.CPUX86State** @env, align 8
  %344 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 11, i32 1
  %345 = load i32* %344, align 4
  %346 = add i32 %345, 26
  %347 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 0, i64 4
  %348 = load i32* %347, align 4
  call fastcc void @stw_kernel(i32 %346, i32 %348)
  %349 = load %struct.CPUX86State** @env, align 8
  %350 = getelementptr inbounds %struct.CPUX86State* %349, i64 0, i32 11, i32 1
  %351 = load i32* %350, align 4
  %352 = add i32 %351, 28
  %353 = getelementptr inbounds %struct.CPUX86State* %349, i64 0, i32 0, i64 5
  %354 = load i32* %353, align 4
  call fastcc void @stw_kernel(i32 %352, i32 %354)
  %355 = load %struct.CPUX86State** @env, align 8
  %356 = getelementptr inbounds %struct.CPUX86State* %355, i64 0, i32 11, i32 1
  %357 = load i32* %356, align 4
  %358 = add i32 %357, 30
  %359 = getelementptr inbounds %struct.CPUX86State* %355, i64 0, i32 0, i64 6
  %360 = load i32* %359, align 4
  call fastcc void @stw_kernel(i32 %358, i32 %360)
  %361 = load %struct.CPUX86State** @env, align 8
  %362 = getelementptr inbounds %struct.CPUX86State* %361, i64 0, i32 11, i32 1
  %363 = load i32* %362, align 4
  %364 = add i32 %363, 32
  %365 = getelementptr inbounds %struct.CPUX86State* %361, i64 0, i32 0, i64 7
  %366 = load i32* %365, align 4
  call fastcc void @stw_kernel(i32 %364, i32 %366)
  %367 = load %struct.CPUX86State** @env, align 8
  %368 = getelementptr inbounds %struct.CPUX86State* %367, i64 0, i32 11, i32 1
  %369 = load i32* %368, align 4
  %370 = add i32 %369, 34
  %371 = getelementptr inbounds %struct.CPUX86State* %367, i64 0, i32 9, i64 0, i32 0
  %372 = load i32* %371, align 4
  call fastcc void @stw_kernel(i32 %370, i32 %372)
  %373 = load %struct.CPUX86State** @env, align 8
  %374 = getelementptr inbounds %struct.CPUX86State* %373, i64 0, i32 11, i32 1
  %375 = load i32* %374, align 4
  %376 = add i32 %375, 38
  %377 = getelementptr inbounds %struct.CPUX86State* %373, i64 0, i32 9, i64 1, i32 0
  %378 = load i32* %377, align 4
  call fastcc void @stw_kernel(i32 %376, i32 %378)
  %379 = load %struct.CPUX86State** @env, align 8
  %380 = getelementptr inbounds %struct.CPUX86State* %379, i64 0, i32 11, i32 1
  %381 = load i32* %380, align 4
  %382 = add i32 %381, 42
  %383 = getelementptr inbounds %struct.CPUX86State* %379, i64 0, i32 9, i64 2, i32 0
  %384 = load i32* %383, align 4
  call fastcc void @stw_kernel(i32 %382, i32 %384)
  %385 = load %struct.CPUX86State** @env, align 8
  %386 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 11, i32 1
  %387 = load i32* %386, align 4
  %388 = add i32 %387, 46
  %389 = getelementptr inbounds %struct.CPUX86State* %385, i64 0, i32 9, i64 3, i32 0
  %390 = load i32* %389, align 4
  call fastcc void @stw_kernel(i32 %388, i32 %390)
  br label %391

; <label>:391                                     ; preds = %.loopexit, %.loopexit25
  switch i32 %source, label %405 [
    i32 2, label %.thread
    i32 0, label %396
  ]

.thread:                                          ; preds = %391
  %392 = load %struct.CPUX86State** @env, align 8
  %393 = getelementptr inbounds %struct.CPUX86State* %392, i64 0, i32 11, i32 0
  %394 = load i32* %393, align 4
  call fastcc void @stw_kernel(i32 %65, i32 %394)
  %395 = or i32 %new_eflags.0, 16384
  br label %396

; <label>:396                                     ; preds = %.thread, %391
  %new_eflags.112 = phi i32 [ %395, %.thread ], [ %new_eflags.0, %391 ]
  %397 = load %struct.CPUX86State** @env, align 8
  %398 = getelementptr inbounds %struct.CPUX86State* %397, i64 0, i32 12, i32 1
  %399 = load i32* %398, align 4
  %400 = and i32 %.0, -8
  %401 = or i32 %400, 4
  %402 = add i32 %399, %401
  %403 = call fastcc i32 @ldl_kernel(i32 %402)
  %404 = or i32 %403, 512
  call fastcc void @stl_kernel(i32 %402, i32 %404)
  br label %405

; <label>:405                                     ; preds = %396, %391
  %new_eflags.113 = phi i32 [ %new_eflags.112, %396 ], [ %new_eflags.0, %391 ]
  %406 = load %struct.CPUX86State** @env, align 8
  %407 = getelementptr inbounds %struct.CPUX86State* %406, i64 0, i32 14, i64 0
  %408 = load i32* %407, align 4
  %409 = or i32 %408, 8
  store i32 %409, i32* %407, align 4
  %410 = load %struct.CPUX86State** @env, align 8
  %411 = getelementptr inbounds %struct.CPUX86State* %410, i64 0, i32 7
  %412 = load i32* %411, align 4
  %413 = or i32 %412, 2048
  store i32 %413, i32* %411, align 4
  %414 = load %struct.CPUX86State** @env, align 8
  %415 = getelementptr inbounds %struct.CPUX86State* %414, i64 0, i32 11, i32 0
  store i32 %.0, i32* %415, align 4
  %416 = load %struct.CPUX86State** @env, align 8
  %417 = getelementptr inbounds %struct.CPUX86State* %416, i64 0, i32 11, i32 1
  store i32 %65, i32* %417, align 4
  %418 = load %struct.CPUX86State** @env, align 8
  %419 = getelementptr inbounds %struct.CPUX86State* %418, i64 0, i32 11, i32 2
  store i32 %limit.0.i, i32* %419, align 4
  %420 = and i32 %43, -513
  %421 = load %struct.CPUX86State** @env, align 8
  %422 = getelementptr inbounds %struct.CPUX86State* %421, i64 0, i32 11, i32 3
  store i32 %420, i32* %422, align 4
  %423 = load %struct.CPUX86State** @env, align 8
  br i1 %51, label %424, label %432

; <label>:424                                     ; preds = %405
  %425 = getelementptr inbounds %struct.CPUX86State* %423, i64 0, i32 14, i64 0
  %426 = load i32* %425, align 4
  %427 = icmp slt i32 %426, 0
  br i1 %427, label %429, label %.thread14

.thread14:                                        ; preds = %424
  %428 = getelementptr inbounds %struct.CPUX86State* %423, i64 0, i32 4
  store i32 %new_eip.0, i32* %428, align 4
  br label %434

; <label>:429                                     ; preds = %424
  call void @cpu_x86_update_cr3(%struct.CPUX86State* %423, i32 %new_cr3.0) nounwind
  %430 = load %struct.CPUX86State** @env, align 8
  %431 = getelementptr inbounds %struct.CPUX86State* %430, i64 0, i32 4
  store i32 %new_eip.0, i32* %431, align 4
  br label %434

; <label>:432                                     ; preds = %405
  %433 = getelementptr inbounds %struct.CPUX86State* %423, i64 0, i32 4
  store i32 %new_eip.0, i32* %433, align 4
  br label %434

; <label>:434                                     ; preds = %432, %429, %.thread14
  %eflags_mask.0 = phi i32 [ 2585344, %429 ], [ 29440, %432 ], [ 2585344, %.thread14 ]
  %435 = and i32 %new_eflags.113, 2261
  %436 = load %struct.CPUX86State** @env, align 8
  %437 = getelementptr inbounds %struct.CPUX86State* %436, i64 0, i32 1
  store i32 %435, i32* %437, align 4
  %438 = lshr i32 %new_eflags.113, 9
  %439 = and i32 %438, 2
  %440 = xor i32 %439, 2
  %441 = add i32 %440, -1
  %442 = load %struct.CPUX86State** @env, align 8
  %443 = getelementptr inbounds %struct.CPUX86State* %442, i64 0, i32 5
  store i32 %441, i32* %443, align 4
  %444 = load %struct.CPUX86State** @env, align 8
  %445 = getelementptr inbounds %struct.CPUX86State* %444, i64 0, i32 6
  %446 = load i32* %445, align 4
  %447 = xor i32 %eflags_mask.0, -1
  %448 = and i32 %446, %447
  %449 = and i32 %eflags_mask.0, %new_eflags.113
  %450 = or i32 %448, %449
  store i32 %450, i32* %445, align 4
  %451 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 0
  %452 = load i32* %451, align 16
  %453 = load %struct.CPUX86State** @env, align 8
  %454 = getelementptr inbounds %struct.CPUX86State* %453, i64 0, i32 0, i64 0
  store i32 %452, i32* %454, align 4
  %455 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 1
  %456 = load i32* %455, align 4
  %457 = load %struct.CPUX86State** @env, align 8
  %458 = getelementptr inbounds %struct.CPUX86State* %457, i64 0, i32 0, i64 1
  store i32 %456, i32* %458, align 4
  %459 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 2
  %460 = load i32* %459, align 8
  %461 = load %struct.CPUX86State** @env, align 8
  %462 = getelementptr inbounds %struct.CPUX86State* %461, i64 0, i32 0, i64 2
  store i32 %460, i32* %462, align 4
  %463 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 3
  %464 = load i32* %463, align 4
  %465 = load %struct.CPUX86State** @env, align 8
  %466 = getelementptr inbounds %struct.CPUX86State* %465, i64 0, i32 0, i64 3
  store i32 %464, i32* %466, align 4
  %467 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 4
  %468 = load i32* %467, align 16
  %469 = load %struct.CPUX86State** @env, align 8
  %470 = getelementptr inbounds %struct.CPUX86State* %469, i64 0, i32 0, i64 4
  store i32 %468, i32* %470, align 4
  %471 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 5
  %472 = load i32* %471, align 4
  %473 = load %struct.CPUX86State** @env, align 8
  %474 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 0, i64 5
  store i32 %472, i32* %474, align 4
  %475 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 6
  %476 = load i32* %475, align 8
  %477 = load %struct.CPUX86State** @env, align 8
  %478 = getelementptr inbounds %struct.CPUX86State* %477, i64 0, i32 0, i64 6
  store i32 %476, i32* %478, align 4
  %479 = getelementptr inbounds [8 x i32]* %new_regs, i64 0, i64 7
  %480 = load i32* %479, align 4
  %481 = load %struct.CPUX86State** @env, align 8
  %482 = getelementptr inbounds %struct.CPUX86State* %481, i64 0, i32 0, i64 7
  store i32 %480, i32* %482, align 4
  %483 = and i32 %new_eflags.113, 131072
  %484 = icmp ne i32 %483, 0
  br i1 %484, label %.preheader23, label %551

.preheader23:                                     ; preds = %load_seg_vm.exit, %434
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %load_seg_vm.exit ], [ 0, %434 ]
  %485 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 %indvars.iv35
  %486 = load i32* %485, align 4
  %487 = and i32 %486, 65535
  %488 = load %struct.CPUX86State** @env, align 8
  %489 = shl nuw nsw i32 %487, 4
  %490 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 9, i64 %indvars.iv35, i32 0
  store i32 %487, i32* %490, align 4
  %491 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 9, i64 %indvars.iv35, i32 1
  store i32 %489, i32* %491, align 4
  %492 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 9, i64 %indvars.iv35, i32 2
  store i32 65535, i32* %492, align 4
  %493 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 9, i64 %indvars.iv35, i32 3
  store i32 0, i32* %493, align 4
  %494 = trunc i64 %indvars.iv35 to i32
  %495 = icmp eq i32 %494, 1
  br i1 %495, label %496, label %._crit_edge.i.i

._crit_edge.i.i:                                  ; preds = %.preheader23
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 7
  %.pre.i.i = load i32* %.phi.trans.insert.i.i, align 4
  br label %505

; <label>:496                                     ; preds = %.preheader23
  %497 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 9, i64 1, i32 3
  %498 = load i32* %497, align 4
  %499 = lshr i32 %498, 18
  %500 = and i32 %499, 16
  %501 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 7
  %502 = load i32* %501, align 4
  %503 = and i32 %502, -32785
  %504 = or i32 %503, %500
  store i32 %504, i32* %501, align 4
  br label %505

; <label>:505                                     ; preds = %496, %._crit_edge.i.i
  %506 = phi i32 [ %.pre.i.i, %._crit_edge.i.i ], [ %504, %496 ]
  %507 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 9, i64 2, i32 3
  %508 = load i32* %507, align 4
  %509 = lshr i32 %508, 17
  %510 = and i32 %509, 32
  %511 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 7
  %512 = and i32 %506, 32768
  %513 = icmp eq i32 %512, 0
  br i1 %513, label %514, label %load_seg_vm.exit

; <label>:514                                     ; preds = %505
  %515 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 14, i64 0
  %516 = load i32* %515, align 4
  %517 = and i32 %516, 1
  %518 = icmp eq i32 %517, 0
  br i1 %518, label %527, label %519

; <label>:519                                     ; preds = %514
  %520 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 6
  %521 = load i32* %520, align 4
  %522 = and i32 %521, 131072
  %523 = icmp eq i32 %522, 0
  br i1 %523, label %524, label %527

; <label>:524                                     ; preds = %519
  %525 = and i32 %506, 16
  %526 = icmp eq i32 %525, 0
  br i1 %526, label %527, label %529

; <label>:527                                     ; preds = %524, %519, %514
  %528 = or i32 %510, 64
  br label %load_seg_vm.exit

; <label>:529                                     ; preds = %524
  %530 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 9, i64 3, i32 1
  %531 = load i32* %530, align 4
  %532 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 9, i64 0, i32 1
  %533 = load i32* %532, align 4
  %534 = getelementptr inbounds %struct.CPUX86State* %488, i64 0, i32 9, i64 2, i32 1
  %535 = load i32* %534, align 4
  %536 = or i32 %533, %531
  %537 = or i32 %536, %535
  %538 = icmp ne i32 %537, 0
  %539 = zext i1 %538 to i32
  %540 = shl nuw nsw i32 %539, 6
  %541 = or i32 %540, %510
  br label %load_seg_vm.exit

load_seg_vm.exit:                                 ; preds = %529, %527, %505
  %new_hflags.0.i.i = phi i32 [ %510, %505 ], [ %528, %527 ], [ %541, %529 ]
  %542 = and i32 %506, -97
  %543 = or i32 %new_hflags.0.i.i, %542
  store i32 %543, i32* %511, align 4
  %indvars.iv.next36 = add i64 %indvars.iv35, 1
  %lftr.wideiv37 = trunc i64 %indvars.iv.next36 to i32
  %exitcond38 = icmp eq i32 %lftr.wideiv37, 6
  br i1 %exitcond38, label %544, label %.preheader23

; <label>:544                                     ; preds = %load_seg_vm.exit
  %545 = load %struct.CPUX86State** @env, align 8
  %546 = getelementptr inbounds %struct.CPUX86State* %545, i64 0, i32 7
  %547 = load i32* %546, align 4
  %548 = and i32 %547, 3
  call void @s2e_on_privilege_change(i32 %548, i32 3) nounwind
  %549 = load i32* %546, align 4
  %550 = or i32 %549, 3
  store i32 %550, i32* %546, align 4
  br label %.loopexit18

; <label>:551                                     ; preds = %434
  %552 = load %struct.CPUX86State** @env, align 8
  %553 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 1
  %554 = load i32* %553, align 4
  %555 = and i32 %554, 3
  %556 = getelementptr inbounds %struct.CPUX86State* %552, i64 0, i32 7
  %557 = load i32* %556, align 4
  %558 = and i32 %557, 3
  call void @s2e_on_privilege_change(i32 %558, i32 %555) nounwind
  %559 = load i32* %556, align 4
  %560 = and i32 %559, -4
  %561 = or i32 %560, %555
  store i32 %561, i32* %556, align 4
  br label %562

; <label>:562                                     ; preds = %cpu_x86_load_seg_cache.exit, %551
  %indvars.iv = phi i64 [ 0, %551 ], [ %indvars.iv.next, %cpu_x86_load_seg_cache.exit ]
  %563 = load %struct.CPUX86State** @env, align 8
  %564 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 %indvars.iv
  %565 = load i32* %564, align 4
  %566 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 9, i64 %indvars.iv, i32 0
  store i32 %565, i32* %566, align 4
  %567 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 9, i64 %indvars.iv, i32 1
  store i32 0, i32* %567, align 4
  %568 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 9, i64 %indvars.iv, i32 2
  store i32 0, i32* %568, align 4
  %569 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 9, i64 %indvars.iv, i32 3
  store i32 0, i32* %569, align 4
  %570 = trunc i64 %indvars.iv to i32
  %571 = icmp eq i32 %570, 1
  br i1 %571, label %572, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %562
  %.phi.trans.insert.i = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 7
  %.pre.i = load i32* %.phi.trans.insert.i, align 4
  br label %581

; <label>:572                                     ; preds = %562
  %573 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 9, i64 1, i32 3
  %574 = load i32* %573, align 4
  %575 = lshr i32 %574, 18
  %576 = and i32 %575, 16
  %577 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 7
  %578 = load i32* %577, align 4
  %579 = and i32 %578, -32785
  %580 = or i32 %579, %576
  store i32 %580, i32* %577, align 4
  br label %581

; <label>:581                                     ; preds = %572, %._crit_edge.i
  %582 = phi i32 [ %.pre.i, %._crit_edge.i ], [ %580, %572 ]
  %583 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 9, i64 2, i32 3
  %584 = load i32* %583, align 4
  %585 = lshr i32 %584, 17
  %586 = and i32 %585, 32
  %587 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 7
  %588 = and i32 %582, 32768
  %589 = icmp eq i32 %588, 0
  br i1 %589, label %590, label %cpu_x86_load_seg_cache.exit

; <label>:590                                     ; preds = %581
  %591 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 14, i64 0
  %592 = load i32* %591, align 4
  %593 = and i32 %592, 1
  %594 = icmp eq i32 %593, 0
  br i1 %594, label %603, label %595

; <label>:595                                     ; preds = %590
  %596 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 6
  %597 = load i32* %596, align 4
  %598 = and i32 %597, 131072
  %599 = icmp eq i32 %598, 0
  br i1 %599, label %600, label %603

; <label>:600                                     ; preds = %595
  %601 = and i32 %582, 16
  %602 = icmp eq i32 %601, 0
  br i1 %602, label %603, label %605

; <label>:603                                     ; preds = %600, %595, %590
  %604 = or i32 %586, 64
  br label %cpu_x86_load_seg_cache.exit

; <label>:605                                     ; preds = %600
  %606 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 9, i64 3, i32 1
  %607 = load i32* %606, align 4
  %608 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 9, i64 0, i32 1
  %609 = load i32* %608, align 4
  %610 = getelementptr inbounds %struct.CPUX86State* %563, i64 0, i32 9, i64 2, i32 1
  %611 = load i32* %610, align 4
  %612 = or i32 %609, %607
  %613 = or i32 %612, %611
  %614 = icmp ne i32 %613, 0
  %615 = zext i1 %614 to i32
  %616 = shl nuw nsw i32 %615, 6
  %617 = or i32 %616, %586
  br label %cpu_x86_load_seg_cache.exit

cpu_x86_load_seg_cache.exit:                      ; preds = %605, %603, %581
  %new_hflags.0.i = phi i32 [ %586, %581 ], [ %604, %603 ], [ %617, %605 ]
  %618 = and i32 %582, -97
  %619 = or i32 %new_hflags.0.i, %618
  store i32 %619, i32* %587, align 4
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 6
  br i1 %exitcond, label %.loopexit18, label %562

.loopexit18:                                      ; preds = %cpu_x86_load_seg_cache.exit, %544
  %620 = and i32 %new_ldt.0, -5
  %621 = load %struct.CPUX86State** @env, align 8
  %622 = getelementptr inbounds %struct.CPUX86State* %621, i64 0, i32 10, i32 0
  store i32 %620, i32* %622, align 4
  %623 = load %struct.CPUX86State** @env, align 8
  %624 = getelementptr inbounds %struct.CPUX86State* %623, i64 0, i32 10, i32 1
  store i32 0, i32* %624, align 4
  %625 = load %struct.CPUX86State** @env, align 8
  %626 = getelementptr inbounds %struct.CPUX86State* %625, i64 0, i32 10, i32 2
  store i32 0, i32* %626, align 4
  %627 = load %struct.CPUX86State** @env, align 8
  %628 = getelementptr inbounds %struct.CPUX86State* %627, i64 0, i32 10, i32 3
  store i32 0, i32* %628, align 4
  %629 = and i32 %new_ldt.0, 4
  %630 = icmp eq i32 %629, 0
  %631 = and i32 %new_ldt.0, 65532
  br i1 %630, label %633, label %632

; <label>:632                                     ; preds = %.loopexit18
  call fastcc void @raise_exception_err(i32 10, i32 %631) noreturn
  unreachable

; <label>:633                                     ; preds = %.loopexit18
  %634 = icmp eq i32 %631, 0
  br i1 %634, label %676, label %635

; <label>:635                                     ; preds = %633
  %636 = load %struct.CPUX86State** @env, align 8
  %637 = or i32 %new_ldt.0, 7
  %638 = getelementptr inbounds %struct.CPUX86State* %636, i64 0, i32 12, i32 2
  %639 = load i32* %638, align 4
  %640 = icmp ugt i32 %637, %639
  br i1 %640, label %641, label %642

; <label>:641                                     ; preds = %635
  call fastcc void @raise_exception_err(i32 10, i32 %631) noreturn
  unreachable

; <label>:642                                     ; preds = %635
  %643 = and i32 %new_ldt.0, -8
  %644 = getelementptr inbounds %struct.CPUX86State* %636, i64 0, i32 12, i32 1
  %645 = load i32* %644, align 4
  %646 = add i32 %645, %643
  %647 = call fastcc i32 @ldl_kernel(i32 %646)
  %648 = add i32 %646, 4
  %649 = call fastcc i32 @ldl_kernel(i32 %648)
  %650 = and i32 %649, 7936
  %651 = icmp eq i32 %650, 512
  br i1 %651, label %653, label %652

; <label>:652                                     ; preds = %642
  call fastcc void @raise_exception_err(i32 10, i32 %631) noreturn
  unreachable

; <label>:653                                     ; preds = %642
  %654 = and i32 %649, 32768
  %655 = icmp eq i32 %654, 0
  br i1 %655, label %656, label %657

; <label>:656                                     ; preds = %653
  call fastcc void @raise_exception_err(i32 10, i32 %631) noreturn
  unreachable

; <label>:657                                     ; preds = %653
  %658 = load %struct.CPUX86State** @env, align 8
  %659 = lshr i32 %647, 16
  %660 = shl i32 %649, 16
  %661 = and i32 %660, 16711680
  %662 = and i32 %649, -16777216
  %663 = or i32 %662, %659
  %664 = or i32 %663, %661
  %665 = getelementptr inbounds %struct.CPUX86State* %658, i64 0, i32 10, i32 1
  store i32 %664, i32* %665, align 4
  %666 = and i32 %647, 65535
  %667 = and i32 %649, 983040
  %668 = or i32 %667, %666
  %669 = and i32 %649, 8388608
  %670 = icmp eq i32 %669, 0
  br i1 %670, label %load_seg_cache_raw_dt.exit, label %671

; <label>:671                                     ; preds = %657
  %672 = shl nuw i32 %668, 12
  %673 = or i32 %672, 4095
  br label %load_seg_cache_raw_dt.exit

load_seg_cache_raw_dt.exit:                       ; preds = %671, %657
  %limit.0.i.i = phi i32 [ %673, %671 ], [ %668, %657 ]
  %674 = getelementptr inbounds %struct.CPUX86State* %658, i64 0, i32 10, i32 2
  store i32 %limit.0.i.i, i32* %674, align 4
  %675 = getelementptr inbounds %struct.CPUX86State* %658, i64 0, i32 10, i32 3
  store i32 %649, i32* %675, align 4
  br label %676

; <label>:676                                     ; preds = %load_seg_cache_raw_dt.exit, %633
  br i1 %484, label %690, label %677

; <label>:677                                     ; preds = %676
  %678 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 1
  %679 = load i32* %678, align 4
  call fastcc void @tss_load_seg(i32 1, i32 %679)
  %680 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 2
  %681 = load i32* %680, align 8
  call fastcc void @tss_load_seg(i32 2, i32 %681)
  %682 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 0
  %683 = load i32* %682, align 16
  call fastcc void @tss_load_seg(i32 0, i32 %683)
  %684 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 3
  %685 = load i32* %684, align 4
  call fastcc void @tss_load_seg(i32 3, i32 %685)
  %686 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 4
  %687 = load i32* %686, align 16
  call fastcc void @tss_load_seg(i32 4, i32 %687)
  %688 = getelementptr inbounds [6 x i32]* %new_segs, i64 0, i64 5
  %689 = load i32* %688, align 4
  call fastcc void @tss_load_seg(i32 5, i32 %689)
  br label %690

; <label>:690                                     ; preds = %677, %676
  %691 = load %struct.CPUX86State** @env, align 8
  %692 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 9, i64 1, i32 2
  %693 = load i32* %692, align 4
  %694 = icmp ugt i32 %new_eip.0, %693
  br i1 %694, label %695, label %696

; <label>:695                                     ; preds = %690
  call fastcc void @raise_exception_err(i32 13, i32 0) noreturn
  unreachable

; <label>:696                                     ; preds = %690
  %697 = getelementptr inbounds %struct.CPUX86State* %691, i64 0, i32 59, i64 7
  %698 = load i32* %697, align 4
  %699 = and i32 %698, 85
  %700 = icmp eq i32 %699, 0
  br i1 %700, label %709, label %.preheader20

.preheader20:                                     ; preds = %696
  %701 = and i32 %698, 3
  %702 = icmp eq i32 %701, 1
  br i1 %702, label %703, label %704

; <label>:703                                     ; preds = %.preheader20
  call void @hw_breakpoint_remove(%struct.CPUX86State* %691, i32 0) nounwind
  %.pre = load %struct.CPUX86State** @env, align 8
  %.phi.trans.insert = getelementptr inbounds %struct.CPUX86State* %.pre, i64 0, i32 59, i64 7
  %.pre51 = load i32* %.phi.trans.insert, align 4
  br label %704

; <label>:704                                     ; preds = %703, %.preheader20
  %705 = phi i32 [ %698, %.preheader20 ], [ %.pre51, %703 ]
  %706 = phi %struct.CPUX86State* [ %691, %.preheader20 ], [ %.pre, %703 ]
  %707 = and i32 %705, 12
  %708 = icmp eq i32 %707, 4
  br i1 %708, label %710, label %711

; <label>:709                                     ; preds = %723, %696
  ret void

; <label>:710                                     ; preds = %704
  call void @hw_breakpoint_remove(%struct.CPUX86State* %706, i32 1) nounwind
  %.pre52 = load %struct.CPUX86State** @env, align 8
  %.phi.trans.insert53 = getelementptr inbounds %struct.CPUX86State* %.pre52, i64 0, i32 59, i64 7
  %.pre54 = load i32* %.phi.trans.insert53, align 4
  br label %711

; <label>:711                                     ; preds = %710, %704
  %712 = phi i32 [ %.pre54, %710 ], [ %705, %704 ]
  %713 = phi %struct.CPUX86State* [ %.pre52, %710 ], [ %706, %704 ]
  %714 = and i32 %712, 48
  %715 = icmp eq i32 %714, 16
  br i1 %715, label %716, label %717

; <label>:716                                     ; preds = %711
  call void @hw_breakpoint_remove(%struct.CPUX86State* %713, i32 2) nounwind
  %.pre55 = load %struct.CPUX86State** @env, align 8
  %.phi.trans.insert56 = getelementptr inbounds %struct.CPUX86State* %.pre55, i64 0, i32 59, i64 7
  %.pre57 = load i32* %.phi.trans.insert56, align 4
  br label %717

; <label>:717                                     ; preds = %716, %711
  %718 = phi i32 [ %.pre57, %716 ], [ %712, %711 ]
  %719 = phi %struct.CPUX86State* [ %.pre55, %716 ], [ %713, %711 ]
  %720 = and i32 %718, 192
  %721 = icmp eq i32 %720, 64
  br i1 %721, label %722, label %723

; <label>:722                                     ; preds = %717
  call void @hw_breakpoint_remove(%struct.CPUX86State* %719, i32 3) nounwind
  %.pre58 = load %struct.CPUX86State** @env, align 8
  %.phi.trans.insert59 = getelementptr inbounds %struct.CPUX86State* %.pre58, i64 0, i32 59, i64 7
  %.pre60 = load i32* %.phi.trans.insert59, align 4
  br label %723

; <label>:723                                     ; preds = %722, %717
  %724 = phi i32 [ %.pre60, %722 ], [ %718, %717 ]
  %725 = phi %struct.CPUX86State* [ %.pre58, %722 ], [ %719, %717 ]
  %726 = getelementptr inbounds %struct.CPUX86State* %725, i64 0, i32 59, i64 7
  %727 = and i32 %724, -86
  store i32 %727, i32* %726, align 4
  br label %709
}

define void @helper_lcall_real(i32 %new_cs, i32 %new_eip1, i32 %shift, i32 %next_eip) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 4
  %3 = load i32* %2, align 4
  %4 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 2, i32 3
  %5 = load i32* %4, align 4
  %6 = lshr i32 %5, 6
  %7 = and i32 %6, 65536
  %8 = xor i32 %7, 65536
  %9 = add i32 %8, -1
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 2, i32 1
  %11 = load i32* %10, align 4
  %12 = icmp eq i32 %shift, 0
  br i1 %12, label %22, label %13

; <label>:13                                      ; preds = %0
  %14 = add i32 %3, -4
  %15 = and i32 %9, %14
  %16 = add i32 %15, %11
  %17 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 1, i32 0
  %18 = load i32* %17, align 4
  tail call fastcc void @stl_kernel(i32 %16, i32 %18)
  %19 = add i32 %3, -8
  %20 = and i32 %9, %19
  %21 = add i32 %20, %11
  tail call fastcc void @stl_kernel(i32 %21, i32 %next_eip)
  br label %31

; <label>:22                                      ; preds = %0
  %23 = add i32 %3, -2
  %24 = and i32 %9, %23
  %25 = add i32 %24, %11
  %26 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 1, i32 0
  %27 = load i32* %26, align 4
  tail call fastcc void @stw_kernel(i32 %25, i32 %27)
  %28 = add i32 %3, -4
  %29 = and i32 %9, %28
  %30 = add i32 %29, %11
  tail call fastcc void @stw_kernel(i32 %30, i32 %next_eip)
  br label %31

; <label>:31                                      ; preds = %22, %13
  %esp.0 = phi i32 [ %19, %13 ], [ %28, %22 ]
  %32 = load %struct.CPUX86State** @env, align 8
  %33 = getelementptr inbounds %struct.CPUX86State* %32, i64 0, i32 0, i64 4
  %34 = load i32* %33, align 4
  %35 = sub i32 0, %8
  %36 = and i32 %34, %35
  %37 = and i32 %esp.0, %9
  %38 = or i32 %36, %37
  store i32 %38, i32* %33, align 4
  %39 = load %struct.CPUX86State** @env, align 8
  %40 = getelementptr inbounds %struct.CPUX86State* %39, i64 0, i32 4
  store i32 %new_eip1, i32* %40, align 4
  %41 = load %struct.CPUX86State** @env, align 8
  %42 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 9, i64 1, i32 0
  store i32 %new_cs, i32* %42, align 4
  %43 = shl i32 %new_cs, 4
  %44 = load %struct.CPUX86State** @env, align 8
  %45 = getelementptr inbounds %struct.CPUX86State* %44, i64 0, i32 9, i64 1, i32 1
  store i32 %43, i32* %45, align 4
  ret void
}

define internal fastcc void @stw_kernel(i32 %ptr, i32 %v) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 1
  %16 = load i32* %15, align 4
  %17 = and i32 %8, -4095
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %21, label %19, !prof !0

; <label>:19                                      ; preds = %6
  %20 = trunc i32 %v to i16
  tail call void @__stw_mmu(i32 %8, i16 zeroext %20, i32 0)
  br label %29

; <label>:21                                      ; preds = %6
  %22 = and i64 %7, 4294967295
  %23 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 3
  %24 = load i64* %23, align 8
  %25 = add i64 %24, %22
  %26 = trunc i32 %v to i16
  %27 = inttoptr i64 %25 to i16*
  store i16 %26, i16* %27, align 2
  %28 = zext i32 %v to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %22, i64 %25, i64 %28, i32 32, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %29

; <label>:29                                      ; preds = %21, %19
  ret void
}

define void @helper_lcall_protected(i32 %new_cs, i32 %new_eip, i32 %shift, i32 %next_eip_addend) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 4
  %3 = load i32* %2, align 4
  %4 = add i32 %3, %next_eip_addend
  %5 = and i32 %new_cs, 65532
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn
  unreachable

; <label>:8                                       ; preds = %0
  %9 = and i32 %new_cs, 4
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 10
  %12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 12
  %dt.0.i = select i1 %10, %struct.SegmentCache* %12, %struct.SegmentCache* %11
  %13 = or i32 %new_cs, 7
  %14 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 2
  %15 = load i32* %14, align 4
  %16 = icmp ugt i32 %13, %15
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %8
  tail call fastcc void @raise_exception_err(i32 13, i32 %5) noreturn
  unreachable

; <label>:18                                      ; preds = %8
  %19 = and i32 %new_cs, -8
  %20 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 1
  %21 = load i32* %20, align 4
  %22 = add i32 %21, %19
  %23 = tail call fastcc i32 @ldl_kernel(i32 %22) nounwind
  %24 = add i32 %22, 4
  %25 = tail call fastcc i32 @ldl_kernel(i32 %24) nounwind
  %26 = load %struct.CPUX86State** @env, align 8
  %27 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 7
  %28 = load i32* %27, align 4
  %29 = and i32 %28, 3
  %30 = and i32 %25, 4096
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %156, label %32

; <label>:32                                      ; preds = %18
  %33 = and i32 %25, 2048
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %32
  tail call fastcc void @raise_exception_err(i32 13, i32 %5) noreturn
  unreachable

; <label>:36                                      ; preds = %32
  %37 = lshr i32 %25, 13
  %38 = and i32 %37, 3
  %39 = and i32 %25, 1024
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %44, label %41

; <label>:41                                      ; preds = %36
  %42 = icmp ugt i32 %38, %29
  br i1 %42, label %43, label %51

; <label>:43                                      ; preds = %41
  tail call fastcc void @raise_exception_err(i32 13, i32 %5) noreturn
  unreachable

; <label>:44                                      ; preds = %36
  %45 = and i32 %new_cs, 3
  %46 = icmp ugt i32 %45, %29
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %44
  tail call fastcc void @raise_exception_err(i32 13, i32 %5) noreturn
  unreachable

; <label>:48                                      ; preds = %44
  %49 = icmp eq i32 %38, %29
  br i1 %49, label %51, label %50

; <label>:50                                      ; preds = %48
  tail call fastcc void @raise_exception_err(i32 13, i32 %5) noreturn
  unreachable

; <label>:51                                      ; preds = %48, %41
  %52 = and i32 %25, 32768
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %51
  tail call fastcc void @raise_exception_err(i32 11, i32 %5) noreturn
  unreachable

; <label>:55                                      ; preds = %51
  %56 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 0, i64 4
  %57 = load i32* %56, align 4
  %58 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 2, i32 3
  %59 = load i32* %58, align 4
  %60 = lshr i32 %59, 6
  %61 = and i32 %60, 65536
  %62 = xor i32 %61, 65536
  %63 = add i32 %62, -1
  %64 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 2, i32 1
  %65 = load i32* %64, align 4
  %66 = icmp eq i32 %shift, 0
  br i1 %66, label %76, label %67

; <label>:67                                      ; preds = %55
  %68 = add i32 %57, -4
  %69 = and i32 %63, %68
  %70 = add i32 %69, %65
  %71 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 1, i32 0
  %72 = load i32* %71, align 4
  tail call fastcc void @stl_kernel(i32 %70, i32 %72)
  %73 = add i32 %57, -8
  %74 = and i32 %63, %73
  %75 = add i32 %74, %65
  tail call fastcc void @stl_kernel(i32 %75, i32 %4)
  br label %85

; <label>:76                                      ; preds = %55
  %77 = add i32 %57, -2
  %78 = and i32 %63, %77
  %79 = add i32 %78, %65
  %80 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 1, i32 0
  %81 = load i32* %80, align 4
  tail call fastcc void @stw_kernel(i32 %79, i32 %81)
  %82 = add i32 %57, -4
  %83 = and i32 %63, %82
  %84 = add i32 %83, %65
  tail call fastcc void @stw_kernel(i32 %84, i32 %4)
  br label %85

; <label>:85                                      ; preds = %76, %67
  %86 = phi i32 [ %82, %76 ], [ %73, %67 ]
  %87 = and i32 %23, 65535
  %88 = and i32 %25, 983040
  %89 = or i32 %88, %87
  %90 = and i32 %25, 8388608
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %get_seg_limit.exit, label %92

; <label>:92                                      ; preds = %85
  %93 = shl nuw i32 %89, 12
  %94 = or i32 %93, 4095
  br label %get_seg_limit.exit

get_seg_limit.exit:                               ; preds = %92, %85
  %limit.0.i = phi i32 [ %94, %92 ], [ %89, %85 ]
  %95 = icmp ult i32 %limit.0.i, %new_eip
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %get_seg_limit.exit
  tail call fastcc void @raise_exception_err(i32 13, i32 %5) noreturn
  unreachable

; <label>:97                                      ; preds = %get_seg_limit.exit
  %98 = load %struct.CPUX86State** @env, align 8
  %99 = getelementptr inbounds %struct.CPUX86State* %98, i64 0, i32 0, i64 4
  %100 = load i32* %99, align 4
  %101 = sub i32 0, %62
  %102 = and i32 %100, %101
  %103 = and i32 %86, %63
  %104 = or i32 %102, %103
  store i32 %104, i32* %99, align 4
  %105 = load %struct.CPUX86State** @env, align 8
  %106 = or i32 %29, %5
  %107 = lshr i32 %23, 16
  %108 = shl i32 %25, 16
  %109 = and i32 %108, 16711680
  %110 = and i32 %25, -16777216
  %111 = or i32 %110, %107
  %112 = or i32 %111, %109
  %113 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 9, i64 1, i32 0
  store i32 %106, i32* %113, align 4
  %114 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 9, i64 1, i32 1
  store i32 %112, i32* %114, align 4
  %115 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 9, i64 1, i32 2
  store i32 %limit.0.i, i32* %115, align 4
  %116 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 9, i64 1, i32 3
  store i32 %25, i32* %116, align 4
  %117 = lshr i32 %25, 18
  %118 = and i32 %117, 16
  %119 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 7
  %120 = load i32* %119, align 4
  %121 = and i32 %120, -32785
  %122 = or i32 %121, %118
  store i32 %122, i32* %119, align 4
  %123 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 9, i64 2, i32 3
  %124 = load i32* %123, align 4
  %125 = lshr i32 %124, 17
  %126 = and i32 %125, 32
  %127 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 14, i64 0
  %128 = load i32* %127, align 4
  %129 = and i32 %128, 1
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %137, label %131

; <label>:131                                     ; preds = %97
  %132 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 6
  %133 = load i32* %132, align 4
  %134 = and i32 %133, 131072
  %135 = icmp ne i32 %134, 0
  %136 = icmp eq i32 %118, 0
  %or.cond27 = or i1 %135, %136
  br i1 %or.cond27, label %137, label %139

; <label>:137                                     ; preds = %131, %97
  %138 = or i32 %126, 64
  br label %cpu_x86_load_seg_cache.exit16

; <label>:139                                     ; preds = %131
  %140 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 9, i64 3, i32 1
  %141 = load i32* %140, align 4
  %142 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 9, i64 0, i32 1
  %143 = load i32* %142, align 4
  %144 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 9, i64 2, i32 1
  %145 = load i32* %144, align 4
  %146 = or i32 %143, %141
  %147 = or i32 %146, %145
  %148 = icmp ne i32 %147, 0
  %149 = zext i1 %148 to i32
  %150 = shl nuw nsw i32 %149, 6
  %151 = or i32 %150, %126
  br label %cpu_x86_load_seg_cache.exit16

cpu_x86_load_seg_cache.exit16:                    ; preds = %139, %137
  %new_hflags.0.i15 = phi i32 [ %138, %137 ], [ %151, %139 ]
  %152 = and i32 %122, -32865
  %153 = or i32 %new_hflags.0.i15, %152
  store i32 %153, i32* %119, align 4
  %154 = load %struct.CPUX86State** @env, align 8
  %155 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 4
  store i32 %new_eip, i32* %155, align 4
  br label %556

; <label>:156                                     ; preds = %18
  %157 = lshr i32 %25, 8
  %158 = and i32 %157, 31
  %159 = lshr i32 %25, 13
  %160 = and i32 %159, 3
  %161 = and i32 %new_cs, 3
  switch i32 %158, label %169 [
    i32 1, label %162
    i32 9, label %162
    i32 5, label %162
    i32 4, label %170
    i32 12, label %170
  ]

; <label>:162                                     ; preds = %156, %156, %156
  %163 = icmp ult i32 %160, %29
  %164 = icmp ult i32 %160, %161
  %or.cond = or i1 %163, %164
  br i1 %or.cond, label %165, label %166

; <label>:165                                     ; preds = %162
  tail call fastcc void @raise_exception_err(i32 13, i32 %5) noreturn
  unreachable

; <label>:166                                     ; preds = %162
  tail call fastcc void @switch_tss(i32 %new_cs, i32 %23, i32 %25, i32 2, i32 %4)
  %167 = load %struct.CPUX86State** @env, align 8
  %168 = getelementptr inbounds %struct.CPUX86State* %167, i64 0, i32 3
  store i32 1, i32* %168, align 4
  br label %556

; <label>:169                                     ; preds = %156
  tail call fastcc void @raise_exception_err(i32 13, i32 %5) noreturn
  unreachable

; <label>:170                                     ; preds = %156, %156
  %171 = lshr i32 %158, 3
  %172 = icmp ult i32 %160, %29
  %173 = icmp ult i32 %160, %161
  %or.cond1 = or i1 %172, %173
  br i1 %or.cond1, label %174, label %175

; <label>:174                                     ; preds = %170
  tail call fastcc void @raise_exception_err(i32 13, i32 %5) noreturn
  unreachable

; <label>:175                                     ; preds = %170
  %176 = and i32 %25, 32768
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %178, label %179

; <label>:178                                     ; preds = %175
  tail call fastcc void @raise_exception_err(i32 11, i32 %5) noreturn
  unreachable

; <label>:179                                     ; preds = %175
  %180 = lshr i32 %23, 16
  %181 = and i32 %25, -65536
  %182 = and i32 %23, 65535
  %183 = or i32 %181, %182
  %184 = and i32 %25, 31
  %185 = and i32 %180, 65532
  %186 = icmp eq i32 %185, 0
  br i1 %186, label %187, label %188

; <label>:187                                     ; preds = %179
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn
  unreachable

; <label>:188                                     ; preds = %179
  %189 = and i32 %180, 4
  %190 = icmp eq i32 %189, 0
  %191 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 10
  %192 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 12
  %dt.0.i17 = select i1 %190, %struct.SegmentCache* %192, %struct.SegmentCache* %191
  %193 = or i32 %180, 7
  %194 = getelementptr inbounds %struct.SegmentCache* %dt.0.i17, i64 0, i32 2
  %195 = load i32* %194, align 4
  %196 = icmp ugt i32 %193, %195
  br i1 %196, label %197, label %198

; <label>:197                                     ; preds = %188
  tail call fastcc void @raise_exception_err(i32 13, i32 %185) noreturn
  unreachable

; <label>:198                                     ; preds = %188
  %199 = and i32 %180, 65528
  %200 = getelementptr inbounds %struct.SegmentCache* %dt.0.i17, i64 0, i32 1
  %201 = load i32* %200, align 4
  %202 = add i32 %201, %199
  %203 = tail call fastcc i32 @ldl_kernel(i32 %202) nounwind
  %204 = add i32 %202, 4
  %205 = tail call fastcc i32 @ldl_kernel(i32 %204) nounwind
  %206 = and i32 %205, 6144
  %207 = icmp eq i32 %206, 6144
  br i1 %207, label %209, label %208

; <label>:208                                     ; preds = %198
  tail call fastcc void @raise_exception_err(i32 13, i32 %185) noreturn
  unreachable

; <label>:209                                     ; preds = %198
  %210 = lshr i32 %205, 13
  %211 = and i32 %210, 3
  %212 = icmp ugt i32 %211, %29
  br i1 %212, label %213, label %214

; <label>:213                                     ; preds = %209
  tail call fastcc void @raise_exception_err(i32 13, i32 %185) noreturn
  unreachable

; <label>:214                                     ; preds = %209
  %215 = and i32 %205, 32768
  %216 = icmp eq i32 %215, 0
  br i1 %216, label %217, label %218

; <label>:217                                     ; preds = %214
  tail call fastcc void @raise_exception_err(i32 11, i32 %185) noreturn
  unreachable

; <label>:218                                     ; preds = %214
  %219 = and i32 %205, 1024
  %220 = icmp eq i32 %219, 0
  %221 = icmp ult i32 %211, %29
  %or.cond4 = and i1 %220, %221
  %222 = load %struct.CPUX86State** @env, align 8
  br i1 %or.cond4, label %223, label %.loopexit

; <label>:223                                     ; preds = %218
  %224 = getelementptr inbounds %struct.CPUX86State* %222, i64 0, i32 11, i32 3
  %225 = load i32* %224, align 4
  %226 = and i32 %225, 32768
  %227 = icmp eq i32 %226, 0
  br i1 %227, label %228, label %229

; <label>:228                                     ; preds = %223
  tail call void (%struct.CPUX86State*, i8*, ...)* @cpu_abort(%struct.CPUX86State* %222, i8* getelementptr inbounds ([12 x i8]* @.str20, i64 0, i64 0)) noreturn nounwind
  unreachable

; <label>:229                                     ; preds = %223
  %230 = and i32 %225, 1792
  %231 = icmp eq i32 %230, 256
  br i1 %231, label %233, label %232

; <label>:232                                     ; preds = %229
  tail call void (%struct.CPUX86State*, i8*, ...)* @cpu_abort(%struct.CPUX86State* %222, i8* getelementptr inbounds ([17 x i8]* @.str21, i64 0, i64 0)) noreturn nounwind
  unreachable

; <label>:233                                     ; preds = %229
  %234 = lshr i32 %225, 11
  %235 = and i32 %234, 1
  %236 = shl nuw nsw i32 %211, 2
  %237 = or i32 %236, 2
  %238 = shl i32 %237, %235
  %239 = shl i32 4, %235
  %240 = add i32 %239, -1
  %241 = add i32 %240, %238
  %242 = getelementptr inbounds %struct.CPUX86State* %222, i64 0, i32 11, i32 2
  %243 = load i32* %242, align 4
  %244 = icmp ugt i32 %241, %243
  br i1 %244, label %245, label %249

; <label>:245                                     ; preds = %233
  %246 = getelementptr inbounds %struct.CPUX86State* %222, i64 0, i32 11, i32 0
  %247 = load i32* %246, align 4
  %248 = and i32 %247, 65532
  tail call fastcc void @raise_exception_err(i32 10, i32 %248) noreturn nounwind
  unreachable

; <label>:249                                     ; preds = %233
  %250 = icmp eq i32 %235, 0
  %251 = getelementptr inbounds %struct.CPUX86State* %222, i64 0, i32 11, i32 1
  %252 = load i32* %251, align 4
  %253 = add i32 %252, %238
  br i1 %250, label %254, label %262

; <label>:254                                     ; preds = %249
  %255 = tail call fastcc i32 @lduw_kernel(i32 %253) nounwind
  %256 = load %struct.CPUX86State** @env, align 8
  %257 = getelementptr inbounds %struct.CPUX86State* %256, i64 0, i32 11, i32 1
  %258 = load i32* %257, align 4
  %259 = add i32 %238, 2
  %260 = add i32 %259, %258
  %261 = tail call fastcc i32 @lduw_kernel(i32 %260) nounwind
  br label %get_ss_esp_from_tss.exit

; <label>:262                                     ; preds = %249
  %263 = tail call fastcc i32 @ldl_kernel(i32 %253) nounwind
  %264 = load %struct.CPUX86State** @env, align 8
  %265 = getelementptr inbounds %struct.CPUX86State* %264, i64 0, i32 11, i32 1
  %266 = load i32* %265, align 4
  %267 = add i32 %238, 4
  %268 = add i32 %267, %266
  %269 = tail call fastcc i32 @lduw_kernel(i32 %268) nounwind
  br label %get_ss_esp_from_tss.exit

get_ss_esp_from_tss.exit:                         ; preds = %262, %254
  %270 = phi i32 [ %255, %254 ], [ %263, %262 ]
  %storemerge.i = phi i32 [ %261, %254 ], [ %269, %262 ]
  %271 = and i32 %storemerge.i, 65532
  %272 = icmp eq i32 %271, 0
  br i1 %272, label %273, label %274

; <label>:273                                     ; preds = %get_ss_esp_from_tss.exit
  tail call fastcc void @raise_exception_err(i32 10, i32 0) noreturn
  unreachable

; <label>:274                                     ; preds = %get_ss_esp_from_tss.exit
  %275 = and i32 %storemerge.i, 3
  %276 = icmp eq i32 %275, %211
  br i1 %276, label %278, label %277

; <label>:277                                     ; preds = %274
  tail call fastcc void @raise_exception_err(i32 10, i32 %271) noreturn
  unreachable

; <label>:278                                     ; preds = %274
  %279 = and i32 %storemerge.i, 4
  %280 = icmp eq i32 %279, 0
  %281 = load %struct.CPUX86State** @env, align 8
  %282 = getelementptr inbounds %struct.CPUX86State* %281, i64 0, i32 10
  %283 = getelementptr inbounds %struct.CPUX86State* %281, i64 0, i32 12
  %dt.0.i20 = select i1 %280, %struct.SegmentCache* %283, %struct.SegmentCache* %282
  %284 = or i32 %storemerge.i, 7
  %285 = getelementptr inbounds %struct.SegmentCache* %dt.0.i20, i64 0, i32 2
  %286 = load i32* %285, align 4
  %287 = icmp ugt i32 %284, %286
  br i1 %287, label %288, label %289

; <label>:288                                     ; preds = %278
  tail call fastcc void @raise_exception_err(i32 10, i32 %271) noreturn
  unreachable

; <label>:289                                     ; preds = %278
  %290 = and i32 %storemerge.i, -8
  %291 = getelementptr inbounds %struct.SegmentCache* %dt.0.i20, i64 0, i32 1
  %292 = load i32* %291, align 4
  %293 = add i32 %292, %290
  %294 = tail call fastcc i32 @ldl_kernel(i32 %293) nounwind
  %295 = add i32 %293, 4
  %296 = tail call fastcc i32 @ldl_kernel(i32 %295) nounwind
  %297 = lshr i32 %296, 13
  %298 = and i32 %297, 3
  %299 = icmp eq i32 %298, %211
  br i1 %299, label %301, label %300

; <label>:300                                     ; preds = %289
  tail call fastcc void @raise_exception_err(i32 10, i32 %271) noreturn
  unreachable

; <label>:301                                     ; preds = %289
  %302 = and i32 %296, 6656
  %303 = icmp eq i32 %302, 4608
  br i1 %303, label %305, label %304

; <label>:304                                     ; preds = %301
  tail call fastcc void @raise_exception_err(i32 10, i32 %271) noreturn
  unreachable

; <label>:305                                     ; preds = %301
  %306 = and i32 %296, 32768
  %307 = icmp eq i32 %306, 0
  br i1 %307, label %308, label %309

; <label>:308                                     ; preds = %305
  tail call fastcc void @raise_exception_err(i32 10, i32 %271) noreturn
  unreachable

; <label>:309                                     ; preds = %305
  %310 = load %struct.CPUX86State** @env, align 8
  %311 = getelementptr inbounds %struct.CPUX86State* %310, i64 0, i32 9, i64 2, i32 3
  %312 = load i32* %311, align 4
  %313 = lshr i32 %312, 6
  %314 = and i32 %313, 65536
  %315 = xor i32 %314, 65536
  %316 = add i32 %315, -1
  %317 = getelementptr inbounds %struct.CPUX86State* %310, i64 0, i32 9, i64 2, i32 1
  %318 = load i32* %317, align 4
  %319 = lshr i32 %296, 6
  %320 = and i32 %319, 65536
  %321 = xor i32 %320, 65536
  %322 = add i32 %321, -1
  %323 = lshr i32 %294, 16
  %324 = shl i32 %296, 16
  %325 = and i32 %324, 16711680
  %326 = and i32 %296, -16777216
  %327 = or i32 %326, %323
  %328 = or i32 %327, %325
  %329 = icmp eq i32 %171, 0
  br i1 %329, label %359, label %330

; <label>:330                                     ; preds = %309
  %331 = add i32 %270, -4
  %332 = and i32 %322, %331
  %333 = add i32 %332, %328
  %334 = getelementptr inbounds %struct.CPUX86State* %310, i64 0, i32 9, i64 2, i32 0
  %335 = load i32* %334, align 4
  tail call fastcc void @stl_kernel(i32 %333, i32 %335)
  %336 = add i32 %270, -8
  %337 = and i32 %322, %336
  %338 = add i32 %337, %328
  %339 = load %struct.CPUX86State** @env, align 8
  %340 = getelementptr inbounds %struct.CPUX86State* %339, i64 0, i32 0, i64 4
  %341 = load i32* %340, align 4
  tail call fastcc void @stl_kernel(i32 %338, i32 %341)
  %i.029 = add i32 %184, -1
  %342 = icmp sgt i32 %i.029, -1
  br i1 %342, label %.lr.ph, label %.loopexit.thread47

.lr.ph:                                           ; preds = %330
  %343 = shl i32 %25, 2
  %344 = and i32 %343, 124
  br label %345

; <label>:345                                     ; preds = %345, %.lr.ph
  %i.030 = phi i32 [ %i.029, %.lr.ph ], [ %i.0, %345 ]
  %346 = phi i32 [ %336, %.lr.ph ], [ %355, %345 ]
  %347 = load %struct.CPUX86State** @env, align 8
  %348 = getelementptr inbounds %struct.CPUX86State* %347, i64 0, i32 0, i64 4
  %349 = load i32* %348, align 4
  %350 = shl i32 %i.030, 2
  %351 = add i32 %349, %350
  %352 = and i32 %351, %316
  %353 = add i32 %352, %318
  %354 = tail call fastcc i32 @ldl_kernel(i32 %353)
  %355 = add i32 %346, -4
  %356 = and i32 %355, %322
  %357 = add i32 %356, %328
  tail call fastcc void @stl_kernel(i32 %357, i32 %354)
  %i.0 = add i32 %i.030, -1
  %358 = icmp sgt i32 %i.0, -1
  br i1 %358, label %345, label %..loopexit_crit_edge

; <label>:359                                     ; preds = %309
  %360 = add i32 %270, -2
  %361 = and i32 %322, %360
  %362 = add i32 %361, %328
  %363 = getelementptr inbounds %struct.CPUX86State* %310, i64 0, i32 9, i64 2, i32 0
  %364 = load i32* %363, align 4
  tail call fastcc void @stw_kernel(i32 %362, i32 %364)
  %365 = add i32 %270, -4
  %366 = and i32 %322, %365
  %367 = add i32 %366, %328
  %368 = load %struct.CPUX86State** @env, align 8
  %369 = getelementptr inbounds %struct.CPUX86State* %368, i64 0, i32 0, i64 4
  %370 = load i32* %369, align 4
  tail call fastcc void @stw_kernel(i32 %367, i32 %370)
  %i.133 = add i32 %184, -1
  %371 = icmp sgt i32 %i.133, -1
  br i1 %371, label %.lr.ph35, label %.loopexit.thread

.lr.ph35:                                         ; preds = %359
  %372 = shl i32 %25, 1
  %373 = and i32 %372, 62
  br label %374

; <label>:374                                     ; preds = %374, %.lr.ph35
  %i.134 = phi i32 [ %i.133, %.lr.ph35 ], [ %i.1, %374 ]
  %375 = phi i32 [ %365, %.lr.ph35 ], [ %384, %374 ]
  %376 = load %struct.CPUX86State** @env, align 8
  %377 = getelementptr inbounds %struct.CPUX86State* %376, i64 0, i32 0, i64 4
  %378 = load i32* %377, align 4
  %379 = shl i32 %i.134, 1
  %380 = add i32 %378, %379
  %381 = and i32 %380, %316
  %382 = add i32 %381, %318
  %383 = tail call fastcc i32 @lduw_kernel(i32 %382)
  %384 = add i32 %375, -2
  %385 = and i32 %384, %322
  %386 = add i32 %385, %328
  tail call fastcc void @stw_kernel(i32 %386, i32 %383)
  %i.1 = add i32 %i.134, -1
  %387 = icmp sgt i32 %i.1, -1
  br i1 %387, label %374, label %..loopexit31_crit_edge

..loopexit_crit_edge:                             ; preds = %345
  %388 = sub i32 %336, %344
  br label %.loopexit.thread47

..loopexit31_crit_edge:                           ; preds = %374
  %389 = sub i32 %365, %373
  br label %.loopexit.thread

.loopexit:                                        ; preds = %218
  %390 = getelementptr inbounds %struct.CPUX86State* %222, i64 0, i32 0, i64 4
  %391 = load i32* %390, align 4
  %392 = getelementptr inbounds %struct.CPUX86State* %222, i64 0, i32 9, i64 2, i32 3
  %393 = load i32* %392, align 4
  %394 = lshr i32 %393, 6
  %395 = and i32 %394, 65536
  %396 = xor i32 %395, 65536
  %397 = add i32 %396, -1
  %398 = getelementptr inbounds %struct.CPUX86State* %222, i64 0, i32 9, i64 2, i32 1
  %399 = load i32* %398, align 4
  %.pre = icmp eq i32 %171, 0
  br i1 %.pre, label %.loopexit.thread, label %.loopexit.thread47

.loopexit.thread47:                               ; preds = %.loopexit, %..loopexit_crit_edge, %330
  %400 = phi i32 [ %399, %.loopexit ], [ %328, %..loopexit_crit_edge ], [ %328, %330 ]
  %sp_mask.050 = phi i32 [ %397, %.loopexit ], [ %322, %..loopexit_crit_edge ], [ %322, %330 ]
  %new_stack.049 = phi i32 [ 0, %.loopexit ], [ 1, %..loopexit_crit_edge ], [ 1, %330 ]
  %storemerge.i2348 = phi i32 [ 0, %.loopexit ], [ %storemerge.i, %..loopexit_crit_edge ], [ %storemerge.i, %330 ]
  %401 = phi i32 [ 0, %.loopexit ], [ %294, %..loopexit_crit_edge ], [ %294, %330 ]
  %402 = phi i32 [ 0, %.loopexit ], [ %296, %..loopexit_crit_edge ], [ %296, %330 ]
  %403 = phi i32 [ %391, %.loopexit ], [ %388, %..loopexit_crit_edge ], [ %336, %330 ]
  %404 = add i32 %403, -4
  %405 = and i32 %404, %sp_mask.050
  %406 = add i32 %405, %400
  %407 = load %struct.CPUX86State** @env, align 8
  %408 = getelementptr inbounds %struct.CPUX86State* %407, i64 0, i32 9, i64 1, i32 0
  %409 = load i32* %408, align 4
  tail call fastcc void @stl_kernel(i32 %406, i32 %409)
  %410 = add i32 %403, -8
  %411 = and i32 %410, %sp_mask.050
  %412 = add i32 %411, %400
  tail call fastcc void @stl_kernel(i32 %412, i32 %4)
  br label %426

.loopexit.thread:                                 ; preds = %.loopexit, %..loopexit31_crit_edge, %359
  %413 = phi i32 [ %399, %.loopexit ], [ %328, %..loopexit31_crit_edge ], [ %328, %359 ]
  %sp_mask.043 = phi i32 [ %397, %.loopexit ], [ %322, %..loopexit31_crit_edge ], [ %322, %359 ]
  %new_stack.042 = phi i32 [ 0, %.loopexit ], [ 1, %..loopexit31_crit_edge ], [ 1, %359 ]
  %storemerge.i2340 = phi i32 [ 0, %.loopexit ], [ %storemerge.i, %..loopexit31_crit_edge ], [ %storemerge.i, %359 ]
  %414 = phi i32 [ 0, %.loopexit ], [ %294, %..loopexit31_crit_edge ], [ %294, %359 ]
  %415 = phi i32 [ 0, %.loopexit ], [ %296, %..loopexit31_crit_edge ], [ %296, %359 ]
  %416 = phi i32 [ %391, %.loopexit ], [ %389, %..loopexit31_crit_edge ], [ %365, %359 ]
  %417 = add i32 %416, -2
  %418 = and i32 %417, %sp_mask.043
  %419 = add i32 %418, %413
  %420 = load %struct.CPUX86State** @env, align 8
  %421 = getelementptr inbounds %struct.CPUX86State* %420, i64 0, i32 9, i64 1, i32 0
  %422 = load i32* %421, align 4
  tail call fastcc void @stw_kernel(i32 %419, i32 %422)
  %423 = add i32 %416, -4
  %424 = and i32 %423, %sp_mask.043
  %425 = add i32 %424, %413
  tail call fastcc void @stw_kernel(i32 %425, i32 %4)
  br label %426

; <label>:426                                     ; preds = %.loopexit.thread, %.loopexit.thread47
  %427 = phi i32 [ %413, %.loopexit.thread ], [ %400, %.loopexit.thread47 ]
  %sp_mask.044 = phi i32 [ %sp_mask.043, %.loopexit.thread ], [ %sp_mask.050, %.loopexit.thread47 ]
  %new_stack.041 = phi i32 [ %new_stack.042, %.loopexit.thread ], [ %new_stack.049, %.loopexit.thread47 ]
  %storemerge.i2339 = phi i32 [ %storemerge.i2340, %.loopexit.thread ], [ %storemerge.i2348, %.loopexit.thread47 ]
  %428 = phi i32 [ %414, %.loopexit.thread ], [ %401, %.loopexit.thread47 ]
  %429 = phi i32 [ %415, %.loopexit.thread ], [ %402, %.loopexit.thread47 ]
  %430 = phi i32 [ %423, %.loopexit.thread ], [ %410, %.loopexit.thread47 ]
  %431 = icmp eq i32 %new_stack.041, 0
  br i1 %431, label %481, label %432

; <label>:432                                     ; preds = %426
  %433 = and i32 %storemerge.i2339, -4
  %434 = or i32 %433, %211
  %435 = load %struct.CPUX86State** @env, align 8
  %436 = and i32 %428, 65535
  %437 = and i32 %429, 983040
  %438 = or i32 %437, %436
  %439 = and i32 %429, 8388608
  %440 = icmp eq i32 %439, 0
  br i1 %440, label %444, label %441

; <label>:441                                     ; preds = %432
  %442 = shl nuw i32 %438, 12
  %443 = or i32 %442, 4095
  br label %444

; <label>:444                                     ; preds = %441, %432
  %limit.0.i13 = phi i32 [ %443, %441 ], [ %438, %432 ]
  %445 = getelementptr inbounds %struct.CPUX86State* %435, i64 0, i32 9, i64 2, i32 0
  store i32 %434, i32* %445, align 4
  %446 = getelementptr inbounds %struct.CPUX86State* %435, i64 0, i32 9, i64 2, i32 1
  store i32 %427, i32* %446, align 4
  %447 = getelementptr inbounds %struct.CPUX86State* %435, i64 0, i32 9, i64 2, i32 2
  store i32 %limit.0.i13, i32* %447, align 4
  %448 = getelementptr inbounds %struct.CPUX86State* %435, i64 0, i32 9, i64 2, i32 3
  store i32 %429, i32* %448, align 4
  %.phi.trans.insert.i = getelementptr inbounds %struct.CPUX86State* %435, i64 0, i32 7
  %.pre.i = load i32* %.phi.trans.insert.i, align 4
  %449 = lshr i32 %429, 17
  %450 = and i32 %449, 32
  %451 = and i32 %.pre.i, 32768
  %452 = icmp eq i32 %451, 0
  br i1 %452, label %453, label %cpu_x86_load_seg_cache.exit12

; <label>:453                                     ; preds = %444
  %454 = getelementptr inbounds %struct.CPUX86State* %435, i64 0, i32 14, i64 0
  %455 = load i32* %454, align 4
  %456 = and i32 %455, 1
  %457 = icmp eq i32 %456, 0
  br i1 %457, label %466, label %458

; <label>:458                                     ; preds = %453
  %459 = getelementptr inbounds %struct.CPUX86State* %435, i64 0, i32 6
  %460 = load i32* %459, align 4
  %461 = and i32 %460, 131072
  %462 = icmp eq i32 %461, 0
  br i1 %462, label %463, label %466

; <label>:463                                     ; preds = %458
  %464 = and i32 %.pre.i, 16
  %465 = icmp eq i32 %464, 0
  br i1 %465, label %466, label %468

; <label>:466                                     ; preds = %463, %458, %453
  %467 = or i32 %450, 64
  br label %cpu_x86_load_seg_cache.exit12

; <label>:468                                     ; preds = %463
  %469 = getelementptr inbounds %struct.CPUX86State* %435, i64 0, i32 9, i64 3, i32 1
  %470 = load i32* %469, align 4
  %471 = getelementptr inbounds %struct.CPUX86State* %435, i64 0, i32 9, i64 0, i32 1
  %472 = load i32* %471, align 4
  %473 = or i32 %470, %427
  %474 = or i32 %473, %472
  %475 = icmp ne i32 %474, 0
  %476 = zext i1 %475 to i32
  %477 = shl nuw nsw i32 %476, 6
  %478 = or i32 %477, %450
  br label %cpu_x86_load_seg_cache.exit12

cpu_x86_load_seg_cache.exit12:                    ; preds = %468, %466, %444
  %new_hflags.0.i11 = phi i32 [ %450, %444 ], [ %467, %466 ], [ %478, %468 ]
  %479 = and i32 %.pre.i, -97
  %480 = or i32 %new_hflags.0.i11, %479
  store i32 %480, i32* %.phi.trans.insert.i, align 4
  br label %481

; <label>:481                                     ; preds = %cpu_x86_load_seg_cache.exit12, %426
  %482 = or i32 %211, %185
  %483 = load %struct.CPUX86State** @env, align 8
  %484 = lshr i32 %203, 16
  %485 = shl i32 %205, 16
  %486 = and i32 %485, 16711680
  %487 = and i32 %205, -16777216
  %488 = or i32 %487, %484
  %489 = or i32 %488, %486
  %490 = and i32 %203, 65535
  %491 = and i32 %205, 983040
  %492 = or i32 %491, %490
  %493 = and i32 %205, 8388608
  %494 = icmp eq i32 %493, 0
  br i1 %494, label %498, label %495

; <label>:495                                     ; preds = %481
  %496 = shl nuw i32 %492, 12
  %497 = or i32 %496, 4095
  br label %498

; <label>:498                                     ; preds = %495, %481
  %limit.0.i9 = phi i32 [ %497, %495 ], [ %492, %481 ]
  %499 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 9, i64 1, i32 0
  store i32 %482, i32* %499, align 4
  %500 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 9, i64 1, i32 1
  store i32 %489, i32* %500, align 4
  %501 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 9, i64 1, i32 2
  store i32 %limit.0.i9, i32* %501, align 4
  %502 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 9, i64 1, i32 3
  store i32 %205, i32* %502, align 4
  %503 = lshr i32 %205, 18
  %504 = and i32 %503, 16
  %505 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 7
  %506 = load i32* %505, align 4
  %507 = and i32 %506, -32785
  %508 = or i32 %507, %504
  store i32 %508, i32* %505, align 4
  %509 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 9, i64 2, i32 3
  %510 = load i32* %509, align 4
  %511 = lshr i32 %510, 17
  %512 = and i32 %511, 32
  %513 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 14, i64 0
  %514 = load i32* %513, align 4
  %515 = and i32 %514, 1
  %516 = icmp eq i32 %515, 0
  br i1 %516, label %523, label %517

; <label>:517                                     ; preds = %498
  %518 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 6
  %519 = load i32* %518, align 4
  %520 = and i32 %519, 131072
  %521 = icmp ne i32 %520, 0
  %522 = icmp eq i32 %504, 0
  %or.cond28 = or i1 %521, %522
  br i1 %or.cond28, label %523, label %525

; <label>:523                                     ; preds = %517, %498
  %524 = or i32 %512, 64
  br label %cpu_x86_load_seg_cache.exit

; <label>:525                                     ; preds = %517
  %526 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 9, i64 3, i32 1
  %527 = load i32* %526, align 4
  %528 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 9, i64 0, i32 1
  %529 = load i32* %528, align 4
  %530 = getelementptr inbounds %struct.CPUX86State* %483, i64 0, i32 9, i64 2, i32 1
  %531 = load i32* %530, align 4
  %532 = or i32 %529, %527
  %533 = or i32 %532, %531
  %534 = icmp ne i32 %533, 0
  %535 = zext i1 %534 to i32
  %536 = shl nuw nsw i32 %535, 6
  %537 = or i32 %536, %512
  br label %cpu_x86_load_seg_cache.exit

cpu_x86_load_seg_cache.exit:                      ; preds = %525, %523
  %new_hflags.0.i = phi i32 [ %524, %523 ], [ %537, %525 ]
  %538 = and i32 %508, -32865
  %539 = or i32 %new_hflags.0.i, %538
  store i32 %539, i32* %505, align 4
  %540 = load %struct.CPUX86State** @env, align 8
  %541 = getelementptr inbounds %struct.CPUX86State* %540, i64 0, i32 7
  %542 = load i32* %541, align 4
  %543 = and i32 %542, 3
  tail call void @s2e_on_privilege_change(i32 %543, i32 %211) nounwind
  %544 = load i32* %541, align 4
  %545 = and i32 %544, -4
  %546 = or i32 %545, %211
  store i32 %546, i32* %541, align 4
  %547 = load %struct.CPUX86State** @env, align 8
  %548 = getelementptr inbounds %struct.CPUX86State* %547, i64 0, i32 0, i64 4
  %549 = load i32* %548, align 4
  %550 = xor i32 %sp_mask.044, -1
  %551 = and i32 %549, %550
  %552 = and i32 %430, %sp_mask.044
  %553 = or i32 %551, %552
  store i32 %553, i32* %548, align 4
  %554 = load %struct.CPUX86State** @env, align 8
  %555 = getelementptr inbounds %struct.CPUX86State* %554, i64 0, i32 4
  store i32 %183, i32* %555, align 4
  br label %556

; <label>:556                                     ; preds = %cpu_x86_load_seg_cache.exit, %166, %cpu_x86_load_seg_cache.exit16
  ret void
}

define internal fastcc i32 @lduw_kernel(i32 %ptr) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 0
  %16 = load i32* %15, align 4
  %17 = and i32 %8, -4095
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %21, label %19, !prof !0

; <label>:19                                      ; preds = %6
  %20 = tail call zeroext i16 @__ldw_mmu(i32 %8, i32 0)
  br label %29

; <label>:21                                      ; preds = %6
  %22 = and i64 %7, 4294967295
  %23 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 3
  %24 = load i64* %23, align 8
  %25 = add i64 %24, %22
  %26 = inttoptr i64 %25 to i16*
  %27 = load i16* %26, align 2
  %28 = zext i16 %27 to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %22, i64 %25, i64 %28, i32 32, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %29

; <label>:29                                      ; preds = %21, %19
  %res.0.in = phi i16 [ %20, %19 ], [ %27, %21 ]
  %res.0 = zext i16 %res.0.in to i32
  ret i32 %res.0
}

define void @helper_iret_real(i32 %shift) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 4
  %3 = load i32* %2, align 4
  %4 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 2, i32 1
  %5 = load i32* %4, align 4
  %6 = icmp eq i32 %shift, 1
  %7 = and i32 %3, 65535
  %8 = add i32 %5, %7
  br i1 %6, label %9, label %21

; <label>:9                                       ; preds = %0
  %10 = tail call fastcc i32 @ldl_kernel(i32 %8)
  %11 = add i32 %3, 4
  %12 = and i32 %11, 65535
  %13 = add i32 %12, %5
  %14 = tail call fastcc i32 @ldl_kernel(i32 %13)
  %15 = add i32 %3, 8
  %16 = and i32 %14, 65535
  %17 = and i32 %15, 65535
  %18 = add i32 %17, %5
  %19 = tail call fastcc i32 @ldl_kernel(i32 %18)
  %20 = add i32 %3, 12
  br label %32

; <label>:21                                      ; preds = %0
  %22 = tail call fastcc i32 @lduw_kernel(i32 %8)
  %23 = add i32 %3, 2
  %24 = and i32 %23, 65535
  %25 = add i32 %24, %5
  %26 = tail call fastcc i32 @lduw_kernel(i32 %25)
  %27 = add i32 %3, 4
  %28 = and i32 %27, 65535
  %29 = add i32 %28, %5
  %30 = tail call fastcc i32 @lduw_kernel(i32 %29)
  %31 = add i32 %3, 6
  br label %32

; <label>:32                                      ; preds = %21, %9
  %new_eflags.0 = phi i32 [ %19, %9 ], [ %30, %21 ]
  %new_eip.0 = phi i32 [ %10, %9 ], [ %22, %21 ]
  %new_cs.0 = phi i32 [ %16, %9 ], [ %26, %21 ]
  %sp.0 = phi i32 [ %20, %9 ], [ %31, %21 ]
  %33 = load %struct.CPUX86State** @env, align 8
  %34 = getelementptr inbounds %struct.CPUX86State* %33, i64 0, i32 0, i64 4
  %35 = load i32* %34, align 4
  %36 = and i32 %35, -65536
  %37 = and i32 %sp.0, 65535
  %38 = or i32 %36, %37
  store i32 %38, i32* %34, align 4
  %39 = load %struct.CPUX86State** @env, align 8
  %40 = getelementptr inbounds %struct.CPUX86State* %39, i64 0, i32 9, i64 1, i32 0
  store i32 %new_cs.0, i32* %40, align 4
  %41 = shl i32 %new_cs.0, 4
  %42 = load %struct.CPUX86State** @env, align 8
  %43 = getelementptr inbounds %struct.CPUX86State* %42, i64 0, i32 9, i64 1, i32 1
  store i32 %41, i32* %43, align 4
  %44 = load %struct.CPUX86State** @env, align 8
  %45 = getelementptr inbounds %struct.CPUX86State* %44, i64 0, i32 4
  store i32 %new_eip.0, i32* %45, align 4
  %46 = load %struct.CPUX86State** @env, align 8
  %47 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 6
  %48 = load i32* %47, align 4
  %49 = and i32 %48, 131072
  %50 = icmp eq i32 %49, 0
  %. = select i1 %50, i32 2454272, i32 2441984
  %51 = icmp eq i32 %shift, 0
  %52 = and i32 %., 29440
  %eflags_mask.1 = select i1 %51, i32 %52, i32 %.
  %53 = and i32 %new_eflags.0, 2261
  %54 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 1
  store i32 %53, i32* %54, align 4
  %55 = lshr i32 %new_eflags.0, 9
  %56 = and i32 %55, 2
  %57 = xor i32 %56, 2
  %58 = add i32 %57, -1
  %59 = load %struct.CPUX86State** @env, align 8
  %60 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 5
  store i32 %58, i32* %60, align 4
  %61 = load %struct.CPUX86State** @env, align 8
  %62 = getelementptr inbounds %struct.CPUX86State* %61, i64 0, i32 6
  %63 = load i32* %62, align 4
  %64 = xor i32 %eflags_mask.1, -1
  %65 = and i32 %63, %64
  %66 = and i32 %eflags_mask.1, %new_eflags.0
  %67 = or i32 %65, %66
  store i32 %67, i32* %62, align 4
  %68 = load %struct.CPUX86State** @env, align 8
  %69 = getelementptr inbounds %struct.CPUX86State* %68, i64 0, i32 8
  %70 = load i32* %69, align 4
  %71 = and i32 %70, -5
  store i32 %71, i32* %69, align 4
  ret void
}

define void @helper_iret_protected(i32 %shift, i32 %next_eip) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 6
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 16384
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %35, label %6

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 11, i32 1
  %8 = load i32* %7, align 4
  %9 = tail call fastcc i32 @lduw_kernel(i32 %8)
  %10 = and i32 %9, 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %14, label %12

; <label>:12                                      ; preds = %6
  %13 = and i32 %9, 65532
  tail call fastcc void @raise_exception_err(i32 10, i32 %13) noreturn
  unreachable

; <label>:14                                      ; preds = %6
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = or i32 %9, 7
  %17 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 12, i32 2
  %18 = load i32* %17, align 4
  %19 = icmp ugt i32 %16, %18
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %14
  %21 = and i32 %9, 65532
  tail call fastcc void @raise_exception_err(i32 10, i32 %21) noreturn
  unreachable

; <label>:22                                      ; preds = %14
  %23 = and i32 %9, -8
  %24 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 12, i32 1
  %25 = load i32* %24, align 4
  %26 = add i32 %25, %23
  %27 = tail call fastcc i32 @ldl_kernel(i32 %26) nounwind
  %28 = add i32 %26, 4
  %29 = tail call fastcc i32 @ldl_kernel(i32 %28) nounwind
  %30 = and i32 %29, 5888
  %31 = icmp eq i32 %30, 768
  br i1 %31, label %34, label %32

; <label>:32                                      ; preds = %22
  %33 = and i32 %9, 65532
  tail call fastcc void @raise_exception_err(i32 10, i32 %33) noreturn
  unreachable

; <label>:34                                      ; preds = %22
  tail call fastcc void @switch_tss(i32 %9, i32 %27, i32 %29, i32 1, i32 %next_eip)
  br label %helper_ret_protected.exit

; <label>:35                                      ; preds = %0
  %36 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 2, i32 3
  %37 = load i32* %36, align 4
  %38 = lshr i32 %37, 6
  %39 = and i32 %38, 65536
  %40 = xor i32 %39, 65536
  %41 = add i32 %40, -1
  %42 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 4
  %43 = load i32* %42, align 4
  %44 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 2, i32 1
  %45 = load i32* %44, align 4
  %46 = icmp eq i32 %shift, 1
  %47 = and i32 %41, %43
  %48 = add i32 %47, %45
  br i1 %46, label %49, label %63

; <label>:49                                      ; preds = %35
  %50 = tail call fastcc i32 @ldl_kernel(i32 %48) nounwind
  %51 = add i32 %43, 4
  %52 = and i32 %41, %51
  %53 = add i32 %52, %45
  %54 = tail call fastcc i32 @ldl_kernel(i32 %53) nounwind
  %55 = add i32 %43, 8
  %56 = and i32 %54, 65535
  %57 = and i32 %41, %55
  %58 = add i32 %57, %45
  %59 = tail call fastcc i32 @ldl_kernel(i32 %58) nounwind
  %60 = add i32 %43, 12
  %61 = and i32 %59, 131072
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %74, label %611

; <label>:63                                      ; preds = %35
  %64 = tail call fastcc i32 @lduw_kernel(i32 %48) nounwind
  %65 = add i32 %43, 2
  %66 = and i32 %41, %65
  %67 = add i32 %66, %45
  %68 = tail call fastcc i32 @lduw_kernel(i32 %67) nounwind
  %69 = add i32 %43, 4
  %70 = and i32 %41, %69
  %71 = add i32 %70, %45
  %72 = tail call fastcc i32 @lduw_kernel(i32 %71) nounwind
  %73 = add i32 %43, 6
  br label %74

; <label>:74                                      ; preds = %63, %49
  %sp.0.i = phi i32 [ %60, %49 ], [ %73, %63 ]
  %new_eflags.0.i = phi i32 [ %59, %49 ], [ %72, %63 ]
  %new_cs.0.i = phi i32 [ %56, %49 ], [ %68, %63 ]
  %new_eip.0.i = phi i32 [ %50, %49 ], [ %64, %63 ]
  %75 = and i32 %new_cs.0.i, 65532
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %78

; <label>:77                                      ; preds = %74
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn nounwind
  unreachable

; <label>:78                                      ; preds = %74
  %79 = and i32 %new_cs.0.i, 4
  %80 = icmp eq i32 %79, 0
  %81 = load %struct.CPUX86State** @env, align 8
  %82 = getelementptr inbounds %struct.CPUX86State* %81, i64 0, i32 10
  %83 = getelementptr inbounds %struct.CPUX86State* %81, i64 0, i32 12
  %dt.0.i.i = select i1 %80, %struct.SegmentCache* %83, %struct.SegmentCache* %82
  %84 = or i32 %new_cs.0.i, 7
  %85 = getelementptr inbounds %struct.SegmentCache* %dt.0.i.i, i64 0, i32 2
  %86 = load i32* %85, align 4
  %87 = icmp ugt i32 %84, %86
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %78
  tail call fastcc void @raise_exception_err(i32 13, i32 %75) noreturn nounwind
  unreachable

; <label>:89                                      ; preds = %78
  %90 = and i32 %new_cs.0.i, -8
  %91 = getelementptr inbounds %struct.SegmentCache* %dt.0.i.i, i64 0, i32 1
  %92 = load i32* %91, align 4
  %93 = add i32 %92, %90
  %94 = tail call fastcc i32 @ldl_kernel(i32 %93) nounwind
  %95 = add i32 %93, 4
  %96 = tail call fastcc i32 @ldl_kernel(i32 %95) nounwind
  %97 = and i32 %96, 6144
  %98 = icmp eq i32 %97, 6144
  br i1 %98, label %100, label %99

; <label>:99                                      ; preds = %89
  tail call fastcc void @raise_exception_err(i32 13, i32 %75) noreturn nounwind
  unreachable

; <label>:100                                     ; preds = %89
  %101 = load %struct.CPUX86State** @env, align 8
  %102 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 7
  %103 = load i32* %102, align 4
  %104 = and i32 %103, 3
  %105 = and i32 %new_cs.0.i, 3
  %106 = icmp ult i32 %105, %104
  br i1 %106, label %107, label %108

; <label>:107                                     ; preds = %100
  tail call fastcc void @raise_exception_err(i32 13, i32 %75) noreturn nounwind
  unreachable

; <label>:108                                     ; preds = %100
  %109 = lshr i32 %96, 13
  %110 = and i32 %109, 3
  %111 = and i32 %96, 1024
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %116, label %113

; <label>:113                                     ; preds = %108
  %114 = icmp ugt i32 %110, %105
  br i1 %114, label %115, label %119

; <label>:115                                     ; preds = %113
  tail call fastcc void @raise_exception_err(i32 13, i32 %75) noreturn nounwind
  unreachable

; <label>:116                                     ; preds = %108
  %117 = icmp eq i32 %110, %105
  br i1 %117, label %119, label %118

; <label>:118                                     ; preds = %116
  tail call fastcc void @raise_exception_err(i32 13, i32 %75) noreturn nounwind
  unreachable

; <label>:119                                     ; preds = %116, %113
  %120 = and i32 %96, 32768
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %123

; <label>:122                                     ; preds = %119
  tail call fastcc void @raise_exception_err(i32 11, i32 %75) noreturn nounwind
  unreachable

; <label>:123                                     ; preds = %119
  %124 = icmp eq i32 %105, %104
  %125 = and i32 %103, 32768
  %126 = icmp eq i32 %125, 0
  %or.cond = and i1 %124, %126
  br i1 %or.cond, label %127, label %182

; <label>:127                                     ; preds = %123
  %128 = lshr i32 %94, 16
  %129 = shl i32 %96, 16
  %130 = and i32 %129, 16711680
  %131 = and i32 %96, -16777216
  %132 = or i32 %131, %128
  %133 = or i32 %132, %130
  %134 = and i32 %94, 65535
  %135 = and i32 %96, 983040
  %136 = or i32 %135, %134
  %137 = and i32 %96, 8388608
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %142, label %139

; <label>:139                                     ; preds = %127
  %140 = shl nuw i32 %136, 12
  %141 = or i32 %140, 4095
  br label %142

; <label>:142                                     ; preds = %139, %127
  %limit.0.i.i = phi i32 [ %141, %139 ], [ %136, %127 ]
  %143 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 9, i64 1, i32 0
  store i32 %new_cs.0.i, i32* %143, align 4
  %144 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 9, i64 1, i32 1
  store i32 %133, i32* %144, align 4
  %145 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 9, i64 1, i32 2
  store i32 %limit.0.i.i, i32* %145, align 4
  %146 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 9, i64 1, i32 3
  store i32 %96, i32* %146, align 4
  %147 = lshr i32 %96, 18
  %148 = and i32 %147, 16
  %149 = and i32 %103, -32785
  %150 = or i32 %149, %148
  store i32 %150, i32* %102, align 4
  %151 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 9, i64 2, i32 3
  %152 = load i32* %151, align 4
  %153 = lshr i32 %152, 17
  %154 = and i32 %153, 32
  %155 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 14, i64 0
  %156 = load i32* %155, align 4
  %157 = and i32 %156, 1
  %158 = icmp eq i32 %157, 0
  br i1 %158, label %165, label %159

; <label>:159                                     ; preds = %142
  %160 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 6
  %161 = load i32* %160, align 4
  %162 = and i32 %161, 131072
  %163 = icmp ne i32 %162, 0
  %164 = icmp eq i32 %148, 0
  %or.cond64.i = or i1 %163, %164
  br i1 %or.cond64.i, label %165, label %167

; <label>:165                                     ; preds = %159, %142
  %166 = or i32 %154, 64
  br label %cpu_x86_load_seg_cache.exit.i

; <label>:167                                     ; preds = %159
  %168 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 9, i64 3, i32 1
  %169 = load i32* %168, align 4
  %170 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 9, i64 0, i32 1
  %171 = load i32* %170, align 4
  %172 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 9, i64 2, i32 1
  %173 = load i32* %172, align 4
  %174 = or i32 %171, %169
  %175 = or i32 %174, %173
  %176 = icmp ne i32 %175, 0
  %177 = zext i1 %176 to i32
  %178 = shl nuw nsw i32 %177, 6
  %179 = or i32 %178, %154
  br label %cpu_x86_load_seg_cache.exit.i

cpu_x86_load_seg_cache.exit.i:                    ; preds = %167, %165
  %new_hflags.0.i.i = phi i32 [ %166, %165 ], [ %179, %167 ]
  %180 = and i32 %150, -32865
  %181 = or i32 %new_hflags.0.i.i, %180
  store i32 %181, i32* %102, align 4
  br label %576

; <label>:182                                     ; preds = %123
  %183 = and i32 %sp.0.i, %41
  %184 = add i32 %183, %45
  br i1 %46, label %185, label %192

; <label>:185                                     ; preds = %182
  %186 = tail call fastcc i32 @ldl_kernel(i32 %184) nounwind
  %187 = add i32 %sp.0.i, 4
  %188 = and i32 %187, %41
  %189 = add i32 %188, %45
  %190 = tail call fastcc i32 @ldl_kernel(i32 %189) nounwind
  %191 = and i32 %190, 65535
  br label %198

; <label>:192                                     ; preds = %182
  %193 = tail call fastcc i32 @lduw_kernel(i32 %184) nounwind
  %194 = add i32 %sp.0.i, 2
  %195 = and i32 %194, %41
  %196 = add i32 %195, %45
  %197 = tail call fastcc i32 @lduw_kernel(i32 %196) nounwind
  br label %198

; <label>:198                                     ; preds = %192, %185
  %new_ss.0.i = phi i32 [ %191, %185 ], [ %197, %192 ]
  %new_esp.0.i = phi i32 [ %186, %185 ], [ %193, %192 ]
  %199 = and i32 %new_ss.0.i, 65532
  %200 = icmp eq i32 %199, 0
  br i1 %200, label %201, label %202

; <label>:201                                     ; preds = %198
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn nounwind
  unreachable

; <label>:202                                     ; preds = %198
  %203 = and i32 %new_ss.0.i, 3
  %204 = icmp eq i32 %203, %105
  br i1 %204, label %206, label %205

; <label>:205                                     ; preds = %202
  tail call fastcc void @raise_exception_err(i32 13, i32 %199) noreturn nounwind
  unreachable

; <label>:206                                     ; preds = %202
  %207 = and i32 %new_ss.0.i, 4
  %208 = icmp eq i32 %207, 0
  %209 = load %struct.CPUX86State** @env, align 8
  %210 = getelementptr inbounds %struct.CPUX86State* %209, i64 0, i32 10
  %211 = getelementptr inbounds %struct.CPUX86State* %209, i64 0, i32 12
  %dt.0.i25.i = select i1 %208, %struct.SegmentCache* %211, %struct.SegmentCache* %210
  %212 = or i32 %new_ss.0.i, 7
  %213 = getelementptr inbounds %struct.SegmentCache* %dt.0.i25.i, i64 0, i32 2
  %214 = load i32* %213, align 4
  %215 = icmp ugt i32 %212, %214
  br i1 %215, label %216, label %217

; <label>:216                                     ; preds = %206
  tail call fastcc void @raise_exception_err(i32 13, i32 %199) noreturn nounwind
  unreachable

; <label>:217                                     ; preds = %206
  %218 = and i32 %new_ss.0.i, -8
  %219 = getelementptr inbounds %struct.SegmentCache* %dt.0.i25.i, i64 0, i32 1
  %220 = load i32* %219, align 4
  %221 = add i32 %220, %218
  %222 = tail call fastcc i32 @ldl_kernel(i32 %221) nounwind
  %223 = add i32 %221, 4
  %224 = tail call fastcc i32 @ldl_kernel(i32 %223) nounwind
  %225 = and i32 %224, 6656
  %226 = icmp eq i32 %225, 4608
  br i1 %226, label %228, label %227

; <label>:227                                     ; preds = %217
  tail call fastcc void @raise_exception_err(i32 13, i32 %199) noreturn nounwind
  unreachable

; <label>:228                                     ; preds = %217
  %229 = lshr i32 %224, 13
  %230 = and i32 %229, 3
  %231 = icmp eq i32 %230, %105
  br i1 %231, label %233, label %232

; <label>:232                                     ; preds = %228
  tail call fastcc void @raise_exception_err(i32 13, i32 %199) noreturn nounwind
  unreachable

; <label>:233                                     ; preds = %228
  %234 = and i32 %224, 32768
  %235 = icmp eq i32 %234, 0
  br i1 %235, label %236, label %237

; <label>:236                                     ; preds = %233
  tail call fastcc void @raise_exception_err(i32 11, i32 %199) noreturn nounwind
  unreachable

; <label>:237                                     ; preds = %233
  %238 = load %struct.CPUX86State** @env, align 8
  %239 = lshr i32 %222, 16
  %240 = shl i32 %224, 16
  %241 = and i32 %240, 16711680
  %242 = and i32 %224, -16777216
  %243 = or i32 %242, %239
  %244 = or i32 %243, %241
  %245 = and i32 %222, 65535
  %246 = and i32 %224, 983040
  %247 = or i32 %246, %245
  %248 = and i32 %224, 8388608
  %249 = icmp eq i32 %248, 0
  br i1 %249, label %253, label %250

; <label>:250                                     ; preds = %237
  %251 = shl nuw i32 %247, 12
  %252 = or i32 %251, 4095
  br label %253

; <label>:253                                     ; preds = %250, %237
  %limit.0.i28.i = phi i32 [ %252, %250 ], [ %247, %237 ]
  %254 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 9, i64 2, i32 0
  store i32 %new_ss.0.i, i32* %254, align 4
  %255 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 9, i64 2, i32 1
  store i32 %244, i32* %255, align 4
  %256 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 9, i64 2, i32 2
  store i32 %limit.0.i28.i, i32* %256, align 4
  %257 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 9, i64 2, i32 3
  store i32 %224, i32* %257, align 4
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 7
  %.pre.i.i = load i32* %.phi.trans.insert.i.i, align 4
  %258 = lshr i32 %224, 17
  %259 = and i32 %258, 32
  %260 = and i32 %.pre.i.i, 32768
  %261 = icmp eq i32 %260, 0
  br i1 %261, label %262, label %cpu_x86_load_seg_cache.exit31.i

; <label>:262                                     ; preds = %253
  %263 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 14, i64 0
  %264 = load i32* %263, align 4
  %265 = and i32 %264, 1
  %266 = icmp eq i32 %265, 0
  br i1 %266, label %275, label %267

; <label>:267                                     ; preds = %262
  %268 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 6
  %269 = load i32* %268, align 4
  %270 = and i32 %269, 131072
  %271 = icmp eq i32 %270, 0
  br i1 %271, label %272, label %275

; <label>:272                                     ; preds = %267
  %273 = and i32 %.pre.i.i, 16
  %274 = icmp eq i32 %273, 0
  br i1 %274, label %275, label %277

; <label>:275                                     ; preds = %272, %267, %262
  %276 = or i32 %259, 64
  br label %cpu_x86_load_seg_cache.exit31.i

; <label>:277                                     ; preds = %272
  %278 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 9, i64 3, i32 1
  %279 = load i32* %278, align 4
  %280 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 9, i64 0, i32 1
  %281 = load i32* %280, align 4
  %282 = or i32 %279, %244
  %283 = or i32 %282, %281
  %284 = icmp ne i32 %283, 0
  %285 = zext i1 %284 to i32
  %286 = shl nuw nsw i32 %285, 6
  %287 = or i32 %286, %259
  br label %cpu_x86_load_seg_cache.exit31.i

cpu_x86_load_seg_cache.exit31.i:                  ; preds = %277, %275, %253
  %new_hflags.0.i30.i = phi i32 [ %259, %253 ], [ %276, %275 ], [ %287, %277 ]
  %288 = and i32 %.pre.i.i, -97
  %289 = or i32 %new_hflags.0.i30.i, %288
  store i32 %289, i32* %.phi.trans.insert.i.i, align 4
  %290 = load %struct.CPUX86State** @env, align 8
  %291 = lshr i32 %94, 16
  %292 = shl i32 %96, 16
  %293 = and i32 %292, 16711680
  %294 = and i32 %96, -16777216
  %295 = or i32 %294, %291
  %296 = or i32 %295, %293
  %297 = and i32 %94, 65535
  %298 = and i32 %96, 983040
  %299 = or i32 %298, %297
  %300 = and i32 %96, 8388608
  %301 = icmp eq i32 %300, 0
  br i1 %301, label %305, label %302

; <label>:302                                     ; preds = %cpu_x86_load_seg_cache.exit31.i
  %303 = shl nuw i32 %299, 12
  %304 = or i32 %303, 4095
  br label %305

; <label>:305                                     ; preds = %302, %cpu_x86_load_seg_cache.exit31.i
  %limit.0.i32.i = phi i32 [ %304, %302 ], [ %299, %cpu_x86_load_seg_cache.exit31.i ]
  %306 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 9, i64 1, i32 0
  store i32 %new_cs.0.i, i32* %306, align 4
  %307 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 9, i64 1, i32 1
  store i32 %296, i32* %307, align 4
  %308 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 9, i64 1, i32 2
  store i32 %limit.0.i32.i, i32* %308, align 4
  %309 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 9, i64 1, i32 3
  store i32 %96, i32* %309, align 4
  %310 = lshr i32 %96, 18
  %311 = and i32 %310, 16
  %312 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 7
  %313 = load i32* %312, align 4
  %314 = and i32 %313, -32785
  %315 = or i32 %314, %311
  store i32 %315, i32* %312, align 4
  %316 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 9, i64 2, i32 3
  %317 = load i32* %316, align 4
  %318 = lshr i32 %317, 17
  %319 = and i32 %318, 32
  %320 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 14, i64 0
  %321 = load i32* %320, align 4
  %322 = and i32 %321, 1
  %323 = icmp eq i32 %322, 0
  br i1 %323, label %330, label %324

; <label>:324                                     ; preds = %305
  %325 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 6
  %326 = load i32* %325, align 4
  %327 = and i32 %326, 131072
  %328 = icmp ne i32 %327, 0
  %329 = icmp eq i32 %311, 0
  %or.cond65.i = or i1 %328, %329
  br i1 %or.cond65.i, label %330, label %332

; <label>:330                                     ; preds = %324, %305
  %331 = or i32 %319, 64
  br label %345

; <label>:332                                     ; preds = %324
  %333 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 9, i64 3, i32 1
  %334 = load i32* %333, align 4
  %335 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 9, i64 0, i32 1
  %336 = load i32* %335, align 4
  %337 = getelementptr inbounds %struct.CPUX86State* %290, i64 0, i32 9, i64 2, i32 1
  %338 = load i32* %337, align 4
  %339 = or i32 %336, %334
  %340 = or i32 %339, %338
  %341 = icmp ne i32 %340, 0
  %342 = zext i1 %341 to i32
  %343 = shl nuw nsw i32 %342, 6
  %344 = or i32 %343, %319
  br label %345

; <label>:345                                     ; preds = %332, %330
  %new_hflags.0.i34.i = phi i32 [ %331, %330 ], [ %344, %332 ]
  %346 = and i32 %315, -32865
  %347 = or i32 %new_hflags.0.i34.i, %346
  store i32 %347, i32* %312, align 4
  %348 = load %struct.CPUX86State** @env, align 8
  %349 = getelementptr inbounds %struct.CPUX86State* %348, i64 0, i32 7
  %350 = load i32* %349, align 4
  %351 = and i32 %350, 3
  tail call void @s2e_on_privilege_change(i32 %351, i32 %105) nounwind
  %352 = load i32* %349, align 4
  %353 = and i32 %352, -4
  %354 = or i32 %353, %105
  store i32 %354, i32* %349, align 4
  %355 = lshr i32 %224, 6
  %356 = and i32 %355, 65536
  %357 = xor i32 %356, 65536
  %358 = add i32 %357, -1
  %.pre.i54.i = load %struct.CPUX86State** @env, align 8
  %359 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 9, i64 0, i32 3
  %360 = load i32* %359, align 4
  %361 = lshr i32 %360, 13
  %362 = and i32 %361, 3
  %363 = and i32 %360, 3072
  %364 = icmp ne i32 %363, 3072
  %365 = icmp ult i32 %362, %105
  %or.cond3.i56.i = and i1 %364, %365
  br i1 %or.cond3.i56.i, label %366, label %409

; <label>:366                                     ; preds = %345
  %367 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 9, i64 0, i32 0
  %368 = bitcast i32* %367 to i8*
  br label %369

; <label>:369                                     ; preds = %372, %366
  %370 = phi i64 [ 0, %366 ], [ %374, %372 ]
  %371 = icmp ult i64 %370, 16
  br i1 %371, label %372, label %375

; <label>:372                                     ; preds = %369
  %373 = getelementptr i8* %368, i64 %370
  store i8 0, i8* %373, align 1
  %374 = add i64 %370, 1
  br label %369

; <label>:375                                     ; preds = %369
  %.phi.trans.insert.i.i57.i = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 7
  %.pre.i.i58.i = load i32* %.phi.trans.insert.i.i57.i, align 4
  %376 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 9, i64 2, i32 3
  %377 = load i32* %376, align 4
  %378 = lshr i32 %377, 17
  %379 = and i32 %378, 32
  %380 = and i32 %.pre.i.i58.i, 32768
  %381 = icmp eq i32 %380, 0
  br i1 %381, label %382, label %cpu_x86_load_seg_cache.exit.i60.i

; <label>:382                                     ; preds = %375
  %383 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 14, i64 0
  %384 = load i32* %383, align 4
  %385 = and i32 %384, 1
  %386 = icmp eq i32 %385, 0
  br i1 %386, label %395, label %387

; <label>:387                                     ; preds = %382
  %388 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 6
  %389 = load i32* %388, align 4
  %390 = and i32 %389, 131072
  %391 = icmp eq i32 %390, 0
  br i1 %391, label %392, label %395

; <label>:392                                     ; preds = %387
  %393 = and i32 %.pre.i.i58.i, 16
  %394 = icmp eq i32 %393, 0
  br i1 %394, label %395, label %397

; <label>:395                                     ; preds = %392, %387, %382
  %396 = or i32 %379, 64
  br label %cpu_x86_load_seg_cache.exit.i60.i

; <label>:397                                     ; preds = %392
  %398 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 9, i64 3, i32 1
  %399 = load i32* %398, align 4
  %400 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 9, i64 2, i32 1
  %401 = load i32* %400, align 4
  %402 = or i32 %401, %399
  %403 = icmp ne i32 %402, 0
  %404 = zext i1 %403 to i32
  %405 = shl nuw nsw i32 %404, 6
  %406 = or i32 %405, %379
  br label %cpu_x86_load_seg_cache.exit.i60.i

cpu_x86_load_seg_cache.exit.i60.i:                ; preds = %397, %395, %375
  %new_hflags.0.i.i59.i = phi i32 [ %379, %375 ], [ %396, %395 ], [ %406, %397 ]
  %407 = and i32 %.pre.i.i58.i, -97
  %408 = or i32 %new_hflags.0.i.i59.i, %407
  store i32 %408, i32* %.phi.trans.insert.i.i57.i, align 4
  %.pre.i46.pre.i = load %struct.CPUX86State** @env, align 8
  br label %409

; <label>:409                                     ; preds = %cpu_x86_load_seg_cache.exit.i60.i, %345
  %.pre.i46.i = phi %struct.CPUX86State* [ %.pre.i46.pre.i, %cpu_x86_load_seg_cache.exit.i60.i ], [ %.pre.i54.i, %345 ]
  %410 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 9, i64 3, i32 3
  %411 = load i32* %410, align 4
  %412 = lshr i32 %411, 13
  %413 = and i32 %412, 3
  %414 = and i32 %411, 3072
  %415 = icmp ne i32 %414, 3072
  %416 = icmp ult i32 %413, %105
  %or.cond3.i48.i = and i1 %415, %416
  br i1 %or.cond3.i48.i, label %417, label %validate_seg.exit53.i

; <label>:417                                     ; preds = %409
  %418 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 9, i64 3, i32 0
  %419 = bitcast i32* %418 to i8*
  br label %420

; <label>:420                                     ; preds = %423, %417
  %421 = phi i64 [ 0, %417 ], [ %425, %423 ]
  %422 = icmp ult i64 %421, 16
  br i1 %422, label %423, label %426

; <label>:423                                     ; preds = %420
  %424 = getelementptr i8* %419, i64 %421
  store i8 0, i8* %424, align 1
  %425 = add i64 %421, 1
  br label %420

; <label>:426                                     ; preds = %420
  %.phi.trans.insert.i.i49.i = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 7
  %.pre.i.i50.i = load i32* %.phi.trans.insert.i.i49.i, align 4
  %427 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 9, i64 2, i32 3
  %428 = load i32* %427, align 4
  %429 = lshr i32 %428, 17
  %430 = and i32 %429, 32
  %431 = and i32 %.pre.i.i50.i, 32768
  %432 = icmp eq i32 %431, 0
  br i1 %432, label %433, label %cpu_x86_load_seg_cache.exit.i52.i

; <label>:433                                     ; preds = %426
  %434 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 14, i64 0
  %435 = load i32* %434, align 4
  %436 = and i32 %435, 1
  %437 = icmp eq i32 %436, 0
  br i1 %437, label %446, label %438

; <label>:438                                     ; preds = %433
  %439 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 6
  %440 = load i32* %439, align 4
  %441 = and i32 %440, 131072
  %442 = icmp eq i32 %441, 0
  br i1 %442, label %443, label %446

; <label>:443                                     ; preds = %438
  %444 = and i32 %.pre.i.i50.i, 16
  %445 = icmp eq i32 %444, 0
  br i1 %445, label %446, label %448

; <label>:446                                     ; preds = %443, %438, %433
  %447 = or i32 %430, 64
  br label %cpu_x86_load_seg_cache.exit.i52.i

; <label>:448                                     ; preds = %443
  %449 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 9, i64 0, i32 1
  %450 = load i32* %449, align 4
  %451 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 9, i64 2, i32 1
  %452 = load i32* %451, align 4
  %453 = or i32 %452, %450
  %454 = icmp ne i32 %453, 0
  %455 = zext i1 %454 to i32
  %456 = shl nuw nsw i32 %455, 6
  %457 = or i32 %456, %430
  br label %cpu_x86_load_seg_cache.exit.i52.i

cpu_x86_load_seg_cache.exit.i52.i:                ; preds = %448, %446, %426
  %new_hflags.0.i.i51.i = phi i32 [ %430, %426 ], [ %447, %446 ], [ %457, %448 ]
  %458 = and i32 %.pre.i.i50.i, -97
  %459 = or i32 %new_hflags.0.i.i51.i, %458
  store i32 %459, i32* %.phi.trans.insert.i.i49.i, align 4
  %.pre.i = load %struct.CPUX86State** @env, align 8
  br label %validate_seg.exit53.i

validate_seg.exit53.i:                            ; preds = %cpu_x86_load_seg_cache.exit.i52.i, %409
  %460 = phi %struct.CPUX86State* [ %.pre.i46.i, %409 ], [ %.pre.i, %cpu_x86_load_seg_cache.exit.i52.i ]
  %461 = getelementptr inbounds %struct.CPUX86State* %460, i64 0, i32 9, i64 4, i32 0
  %462 = load i32* %461, align 4
  %463 = and i32 %462, 65532
  %464 = icmp eq i32 %463, 0
  br i1 %464, label %validate_seg.exit45.i, label %465

; <label>:465                                     ; preds = %validate_seg.exit53.i
  %466 = getelementptr inbounds %struct.CPUX86State* %460, i64 0, i32 9, i64 4, i32 3
  %467 = load i32* %466, align 4
  %468 = lshr i32 %467, 13
  %469 = and i32 %468, 3
  %470 = and i32 %467, 3072
  %471 = icmp ne i32 %470, 3072
  %472 = icmp ult i32 %469, %105
  %or.cond3.i40.i = and i1 %471, %472
  br i1 %or.cond3.i40.i, label %473, label %validate_seg.exit45.i

; <label>:473                                     ; preds = %465
  %474 = bitcast i32* %461 to i8*
  br label %475

; <label>:475                                     ; preds = %478, %473
  %476 = phi i64 [ 0, %473 ], [ %480, %478 ]
  %477 = icmp ult i64 %476, 16
  br i1 %477, label %478, label %481

; <label>:478                                     ; preds = %475
  %479 = getelementptr i8* %474, i64 %476
  store i8 0, i8* %479, align 1
  %480 = add i64 %476, 1
  br label %475

; <label>:481                                     ; preds = %475
  %.phi.trans.insert.i.i41.i = getelementptr inbounds %struct.CPUX86State* %460, i64 0, i32 7
  %.pre.i.i42.i = load i32* %.phi.trans.insert.i.i41.i, align 4
  %482 = getelementptr inbounds %struct.CPUX86State* %460, i64 0, i32 9, i64 2, i32 3
  %483 = load i32* %482, align 4
  %484 = lshr i32 %483, 17
  %485 = and i32 %484, 32
  %486 = and i32 %.pre.i.i42.i, 32768
  %487 = icmp eq i32 %486, 0
  br i1 %487, label %488, label %cpu_x86_load_seg_cache.exit.i44.i

; <label>:488                                     ; preds = %481
  %489 = getelementptr inbounds %struct.CPUX86State* %460, i64 0, i32 14, i64 0
  %490 = load i32* %489, align 4
  %491 = and i32 %490, 1
  %492 = icmp eq i32 %491, 0
  br i1 %492, label %501, label %493

; <label>:493                                     ; preds = %488
  %494 = getelementptr inbounds %struct.CPUX86State* %460, i64 0, i32 6
  %495 = load i32* %494, align 4
  %496 = and i32 %495, 131072
  %497 = icmp eq i32 %496, 0
  br i1 %497, label %498, label %501

; <label>:498                                     ; preds = %493
  %499 = and i32 %.pre.i.i42.i, 16
  %500 = icmp eq i32 %499, 0
  br i1 %500, label %501, label %503

; <label>:501                                     ; preds = %498, %493, %488
  %502 = or i32 %485, 64
  br label %cpu_x86_load_seg_cache.exit.i44.i

; <label>:503                                     ; preds = %498
  %504 = getelementptr inbounds %struct.CPUX86State* %460, i64 0, i32 9, i64 3, i32 1
  %505 = load i32* %504, align 4
  %506 = getelementptr inbounds %struct.CPUX86State* %460, i64 0, i32 9, i64 0, i32 1
  %507 = load i32* %506, align 4
  %508 = getelementptr inbounds %struct.CPUX86State* %460, i64 0, i32 9, i64 2, i32 1
  %509 = load i32* %508, align 4
  %510 = or i32 %507, %505
  %511 = or i32 %510, %509
  %512 = icmp ne i32 %511, 0
  %513 = zext i1 %512 to i32
  %514 = shl nuw nsw i32 %513, 6
  %515 = or i32 %514, %485
  br label %cpu_x86_load_seg_cache.exit.i44.i

cpu_x86_load_seg_cache.exit.i44.i:                ; preds = %503, %501, %481
  %new_hflags.0.i.i43.i = phi i32 [ %485, %481 ], [ %502, %501 ], [ %515, %503 ]
  %516 = and i32 %.pre.i.i42.i, -97
  %517 = or i32 %new_hflags.0.i.i43.i, %516
  store i32 %517, i32* %.phi.trans.insert.i.i41.i, align 4
  %.pre67.i = load %struct.CPUX86State** @env, align 8
  br label %validate_seg.exit45.i

validate_seg.exit45.i:                            ; preds = %cpu_x86_load_seg_cache.exit.i44.i, %465, %validate_seg.exit53.i
  %518 = phi %struct.CPUX86State* [ %460, %validate_seg.exit53.i ], [ %460, %465 ], [ %.pre67.i, %cpu_x86_load_seg_cache.exit.i44.i ]
  %519 = getelementptr inbounds %struct.CPUX86State* %518, i64 0, i32 9, i64 5, i32 0
  %520 = load i32* %519, align 4
  %521 = and i32 %520, 65532
  %522 = icmp eq i32 %521, 0
  br i1 %522, label %576, label %523

; <label>:523                                     ; preds = %validate_seg.exit45.i
  %524 = getelementptr inbounds %struct.CPUX86State* %518, i64 0, i32 9, i64 5, i32 3
  %525 = load i32* %524, align 4
  %526 = lshr i32 %525, 13
  %527 = and i32 %526, 3
  %528 = and i32 %525, 3072
  %529 = icmp ne i32 %528, 3072
  %530 = icmp ult i32 %527, %105
  %or.cond3.i.i = and i1 %529, %530
  br i1 %or.cond3.i.i, label %531, label %576

; <label>:531                                     ; preds = %523
  %532 = bitcast i32* %519 to i8*
  br label %533

; <label>:533                                     ; preds = %536, %531
  %534 = phi i64 [ 0, %531 ], [ %538, %536 ]
  %535 = icmp ult i64 %534, 16
  br i1 %535, label %536, label %539

; <label>:536                                     ; preds = %533
  %537 = getelementptr i8* %532, i64 %534
  store i8 0, i8* %537, align 1
  %538 = add i64 %534, 1
  br label %533

; <label>:539                                     ; preds = %533
  %.phi.trans.insert.i.i36.i = getelementptr inbounds %struct.CPUX86State* %518, i64 0, i32 7
  %.pre.i.i37.i = load i32* %.phi.trans.insert.i.i36.i, align 4
  %540 = getelementptr inbounds %struct.CPUX86State* %518, i64 0, i32 9, i64 2, i32 3
  %541 = load i32* %540, align 4
  %542 = lshr i32 %541, 17
  %543 = and i32 %542, 32
  %544 = and i32 %.pre.i.i37.i, 32768
  %545 = icmp eq i32 %544, 0
  br i1 %545, label %546, label %cpu_x86_load_seg_cache.exit.i.i

; <label>:546                                     ; preds = %539
  %547 = getelementptr inbounds %struct.CPUX86State* %518, i64 0, i32 14, i64 0
  %548 = load i32* %547, align 4
  %549 = and i32 %548, 1
  %550 = icmp eq i32 %549, 0
  br i1 %550, label %559, label %551

; <label>:551                                     ; preds = %546
  %552 = getelementptr inbounds %struct.CPUX86State* %518, i64 0, i32 6
  %553 = load i32* %552, align 4
  %554 = and i32 %553, 131072
  %555 = icmp eq i32 %554, 0
  br i1 %555, label %556, label %559

; <label>:556                                     ; preds = %551
  %557 = and i32 %.pre.i.i37.i, 16
  %558 = icmp eq i32 %557, 0
  br i1 %558, label %559, label %561

; <label>:559                                     ; preds = %556, %551, %546
  %560 = or i32 %543, 64
  br label %cpu_x86_load_seg_cache.exit.i.i

; <label>:561                                     ; preds = %556
  %562 = getelementptr inbounds %struct.CPUX86State* %518, i64 0, i32 9, i64 3, i32 1
  %563 = load i32* %562, align 4
  %564 = getelementptr inbounds %struct.CPUX86State* %518, i64 0, i32 9, i64 0, i32 1
  %565 = load i32* %564, align 4
  %566 = getelementptr inbounds %struct.CPUX86State* %518, i64 0, i32 9, i64 2, i32 1
  %567 = load i32* %566, align 4
  %568 = or i32 %565, %563
  %569 = or i32 %568, %567
  %570 = icmp ne i32 %569, 0
  %571 = zext i1 %570 to i32
  %572 = shl nuw nsw i32 %571, 6
  %573 = or i32 %572, %543
  br label %cpu_x86_load_seg_cache.exit.i.i

cpu_x86_load_seg_cache.exit.i.i:                  ; preds = %561, %559, %539
  %new_hflags.0.i.i38.i = phi i32 [ %543, %539 ], [ %560, %559 ], [ %573, %561 ]
  %574 = and i32 %.pre.i.i37.i, -97
  %575 = or i32 %new_hflags.0.i.i38.i, %574
  store i32 %575, i32* %.phi.trans.insert.i.i36.i, align 4
  br label %576

; <label>:576                                     ; preds = %cpu_x86_load_seg_cache.exit.i.i, %523, %validate_seg.exit45.i, %cpu_x86_load_seg_cache.exit.i
  %sp.1.i = phi i32 [ %sp.0.i, %cpu_x86_load_seg_cache.exit.i ], [ %new_esp.0.i, %cpu_x86_load_seg_cache.exit.i.i ], [ %new_esp.0.i, %523 ], [ %new_esp.0.i, %validate_seg.exit45.i ]
  %sp_mask.0.i = phi i32 [ %41, %cpu_x86_load_seg_cache.exit.i ], [ %358, %cpu_x86_load_seg_cache.exit.i.i ], [ %358, %523 ], [ %358, %validate_seg.exit45.i ]
  %577 = load %struct.CPUX86State** @env, align 8
  %578 = getelementptr inbounds %struct.CPUX86State* %577, i64 0, i32 0, i64 4
  %579 = load i32* %578, align 4
  %580 = xor i32 %sp_mask.0.i, -1
  %581 = and i32 %579, %580
  %582 = and i32 %sp_mask.0.i, %sp.1.i
  %583 = or i32 %581, %582
  store i32 %583, i32* %578, align 4
  %584 = load %struct.CPUX86State** @env, align 8
  %585 = getelementptr inbounds %struct.CPUX86State* %584, i64 0, i32 4
  store i32 %new_eip.0.i, i32* %585, align 4
  %586 = icmp eq i32 %104, 0
  %eflags_mask.0.i = select i1 %586, i32 2453760, i32 2441472
  %587 = load %struct.CPUX86State** @env, align 8
  %588 = getelementptr inbounds %struct.CPUX86State* %587, i64 0, i32 6
  %589 = load i32* %588, align 4
  %590 = lshr i32 %589, 12
  %591 = and i32 %590, 3
  %592 = or i32 %eflags_mask.0.i, 512
  %593 = icmp ugt i32 %104, %591
  %eflags_mask.0..i = select i1 %593, i32 %eflags_mask.0.i, i32 %592
  %594 = icmp eq i32 %shift, 0
  %595 = and i32 %eflags_mask.0..i, 29440
  %eflags_mask.2.i = select i1 %594, i32 %595, i32 %eflags_mask.0..i
  %596 = and i32 %new_eflags.0.i, 2261
  %597 = getelementptr inbounds %struct.CPUX86State* %587, i64 0, i32 1
  store i32 %596, i32* %597, align 4
  %598 = lshr i32 %new_eflags.0.i, 9
  %599 = and i32 %598, 2
  %600 = xor i32 %599, 2
  %601 = add i32 %600, -1
  %602 = load %struct.CPUX86State** @env, align 8
  %603 = getelementptr inbounds %struct.CPUX86State* %602, i64 0, i32 5
  store i32 %601, i32* %603, align 4
  %604 = load %struct.CPUX86State** @env, align 8
  %605 = getelementptr inbounds %struct.CPUX86State* %604, i64 0, i32 6
  %606 = load i32* %605, align 4
  %607 = xor i32 %eflags_mask.2.i, -1
  %608 = and i32 %606, %607
  %609 = and i32 %eflags_mask.2.i, %new_eflags.0.i
  %610 = or i32 %608, %609
  store i32 %610, i32* %605, align 4
  br label %helper_ret_protected.exit

; <label>:611                                     ; preds = %49
  %612 = and i32 %41, %60
  %613 = add i32 %612, %45
  %614 = tail call fastcc i32 @ldl_kernel(i32 %613) nounwind
  %615 = add i32 %43, 16
  %616 = and i32 %41, %615
  %617 = add i32 %616, %45
  %618 = tail call fastcc i32 @ldl_kernel(i32 %617) nounwind
  %619 = add i32 %43, 20
  %620 = and i32 %41, %619
  %621 = add i32 %620, %45
  %622 = tail call fastcc i32 @ldl_kernel(i32 %621) nounwind
  %623 = add i32 %43, 24
  %624 = and i32 %41, %623
  %625 = add i32 %624, %45
  %626 = tail call fastcc i32 @ldl_kernel(i32 %625) nounwind
  %627 = add i32 %43, 28
  %628 = and i32 %41, %627
  %629 = add i32 %628, %45
  %630 = tail call fastcc i32 @ldl_kernel(i32 %629) nounwind
  %631 = add i32 %43, 32
  %632 = and i32 %41, %631
  %633 = add i32 %632, %45
  %634 = tail call fastcc i32 @ldl_kernel(i32 %633) nounwind
  %635 = and i32 %59, 2261
  %636 = load %struct.CPUX86State** @env, align 8
  %637 = getelementptr inbounds %struct.CPUX86State* %636, i64 0, i32 1
  store i32 %635, i32* %637, align 4
  %638 = lshr i32 %59, 9
  %639 = and i32 %638, 2
  %640 = xor i32 %639, 2
  %641 = add i32 %640, -1
  %642 = load %struct.CPUX86State** @env, align 8
  %643 = getelementptr inbounds %struct.CPUX86State* %642, i64 0, i32 5
  store i32 %641, i32* %643, align 4
  %644 = load %struct.CPUX86State** @env, align 8
  %645 = getelementptr inbounds %struct.CPUX86State* %644, i64 0, i32 6
  %646 = load i32* %645, align 4
  %647 = and i32 %646, -4092673
  %648 = and i32 %59, 4092672
  %649 = or i32 %647, %648
  store i32 %649, i32* %645, align 4
  %650 = load %struct.CPUX86State** @env, align 8
  %651 = shl nuw nsw i32 %56, 4
  %652 = getelementptr inbounds %struct.CPUX86State* %650, i64 0, i32 9, i64 1, i32 0
  store i32 %56, i32* %652, align 4
  %653 = getelementptr inbounds %struct.CPUX86State* %650, i64 0, i32 9, i64 1, i32 1
  store i32 %651, i32* %653, align 4
  %654 = getelementptr inbounds %struct.CPUX86State* %650, i64 0, i32 9, i64 1, i32 2
  store i32 65535, i32* %654, align 4
  %655 = getelementptr inbounds %struct.CPUX86State* %650, i64 0, i32 9, i64 1, i32 3
  store i32 0, i32* %655, align 4
  %656 = getelementptr inbounds %struct.CPUX86State* %650, i64 0, i32 7
  %657 = load i32* %656, align 4
  %658 = getelementptr inbounds %struct.CPUX86State* %650, i64 0, i32 9, i64 2, i32 3
  %659 = load i32* %658, align 4
  %660 = lshr i32 %659, 17
  %661 = and i32 %660, 32
  %662 = and i32 %657, -32881
  %663 = or i32 %662, %661
  %664 = or i32 %663, 64
  store i32 %664, i32* %656, align 4
  %665 = load %struct.CPUX86State** @env, align 8
  %666 = getelementptr inbounds %struct.CPUX86State* %665, i64 0, i32 7
  %667 = load i32* %666, align 4
  %668 = and i32 %667, 3
  tail call void @s2e_on_privilege_change(i32 %668, i32 3) nounwind
  %669 = load i32* %666, align 4
  %670 = or i32 %669, 3
  store i32 %670, i32* %666, align 4
  %671 = and i32 %618, 65535
  %672 = load %struct.CPUX86State** @env, align 8
  %673 = shl nuw nsw i32 %671, 4
  %674 = getelementptr inbounds %struct.CPUX86State* %672, i64 0, i32 9, i64 2, i32 0
  store i32 %671, i32* %674, align 4
  %675 = getelementptr inbounds %struct.CPUX86State* %672, i64 0, i32 9, i64 2, i32 1
  store i32 %673, i32* %675, align 4
  %676 = getelementptr inbounds %struct.CPUX86State* %672, i64 0, i32 9, i64 2, i32 2
  store i32 65535, i32* %676, align 4
  %677 = getelementptr inbounds %struct.CPUX86State* %672, i64 0, i32 9, i64 2, i32 3
  store i32 0, i32* %677, align 4
  %.phi.trans.insert.i.i19.i = getelementptr inbounds %struct.CPUX86State* %672, i64 0, i32 7
  %.pre.i.i20.i = load i32* %.phi.trans.insert.i.i19.i, align 4
  %678 = and i32 %.pre.i.i20.i, 32768
  %679 = icmp eq i32 %678, 0
  br i1 %679, label %680, label %703

; <label>:680                                     ; preds = %611
  %681 = getelementptr inbounds %struct.CPUX86State* %672, i64 0, i32 14, i64 0
  %682 = load i32* %681, align 4
  %683 = and i32 %682, 1
  %684 = icmp eq i32 %683, 0
  br i1 %684, label %703, label %685

; <label>:685                                     ; preds = %680
  %686 = getelementptr inbounds %struct.CPUX86State* %672, i64 0, i32 6
  %687 = load i32* %686, align 4
  %688 = and i32 %687, 131072
  %689 = icmp eq i32 %688, 0
  br i1 %689, label %690, label %703

; <label>:690                                     ; preds = %685
  %691 = and i32 %.pre.i.i20.i, 16
  %692 = icmp eq i32 %691, 0
  br i1 %692, label %703, label %693

; <label>:693                                     ; preds = %690
  %694 = getelementptr inbounds %struct.CPUX86State* %672, i64 0, i32 9, i64 3, i32 1
  %695 = load i32* %694, align 4
  %696 = getelementptr inbounds %struct.CPUX86State* %672, i64 0, i32 9, i64 0, i32 1
  %697 = load i32* %696, align 4
  %698 = or i32 %695, %673
  %699 = or i32 %698, %697
  %700 = icmp ne i32 %699, 0
  %701 = zext i1 %700 to i32
  %702 = shl nuw nsw i32 %701, 6
  br label %703

; <label>:703                                     ; preds = %693, %690, %685, %680, %611
  %new_hflags.0.i.i21.i = phi i32 [ 0, %611 ], [ %702, %693 ], [ 64, %690 ], [ 64, %685 ], [ 64, %680 ]
  %704 = and i32 %.pre.i.i20.i, -97
  %705 = or i32 %new_hflags.0.i.i21.i, %704
  store i32 %705, i32* %.phi.trans.insert.i.i19.i, align 4
  %706 = and i32 %622, 65535
  %707 = load %struct.CPUX86State** @env, align 8
  %708 = shl nuw nsw i32 %706, 4
  %709 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 9, i64 0, i32 0
  store i32 %706, i32* %709, align 4
  %710 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 9, i64 0, i32 1
  store i32 %708, i32* %710, align 4
  %711 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 9, i64 0, i32 2
  store i32 65535, i32* %711, align 4
  %712 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 9, i64 0, i32 3
  store i32 0, i32* %712, align 4
  %.phi.trans.insert.i.i15.i = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 7
  %.pre.i.i16.i = load i32* %.phi.trans.insert.i.i15.i, align 4
  %713 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 9, i64 2, i32 3
  %714 = load i32* %713, align 4
  %715 = lshr i32 %714, 17
  %716 = and i32 %715, 32
  %717 = and i32 %.pre.i.i16.i, 32768
  %718 = icmp eq i32 %717, 0
  br i1 %718, label %719, label %745

; <label>:719                                     ; preds = %703
  %720 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 14, i64 0
  %721 = load i32* %720, align 4
  %722 = and i32 %721, 1
  %723 = icmp eq i32 %722, 0
  br i1 %723, label %732, label %724

; <label>:724                                     ; preds = %719
  %725 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 6
  %726 = load i32* %725, align 4
  %727 = and i32 %726, 131072
  %728 = icmp eq i32 %727, 0
  br i1 %728, label %729, label %732

; <label>:729                                     ; preds = %724
  %730 = and i32 %.pre.i.i16.i, 16
  %731 = icmp eq i32 %730, 0
  br i1 %731, label %732, label %734

; <label>:732                                     ; preds = %729, %724, %719
  %733 = or i32 %716, 64
  br label %745

; <label>:734                                     ; preds = %729
  %735 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 9, i64 3, i32 1
  %736 = load i32* %735, align 4
  %737 = getelementptr inbounds %struct.CPUX86State* %707, i64 0, i32 9, i64 2, i32 1
  %738 = load i32* %737, align 4
  %739 = or i32 %736, %708
  %740 = or i32 %739, %738
  %741 = icmp ne i32 %740, 0
  %742 = zext i1 %741 to i32
  %743 = shl nuw nsw i32 %742, 6
  %744 = or i32 %743, %716
  br label %745

; <label>:745                                     ; preds = %734, %732, %703
  %new_hflags.0.i.i17.i = phi i32 [ %716, %703 ], [ %733, %732 ], [ %744, %734 ]
  %746 = and i32 %.pre.i.i16.i, -97
  %747 = or i32 %new_hflags.0.i.i17.i, %746
  store i32 %747, i32* %.phi.trans.insert.i.i15.i, align 4
  %748 = and i32 %626, 65535
  %749 = load %struct.CPUX86State** @env, align 8
  %750 = shl nuw nsw i32 %748, 4
  %751 = getelementptr inbounds %struct.CPUX86State* %749, i64 0, i32 9, i64 3, i32 0
  store i32 %748, i32* %751, align 4
  %752 = getelementptr inbounds %struct.CPUX86State* %749, i64 0, i32 9, i64 3, i32 1
  store i32 %750, i32* %752, align 4
  %753 = getelementptr inbounds %struct.CPUX86State* %749, i64 0, i32 9, i64 3, i32 2
  store i32 65535, i32* %753, align 4
  %754 = getelementptr inbounds %struct.CPUX86State* %749, i64 0, i32 9, i64 3, i32 3
  store i32 0, i32* %754, align 4
  %.phi.trans.insert.i.i11.i = getelementptr inbounds %struct.CPUX86State* %749, i64 0, i32 7
  %.pre.i.i12.i = load i32* %.phi.trans.insert.i.i11.i, align 4
  %755 = getelementptr inbounds %struct.CPUX86State* %749, i64 0, i32 9, i64 2, i32 3
  %756 = load i32* %755, align 4
  %757 = lshr i32 %756, 17
  %758 = and i32 %757, 32
  %759 = and i32 %.pre.i.i12.i, 32768
  %760 = icmp eq i32 %759, 0
  br i1 %760, label %761, label %787

; <label>:761                                     ; preds = %745
  %762 = getelementptr inbounds %struct.CPUX86State* %749, i64 0, i32 14, i64 0
  %763 = load i32* %762, align 4
  %764 = and i32 %763, 1
  %765 = icmp eq i32 %764, 0
  br i1 %765, label %774, label %766

; <label>:766                                     ; preds = %761
  %767 = getelementptr inbounds %struct.CPUX86State* %749, i64 0, i32 6
  %768 = load i32* %767, align 4
  %769 = and i32 %768, 131072
  %770 = icmp eq i32 %769, 0
  br i1 %770, label %771, label %774

; <label>:771                                     ; preds = %766
  %772 = and i32 %.pre.i.i12.i, 16
  %773 = icmp eq i32 %772, 0
  br i1 %773, label %774, label %776

; <label>:774                                     ; preds = %771, %766, %761
  %775 = or i32 %758, 64
  br label %787

; <label>:776                                     ; preds = %771
  %777 = getelementptr inbounds %struct.CPUX86State* %749, i64 0, i32 9, i64 0, i32 1
  %778 = load i32* %777, align 4
  %779 = getelementptr inbounds %struct.CPUX86State* %749, i64 0, i32 9, i64 2, i32 1
  %780 = load i32* %779, align 4
  %781 = or i32 %778, %750
  %782 = or i32 %781, %780
  %783 = icmp ne i32 %782, 0
  %784 = zext i1 %783 to i32
  %785 = shl nuw nsw i32 %784, 6
  %786 = or i32 %785, %758
  br label %787

; <label>:787                                     ; preds = %776, %774, %745
  %new_hflags.0.i.i13.i = phi i32 [ %758, %745 ], [ %775, %774 ], [ %786, %776 ]
  %788 = and i32 %.pre.i.i12.i, -97
  %789 = or i32 %new_hflags.0.i.i13.i, %788
  store i32 %789, i32* %.phi.trans.insert.i.i11.i, align 4
  %790 = and i32 %630, 65535
  %791 = load %struct.CPUX86State** @env, align 8
  %792 = shl nuw nsw i32 %790, 4
  %793 = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 9, i64 4, i32 0
  store i32 %790, i32* %793, align 4
  %794 = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 9, i64 4, i32 1
  store i32 %792, i32* %794, align 4
  %795 = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 9, i64 4, i32 2
  store i32 65535, i32* %795, align 4
  %796 = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 9, i64 4, i32 3
  store i32 0, i32* %796, align 4
  %.phi.trans.insert.i.i7.i = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 7
  %.pre.i.i8.i = load i32* %.phi.trans.insert.i.i7.i, align 4
  %797 = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 9, i64 2, i32 3
  %798 = load i32* %797, align 4
  %799 = lshr i32 %798, 17
  %800 = and i32 %799, 32
  %801 = and i32 %.pre.i.i8.i, 32768
  %802 = icmp eq i32 %801, 0
  br i1 %802, label %803, label %831

; <label>:803                                     ; preds = %787
  %804 = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 14, i64 0
  %805 = load i32* %804, align 4
  %806 = and i32 %805, 1
  %807 = icmp eq i32 %806, 0
  br i1 %807, label %816, label %808

; <label>:808                                     ; preds = %803
  %809 = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 6
  %810 = load i32* %809, align 4
  %811 = and i32 %810, 131072
  %812 = icmp eq i32 %811, 0
  br i1 %812, label %813, label %816

; <label>:813                                     ; preds = %808
  %814 = and i32 %.pre.i.i8.i, 16
  %815 = icmp eq i32 %814, 0
  br i1 %815, label %816, label %818

; <label>:816                                     ; preds = %813, %808, %803
  %817 = or i32 %800, 64
  br label %831

; <label>:818                                     ; preds = %813
  %819 = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 9, i64 3, i32 1
  %820 = load i32* %819, align 4
  %821 = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 9, i64 0, i32 1
  %822 = load i32* %821, align 4
  %823 = getelementptr inbounds %struct.CPUX86State* %791, i64 0, i32 9, i64 2, i32 1
  %824 = load i32* %823, align 4
  %825 = or i32 %822, %820
  %826 = or i32 %825, %824
  %827 = icmp ne i32 %826, 0
  %828 = zext i1 %827 to i32
  %829 = shl nuw nsw i32 %828, 6
  %830 = or i32 %829, %800
  br label %831

; <label>:831                                     ; preds = %818, %816, %787
  %new_hflags.0.i.i9.i = phi i32 [ %800, %787 ], [ %817, %816 ], [ %830, %818 ]
  %832 = and i32 %.pre.i.i8.i, -97
  %833 = or i32 %new_hflags.0.i.i9.i, %832
  store i32 %833, i32* %.phi.trans.insert.i.i7.i, align 4
  %834 = and i32 %634, 65535
  %835 = load %struct.CPUX86State** @env, align 8
  %836 = shl nuw nsw i32 %834, 4
  %837 = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 9, i64 5, i32 0
  store i32 %834, i32* %837, align 4
  %838 = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 9, i64 5, i32 1
  store i32 %836, i32* %838, align 4
  %839 = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 9, i64 5, i32 2
  store i32 65535, i32* %839, align 4
  %840 = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 9, i64 5, i32 3
  store i32 0, i32* %840, align 4
  %.phi.trans.insert.i.i.i = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 7
  %.pre.i.i.i = load i32* %.phi.trans.insert.i.i.i, align 4
  %841 = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 9, i64 2, i32 3
  %842 = load i32* %841, align 4
  %843 = lshr i32 %842, 17
  %844 = and i32 %843, 32
  %845 = and i32 %.pre.i.i.i, 32768
  %846 = icmp eq i32 %845, 0
  br i1 %846, label %847, label %load_seg_vm.exit.i

; <label>:847                                     ; preds = %831
  %848 = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 14, i64 0
  %849 = load i32* %848, align 4
  %850 = and i32 %849, 1
  %851 = icmp eq i32 %850, 0
  br i1 %851, label %860, label %852

; <label>:852                                     ; preds = %847
  %853 = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 6
  %854 = load i32* %853, align 4
  %855 = and i32 %854, 131072
  %856 = icmp eq i32 %855, 0
  br i1 %856, label %857, label %860

; <label>:857                                     ; preds = %852
  %858 = and i32 %.pre.i.i.i, 16
  %859 = icmp eq i32 %858, 0
  br i1 %859, label %860, label %862

; <label>:860                                     ; preds = %857, %852, %847
  %861 = or i32 %844, 64
  br label %load_seg_vm.exit.i

; <label>:862                                     ; preds = %857
  %863 = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 9, i64 3, i32 1
  %864 = load i32* %863, align 4
  %865 = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 9, i64 0, i32 1
  %866 = load i32* %865, align 4
  %867 = getelementptr inbounds %struct.CPUX86State* %835, i64 0, i32 9, i64 2, i32 1
  %868 = load i32* %867, align 4
  %869 = or i32 %866, %864
  %870 = or i32 %869, %868
  %871 = icmp ne i32 %870, 0
  %872 = zext i1 %871 to i32
  %873 = shl nuw nsw i32 %872, 6
  %874 = or i32 %873, %844
  br label %load_seg_vm.exit.i

load_seg_vm.exit.i:                               ; preds = %862, %860, %831
  %new_hflags.0.i.i.i = phi i32 [ %844, %831 ], [ %861, %860 ], [ %874, %862 ]
  %875 = and i32 %.pre.i.i.i, -97
  %876 = or i32 %new_hflags.0.i.i.i, %875
  store i32 %876, i32* %.phi.trans.insert.i.i.i, align 4
  %877 = and i32 %50, 65535
  %878 = load %struct.CPUX86State** @env, align 8
  %879 = getelementptr inbounds %struct.CPUX86State* %878, i64 0, i32 4
  store i32 %877, i32* %879, align 4
  %880 = load %struct.CPUX86State** @env, align 8
  %881 = getelementptr inbounds %struct.CPUX86State* %880, i64 0, i32 0, i64 4
  store i32 %614, i32* %881, align 4
  br label %helper_ret_protected.exit

helper_ret_protected.exit:                        ; preds = %load_seg_vm.exit.i, %576, %34
  %882 = load %struct.CPUX86State** @env, align 8
  %883 = getelementptr inbounds %struct.CPUX86State* %882, i64 0, i32 8
  %884 = load i32* %883, align 4
  %885 = and i32 %884, -5
  store i32 %885, i32* %883, align 4
  ret void
}

define void @helper_lret_protected(i32 %shift, i32 %addend) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 2, i32 3
  %3 = load i32* %2, align 4
  %4 = lshr i32 %3, 6
  %5 = and i32 %4, 65536
  %6 = xor i32 %5, 65536
  %7 = add i32 %6, -1
  %8 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 4
  %9 = load i32* %8, align 4
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 9, i64 2, i32 1
  %11 = load i32* %10, align 4
  %12 = icmp eq i32 %shift, 1
  %13 = and i32 %7, %9
  %14 = add i32 %13, %11
  br i1 %12, label %15, label %23

; <label>:15                                      ; preds = %0
  %16 = tail call fastcc i32 @ldl_kernel(i32 %14) nounwind
  %17 = add i32 %9, 4
  %18 = and i32 %7, %17
  %19 = add i32 %18, %11
  %20 = tail call fastcc i32 @ldl_kernel(i32 %19) nounwind
  %21 = add i32 %9, 8
  %22 = and i32 %20, 65535
  br label %30

; <label>:23                                      ; preds = %0
  %24 = tail call fastcc i32 @lduw_kernel(i32 %14) nounwind
  %25 = add i32 %9, 2
  %26 = and i32 %7, %25
  %27 = add i32 %26, %11
  %28 = tail call fastcc i32 @lduw_kernel(i32 %27) nounwind
  %29 = add i32 %9, 4
  br label %30

; <label>:30                                      ; preds = %23, %15
  %sp.0.i = phi i32 [ %21, %15 ], [ %29, %23 ]
  %new_cs.0.i = phi i32 [ %22, %15 ], [ %28, %23 ]
  %new_eip.0.i = phi i32 [ %16, %15 ], [ %24, %23 ]
  %31 = and i32 %new_cs.0.i, 65532
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %30
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn nounwind
  unreachable

; <label>:34                                      ; preds = %30
  %35 = and i32 %new_cs.0.i, 4
  %36 = icmp eq i32 %35, 0
  %37 = load %struct.CPUX86State** @env, align 8
  %38 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 10
  %39 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 12
  %dt.0.i.i = select i1 %36, %struct.SegmentCache* %39, %struct.SegmentCache* %38
  %40 = or i32 %new_cs.0.i, 7
  %41 = getelementptr inbounds %struct.SegmentCache* %dt.0.i.i, i64 0, i32 2
  %42 = load i32* %41, align 4
  %43 = icmp ugt i32 %40, %42
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %34
  tail call fastcc void @raise_exception_err(i32 13, i32 %31) noreturn nounwind
  unreachable

; <label>:45                                      ; preds = %34
  %46 = and i32 %new_cs.0.i, -8
  %47 = getelementptr inbounds %struct.SegmentCache* %dt.0.i.i, i64 0, i32 1
  %48 = load i32* %47, align 4
  %49 = add i32 %48, %46
  %50 = tail call fastcc i32 @ldl_kernel(i32 %49) nounwind
  %51 = add i32 %49, 4
  %52 = tail call fastcc i32 @ldl_kernel(i32 %51) nounwind
  %53 = and i32 %52, 6144
  %54 = icmp eq i32 %53, 6144
  br i1 %54, label %56, label %55

; <label>:55                                      ; preds = %45
  tail call fastcc void @raise_exception_err(i32 13, i32 %31) noreturn nounwind
  unreachable

; <label>:56                                      ; preds = %45
  %57 = load %struct.CPUX86State** @env, align 8
  %58 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 7
  %59 = load i32* %58, align 4
  %60 = and i32 %59, 3
  %61 = and i32 %new_cs.0.i, 3
  %62 = icmp ult i32 %61, %60
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %56
  tail call fastcc void @raise_exception_err(i32 13, i32 %31) noreturn nounwind
  unreachable

; <label>:64                                      ; preds = %56
  %65 = lshr i32 %52, 13
  %66 = and i32 %65, 3
  %67 = and i32 %52, 1024
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %72, label %69

; <label>:69                                      ; preds = %64
  %70 = icmp ugt i32 %66, %61
  br i1 %70, label %71, label %75

; <label>:71                                      ; preds = %69
  tail call fastcc void @raise_exception_err(i32 13, i32 %31) noreturn nounwind
  unreachable

; <label>:72                                      ; preds = %64
  %73 = icmp eq i32 %66, %61
  br i1 %73, label %75, label %74

; <label>:74                                      ; preds = %72
  tail call fastcc void @raise_exception_err(i32 13, i32 %31) noreturn nounwind
  unreachable

; <label>:75                                      ; preds = %72, %69
  %76 = and i32 %52, 32768
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %79

; <label>:78                                      ; preds = %75
  tail call fastcc void @raise_exception_err(i32 11, i32 %31) noreturn nounwind
  unreachable

; <label>:79                                      ; preds = %75
  %80 = add i32 %sp.0.i, %addend
  %81 = icmp eq i32 %61, %60
  br i1 %81, label %82, label %137

; <label>:82                                      ; preds = %79
  %83 = lshr i32 %50, 16
  %84 = shl i32 %52, 16
  %85 = and i32 %84, 16711680
  %86 = and i32 %52, -16777216
  %87 = or i32 %86, %83
  %88 = or i32 %87, %85
  %89 = and i32 %50, 65535
  %90 = and i32 %52, 983040
  %91 = or i32 %90, %89
  %92 = and i32 %52, 8388608
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %97, label %94

; <label>:94                                      ; preds = %82
  %95 = shl nuw i32 %91, 12
  %96 = or i32 %95, 4095
  br label %97

; <label>:97                                      ; preds = %94, %82
  %limit.0.i.i = phi i32 [ %96, %94 ], [ %91, %82 ]
  %98 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 9, i64 1, i32 0
  store i32 %new_cs.0.i, i32* %98, align 4
  %99 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 9, i64 1, i32 1
  store i32 %88, i32* %99, align 4
  %100 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 9, i64 1, i32 2
  store i32 %limit.0.i.i, i32* %100, align 4
  %101 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 9, i64 1, i32 3
  store i32 %52, i32* %101, align 4
  %102 = lshr i32 %52, 18
  %103 = and i32 %102, 16
  %104 = and i32 %59, -32785
  %105 = or i32 %104, %103
  store i32 %105, i32* %58, align 4
  %106 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 9, i64 2, i32 3
  %107 = load i32* %106, align 4
  %108 = lshr i32 %107, 17
  %109 = and i32 %108, 32
  %110 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 14, i64 0
  %111 = load i32* %110, align 4
  %112 = and i32 %111, 1
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %120, label %114

; <label>:114                                     ; preds = %97
  %115 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 6
  %116 = load i32* %115, align 4
  %117 = and i32 %116, 131072
  %118 = icmp ne i32 %117, 0
  %119 = icmp eq i32 %103, 0
  %or.cond64.i = or i1 %118, %119
  br i1 %or.cond64.i, label %120, label %122

; <label>:120                                     ; preds = %114, %97
  %121 = or i32 %109, 64
  br label %cpu_x86_load_seg_cache.exit.i

; <label>:122                                     ; preds = %114
  %123 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 9, i64 3, i32 1
  %124 = load i32* %123, align 4
  %125 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 9, i64 0, i32 1
  %126 = load i32* %125, align 4
  %127 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 9, i64 2, i32 1
  %128 = load i32* %127, align 4
  %129 = or i32 %126, %124
  %130 = or i32 %129, %128
  %131 = icmp ne i32 %130, 0
  %132 = zext i1 %131 to i32
  %133 = shl nuw nsw i32 %132, 6
  %134 = or i32 %133, %109
  br label %cpu_x86_load_seg_cache.exit.i

cpu_x86_load_seg_cache.exit.i:                    ; preds = %122, %120
  %new_hflags.0.i.i = phi i32 [ %121, %120 ], [ %134, %122 ]
  %135 = and i32 %105, -32865
  %136 = or i32 %new_hflags.0.i.i, %135
  store i32 %136, i32* %58, align 4
  br label %helper_ret_protected.exit

; <label>:137                                     ; preds = %79
  %138 = and i32 %80, %7
  %139 = add i32 %138, %11
  br i1 %12, label %140, label %147

; <label>:140                                     ; preds = %137
  %141 = tail call fastcc i32 @ldl_kernel(i32 %139) nounwind
  %142 = add i32 %80, 4
  %143 = and i32 %142, %7
  %144 = add i32 %143, %11
  %145 = tail call fastcc i32 @ldl_kernel(i32 %144) nounwind
  %146 = and i32 %145, 65535
  br label %153

; <label>:147                                     ; preds = %137
  %148 = tail call fastcc i32 @lduw_kernel(i32 %139) nounwind
  %149 = add i32 %80, 2
  %150 = and i32 %149, %7
  %151 = add i32 %150, %11
  %152 = tail call fastcc i32 @lduw_kernel(i32 %151) nounwind
  br label %153

; <label>:153                                     ; preds = %147, %140
  %new_ss.0.i = phi i32 [ %146, %140 ], [ %152, %147 ]
  %new_esp.0.i = phi i32 [ %141, %140 ], [ %148, %147 ]
  %154 = and i32 %new_ss.0.i, 65532
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %157

; <label>:156                                     ; preds = %153
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn nounwind
  unreachable

; <label>:157                                     ; preds = %153
  %158 = and i32 %new_ss.0.i, 3
  %159 = icmp eq i32 %158, %61
  br i1 %159, label %161, label %160

; <label>:160                                     ; preds = %157
  tail call fastcc void @raise_exception_err(i32 13, i32 %154) noreturn nounwind
  unreachable

; <label>:161                                     ; preds = %157
  %162 = and i32 %new_ss.0.i, 4
  %163 = icmp eq i32 %162, 0
  %164 = load %struct.CPUX86State** @env, align 8
  %165 = getelementptr inbounds %struct.CPUX86State* %164, i64 0, i32 10
  %166 = getelementptr inbounds %struct.CPUX86State* %164, i64 0, i32 12
  %dt.0.i25.i = select i1 %163, %struct.SegmentCache* %166, %struct.SegmentCache* %165
  %167 = or i32 %new_ss.0.i, 7
  %168 = getelementptr inbounds %struct.SegmentCache* %dt.0.i25.i, i64 0, i32 2
  %169 = load i32* %168, align 4
  %170 = icmp ugt i32 %167, %169
  br i1 %170, label %171, label %172

; <label>:171                                     ; preds = %161
  tail call fastcc void @raise_exception_err(i32 13, i32 %154) noreturn nounwind
  unreachable

; <label>:172                                     ; preds = %161
  %173 = and i32 %new_ss.0.i, -8
  %174 = getelementptr inbounds %struct.SegmentCache* %dt.0.i25.i, i64 0, i32 1
  %175 = load i32* %174, align 4
  %176 = add i32 %175, %173
  %177 = tail call fastcc i32 @ldl_kernel(i32 %176) nounwind
  %178 = add i32 %176, 4
  %179 = tail call fastcc i32 @ldl_kernel(i32 %178) nounwind
  %180 = and i32 %179, 6656
  %181 = icmp eq i32 %180, 4608
  br i1 %181, label %183, label %182

; <label>:182                                     ; preds = %172
  tail call fastcc void @raise_exception_err(i32 13, i32 %154) noreturn nounwind
  unreachable

; <label>:183                                     ; preds = %172
  %184 = lshr i32 %179, 13
  %185 = and i32 %184, 3
  %186 = icmp eq i32 %185, %61
  br i1 %186, label %188, label %187

; <label>:187                                     ; preds = %183
  tail call fastcc void @raise_exception_err(i32 13, i32 %154) noreturn nounwind
  unreachable

; <label>:188                                     ; preds = %183
  %189 = and i32 %179, 32768
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %191, label %192

; <label>:191                                     ; preds = %188
  tail call fastcc void @raise_exception_err(i32 11, i32 %154) noreturn nounwind
  unreachable

; <label>:192                                     ; preds = %188
  %193 = load %struct.CPUX86State** @env, align 8
  %194 = lshr i32 %177, 16
  %195 = shl i32 %179, 16
  %196 = and i32 %195, 16711680
  %197 = and i32 %179, -16777216
  %198 = or i32 %197, %194
  %199 = or i32 %198, %196
  %200 = and i32 %177, 65535
  %201 = and i32 %179, 983040
  %202 = or i32 %201, %200
  %203 = and i32 %179, 8388608
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %208, label %205

; <label>:205                                     ; preds = %192
  %206 = shl nuw i32 %202, 12
  %207 = or i32 %206, 4095
  br label %208

; <label>:208                                     ; preds = %205, %192
  %limit.0.i28.i = phi i32 [ %207, %205 ], [ %202, %192 ]
  %209 = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 9, i64 2, i32 0
  store i32 %new_ss.0.i, i32* %209, align 4
  %210 = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 9, i64 2, i32 1
  store i32 %199, i32* %210, align 4
  %211 = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 9, i64 2, i32 2
  store i32 %limit.0.i28.i, i32* %211, align 4
  %212 = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 9, i64 2, i32 3
  store i32 %179, i32* %212, align 4
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 7
  %.pre.i.i = load i32* %.phi.trans.insert.i.i, align 4
  %213 = lshr i32 %179, 17
  %214 = and i32 %213, 32
  %215 = and i32 %.pre.i.i, 32768
  %216 = icmp eq i32 %215, 0
  br i1 %216, label %217, label %cpu_x86_load_seg_cache.exit31.i

; <label>:217                                     ; preds = %208
  %218 = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 14, i64 0
  %219 = load i32* %218, align 4
  %220 = and i32 %219, 1
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %230, label %222

; <label>:222                                     ; preds = %217
  %223 = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 6
  %224 = load i32* %223, align 4
  %225 = and i32 %224, 131072
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %227, label %230

; <label>:227                                     ; preds = %222
  %228 = and i32 %.pre.i.i, 16
  %229 = icmp eq i32 %228, 0
  br i1 %229, label %230, label %232

; <label>:230                                     ; preds = %227, %222, %217
  %231 = or i32 %214, 64
  br label %cpu_x86_load_seg_cache.exit31.i

; <label>:232                                     ; preds = %227
  %233 = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 9, i64 3, i32 1
  %234 = load i32* %233, align 4
  %235 = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 9, i64 0, i32 1
  %236 = load i32* %235, align 4
  %237 = or i32 %234, %199
  %238 = or i32 %237, %236
  %239 = icmp ne i32 %238, 0
  %240 = zext i1 %239 to i32
  %241 = shl nuw nsw i32 %240, 6
  %242 = or i32 %241, %214
  br label %cpu_x86_load_seg_cache.exit31.i

cpu_x86_load_seg_cache.exit31.i:                  ; preds = %232, %230, %208
  %new_hflags.0.i30.i = phi i32 [ %214, %208 ], [ %231, %230 ], [ %242, %232 ]
  %243 = and i32 %.pre.i.i, -97
  %244 = or i32 %new_hflags.0.i30.i, %243
  store i32 %244, i32* %.phi.trans.insert.i.i, align 4
  %245 = load %struct.CPUX86State** @env, align 8
  %246 = lshr i32 %50, 16
  %247 = shl i32 %52, 16
  %248 = and i32 %247, 16711680
  %249 = and i32 %52, -16777216
  %250 = or i32 %249, %246
  %251 = or i32 %250, %248
  %252 = and i32 %50, 65535
  %253 = and i32 %52, 983040
  %254 = or i32 %253, %252
  %255 = and i32 %52, 8388608
  %256 = icmp eq i32 %255, 0
  br i1 %256, label %260, label %257

; <label>:257                                     ; preds = %cpu_x86_load_seg_cache.exit31.i
  %258 = shl nuw i32 %254, 12
  %259 = or i32 %258, 4095
  br label %260

; <label>:260                                     ; preds = %257, %cpu_x86_load_seg_cache.exit31.i
  %limit.0.i32.i = phi i32 [ %259, %257 ], [ %254, %cpu_x86_load_seg_cache.exit31.i ]
  %261 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 9, i64 1, i32 0
  store i32 %new_cs.0.i, i32* %261, align 4
  %262 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 9, i64 1, i32 1
  store i32 %251, i32* %262, align 4
  %263 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 9, i64 1, i32 2
  store i32 %limit.0.i32.i, i32* %263, align 4
  %264 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 9, i64 1, i32 3
  store i32 %52, i32* %264, align 4
  %265 = lshr i32 %52, 18
  %266 = and i32 %265, 16
  %267 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 7
  %268 = load i32* %267, align 4
  %269 = and i32 %268, -32785
  %270 = or i32 %269, %266
  store i32 %270, i32* %267, align 4
  %271 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 9, i64 2, i32 3
  %272 = load i32* %271, align 4
  %273 = lshr i32 %272, 17
  %274 = and i32 %273, 32
  %275 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 14, i64 0
  %276 = load i32* %275, align 4
  %277 = and i32 %276, 1
  %278 = icmp eq i32 %277, 0
  br i1 %278, label %285, label %279

; <label>:279                                     ; preds = %260
  %280 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 6
  %281 = load i32* %280, align 4
  %282 = and i32 %281, 131072
  %283 = icmp ne i32 %282, 0
  %284 = icmp eq i32 %266, 0
  %or.cond65.i = or i1 %283, %284
  br i1 %or.cond65.i, label %285, label %287

; <label>:285                                     ; preds = %279, %260
  %286 = or i32 %274, 64
  br label %300

; <label>:287                                     ; preds = %279
  %288 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 9, i64 3, i32 1
  %289 = load i32* %288, align 4
  %290 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 9, i64 0, i32 1
  %291 = load i32* %290, align 4
  %292 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 9, i64 2, i32 1
  %293 = load i32* %292, align 4
  %294 = or i32 %291, %289
  %295 = or i32 %294, %293
  %296 = icmp ne i32 %295, 0
  %297 = zext i1 %296 to i32
  %298 = shl nuw nsw i32 %297, 6
  %299 = or i32 %298, %274
  br label %300

; <label>:300                                     ; preds = %287, %285
  %new_hflags.0.i34.i = phi i32 [ %286, %285 ], [ %299, %287 ]
  %301 = and i32 %270, -32865
  %302 = or i32 %new_hflags.0.i34.i, %301
  store i32 %302, i32* %267, align 4
  %303 = load %struct.CPUX86State** @env, align 8
  %304 = getelementptr inbounds %struct.CPUX86State* %303, i64 0, i32 7
  %305 = load i32* %304, align 4
  %306 = and i32 %305, 3
  tail call void @s2e_on_privilege_change(i32 %306, i32 %61) nounwind
  %307 = load i32* %304, align 4
  %308 = and i32 %307, -4
  %309 = or i32 %308, %61
  store i32 %309, i32* %304, align 4
  %310 = lshr i32 %179, 6
  %311 = and i32 %310, 65536
  %312 = xor i32 %311, 65536
  %313 = add i32 %312, -1
  %.pre.i54.i = load %struct.CPUX86State** @env, align 8
  %314 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 9, i64 0, i32 3
  %315 = load i32* %314, align 4
  %316 = lshr i32 %315, 13
  %317 = and i32 %316, 3
  %318 = and i32 %315, 3072
  %319 = icmp ne i32 %318, 3072
  %320 = icmp ult i32 %317, %61
  %or.cond3.i56.i = and i1 %319, %320
  br i1 %or.cond3.i56.i, label %321, label %364

; <label>:321                                     ; preds = %300
  %322 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 9, i64 0, i32 0
  %323 = bitcast i32* %322 to i8*
  br label %324

; <label>:324                                     ; preds = %327, %321
  %325 = phi i64 [ 0, %321 ], [ %329, %327 ]
  %326 = icmp ult i64 %325, 16
  br i1 %326, label %327, label %330

; <label>:327                                     ; preds = %324
  %328 = getelementptr i8* %323, i64 %325
  store i8 0, i8* %328, align 1
  %329 = add i64 %325, 1
  br label %324

; <label>:330                                     ; preds = %324
  %.phi.trans.insert.i.i57.i = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 7
  %.pre.i.i58.i = load i32* %.phi.trans.insert.i.i57.i, align 4
  %331 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 9, i64 2, i32 3
  %332 = load i32* %331, align 4
  %333 = lshr i32 %332, 17
  %334 = and i32 %333, 32
  %335 = and i32 %.pre.i.i58.i, 32768
  %336 = icmp eq i32 %335, 0
  br i1 %336, label %337, label %cpu_x86_load_seg_cache.exit.i60.i

; <label>:337                                     ; preds = %330
  %338 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 14, i64 0
  %339 = load i32* %338, align 4
  %340 = and i32 %339, 1
  %341 = icmp eq i32 %340, 0
  br i1 %341, label %350, label %342

; <label>:342                                     ; preds = %337
  %343 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 6
  %344 = load i32* %343, align 4
  %345 = and i32 %344, 131072
  %346 = icmp eq i32 %345, 0
  br i1 %346, label %347, label %350

; <label>:347                                     ; preds = %342
  %348 = and i32 %.pre.i.i58.i, 16
  %349 = icmp eq i32 %348, 0
  br i1 %349, label %350, label %352

; <label>:350                                     ; preds = %347, %342, %337
  %351 = or i32 %334, 64
  br label %cpu_x86_load_seg_cache.exit.i60.i

; <label>:352                                     ; preds = %347
  %353 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 9, i64 3, i32 1
  %354 = load i32* %353, align 4
  %355 = getelementptr inbounds %struct.CPUX86State* %.pre.i54.i, i64 0, i32 9, i64 2, i32 1
  %356 = load i32* %355, align 4
  %357 = or i32 %356, %354
  %358 = icmp ne i32 %357, 0
  %359 = zext i1 %358 to i32
  %360 = shl nuw nsw i32 %359, 6
  %361 = or i32 %360, %334
  br label %cpu_x86_load_seg_cache.exit.i60.i

cpu_x86_load_seg_cache.exit.i60.i:                ; preds = %352, %350, %330
  %new_hflags.0.i.i59.i = phi i32 [ %334, %330 ], [ %351, %350 ], [ %361, %352 ]
  %362 = and i32 %.pre.i.i58.i, -97
  %363 = or i32 %new_hflags.0.i.i59.i, %362
  store i32 %363, i32* %.phi.trans.insert.i.i57.i, align 4
  %.pre.i46.pre.i = load %struct.CPUX86State** @env, align 8
  br label %364

; <label>:364                                     ; preds = %cpu_x86_load_seg_cache.exit.i60.i, %300
  %.pre.i46.i = phi %struct.CPUX86State* [ %.pre.i46.pre.i, %cpu_x86_load_seg_cache.exit.i60.i ], [ %.pre.i54.i, %300 ]
  %365 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 9, i64 3, i32 3
  %366 = load i32* %365, align 4
  %367 = lshr i32 %366, 13
  %368 = and i32 %367, 3
  %369 = and i32 %366, 3072
  %370 = icmp ne i32 %369, 3072
  %371 = icmp ult i32 %368, %61
  %or.cond3.i48.i = and i1 %370, %371
  br i1 %or.cond3.i48.i, label %372, label %validate_seg.exit53.i

; <label>:372                                     ; preds = %364
  %373 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 9, i64 3, i32 0
  %374 = bitcast i32* %373 to i8*
  br label %375

; <label>:375                                     ; preds = %378, %372
  %376 = phi i64 [ 0, %372 ], [ %380, %378 ]
  %377 = icmp ult i64 %376, 16
  br i1 %377, label %378, label %381

; <label>:378                                     ; preds = %375
  %379 = getelementptr i8* %374, i64 %376
  store i8 0, i8* %379, align 1
  %380 = add i64 %376, 1
  br label %375

; <label>:381                                     ; preds = %375
  %.phi.trans.insert.i.i49.i = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 7
  %.pre.i.i50.i = load i32* %.phi.trans.insert.i.i49.i, align 4
  %382 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 9, i64 2, i32 3
  %383 = load i32* %382, align 4
  %384 = lshr i32 %383, 17
  %385 = and i32 %384, 32
  %386 = and i32 %.pre.i.i50.i, 32768
  %387 = icmp eq i32 %386, 0
  br i1 %387, label %388, label %cpu_x86_load_seg_cache.exit.i52.i

; <label>:388                                     ; preds = %381
  %389 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 14, i64 0
  %390 = load i32* %389, align 4
  %391 = and i32 %390, 1
  %392 = icmp eq i32 %391, 0
  br i1 %392, label %401, label %393

; <label>:393                                     ; preds = %388
  %394 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 6
  %395 = load i32* %394, align 4
  %396 = and i32 %395, 131072
  %397 = icmp eq i32 %396, 0
  br i1 %397, label %398, label %401

; <label>:398                                     ; preds = %393
  %399 = and i32 %.pre.i.i50.i, 16
  %400 = icmp eq i32 %399, 0
  br i1 %400, label %401, label %403

; <label>:401                                     ; preds = %398, %393, %388
  %402 = or i32 %385, 64
  br label %cpu_x86_load_seg_cache.exit.i52.i

; <label>:403                                     ; preds = %398
  %404 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 9, i64 0, i32 1
  %405 = load i32* %404, align 4
  %406 = getelementptr inbounds %struct.CPUX86State* %.pre.i46.i, i64 0, i32 9, i64 2, i32 1
  %407 = load i32* %406, align 4
  %408 = or i32 %407, %405
  %409 = icmp ne i32 %408, 0
  %410 = zext i1 %409 to i32
  %411 = shl nuw nsw i32 %410, 6
  %412 = or i32 %411, %385
  br label %cpu_x86_load_seg_cache.exit.i52.i

cpu_x86_load_seg_cache.exit.i52.i:                ; preds = %403, %401, %381
  %new_hflags.0.i.i51.i = phi i32 [ %385, %381 ], [ %402, %401 ], [ %412, %403 ]
  %413 = and i32 %.pre.i.i50.i, -97
  %414 = or i32 %new_hflags.0.i.i51.i, %413
  store i32 %414, i32* %.phi.trans.insert.i.i49.i, align 4
  %.pre.i = load %struct.CPUX86State** @env, align 8
  br label %validate_seg.exit53.i

validate_seg.exit53.i:                            ; preds = %cpu_x86_load_seg_cache.exit.i52.i, %364
  %415 = phi %struct.CPUX86State* [ %.pre.i46.i, %364 ], [ %.pre.i, %cpu_x86_load_seg_cache.exit.i52.i ]
  %416 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 4, i32 0
  %417 = load i32* %416, align 4
  %418 = and i32 %417, 65532
  %419 = icmp eq i32 %418, 0
  br i1 %419, label %validate_seg.exit45.i, label %420

; <label>:420                                     ; preds = %validate_seg.exit53.i
  %421 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 4, i32 3
  %422 = load i32* %421, align 4
  %423 = lshr i32 %422, 13
  %424 = and i32 %423, 3
  %425 = and i32 %422, 3072
  %426 = icmp ne i32 %425, 3072
  %427 = icmp ult i32 %424, %61
  %or.cond3.i40.i = and i1 %426, %427
  br i1 %or.cond3.i40.i, label %428, label %validate_seg.exit45.i

; <label>:428                                     ; preds = %420
  %429 = bitcast i32* %416 to i8*
  br label %430

; <label>:430                                     ; preds = %433, %428
  %431 = phi i64 [ 0, %428 ], [ %435, %433 ]
  %432 = icmp ult i64 %431, 16
  br i1 %432, label %433, label %436

; <label>:433                                     ; preds = %430
  %434 = getelementptr i8* %429, i64 %431
  store i8 0, i8* %434, align 1
  %435 = add i64 %431, 1
  br label %430

; <label>:436                                     ; preds = %430
  %.phi.trans.insert.i.i41.i = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 7
  %.pre.i.i42.i = load i32* %.phi.trans.insert.i.i41.i, align 4
  %437 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 2, i32 3
  %438 = load i32* %437, align 4
  %439 = lshr i32 %438, 17
  %440 = and i32 %439, 32
  %441 = and i32 %.pre.i.i42.i, 32768
  %442 = icmp eq i32 %441, 0
  br i1 %442, label %443, label %cpu_x86_load_seg_cache.exit.i44.i

; <label>:443                                     ; preds = %436
  %444 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 14, i64 0
  %445 = load i32* %444, align 4
  %446 = and i32 %445, 1
  %447 = icmp eq i32 %446, 0
  br i1 %447, label %456, label %448

; <label>:448                                     ; preds = %443
  %449 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 6
  %450 = load i32* %449, align 4
  %451 = and i32 %450, 131072
  %452 = icmp eq i32 %451, 0
  br i1 %452, label %453, label %456

; <label>:453                                     ; preds = %448
  %454 = and i32 %.pre.i.i42.i, 16
  %455 = icmp eq i32 %454, 0
  br i1 %455, label %456, label %458

; <label>:456                                     ; preds = %453, %448, %443
  %457 = or i32 %440, 64
  br label %cpu_x86_load_seg_cache.exit.i44.i

; <label>:458                                     ; preds = %453
  %459 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 3, i32 1
  %460 = load i32* %459, align 4
  %461 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 0, i32 1
  %462 = load i32* %461, align 4
  %463 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 2, i32 1
  %464 = load i32* %463, align 4
  %465 = or i32 %462, %460
  %466 = or i32 %465, %464
  %467 = icmp ne i32 %466, 0
  %468 = zext i1 %467 to i32
  %469 = shl nuw nsw i32 %468, 6
  %470 = or i32 %469, %440
  br label %cpu_x86_load_seg_cache.exit.i44.i

cpu_x86_load_seg_cache.exit.i44.i:                ; preds = %458, %456, %436
  %new_hflags.0.i.i43.i = phi i32 [ %440, %436 ], [ %457, %456 ], [ %470, %458 ]
  %471 = and i32 %.pre.i.i42.i, -97
  %472 = or i32 %new_hflags.0.i.i43.i, %471
  store i32 %472, i32* %.phi.trans.insert.i.i41.i, align 4
  %.pre67.i = load %struct.CPUX86State** @env, align 8
  br label %validate_seg.exit45.i

validate_seg.exit45.i:                            ; preds = %cpu_x86_load_seg_cache.exit.i44.i, %420, %validate_seg.exit53.i
  %473 = phi %struct.CPUX86State* [ %415, %validate_seg.exit53.i ], [ %415, %420 ], [ %.pre67.i, %cpu_x86_load_seg_cache.exit.i44.i ]
  %474 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 9, i64 5, i32 0
  %475 = load i32* %474, align 4
  %476 = and i32 %475, 65532
  %477 = icmp eq i32 %476, 0
  br i1 %477, label %validate_seg.exit.i, label %478

; <label>:478                                     ; preds = %validate_seg.exit45.i
  %479 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 9, i64 5, i32 3
  %480 = load i32* %479, align 4
  %481 = lshr i32 %480, 13
  %482 = and i32 %481, 3
  %483 = and i32 %480, 3072
  %484 = icmp ne i32 %483, 3072
  %485 = icmp ult i32 %482, %61
  %or.cond3.i.i = and i1 %484, %485
  br i1 %or.cond3.i.i, label %486, label %validate_seg.exit.i

; <label>:486                                     ; preds = %478
  %487 = bitcast i32* %474 to i8*
  br label %488

; <label>:488                                     ; preds = %491, %486
  %489 = phi i64 [ 0, %486 ], [ %493, %491 ]
  %490 = icmp ult i64 %489, 16
  br i1 %490, label %491, label %494

; <label>:491                                     ; preds = %488
  %492 = getelementptr i8* %487, i64 %489
  store i8 0, i8* %492, align 1
  %493 = add i64 %489, 1
  br label %488

; <label>:494                                     ; preds = %488
  %.phi.trans.insert.i.i36.i = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 7
  %.pre.i.i37.i = load i32* %.phi.trans.insert.i.i36.i, align 4
  %495 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 9, i64 2, i32 3
  %496 = load i32* %495, align 4
  %497 = lshr i32 %496, 17
  %498 = and i32 %497, 32
  %499 = and i32 %.pre.i.i37.i, 32768
  %500 = icmp eq i32 %499, 0
  br i1 %500, label %501, label %cpu_x86_load_seg_cache.exit.i.i

; <label>:501                                     ; preds = %494
  %502 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 14, i64 0
  %503 = load i32* %502, align 4
  %504 = and i32 %503, 1
  %505 = icmp eq i32 %504, 0
  br i1 %505, label %514, label %506

; <label>:506                                     ; preds = %501
  %507 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 6
  %508 = load i32* %507, align 4
  %509 = and i32 %508, 131072
  %510 = icmp eq i32 %509, 0
  br i1 %510, label %511, label %514

; <label>:511                                     ; preds = %506
  %512 = and i32 %.pre.i.i37.i, 16
  %513 = icmp eq i32 %512, 0
  br i1 %513, label %514, label %516

; <label>:514                                     ; preds = %511, %506, %501
  %515 = or i32 %498, 64
  br label %cpu_x86_load_seg_cache.exit.i.i

; <label>:516                                     ; preds = %511
  %517 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 9, i64 3, i32 1
  %518 = load i32* %517, align 4
  %519 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 9, i64 0, i32 1
  %520 = load i32* %519, align 4
  %521 = getelementptr inbounds %struct.CPUX86State* %473, i64 0, i32 9, i64 2, i32 1
  %522 = load i32* %521, align 4
  %523 = or i32 %520, %518
  %524 = or i32 %523, %522
  %525 = icmp ne i32 %524, 0
  %526 = zext i1 %525 to i32
  %527 = shl nuw nsw i32 %526, 6
  %528 = or i32 %527, %498
  br label %cpu_x86_load_seg_cache.exit.i.i

cpu_x86_load_seg_cache.exit.i.i:                  ; preds = %516, %514, %494
  %new_hflags.0.i.i38.i = phi i32 [ %498, %494 ], [ %515, %514 ], [ %528, %516 ]
  %529 = and i32 %.pre.i.i37.i, -97
  %530 = or i32 %new_hflags.0.i.i38.i, %529
  store i32 %530, i32* %.phi.trans.insert.i.i36.i, align 4
  br label %validate_seg.exit.i

validate_seg.exit.i:                              ; preds = %cpu_x86_load_seg_cache.exit.i.i, %478, %validate_seg.exit45.i
  %531 = add i32 %new_esp.0.i, %addend
  br label %helper_ret_protected.exit

helper_ret_protected.exit:                        ; preds = %validate_seg.exit.i, %cpu_x86_load_seg_cache.exit.i
  %sp.1.i = phi i32 [ %531, %validate_seg.exit.i ], [ %80, %cpu_x86_load_seg_cache.exit.i ]
  %sp_mask.0.i = phi i32 [ %313, %validate_seg.exit.i ], [ %7, %cpu_x86_load_seg_cache.exit.i ]
  %532 = load %struct.CPUX86State** @env, align 8
  %533 = getelementptr inbounds %struct.CPUX86State* %532, i64 0, i32 0, i64 4
  %534 = load i32* %533, align 4
  %535 = xor i32 %sp_mask.0.i, -1
  %536 = and i32 %534, %535
  %537 = and i32 %sp_mask.0.i, %sp.1.i
  %538 = or i32 %536, %537
  store i32 %538, i32* %533, align 4
  %539 = load %struct.CPUX86State** @env, align 8
  %540 = getelementptr inbounds %struct.CPUX86State* %539, i64 0, i32 4
  store i32 %new_eip.0.i, i32* %540, align 4
  ret void
}

define void @helper_sysenter() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 34
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn
  unreachable

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 6
  %8 = load i32* %7, align 4
  %9 = and i32 %8, -197121
  store i32 %9, i32* %7, align 4
  %10 = load %struct.CPUX86State** @env, align 8
  %11 = getelementptr inbounds %struct.CPUX86State* %10, i64 0, i32 7
  %12 = load i32* %11, align 4
  %13 = and i32 %12, 3
  tail call void @s2e_on_privilege_change(i32 %13, i32 0) nounwind
  %14 = load i32* %11, align 4
  %15 = and i32 %14, -4
  store i32 %15, i32* %11, align 4
  %16 = load %struct.CPUX86State** @env, align 8
  %17 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 34
  %18 = load i32* %17, align 4
  %19 = and i32 %18, 65532
  %20 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 9, i64 1, i32 0
  store i32 %19, i32* %20, align 4
  %21 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 9, i64 1, i32 1
  store i32 0, i32* %21, align 4
  %22 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 9, i64 1, i32 2
  store i32 -1, i32* %22, align 4
  %23 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 9, i64 1, i32 3
  store i32 12622592, i32* %23, align 4
  %24 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 7
  %25 = load i32* %24, align 4
  %26 = and i32 %25, -32785
  %27 = or i32 %26, 16
  store i32 %27, i32* %24, align 4
  %28 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 9, i64 2, i32 3
  %29 = load i32* %28, align 4
  %30 = lshr i32 %29, 17
  %31 = and i32 %30, 32
  %32 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 14, i64 0
  %33 = load i32* %32, align 4
  %34 = and i32 %33, 1
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %41, label %36

; <label>:36                                      ; preds = %6
  %37 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 6
  %38 = load i32* %37, align 4
  %39 = and i32 %38, 131072
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %43, label %41

; <label>:41                                      ; preds = %36, %6
  %42 = or i32 %31, 64
  br label %56

; <label>:43                                      ; preds = %36
  %44 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 9, i64 3, i32 1
  %45 = load i32* %44, align 4
  %46 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 9, i64 0, i32 1
  %47 = load i32* %46, align 4
  %48 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 9, i64 2, i32 1
  %49 = load i32* %48, align 4
  %50 = or i32 %47, %45
  %51 = or i32 %50, %49
  %52 = icmp ne i32 %51, 0
  %53 = zext i1 %52 to i32
  %54 = shl nuw nsw i32 %53, 6
  %55 = or i32 %54, %31
  br label %56

; <label>:56                                      ; preds = %43, %41
  %new_hflags.0.i = phi i32 [ %42, %41 ], [ %55, %43 ]
  %57 = and i32 %27, -32865
  %58 = or i32 %new_hflags.0.i, %57
  store i32 %58, i32* %24, align 4
  %59 = load %struct.CPUX86State** @env, align 8
  %60 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 34
  %61 = load i32* %60, align 4
  %62 = add i32 %61, 8
  %63 = and i32 %62, 65532
  %64 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 2, i32 0
  store i32 %63, i32* %64, align 4
  %65 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 2, i32 1
  store i32 0, i32* %65, align 4
  %66 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 2, i32 2
  store i32 -1, i32* %66, align 4
  %67 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 2, i32 3
  store i32 12620544, i32* %67, align 4
  %.phi.trans.insert.i = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 7
  %.pre.i = load i32* %.phi.trans.insert.i, align 4
  %68 = and i32 %.pre.i, 32768
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %cpu_x86_load_seg_cache.exit2

; <label>:70                                      ; preds = %56
  %71 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 14, i64 0
  %72 = load i32* %71, align 4
  %73 = and i32 %72, 1
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %cpu_x86_load_seg_cache.exit2, label %75

; <label>:75                                      ; preds = %70
  %76 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 6
  %77 = load i32* %76, align 4
  %78 = and i32 %77, 131072
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %cpu_x86_load_seg_cache.exit2

; <label>:80                                      ; preds = %75
  %81 = and i32 %.pre.i, 16
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %cpu_x86_load_seg_cache.exit2, label %83

; <label>:83                                      ; preds = %80
  %84 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 3, i32 1
  %85 = load i32* %84, align 4
  %86 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 0, i32 1
  %87 = load i32* %86, align 4
  %88 = or i32 %87, %85
  %89 = icmp ne i32 %88, 0
  %90 = zext i1 %89 to i32
  %91 = shl nuw nsw i32 %90, 6
  %92 = or i32 %91, 32
  br label %cpu_x86_load_seg_cache.exit2

cpu_x86_load_seg_cache.exit2:                     ; preds = %83, %80, %75, %70, %56
  %new_hflags.0.i1 = phi i32 [ 32, %56 ], [ %92, %83 ], [ 96, %80 ], [ 96, %75 ], [ 96, %70 ]
  %93 = and i32 %.pre.i, -97
  %94 = or i32 %new_hflags.0.i1, %93
  store i32 %94, i32* %.phi.trans.insert.i, align 4
  %95 = load %struct.CPUX86State** @env, align 8
  %96 = getelementptr inbounds %struct.CPUX86State* %95, i64 0, i32 35
  %97 = load i32* %96, align 4
  %98 = getelementptr inbounds %struct.CPUX86State* %95, i64 0, i32 0, i64 4
  store i32 %97, i32* %98, align 4
  %99 = load %struct.CPUX86State** @env, align 8
  %100 = getelementptr inbounds %struct.CPUX86State* %99, i64 0, i32 36
  %101 = load i32* %100, align 4
  %102 = getelementptr inbounds %struct.CPUX86State* %99, i64 0, i32 4
  store i32 %101, i32* %102, align 4
  ret void
}

define void @helper_sysexit(i32 %dflag) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 34
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %10, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %7 = load i32* %6, align 4
  %8 = and i32 %7, 3
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %5, %0
  tail call fastcc void @raise_exception_err(i32 13, i32 0) noreturn
  unreachable

; <label>:11                                      ; preds = %5
  tail call void @s2e_on_privilege_change(i32 0, i32 3) nounwind
  %12 = load i32* %6, align 4
  %13 = or i32 %12, 3
  store i32 %13, i32* %6, align 4
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 34
  %16 = load i32* %15, align 4
  %17 = add i32 %16, 16
  %18 = and i32 %17, 65532
  %19 = or i32 %18, 3
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 9, i64 1, i32 0
  store i32 %19, i32* %20, align 4
  %21 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 9, i64 1, i32 1
  store i32 0, i32* %21, align 4
  %22 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 9, i64 1, i32 2
  store i32 -1, i32* %22, align 4
  %23 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 9, i64 1, i32 3
  store i32 12647168, i32* %23, align 4
  %24 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 7
  %25 = load i32* %24, align 4
  %26 = and i32 %25, -32785
  %27 = or i32 %26, 16
  store i32 %27, i32* %24, align 4
  %28 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 9, i64 2, i32 3
  %29 = load i32* %28, align 4
  %30 = lshr i32 %29, 17
  %31 = and i32 %30, 32
  %32 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 14, i64 0
  %33 = load i32* %32, align 4
  %34 = and i32 %33, 1
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %41, label %36

; <label>:36                                      ; preds = %11
  %37 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 6
  %38 = load i32* %37, align 4
  %39 = and i32 %38, 131072
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %43, label %41

; <label>:41                                      ; preds = %36, %11
  %42 = or i32 %31, 64
  br label %56

; <label>:43                                      ; preds = %36
  %44 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 9, i64 3, i32 1
  %45 = load i32* %44, align 4
  %46 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 9, i64 0, i32 1
  %47 = load i32* %46, align 4
  %48 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 9, i64 2, i32 1
  %49 = load i32* %48, align 4
  %50 = or i32 %47, %45
  %51 = or i32 %50, %49
  %52 = icmp ne i32 %51, 0
  %53 = zext i1 %52 to i32
  %54 = shl nuw nsw i32 %53, 6
  %55 = or i32 %54, %31
  br label %56

; <label>:56                                      ; preds = %43, %41
  %new_hflags.0.i = phi i32 [ %42, %41 ], [ %55, %43 ]
  %57 = and i32 %27, -32865
  %58 = or i32 %new_hflags.0.i, %57
  store i32 %58, i32* %24, align 4
  %59 = load %struct.CPUX86State** @env, align 8
  %60 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 34
  %61 = load i32* %60, align 4
  %62 = add i32 %61, 24
  %63 = and i32 %62, 65532
  %64 = or i32 %63, 3
  %65 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 2, i32 0
  store i32 %64, i32* %65, align 4
  %66 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 2, i32 1
  store i32 0, i32* %66, align 4
  %67 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 2, i32 2
  store i32 -1, i32* %67, align 4
  %68 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 2, i32 3
  store i32 12645120, i32* %68, align 4
  %.phi.trans.insert.i = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 7
  %.pre.i = load i32* %.phi.trans.insert.i, align 4
  %69 = and i32 %.pre.i, 32768
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %cpu_x86_load_seg_cache.exit2

; <label>:71                                      ; preds = %56
  %72 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 14, i64 0
  %73 = load i32* %72, align 4
  %74 = and i32 %73, 1
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %cpu_x86_load_seg_cache.exit2, label %76

; <label>:76                                      ; preds = %71
  %77 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 6
  %78 = load i32* %77, align 4
  %79 = and i32 %78, 131072
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %81, label %cpu_x86_load_seg_cache.exit2

; <label>:81                                      ; preds = %76
  %82 = and i32 %.pre.i, 16
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %cpu_x86_load_seg_cache.exit2, label %84

; <label>:84                                      ; preds = %81
  %85 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 3, i32 1
  %86 = load i32* %85, align 4
  %87 = getelementptr inbounds %struct.CPUX86State* %59, i64 0, i32 9, i64 0, i32 1
  %88 = load i32* %87, align 4
  %89 = or i32 %88, %86
  %90 = icmp ne i32 %89, 0
  %91 = zext i1 %90 to i32
  %92 = shl nuw nsw i32 %91, 6
  %93 = or i32 %92, 32
  br label %cpu_x86_load_seg_cache.exit2

cpu_x86_load_seg_cache.exit2:                     ; preds = %84, %81, %76, %71, %56
  %new_hflags.0.i1 = phi i32 [ 32, %56 ], [ %93, %84 ], [ 96, %81 ], [ 96, %76 ], [ 96, %71 ]
  %94 = and i32 %.pre.i, -97
  %95 = or i32 %new_hflags.0.i1, %94
  store i32 %95, i32* %.phi.trans.insert.i, align 4
  %96 = load %struct.CPUX86State** @env, align 8
  %97 = getelementptr inbounds %struct.CPUX86State* %96, i64 0, i32 0, i64 1
  %98 = load i32* %97, align 4
  %99 = getelementptr inbounds %struct.CPUX86State* %96, i64 0, i32 0, i64 4
  store i32 %98, i32* %99, align 4
  %100 = load %struct.CPUX86State** @env, align 8
  %101 = getelementptr inbounds %struct.CPUX86State* %100, i64 0, i32 0, i64 2
  %102 = load i32* %101, align 4
  %103 = getelementptr inbounds %struct.CPUX86State* %100, i64 0, i32 4
  store i32 %102, i32* %103, align 4
  ret void
}

define i32 @helper_read_crN(i32 %reg) nounwind uwtable sspreq {
  tail call void @helper_svm_check_intercept_param(i32 %reg, i64 0)
  %cond = icmp eq i32 %reg, 8
  br i1 %cond, label %6, label %1

; <label>:1                                       ; preds = %0
  %2 = sext i32 %reg to i64
  %3 = load %struct.CPUX86State** @env, align 8
  %4 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 14, i64 %2
  %5 = load i32* %4, align 4
  br label %21

; <label>:6                                       ; preds = %0
  %7 = load %struct.CPUX86State** @env, align 8
  %8 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 8
  %9 = load i32* %8, align 4
  %10 = and i32 %9, 8
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %17

; <label>:12                                      ; preds = %6
  %13 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 146
  %14 = load %struct.DeviceState** %13, align 8
  %15 = tail call zeroext i8 @cpu_get_apic_tpr(%struct.DeviceState* %14) nounwind
  %16 = zext i8 %15 to i32
  br label %21

; <label>:17                                      ; preds = %6
  %18 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 48
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  br label %21

; <label>:21                                      ; preds = %17, %12, %1
  %val.0 = phi i32 [ %20, %17 ], [ %16, %12 ], [ %5, %1 ]
  ret i32 %val.0
}

declare zeroext i8 @cpu_get_apic_tpr(%struct.DeviceState*)

define void @helper_write_crN(i32 %reg, i32 %t0) nounwind uwtable sspreq {
  %1 = add nsw i32 %reg, 16
  tail call void @helper_svm_check_intercept_param(i32 %1, i64 0)
  switch i32 %reg, label %22 [
    i32 0, label %2
    i32 3, label %4
    i32 4, label %6
    i32 8, label %8
  ]

; <label>:2                                       ; preds = %0
  %3 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_x86_update_cr0(%struct.CPUX86State* %3, i32 %t0) nounwind
  br label %26

; <label>:4                                       ; preds = %0
  %5 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_x86_update_cr3(%struct.CPUX86State* %5, i32 %t0) nounwind
  br label %26

; <label>:6                                       ; preds = %0
  %7 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_x86_update_cr4(%struct.CPUX86State* %7, i32 %t0) nounwind
  br label %26

; <label>:8                                       ; preds = %0
  %9 = load %struct.CPUX86State** @env, align 8
  %10 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 8
  %11 = load i32* %10, align 4
  %12 = and i32 %11, 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %8
  %t0.tr.pre = trunc i32 %t0 to i8
  br label %18

; <label>:14                                      ; preds = %8
  %15 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 146
  %16 = load %struct.DeviceState** %15, align 8
  %17 = trunc i32 %t0 to i8
  tail call void @cpu_set_apic_tpr(%struct.DeviceState* %16, i8 zeroext %17) nounwind
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %18

; <label>:18                                      ; preds = %14, %._crit_edge
  %t0.tr.pre-phi = phi i8 [ %t0.tr.pre, %._crit_edge ], [ %17, %14 ]
  %19 = phi %struct.CPUX86State* [ %9, %._crit_edge ], [ %.pre, %14 ]
  %20 = and i8 %t0.tr.pre-phi, 15
  %21 = getelementptr inbounds %struct.CPUX86State* %19, i64 0, i32 48
  store i8 %20, i8* %21, align 1
  br label %26

; <label>:22                                      ; preds = %0
  %23 = sext i32 %reg to i64
  %24 = load %struct.CPUX86State** @env, align 8
  %25 = getelementptr inbounds %struct.CPUX86State* %24, i64 0, i32 14, i64 %23
  store i32 %t0, i32* %25, align 4
  br label %26

; <label>:26                                      ; preds = %22, %18, %6, %4, %2
  ret void
}

declare void @cpu_set_apic_tpr(%struct.DeviceState*, i8 zeroext)

define void @helper_movl_drN_T0(i32 %reg, i32 %t0) nounwind uwtable sspreq {
  %1 = icmp slt i32 %reg, 4
  br i1 %1, label %2, label %8

; <label>:2                                       ; preds = %0
  %3 = load %struct.CPUX86State** @env, align 8
  tail call void @hw_breakpoint_remove(%struct.CPUX86State* %3, i32 %reg) nounwind
  %4 = sext i32 %reg to i64
  %5 = load %struct.CPUX86State** @env, align 8
  %6 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 59, i64 %4
  store i32 %t0, i32* %6, align 4
  %7 = load %struct.CPUX86State** @env, align 8
  tail call void @hw_breakpoint_insert(%struct.CPUX86State* %7, i32 %reg) nounwind
  br label %24

; <label>:8                                       ; preds = %0
  %9 = icmp eq i32 %reg, 7
  br i1 %9, label %.preheader, label %20

.preheader:                                       ; preds = %8
  %10 = load %struct.CPUX86State** @env, align 8
  tail call void @hw_breakpoint_remove(%struct.CPUX86State* %10, i32 0) nounwind
  %11 = load %struct.CPUX86State** @env, align 8
  tail call void @hw_breakpoint_remove(%struct.CPUX86State* %11, i32 1) nounwind
  %12 = load %struct.CPUX86State** @env, align 8
  tail call void @hw_breakpoint_remove(%struct.CPUX86State* %12, i32 2) nounwind
  %13 = load %struct.CPUX86State** @env, align 8
  tail call void @hw_breakpoint_remove(%struct.CPUX86State* %13, i32 3) nounwind
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 59, i64 7
  store i32 %t0, i32* %15, align 4
  %16 = load %struct.CPUX86State** @env, align 8
  tail call void @hw_breakpoint_insert(%struct.CPUX86State* %16, i32 0) nounwind
  %17 = load %struct.CPUX86State** @env, align 8
  tail call void @hw_breakpoint_insert(%struct.CPUX86State* %17, i32 1) nounwind
  %18 = load %struct.CPUX86State** @env, align 8
  tail call void @hw_breakpoint_insert(%struct.CPUX86State* %18, i32 2) nounwind
  %19 = load %struct.CPUX86State** @env, align 8
  tail call void @hw_breakpoint_insert(%struct.CPUX86State* %19, i32 3) nounwind
  br label %24

; <label>:20                                      ; preds = %8
  %21 = sext i32 %reg to i64
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 59, i64 %21
  store i32 %t0, i32* %23, align 4
  br label %24

; <label>:24                                      ; preds = %20, %.preheader, %2
  ret void
}

declare void @hw_breakpoint_remove(%struct.CPUX86State*, i32)

declare void @hw_breakpoint_insert(%struct.CPUX86State*, i32)

define void @helper_lmsw(i32 %t0) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 14, i64 0
  %3 = load i32* %2, align 4
  %4 = and i32 %3, -15
  %5 = and i32 %t0, 15
  %6 = or i32 %4, %5
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %8 = load i32* %7, align 4
  %.lobit.i = and i32 %8, 2097152
  %9 = icmp eq i32 %.lobit.i, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10, !prof !0

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 44
  %12 = load i16* %11, align 2
  %13 = and i16 %12, 1
  %14 = icmp eq i16 %13, 0
  br i1 %14, label %helper_svm_check_intercept_param.exit, label %15

; <label>:15                                      ; preds = %10
  tail call void @helper_vmexit(i32 16, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %10, %0
  tail call void @cpu_x86_update_cr0(%struct.CPUX86State* %1, i32 %6) nounwind
  ret void
}

define void @helper_clts() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 14, i64 0
  %3 = load i32* %2, align 4
  %4 = and i32 %3, -9
  store i32 %4, i32* %2, align 4
  %5 = load %struct.CPUX86State** @env, align 8
  %6 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 7
  %7 = load i32* %6, align 4
  %8 = and i32 %7, -2049
  store i32 %8, i32* %6, align 4
  ret void
}

define void @helper_invlpg(i32 %addr) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 33554432
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  tail call void @helper_vmexit(i32 121, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  tail call void @tlb_flush_page(%struct.CPUX86State* %1, i32 %addr) nounwind
  ret void
}

declare void @tlb_flush_page(%struct.CPUX86State*, i32)

define void @helper_rdtsc() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 14, i64 4
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 4
  %5 = icmp eq i32 %4, 0
  %.phi.trans.insert = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %.pre = load i32* %.phi.trans.insert, align 4
  br i1 %5, label %._crit_edge, label %6

; <label>:6                                       ; preds = %0
  %7 = and i32 %.pre, 3
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %._crit_edge, label %9

; <label>:9                                       ; preds = %6
  tail call fastcc void @raise_exception(i32 13) noreturn
  unreachable

._crit_edge:                                      ; preds = %6, %0
  %.lobit.i = and i32 %.pre, 2097152
  %10 = icmp eq i32 %.lobit.i, 0
  br i1 %10, label %helper_svm_check_intercept_param.exit, label %11, !prof !0

; <label>:11                                      ; preds = %._crit_edge
  %12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %13 = load i64* %12, align 8
  %14 = and i64 %13, 16384
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %helper_svm_check_intercept_param.exit, label %16

; <label>:16                                      ; preds = %11
  tail call void @helper_vmexit(i32 110, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %11, %._crit_edge
  %17 = tail call i64 @cpu_get_tsc(%struct.CPUX86State* %1) nounwind
  %18 = load %struct.CPUX86State** @env, align 8
  %19 = getelementptr inbounds %struct.CPUX86State* %18, i64 0, i32 41
  %20 = load i64* %19, align 8
  %21 = add i64 %20, %17
  %22 = trunc i64 %21 to i32
  %23 = getelementptr inbounds %struct.CPUX86State* %18, i64 0, i32 0, i64 0
  store i32 %22, i32* %23, align 4
  %24 = lshr i64 %21, 32
  %25 = trunc i64 %24 to i32
  %26 = load %struct.CPUX86State** @env, align 8
  %27 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 0, i64 2
  store i32 %25, i32* %27, align 4
  ret void
}

declare i64 @cpu_get_tsc(%struct.CPUX86State*)

define void @helper_rdtscp() nounwind uwtable sspreq {
  tail call void @helper_rdtsc()
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 150
  %3 = load i64* %2, align 8
  %4 = trunc i64 %3 to i32
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 1
  store i32 %4, i32* %5, align 4
  ret void
}

define void @helper_rdpmc() noreturn nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 14, i64 4
  %3 = load i32* %2, align 4
  %4 = and i32 %3, 256
  %5 = icmp eq i32 %4, 0
  %.phi.trans.insert = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %.pre = load i32* %.phi.trans.insert, align 4
  br i1 %5, label %._crit_edge, label %6

; <label>:6                                       ; preds = %0
  %7 = and i32 %.pre, 3
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %._crit_edge, label %9

; <label>:9                                       ; preds = %6
  tail call fastcc void @raise_exception(i32 13) noreturn
  unreachable

._crit_edge:                                      ; preds = %6, %0
  %.lobit.i = and i32 %.pre, 2097152
  %10 = icmp eq i32 %.lobit.i, 0
  br i1 %10, label %helper_svm_check_intercept_param.exit, label %11, !prof !0

; <label>:11                                      ; preds = %._crit_edge
  %12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %13 = load i64* %12, align 8
  %14 = and i64 %13, 32768
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %helper_svm_check_intercept_param.exit, label %16

; <label>:16                                      ; preds = %11
  tail call void @helper_vmexit(i32 111, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %11, %._crit_edge
  tail call fastcc void @raise_exception_err(i32 6, i32 0) noreturn
  unreachable
}

define void @helper_wrmsr() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 268435456
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 40
  %12 = load i64* %11, align 8
  %13 = add i64 %12, 72
  %14 = tail call i64 @ldq_phys(i64 %13) nounwind
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 0, i64 1
  %17 = load i32* %16, align 4
  %18 = add i32 %17, 1073676288
  %19 = icmp ult i32 %18, 8192
  br i1 %19, label %33, label %30

; <label>:20                                      ; preds = %24
  %21 = shl i32 %17, 1
  %22 = lshr i32 %17, 2
  %23 = and i32 %22, 536870911
  br label %38

; <label>:24                                      ; preds = %30
  %25 = icmp ult i32 %17, 8192
  br i1 %25, label %20, label %37

; <label>:26                                      ; preds = %30
  %27 = shl i32 %17, 1
  %28 = add i32 %27, -2147467264
  %29 = lshr i32 %28, 3
  br label %38

; <label>:30                                      ; preds = %10
  %31 = add i32 %17, 1073741824
  %32 = icmp ult i32 %31, 8192
  br i1 %32, label %26, label %24

; <label>:33                                      ; preds = %10
  %34 = shl i32 %17, 1
  %35 = add i32 %34, 2147385344
  %36 = lshr i32 %35, 3
  br label %38

; <label>:37                                      ; preds = %24
  tail call void @helper_vmexit(i32 124, i64 1) nounwind
  unreachable

; <label>:38                                      ; preds = %33, %26, %20
  %t0.0.in.i = phi i32 [ %35, %33 ], [ %28, %26 ], [ %21, %20 ]
  %t1.0.i = phi i32 [ %36, %33 ], [ %29, %26 ], [ %23, %20 ]
  %t0.0.i = and i32 %t0.0.in.i, 6
  %39 = zext i32 %t1.0.i to i64
  %40 = add i64 %39, %14
  %41 = tail call i32 @ldub_phys(i64 %40) nounwind
  %42 = shl i32 2, %t0.0.i
  %43 = and i32 %41, %42
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %.helper_svm_check_intercept_param.exit_crit_edge, label %45

.helper_svm_check_intercept_param.exit_crit_edge: ; preds = %38
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %helper_svm_check_intercept_param.exit

; <label>:45                                      ; preds = %38
  tail call void @helper_vmexit(i32 124, i64 1) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %.helper_svm_check_intercept_param.exit_crit_edge, %5, %0
  %46 = phi %struct.CPUX86State* [ %.pre, %.helper_svm_check_intercept_param.exit_crit_edge ], [ %1, %0 ], [ %1, %5 ]
  %47 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 0, i64 0
  %48 = load i32* %47, align 4
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 0, i64 2
  %51 = load i32* %50, align 4
  %52 = zext i32 %51 to i64
  %53 = shl nuw i64 %52, 32
  %54 = or i64 %53, %49
  %55 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 0, i64 1
  %56 = load i32* %55, align 4
  switch i32 %56, label %143 [
    i32 372, label %57
    i32 373, label %60
    i32 374, label %62
    i32 27, label %64
    i32 -1073741696, label %67
    i32 -1073741695, label %101
    i32 631, label %103
    i32 -1073676009, label %105
    i32 512, label %107
    i32 514, label %107
    i32 516, label %107
    i32 518, label %107
    i32 520, label %107
    i32 522, label %107
    i32 524, label %107
    i32 526, label %107
    i32 513, label %112
    i32 515, label %112
    i32 517, label %112
    i32 519, label %112
    i32 521, label %112
    i32 523, label %112
    i32 525, label %112
    i32 527, label %112
    i32 592, label %117
    i32 600, label %119
    i32 601, label %119
    i32 616, label %123
    i32 617, label %123
    i32 618, label %123
    i32 619, label %123
    i32 620, label %123
    i32 621, label %123
    i32 622, label %123
    i32 623, label %123
    i32 767, label %127
    i32 378, label %129
    i32 379, label %131
    i32 -1073741565, label %139
    i32 416, label %141
  ]

; <label>:57                                      ; preds = %helper_svm_check_intercept_param.exit
  %58 = and i32 %48, 65535
  %59 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 34
  store i32 %58, i32* %59, align 4
  br label %161

; <label>:60                                      ; preds = %helper_svm_check_intercept_param.exit
  %61 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 35
  store i32 %48, i32* %61, align 4
  br label %161

; <label>:62                                      ; preds = %helper_svm_check_intercept_param.exit
  %63 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 36
  store i32 %48, i32* %63, align 4
  br label %161

; <label>:64                                      ; preds = %helper_svm_check_intercept_param.exit
  %65 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 146
  %66 = load %struct.DeviceState** %65, align 8
  tail call void @cpu_set_apic_base(%struct.DeviceState* %66, i64 %54) nounwind
  br label %161

; <label>:67                                      ; preds = %helper_svm_check_intercept_param.exit
  %68 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 126
  %69 = load i32* %68, align 4
  %70 = lshr i32 %69, 11
  %.lobit = and i32 %70, 1
  %update_mask.0 = zext i32 %.lobit to i64
  %71 = and i32 %69, 536870912
  %72 = or i64 %update_mask.0, 256
  %73 = icmp eq i32 %71, 0
  %update_mask.0. = select i1 %73, i64 %update_mask.0, i64 %72
  %74 = and i32 %69, 33554432
  %75 = icmp eq i32 %74, 0
  %76 = or i64 %update_mask.0., 16384
  %update_mask.2 = select i1 %75, i64 %update_mask.0., i64 %76
  %77 = and i32 %69, 1048576
  %78 = or i64 %update_mask.2, 2048
  %79 = icmp eq i32 %77, 0
  %update_mask.2. = select i1 %79, i64 %update_mask.2, i64 %78
  %80 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 127
  %81 = load i32* %80, align 4
  %82 = and i32 %81, 4
  %83 = icmp eq i32 %82, 0
  %84 = or i64 %update_mask.2., 4096
  %update_mask.4 = select i1 %83, i64 %update_mask.2., i64 %84
  %85 = or i64 %update_mask.4, 16384
  %update_mask.4. = select i1 %75, i64 %update_mask.4, i64 %85
  %86 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 37
  %87 = load i64* %86, align 8
  %88 = xor i64 %update_mask.4., -1
  %89 = and i64 %87, %88
  %90 = and i64 %update_mask.4., %54
  %91 = or i64 %89, %90
  store i64 %91, i64* %86, align 8
  %92 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 7
  %93 = load i32* %92, align 4
  %94 = and i32 %93, -1064961
  %95 = and i64 %91, 1024
  %96 = icmp eq i64 %95, 0
  %97 = or i32 %94, 16384
  %storemerge.i = select i1 %96, i32 %94, i32 %97
  %98 = and i64 %91, 4096
  %99 = or i32 %storemerge.i, 1048576
  %100 = icmp eq i64 %98, 0
  %storemerge..i = select i1 %100, i32 %storemerge.i, i32 %99
  store i32 %storemerge..i, i32* %92, align 4
  br label %161

; <label>:101                                     ; preds = %helper_svm_check_intercept_param.exit
  %102 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 38
  store i64 %54, i64* %102, align 8
  br label %161

; <label>:103                                     ; preds = %helper_svm_check_intercept_param.exit
  %104 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 116
  store i64 %54, i64* %104, align 8
  br label %161

; <label>:105                                     ; preds = %helper_svm_check_intercept_param.exit
  %106 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 39
  store i64 %54, i64* %106, align 8
  br label %161

; <label>:107                                     ; preds = %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.
  %108 = add i32 %56, -512
  %109 = lshr i32 %108, 1
  %110 = zext i32 %109 to i64
  %111 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 134, i64 %110, i32 0
  store i64 %54, i64* %111, align 8
  br label %161

; <label>:112                                     ; preds = %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.
  %113 = add i32 %56, -513
  %114 = lshr i32 %113, 1
  %115 = zext i32 %114 to i64
  %116 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 134, i64 %115, i32 1
  store i64 %54, i64* %116, align 8
  br label %161

; <label>:117                                     ; preds = %helper_svm_check_intercept_param.exit
  %118 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 132, i64 0
  store i64 %54, i64* %118, align 8
  br label %161

; <label>:119                                     ; preds = %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit
  %120 = add i32 %56, -599
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 132, i64 %121
  store i64 %54, i64* %122, align 8
  br label %161

; <label>:123                                     ; preds = %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.
  %124 = add i32 %56, -613
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 132, i64 %125
  store i64 %54, i64* %126, align 8
  br label %161

; <label>:127                                     ; preds = %helper_svm_check_intercept_param.exit
  %128 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 133
  store i64 %54, i64* %128, align 8
  br label %161

; <label>:129                                     ; preds = %helper_svm_check_intercept_param.exit
  %130 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 54
  store i64 %54, i64* %130, align 8
  br label %161

; <label>:131                                     ; preds = %helper_svm_check_intercept_param.exit
  %132 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 147
  %133 = load i64* %132, align 8
  %134 = and i64 %133, 256
  %135 = icmp eq i64 %134, 0
  br i1 %135, label %161, label %136

; <label>:136                                     ; preds = %131
  switch i64 %54, label %161 [
    i64 -1, label %137
    i64 0, label %137
  ]

; <label>:137                                     ; preds = %136, %136
  %138 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 148
  store i64 %54, i64* %138, align 8
  br label %161

; <label>:139                                     ; preds = %helper_svm_check_intercept_param.exit
  %140 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 150
  store i64 %54, i64* %140, align 8
  br label %161

; <label>:141                                     ; preds = %helper_svm_check_intercept_param.exit
  %142 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 55
  store i64 %54, i64* %142, align 8
  br label %161

; <label>:143                                     ; preds = %helper_svm_check_intercept_param.exit
  %144 = icmp ugt i32 %56, 1023
  br i1 %144, label %145, label %161

; <label>:145                                     ; preds = %143
  %146 = zext i32 %56 to i64
  %147 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 147
  %148 = load i64* %147, align 8
  %149 = shl i64 %148, 2
  %150 = and i64 %149, 252
  %151 = or i64 %150, 1024
  %152 = icmp ult i64 %146, %151
  br i1 %152, label %153, label %161

; <label>:153                                     ; preds = %145
  %154 = add i32 %56, -1024
  %155 = and i32 %154, 3
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %157, label %158

; <label>:157                                     ; preds = %153
  switch i64 %54, label %161 [
    i64 -1, label %158
    i64 0, label %158
  ]

; <label>:158                                     ; preds = %157, %157, %153
  %159 = zext i32 %154 to i64
  %160 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 149, i64 %159
  store i64 %54, i64* %160, align 8
  br label %161

; <label>:161                                     ; preds = %158, %157, %145, %143, %141, %139, %137, %136, %131, %129, %127, %123, %119, %117, %112, %107, %105, %103, %101, %67, %64, %62, %60, %57
  ret void
}

declare void @cpu_set_apic_base(%struct.DeviceState*, i64)

define void @helper_rdmsr() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 268435456
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 40
  %12 = load i64* %11, align 8
  %13 = add i64 %12, 72
  %14 = tail call i64 @ldq_phys(i64 %13) nounwind
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 0, i64 1
  %17 = load i32* %16, align 4
  %18 = add i32 %17, 1073676288
  %19 = icmp ult i32 %18, 8192
  br i1 %19, label %33, label %30

; <label>:20                                      ; preds = %24
  %21 = shl i32 %17, 1
  %22 = lshr i32 %17, 2
  %23 = and i32 %22, 536870911
  br label %38

; <label>:24                                      ; preds = %30
  %25 = icmp ult i32 %17, 8192
  br i1 %25, label %20, label %37

; <label>:26                                      ; preds = %30
  %27 = shl i32 %17, 1
  %28 = add i32 %27, -2147467264
  %29 = lshr i32 %28, 3
  br label %38

; <label>:30                                      ; preds = %10
  %31 = add i32 %17, 1073741824
  %32 = icmp ult i32 %31, 8192
  br i1 %32, label %26, label %24

; <label>:33                                      ; preds = %10
  %34 = shl i32 %17, 1
  %35 = add i32 %34, 2147385344
  %36 = lshr i32 %35, 3
  br label %38

; <label>:37                                      ; preds = %24
  tail call void @helper_vmexit(i32 124, i64 0) nounwind
  unreachable

; <label>:38                                      ; preds = %33, %26, %20
  %t0.0.in.i = phi i32 [ %35, %33 ], [ %28, %26 ], [ %21, %20 ]
  %t1.0.i = phi i32 [ %36, %33 ], [ %29, %26 ], [ %23, %20 ]
  %t0.0.i = and i32 %t0.0.in.i, 6
  %39 = zext i32 %t1.0.i to i64
  %40 = add i64 %39, %14
  %41 = tail call i32 @ldub_phys(i64 %40) nounwind
  %42 = shl i32 1, %t0.0.i
  %43 = and i32 %41, %42
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %.helper_svm_check_intercept_param.exit_crit_edge, label %45

.helper_svm_check_intercept_param.exit_crit_edge: ; preds = %38
  %.pre1 = load %struct.CPUX86State** @env, align 8
  br label %helper_svm_check_intercept_param.exit

; <label>:45                                      ; preds = %38
  tail call void @helper_vmexit(i32 124, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %.helper_svm_check_intercept_param.exit_crit_edge, %5, %0
  %46 = phi %struct.CPUX86State* [ %.pre1, %.helper_svm_check_intercept_param.exit_crit_edge ], [ %1, %0 ], [ %1, %5 ]
  %47 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 0, i64 1
  %48 = load i32* %47, align 4
  switch i32 %48, label %127 [
    i32 372, label %49
    i32 373, label %53
    i32 374, label %57
    i32 27, label %61
    i32 -1073741696, label %65
    i32 -1073741695, label %68
    i32 631, label %71
    i32 -1073676009, label %74
    i32 408, label %142
    i32 512, label %77
    i32 514, label %77
    i32 516, label %77
    i32 518, label %77
    i32 520, label %77
    i32 522, label %77
    i32 524, label %77
    i32 526, label %77
    i32 513, label %83
    i32 515, label %83
    i32 517, label %83
    i32 519, label %83
    i32 521, label %83
    i32 523, label %83
    i32 525, label %83
    i32 527, label %83
    i32 592, label %89
    i32 600, label %92
    i32 601, label %92
    i32 616, label %97
    i32 617, label %97
    i32 618, label %97
    i32 619, label %97
    i32 620, label %97
    i32 621, label %97
    i32 622, label %97
    i32 623, label %97
    i32 767, label %102
    i32 254, label %105
    i32 377, label %110
    i32 379, label %113
    i32 378, label %121
    i32 416, label %124
  ]

; <label>:49                                      ; preds = %helper_svm_check_intercept_param.exit
  %50 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 34
  %51 = load i32* %50, align 4
  %52 = zext i32 %51 to i64
  br label %142

; <label>:53                                      ; preds = %helper_svm_check_intercept_param.exit
  %54 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 35
  %55 = load i32* %54, align 4
  %56 = zext i32 %55 to i64
  br label %142

; <label>:57                                      ; preds = %helper_svm_check_intercept_param.exit
  %58 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 36
  %59 = load i32* %58, align 4
  %60 = zext i32 %59 to i64
  br label %142

; <label>:61                                      ; preds = %helper_svm_check_intercept_param.exit
  %62 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 146
  %63 = load %struct.DeviceState** %62, align 8
  %64 = tail call i64 @cpu_get_apic_base(%struct.DeviceState* %63) nounwind
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %142

; <label>:65                                      ; preds = %helper_svm_check_intercept_param.exit
  %66 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 37
  %67 = load i64* %66, align 8
  br label %142

; <label>:68                                      ; preds = %helper_svm_check_intercept_param.exit
  %69 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 38
  %70 = load i64* %69, align 8
  br label %142

; <label>:71                                      ; preds = %helper_svm_check_intercept_param.exit
  %72 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 116
  %73 = load i64* %72, align 8
  br label %142

; <label>:74                                      ; preds = %helper_svm_check_intercept_param.exit
  %75 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 39
  %76 = load i64* %75, align 8
  br label %142

; <label>:77                                      ; preds = %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.
  %78 = add i32 %48, -512
  %79 = lshr i32 %78, 1
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 134, i64 %80, i32 0
  %82 = load i64* %81, align 8
  br label %142

; <label>:83                                      ; preds = %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.
  %84 = add i32 %48, -513
  %85 = lshr i32 %84, 1
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 134, i64 %86, i32 1
  %88 = load i64* %87, align 8
  br label %142

; <label>:89                                      ; preds = %helper_svm_check_intercept_param.exit
  %90 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 132, i64 0
  %91 = load i64* %90, align 8
  br label %142

; <label>:92                                      ; preds = %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit
  %93 = add i32 %48, -599
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 132, i64 %94
  %96 = load i64* %95, align 8
  br label %142

; <label>:97                                      ; preds = %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.exit, %helper_svm_check_intercept_param.
  %98 = add i32 %48, -613
  %99 = zext i32 %98 to i64
  %100 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 132, i64 %99
  %101 = load i64* %100, align 8
  br label %142

; <label>:102                                     ; preds = %helper_svm_check_intercept_param.exit
  %103 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 133
  %104 = load i64* %103, align 8
  br label %142

; <label>:105                                     ; preds = %helper_svm_check_intercept_param.exit
  %106 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 122
  %107 = load i32* %106, align 4
  %108 = and i32 %107, 4096
  %109 = icmp eq i32 %108, 0
  %. = select i1 %109, i64 0, i64 1288
  br label %142

; <label>:110                                     ; preds = %helper_svm_check_intercept_param.exit
  %111 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 147
  %112 = load i64* %111, align 8
  br label %142

; <label>:113                                     ; preds = %helper_svm_check_intercept_param.exit
  %114 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 147
  %115 = load i64* %114, align 8
  %116 = and i64 %115, 256
  %117 = icmp eq i64 %116, 0
  br i1 %117, label %142, label %118

; <label>:118                                     ; preds = %113
  %119 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 148
  %120 = load i64* %119, align 8
  br label %142

; <label>:121                                     ; preds = %helper_svm_check_intercept_param.exit
  %122 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 54
  %123 = load i64* %122, align 8
  br label %142

; <label>:124                                     ; preds = %helper_svm_check_intercept_param.exit
  %125 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 55
  %126 = load i64* %125, align 8
  br label %142

; <label>:127                                     ; preds = %helper_svm_check_intercept_param.exit
  %128 = icmp ugt i32 %48, 1023
  br i1 %128, label %129, label %142

; <label>:129                                     ; preds = %127
  %130 = zext i32 %48 to i64
  %131 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 147
  %132 = load i64* %131, align 8
  %133 = shl i64 %132, 2
  %134 = and i64 %133, 252
  %135 = or i64 %134, 1024
  %136 = icmp ult i64 %130, %135
  br i1 %136, label %137, label %142

; <label>:137                                     ; preds = %129
  %138 = add i32 %48, -1024
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 149, i64 %139
  %141 = load i64* %140, align 8
  br label %142

; <label>:142                                     ; preds = %137, %129, %127, %124, %121, %118, %113, %110, %105, %102, %97, %92, %89, %83, %77, %74, %71, %68, %65, %61, %57, %53, %49, %helper_svm_check_intercept_param.exit
  %143 = phi %struct.CPUX86State* [ %46, %137 ], [ %46, %124 ], [ %46, %121 ], [ %46, %118 ], [ %46, %110 ], [ %46, %102 ], [ %46, %97 ], [ %46, %92 ], [ %46, %89 ], [ %46, %83 ], [ %46, %77 ], [ %46, %74 ], [ %46, %71 ], [ %46, %68 ], [ %46, %65 ], [ %.
  %val.0 = phi i64 [ %141, %137 ], [ %126, %124 ], [ %123, %121 ], [ %120, %118 ], [ %112, %110 ], [ %104, %102 ], [ %101, %97 ], [ %96, %92 ], [ %91, %89 ], [ %88, %83 ], [ %82, %77 ], [ %76, %74 ], [ %73, %71 ], [ %70, %68 ], [ %67, %65 ], [ %64, %61 ]
  %144 = trunc i64 %val.0 to i32
  %145 = getelementptr inbounds %struct.CPUX86State* %143, i64 0, i32 0, i64 0
  store i32 %144, i32* %145, align 4
  %146 = lshr i64 %val.0, 32
  %147 = trunc i64 %146 to i32
  %148 = load %struct.CPUX86State** @env, align 8
  %149 = getelementptr inbounds %struct.CPUX86State* %148, i64 0, i32 0, i64 2
  store i32 %147, i32* %149, align 4
  ret void
}

declare i64 @cpu_get_apic_base(%struct.DeviceState*)

define i32 @helper_lsl(i32 %selector1) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = and i32 %selector1, 65532
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %load_segment.exit.thread4, label %7

; <label>:7                                       ; preds = %0
  %8 = and i32 %selector1, 65528
  %9 = and i32 %selector1, 4
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 10
  %12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 12
  %dt.0.i = select i1 %10, %struct.SegmentCache* %12, %struct.SegmentCache* %11
  %13 = or i32 %8, 7
  %14 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 2
  %15 = load i32* %14, align 4
  %16 = icmp ugt i32 %13, %15
  br i1 %16, label %load_segment.exit.thread4, label %17

; <label>:17                                      ; preds = %7
  %18 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 1
  %19 = load i32* %18, align 4
  %20 = add i32 %19, %8
  %21 = tail call fastcc i32 @ldl_kernel(i32 %20) nounwind
  %22 = add i32 %20, 4
  %23 = tail call fastcc i32 @ldl_kernel(i32 %22) nounwind
  %24 = and i32 %selector1, 3
  %25 = lshr i32 %23, 13
  %26 = and i32 %25, 3
  %27 = load %struct.CPUX86State** @env, align 8
  %28 = getelementptr inbounds %struct.CPUX86State* %27, i64 0, i32 7
  %29 = load i32* %28, align 4
  %30 = and i32 %29, 3
  %31 = and i32 %23, 4096
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %39, label %33

; <label>:33                                      ; preds = %17
  %34 = and i32 %23, 3072
  %35 = icmp eq i32 %34, 3072
  br i1 %35, label %48, label %36

; <label>:36                                      ; preds = %33
  %37 = icmp ult i32 %26, %30
  %38 = icmp ult i32 %26, %24
  %or.cond2 = or i1 %37, %38
  br i1 %or.cond2, label %load_segment.exit.thread4, label %48

; <label>:39                                      ; preds = %17
  %40 = lshr i32 %23, 8
  %41 = and i32 %40, 15
  switch i32 %41, label %load_segment.exit.thread4 [
    i32 1, label %42
    i32 2, label %42
    i32 3, label %42
    i32 9, label %42
    i32 11, label %42
  ]

; <label>:42                                      ; preds = %39, %39, %39, %39, %39
  %43 = icmp ult i32 %26, %30
  %44 = icmp ult i32 %26, %24
  %or.cond3 = or i1 %43, %44
  br i1 %or.cond3, label %load_segment.exit.thread4, label %48

load_segment.exit.thread4:                        ; preds = %42, %39, %36, %7, %0
  %45 = phi %struct.CPUX86State* [ %1, %7 ], [ %27, %42 ], [ %27, %39 ], [ %27, %36 ], [ %1, %0 ]
  %46 = and i32 %4, -65
  %47 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 1
  store i32 %46, i32* %47, align 4
  br label %59

; <label>:48                                      ; preds = %42, %36, %33
  %49 = and i32 %21, 65535
  %50 = and i32 %23, 983040
  %51 = or i32 %50, %49
  %52 = and i32 %23, 8388608
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %get_seg_limit.exit, label %54

; <label>:54                                      ; preds = %48
  %55 = shl nuw i32 %51, 12
  %56 = or i32 %55, 4095
  br label %get_seg_limit.exit

get_seg_limit.exit:                               ; preds = %54, %48
  %limit.0.i = phi i32 [ %56, %54 ], [ %51, %48 ]
  %57 = or i32 %4, 64
  %58 = getelementptr inbounds %struct.CPUX86State* %27, i64 0, i32 1
  store i32 %57, i32* %58, align 4
  br label %59

; <label>:59                                      ; preds = %get_seg_limit.exit, %load_segment.exit.thread4
  %.0 = phi i32 [ 0, %load_segment.exit.thread4 ], [ %limit.0.i, %get_seg_limit.exit ]
  ret i32 %.0
}

define i32 @helper_lar(i32 %selector1) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = and i32 %selector1, 65532
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %load_segment.exit.thread4, label %7

; <label>:7                                       ; preds = %0
  %8 = and i32 %selector1, 65528
  %9 = and i32 %selector1, 4
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 10
  %12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 12
  %dt.0.i = select i1 %10, %struct.SegmentCache* %12, %struct.SegmentCache* %11
  %13 = or i32 %8, 7
  %14 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 2
  %15 = load i32* %14, align 4
  %16 = icmp ugt i32 %13, %15
  br i1 %16, label %load_segment.exit.thread4, label %17

; <label>:17                                      ; preds = %7
  %18 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 1
  %19 = load i32* %18, align 4
  %20 = add i32 %19, %8
  %21 = tail call fastcc i32 @ldl_kernel(i32 %20) nounwind
  %22 = add i32 %20, 4
  %23 = tail call fastcc i32 @ldl_kernel(i32 %22) nounwind
  %24 = and i32 %selector1, 3
  %25 = lshr i32 %23, 13
  %26 = and i32 %25, 3
  %27 = load %struct.CPUX86State** @env, align 8
  %28 = getelementptr inbounds %struct.CPUX86State* %27, i64 0, i32 7
  %29 = load i32* %28, align 4
  %30 = and i32 %29, 3
  %31 = and i32 %23, 4096
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %39, label %33

; <label>:33                                      ; preds = %17
  %34 = and i32 %23, 3072
  %35 = icmp eq i32 %34, 3072
  br i1 %35, label %48, label %36

; <label>:36                                      ; preds = %33
  %37 = icmp ult i32 %26, %30
  %38 = icmp ult i32 %26, %24
  %or.cond2 = or i1 %37, %38
  br i1 %or.cond2, label %load_segment.exit.thread4, label %48

; <label>:39                                      ; preds = %17
  %40 = lshr i32 %23, 8
  %41 = and i32 %40, 15
  switch i32 %41, label %load_segment.exit.thread4 [
    i32 1, label %42
    i32 2, label %42
    i32 3, label %42
    i32 4, label %42
    i32 5, label %42
    i32 9, label %42
    i32 11, label %42
    i32 12, label %42
  ]

; <label>:42                                      ; preds = %39, %39, %39, %39, %39, %39, %39, %39
  %43 = icmp ult i32 %26, %30
  %44 = icmp ult i32 %26, %24
  %or.cond3 = or i1 %43, %44
  br i1 %or.cond3, label %load_segment.exit.thread4, label %48

load_segment.exit.thread4:                        ; preds = %42, %39, %36, %7, %0
  %45 = phi %struct.CPUX86State* [ %1, %7 ], [ %27, %42 ], [ %27, %39 ], [ %27, %36 ], [ %1, %0 ]
  %46 = and i32 %4, -65
  %47 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 1
  store i32 %46, i32* %47, align 4
  br label %52

; <label>:48                                      ; preds = %42, %36, %33
  %49 = or i32 %4, 64
  %50 = getelementptr inbounds %struct.CPUX86State* %27, i64 0, i32 1
  store i32 %49, i32* %50, align 4
  %51 = and i32 %23, 15793920
  br label %52

; <label>:52                                      ; preds = %48, %load_segment.exit.thread4
  %.0 = phi i32 [ 0, %load_segment.exit.thread4 ], [ %51, %48 ]
  ret i32 %.0
}

define void @helper_verr(i32 %selector1) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = and i32 %selector1, 65532
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %load_segment.exit.thread2, label %7

; <label>:7                                       ; preds = %0
  %8 = and i32 %selector1, 65528
  %9 = and i32 %selector1, 4
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 10
  %12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 12
  %dt.0.i = select i1 %10, %struct.SegmentCache* %12, %struct.SegmentCache* %11
  %13 = or i32 %8, 7
  %14 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 2
  %15 = load i32* %14, align 4
  %16 = icmp ugt i32 %13, %15
  br i1 %16, label %load_segment.exit.thread2, label %17

; <label>:17                                      ; preds = %7
  %18 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 1
  %19 = load i32* %18, align 4
  %20 = add i32 %19, %8
  %21 = tail call fastcc i32 @ldl_kernel(i32 %20) nounwind
  %22 = add i32 %20, 4
  %23 = tail call fastcc i32 @ldl_kernel(i32 %22) nounwind
  %24 = and i32 %23, 4096
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %.load_segment.exit.thread2_crit_edge, label %26

.load_segment.exit.thread2_crit_edge:             ; preds = %17
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %load_segment.exit.thread2

; <label>:26                                      ; preds = %17
  %27 = and i32 %selector1, 3
  %28 = lshr i32 %23, 13
  %29 = and i32 %28, 3
  %30 = load %struct.CPUX86State** @env, align 8
  %31 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 7
  %32 = load i32* %31, align 4
  %33 = and i32 %32, 3
  %34 = and i32 %23, 2048
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %45, label %36

; <label>:36                                      ; preds = %26
  %37 = and i32 %23, 512
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %load_segment.exit.thread2, label %39

; <label>:39                                      ; preds = %36
  %40 = and i32 %23, 1024
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %51

; <label>:42                                      ; preds = %39
  %43 = icmp ult i32 %29, %33
  %44 = icmp ult i32 %29, %27
  %or.cond = or i1 %43, %44
  br i1 %or.cond, label %load_segment.exit.thread2, label %51

; <label>:45                                      ; preds = %26
  %46 = icmp ult i32 %29, %33
  %47 = icmp ult i32 %29, %27
  %or.cond1 = or i1 %46, %47
  br i1 %or.cond1, label %load_segment.exit.thread2, label %51

load_segment.exit.thread2:                        ; preds = %45, %42, %36, %.load_segment.exit.thread2_crit_edge, %7, %0
  %48 = phi %struct.CPUX86State* [ %.pre, %.load_segment.exit.thread2_crit_edge ], [ %1, %7 ], [ %30, %36 ], [ %30, %45 ], [ %30, %42 ], [ %1, %0 ]
  %49 = and i32 %4, -65
  %50 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 1
  store i32 %49, i32* %50, align 4
  br label %54

; <label>:51                                      ; preds = %45, %42, %39
  %52 = or i32 %4, 64
  %53 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 1
  store i32 %52, i32* %53, align 4
  br label %54

; <label>:54                                      ; preds = %51, %load_segment.exit.thread2
  ret void
}

define void @helper_verw(i32 %selector1) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = and i32 %selector1, 65532
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %load_segment.exit.thread1, label %7

; <label>:7                                       ; preds = %0
  %8 = and i32 %selector1, 65528
  %9 = and i32 %selector1, 4
  %10 = icmp eq i32 %9, 0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 10
  %12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 12
  %dt.0.i = select i1 %10, %struct.SegmentCache* %12, %struct.SegmentCache* %11
  %13 = or i32 %8, 7
  %14 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 2
  %15 = load i32* %14, align 4
  %16 = icmp ugt i32 %13, %15
  br i1 %16, label %load_segment.exit.thread1, label %17

; <label>:17                                      ; preds = %7
  %18 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 1
  %19 = load i32* %18, align 4
  %20 = add i32 %19, %8
  %21 = tail call fastcc i32 @ldl_kernel(i32 %20) nounwind
  %22 = add i32 %20, 4
  %23 = tail call fastcc i32 @ldl_kernel(i32 %22) nounwind
  %24 = and i32 %23, 4096
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %.load_segment.exit.thread1_crit_edge, label %26

.load_segment.exit.thread1_crit_edge:             ; preds = %17
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %load_segment.exit.thread1

; <label>:26                                      ; preds = %17
  %27 = lshr i32 %23, 13
  %28 = and i32 %27, 3
  %29 = load %struct.CPUX86State** @env, align 8
  %30 = and i32 %23, 2048
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %load_segment.exit.thread1

; <label>:32                                      ; preds = %26
  %33 = and i32 %selector1, 3
  %34 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 7
  %35 = load i32* %34, align 4
  %36 = and i32 %35, 3
  %37 = icmp ult i32 %28, %36
  %38 = icmp ult i32 %28, %33
  %or.cond = or i1 %37, %38
  br i1 %or.cond, label %load_segment.exit.thread1, label %39

; <label>:39                                      ; preds = %32
  %40 = and i32 %23, 512
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %load_segment.exit.thread1, label %45

load_segment.exit.thread1:                        ; preds = %39, %32, %26, %.load_segment.exit.thread1_crit_edge, %7, %0
  %42 = phi %struct.CPUX86State* [ %.pre, %.load_segment.exit.thread1_crit_edge ], [ %1, %7 ], [ %29, %39 ], [ %29, %26 ], [ %29, %32 ], [ %1, %0 ]
  %43 = and i32 %4, -65
  %44 = getelementptr inbounds %struct.CPUX86State* %42, i64 0, i32 1
  store i32 %43, i32* %44, align 4
  br label %48

; <label>:45                                      ; preds = %39
  %46 = or i32 %4, 64
  %47 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 1
  store i32 %46, i32* %47, align 4
  br label %48

; <label>:48                                      ; preds = %45, %load_segment.exit.thread1
  ret void
}

define void @helper_flds_FT0(i32 %val) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %3 = tail call { i64, i16 } @float32_to_floatx80(i32 %val, %struct.float_status* %2) nounwind
  %4 = extractvalue { i64, i16 } %3, 0
  %5 = extractvalue { i64, i16 } %3, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  store i64 %4, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  store i16 %5, i16* %.12, align 8
  ret void
}

declare { i64, i16 } @float32_to_floatx80(i32, %struct.float_status*)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define void @helper_fldl_FT0(i64 %val) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %3 = tail call { i64, i16 } @float64_to_floatx80(i64 %val, %struct.float_status* %2) nounwind
  %4 = extractvalue { i64, i16 } %3, 0
  %5 = extractvalue { i64, i16 } %3, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  store i64 %4, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  store i16 %5, i16* %.12, align 8
  ret void
}

declare { i64, i16 } @float64_to_floatx80(i64, %struct.float_status*)

define void @helper_fildl_FT0(i32 %val) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %3 = tail call { i64, i16 } @int32_to_floatx80(i32 %val, %struct.float_status* %2) nounwind
  %4 = extractvalue { i64, i16 } %3, 0
  %5 = extractvalue { i64, i16 } %3, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  store i64 %4, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  store i16 %5, i16* %.12, align 8
  ret void
}

declare { i64, i16 } @int32_to_floatx80(i32, %struct.float_status*)

define void @helper_flds_ST0(i32 %val) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 7
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %8 = tail call { i64, i16 } @float32_to_floatx80(i32 %val, %struct.float_status* %7) nounwind
  %9 = extractvalue { i64, i16 } %8, 0
  %10 = extractvalue { i64, i16 } %8, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  store i64 %9, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  store i16 %10, i16* %.12, align 8
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 16
  store i32 %5, i32* %12, align 4
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 19, i64 %6
  store i8 0, i8* %14, align 1
  ret void
}

define void @helper_fldl_ST0(i64 %val) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 7
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %8 = tail call { i64, i16 } @float64_to_floatx80(i64 %val, %struct.float_status* %7) nounwind
  %9 = extractvalue { i64, i16 } %8, 0
  %10 = extractvalue { i64, i16 } %8, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  store i64 %9, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  store i16 %10, i16* %.12, align 8
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 16
  store i32 %5, i32* %12, align 4
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 19, i64 %6
  store i8 0, i8* %14, align 1
  ret void
}

define void @helper_fildl_ST0(i32 %val) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 7
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %8 = tail call { i64, i16 } @int32_to_floatx80(i32 %val, %struct.float_status* %7) nounwind
  %9 = extractvalue { i64, i16 } %8, 0
  %10 = extractvalue { i64, i16 } %8, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  store i64 %9, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  store i16 %10, i16* %.12, align 8
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 16
  store i32 %5, i32* %12, align 4
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 19, i64 %6
  store i8 0, i8* %14, align 1
  ret void
}

define void @helper_fildll_ST0(i64 %val) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 7
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %8 = tail call { i64, i16 } @int64_to_floatx80(i64 %val, %struct.float_status* %7) nounwind
  %9 = extractvalue { i64, i16 } %8, 0
  %10 = extractvalue { i64, i16 } %8, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  store i64 %9, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  store i16 %10, i16* %.12, align 8
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 16
  store i32 %5, i32* %12, align 4
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 19, i64 %6
  store i8 0, i8* %14, align 1
  ret void
}

declare { i64, i16 } @int64_to_floatx80(i64, %struct.float_status*)

define i32 @helper_fsts_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = tail call i32 @floatx80_to_float32(i64 %7, i16 %9, %struct.float_status* %5) nounwind
  ret i32 %10
}

declare i32 @floatx80_to_float32(i64, i16, %struct.float_status*)

define i64 @helper_fstl_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = tail call i64 @floatx80_to_float64(i64 %7, i16 %9, %struct.float_status* %5) nounwind
  ret i64 %10
}

declare i64 @floatx80_to_float64(i64, i16, %struct.float_status*)

define i32 @helper_fist_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = tail call i32 @floatx80_to_int32(i64 %7, i16 %9, %struct.float_status* %5) nounwind
  %sext = shl i32 %10, 16
  %11 = ashr exact i32 %sext, 16
  %12 = icmp eq i32 %10, %11
  %val.0 = select i1 %12, i32 %10, i32 -32768
  ret i32 %val.0
}

declare i32 @floatx80_to_int32(i64, i16, %struct.float_status*)

define i32 @helper_fistl_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = tail call i32 @floatx80_to_int32(i64 %7, i16 %9, %struct.float_status* %5) nounwind
  ret i32 %10
}

define i64 @helper_fistll_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = tail call i64 @floatx80_to_int64(i64 %7, i16 %9, %struct.float_status* %5) nounwind
  ret i64 %10
}

declare i64 @floatx80_to_int64(i64, i16, %struct.float_status*)

define i32 @helper_fistt_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = tail call i32 @floatx80_to_int32_round_to_zero(i64 %7, i16 %9, %struct.float_status* %5) nounwind
  %sext = shl i32 %10, 16
  %11 = ashr exact i32 %sext, 16
  %12 = icmp eq i32 %10, %11
  %val.0 = select i1 %12, i32 %10, i32 -32768
  ret i32 %val.0
}

declare i32 @floatx80_to_int32_round_to_zero(i64, i16, %struct.float_status*)

define i32 @helper_fisttl_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = tail call i32 @floatx80_to_int32_round_to_zero(i64 %7, i16 %9, %struct.float_status* %5) nounwind
  ret i32 %10
}

define i64 @helper_fisttll_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = tail call i64 @floatx80_to_int64_round_to_zero(i64 %7, i16 %9, %struct.float_status* %5) nounwind
  ret i64 %10
}

declare i64 @floatx80_to_int64_round_to_zero(i64, i16, %struct.float_status*)

define void @helper_fldt_ST0(i32 %ptr) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 7
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = tail call fastcc i64 @ldq_data(i32 %ptr) nounwind
  %8 = add i32 %ptr, 8
  %9 = tail call fastcc i32 @lduw_data(i32 %8) nounwind
  %10 = trunc i32 %9 to i16
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  store i64 %7, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  store i16 %10, i16* %.12, align 8
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 16
  store i32 %5, i32* %12, align 4
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 19, i64 %6
  store i8 0, i8* %14, align 1
  ret void
}

define void @helper_fstt_ST0(i32 %ptr) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  tail call fastcc void @stq_data(i32 %ptr, i64 %6) nounwind
  %9 = add i32 %ptr, 8
  %10 = zext i16 %8 to i32
  tail call fastcc void @stw_data(i32 %9, i32 %10) nounwind
  ret void
}

define void @helper_fpush() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 7
  %5 = and i32 %4, 7
  store i32 %5, i32* %2, align 4
  %6 = load %struct.CPUX86State** @env, align 8
  %7 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 16
  %8 = load i32* %7, align 4
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 19, i64 %9
  store i8 0, i8* %10, align 1
  ret void
}

define void @helper_fpop() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 19, i64 %4
  store i8 1, i8* %5, align 1
  %6 = load %struct.CPUX86State** @env, align 8
  %7 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 16
  %8 = load i32* %7, align 4
  %9 = add i32 %8, 1
  %10 = and i32 %9, 7
  store i32 %10, i32* %7, align 4
  ret void
}

define void @helper_fdecstp() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 7
  %5 = and i32 %4, 7
  store i32 %5, i32* %2, align 4
  %6 = load %struct.CPUX86State** @env, align 8
  %7 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 17
  %8 = load i16* %7, align 2
  %9 = and i16 %8, -18177
  store i16 %9, i16* %7, align 2
  ret void
}

define void @helper_fincstp() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 1
  %5 = and i32 %4, 7
  store i32 %5, i32* %2, align 4
  %6 = load %struct.CPUX86State** @env, align 8
  %7 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 17
  %8 = load i16* %7, align 2
  %9 = and i16 %8, -18177
  store i16 %9, i16* %7, align 2
  ret void
}

define void @helper_ffree_STN(i32 %st_index) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, %st_index
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 19, i64 %6
  store i8 1, i8* %7, align 1
  ret void
}

define void @helper_fmov_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26
  %7 = bitcast %struct.floatx80* %5 to i8*
  %8 = bitcast %struct.floatx80* %6 to i8*
  br label %9

; <label>:9                                       ; preds = %12, %0
  %10 = phi i64 [ 0, %0 ], [ %16, %12 ]
  %11 = icmp ult i64 %10, 16
  br i1 %11, label %12, label %17

; <label>:12                                      ; preds = %9
  %13 = getelementptr i8* %8, i64 %10
  %14 = load i8* %13, align 1
  %15 = getelementptr i8* %7, i64 %10
  store i8 %14, i8* %15, align 1
  %16 = add i64 %10, 1
  br label %9

; <label>:17                                      ; preds = %9
  ret void
}

define void @helper_fmov_FT0_STN(i32 %st_index) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26
  %3 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %4 = load i32* %3, align 4
  %5 = add i32 %4, %st_index
  %6 = and i32 %5, 7
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0
  %9 = bitcast %struct.floatx80* %2 to i8*
  %10 = bitcast %struct.floatx80* %8 to i8*
  br label %11

; <label>:11                                      ; preds = %14, %0
  %12 = phi i64 [ 0, %0 ], [ %18, %14 ]
  %13 = icmp ult i64 %12, 16
  br i1 %13, label %14, label %19

; <label>:14                                      ; preds = %11
  %15 = getelementptr i8* %10, i64 %12
  %16 = load i8* %15, align 1
  %17 = getelementptr i8* %9, i64 %12
  store i8 %16, i8* %17, align 1
  %18 = add i64 %12, 1
  br label %11

; <label>:19                                      ; preds = %11
  ret void
}

define void @helper_fmov_ST0_STN(i32 %st_index) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0
  %6 = add i32 %3, %st_index
  %7 = and i32 %6, 7
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %8, i32 0
  %10 = bitcast %struct.floatx80* %5 to i8*
  %11 = bitcast %struct.floatx80* %9 to i8*
  br label %12

; <label>:12                                      ; preds = %15, %0
  %13 = phi i64 [ 0, %0 ], [ %19, %15 ]
  %14 = icmp ult i64 %13, 16
  br i1 %14, label %15, label %20

; <label>:15                                      ; preds = %12
  %16 = getelementptr i8* %11, i64 %13
  %17 = load i8* %16, align 1
  %18 = getelementptr i8* %10, i64 %13
  store i8 %17, i8* %18, align 1
  %19 = add i64 %13, 1
  br label %12

; <label>:20                                      ; preds = %12
  ret void
}

define void @helper_fmov_STN_ST0(i32 %st_index) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, %st_index
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0
  %8 = zext i32 %3 to i64
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %8, i32 0
  %10 = bitcast %struct.floatx80* %7 to i8*
  %11 = bitcast %struct.floatx80* %9 to i8*
  br label %12

; <label>:12                                      ; preds = %15, %0
  %13 = phi i64 [ 0, %0 ], [ %19, %15 ]
  %14 = icmp ult i64 %13, 16
  br i1 %14, label %15, label %20

; <label>:15                                      ; preds = %12
  %16 = getelementptr i8* %11, i64 %13
  %17 = load i8* %16, align 1
  %18 = getelementptr i8* %10, i64 %13
  store i8 %17, i8* %18, align 1
  %19 = add i64 %13, 1
  br label %12

; <label>:20                                      ; preds = %12
  ret void
}

define void @helper_fxchg_ST0_STN(i32 %st_index) nounwind uwtable sspreq {
  %tmp = alloca %struct.floatx80, align 8
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, %st_index
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0
  %8 = bitcast %struct.floatx80* %tmp to i8*
  %9 = bitcast %struct.floatx80* %7 to i8*
  br label %10

; <label>:10                                      ; preds = %13, %0
  %11 = phi i64 [ 0, %0 ], [ %17, %13 ]
  %12 = icmp ult i64 %11, 16
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %10
  %14 = getelementptr i8* %9, i64 %11
  %15 = load i8* %14, align 1
  %16 = getelementptr i8* %8, i64 %11
  store i8 %15, i8* %16, align 1
  %17 = add i64 %11, 1
  br label %10

; <label>:18                                      ; preds = %10
  %19 = zext i32 %3 to i64
  %20 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %19, i32 0
  %21 = bitcast %struct.floatx80* %20 to i8*
  br label %22

; <label>:22                                      ; preds = %25, %18
  %23 = phi i64 [ 0, %18 ], [ %29, %25 ]
  %24 = icmp ult i64 %23, 16
  br i1 %24, label %25, label %30

; <label>:25                                      ; preds = %22
  %26 = getelementptr i8* %21, i64 %23
  %27 = load i8* %26, align 1
  %28 = getelementptr i8* %9, i64 %23
  store i8 %27, i8* %28, align 1
  %29 = add i64 %23, 1
  br label %22

; <label>:30                                      ; preds = %22
  %31 = load i32* %2, align 4
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %32, i32 0
  %34 = bitcast %struct.floatx80* %33 to i8*
  br label %35

; <label>:35                                      ; preds = %38, %30
  %36 = phi i64 [ 0, %30 ], [ %42, %38 ]
  %37 = icmp ult i64 %36, 16
  br i1 %37, label %38, label %43

; <label>:38                                      ; preds = %35
  %39 = getelementptr i8* %8, i64 %36
  %40 = load i8* %39, align 1
  %41 = getelementptr i8* %34, i64 %36
  store i8 %40, i8* %41, align 1
  %42 = add i64 %36, 1
  br label %35

; <label>:43                                      ; preds = %35
  ret void
}

define void @helper_fcom_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  %13 = load i16* %12, align 1
  %14 = tail call i32 @floatx80_compare(i64 %7, i16 %9, i64 %11, i16 %13, %struct.float_status* %5) nounwind
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 17
  %17 = load i16* %16, align 2
  %18 = zext i16 %17 to i32
  %19 = and i32 %18, 47871
  %20 = add nsw i32 %14, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x i32]* @fcom_ccval, i64 0, i64 %21
  %23 = load i32* %22, align 4
  %24 = or i32 %19, %23
  %25 = trunc i32 %24 to i16
  store i16 %25, i16* %16, align 2
  ret void
}

declare i32 @floatx80_compare(i64, i16, i64, i16, %struct.float_status*)

define void @helper_fucom_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  %13 = load i16* %12, align 1
  %14 = tail call i32 @floatx80_compare_quiet(i64 %7, i16 %9, i64 %11, i16 %13, %struct.float_status* %5) nounwind
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 17
  %17 = load i16* %16, align 2
  %18 = zext i16 %17 to i32
  %19 = and i32 %18, 47871
  %20 = add nsw i32 %14, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x i32]* @fcom_ccval, i64 0, i64 %21
  %23 = load i32* %22, align 4
  %24 = or i32 %19, %23
  %25 = trunc i32 %24 to i16
  store i16 %25, i16* %16, align 2
  ret void
}

declare i32 @floatx80_compare_quiet(i64, i16, i64, i16, %struct.float_status*)

define void @helper_fcomi_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  %13 = load i16* %12, align 1
  %14 = tail call i32 @floatx80_compare(i64 %7, i16 %9, i64 %11, i16 %13, %struct.float_status* %5) nounwind
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 3
  %17 = load i32* %16, align 4
  %18 = tail call i32 @helper_cc_compute_all(i32 %17)
  %19 = and i32 %18, -70
  %20 = add nsw i32 %14, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x i32]* @fcomi_ccval, i64 0, i64 %21
  %23 = load i32* %22, align 4
  %24 = or i32 %19, %23
  %25 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 1
  store i32 %24, i32* %25, align 4
  ret void
}

define void @helper_fucomi_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  %13 = load i16* %12, align 1
  %14 = tail call i32 @floatx80_compare_quiet(i64 %7, i16 %9, i64 %11, i16 %13, %struct.float_status* %5) nounwind
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 3
  %17 = load i32* %16, align 4
  %18 = tail call i32 @helper_cc_compute_all(i32 %17)
  %19 = and i32 %18, -70
  %20 = add nsw i32 %14, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x i32]* @fcomi_ccval, i64 0, i64 %21
  %23 = load i32* %22, align 4
  %24 = or i32 %19, %23
  %25 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 1
  store i32 %24, i32* %25, align 4
  ret void
}

define void @helper_fadd_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  %13 = load i16* %12, align 1
  %14 = tail call { i64, i16 } @floatx80_add(i64 %7, i16 %9, i64 %11, i16 %13, %struct.float_status* %5) nounwind
  %15 = extractvalue { i64, i16 } %14, 0
  %16 = extractvalue { i64, i16 } %14, 1
  store i64 %15, i64* %6, align 8
  store i16 %16, i16* %8, align 8
  ret void
}

declare { i64, i16 } @floatx80_add(i64, i16, i64, i16, %struct.float_status*)

define void @helper_fmul_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  %13 = load i16* %12, align 1
  %14 = tail call { i64, i16 } @floatx80_mul(i64 %7, i16 %9, i64 %11, i16 %13, %struct.float_status* %5) nounwind
  %15 = extractvalue { i64, i16 } %14, 0
  %16 = extractvalue { i64, i16 } %14, 1
  store i64 %15, i64* %6, align 8
  store i16 %16, i16* %8, align 8
  ret void
}

declare { i64, i16 } @floatx80_mul(i64, i16, i64, i16, %struct.float_status*)

define void @helper_fsub_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  %13 = load i16* %12, align 1
  %14 = tail call { i64, i16 } @floatx80_sub(i64 %7, i16 %9, i64 %11, i16 %13, %struct.float_status* %5) nounwind
  %15 = extractvalue { i64, i16 } %14, 0
  %16 = extractvalue { i64, i16 } %14, 1
  store i64 %15, i64* %6, align 8
  store i16 %16, i16* %8, align 8
  ret void
}

declare { i64, i16 } @floatx80_sub(i64, i16, i64, i16, %struct.float_status*)

define void @helper_fsubr_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  %9 = load i16* %8, align 1
  %10 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %13 = load i16* %12, align 1
  %14 = tail call { i64, i16 } @floatx80_sub(i64 %7, i16 %9, i64 %11, i16 %13, %struct.float_status* %5) nounwind
  %15 = extractvalue { i64, i16 } %14, 0
  %16 = extractvalue { i64, i16 } %14, 1
  store i64 %15, i64* %10, align 8
  store i16 %16, i16* %12, align 8
  ret void
}

define void @helper_fdiv_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  %12 = load i16* %11, align 1
  %13 = and i16 %12, 32767
  %14 = icmp eq i16 %13, 0
  %15 = icmp eq i64 %10, 0
  %.demorgan.i = and i1 %14, %15
  br i1 %.demorgan.i, label %16, label %helper_fdiv.exit

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  %18 = load i16* %17, align 2
  %19 = or i16 %18, 4
  store i16 %19, i16* %17, align 2
  %20 = load %struct.CPUX86State** @env, align 8
  %21 = getelementptr inbounds %struct.CPUX86State* %20, i64 0, i32 17
  %22 = load i16* %21, align 2
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds %struct.CPUX86State* %20, i64 0, i32 18
  %25 = load i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = and i32 %26, 63
  %28 = xor i32 %27, 63
  %29 = and i32 %28, %23
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %helper_fdiv.exit, label %31

; <label>:31                                      ; preds = %16
  %32 = or i16 %22, -32640
  store i16 %32, i16* %21, align 2
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %helper_fdiv.exit

helper_fdiv.exit:                                 ; preds = %31, %16, %0
  %33 = phi %struct.CPUX86State* [ %1, %0 ], [ %20, %16 ], [ %.pre, %31 ]
  %34 = getelementptr inbounds %struct.CPUX86State* %33, i64 0, i32 25
  %35 = tail call { i64, i16 } @floatx80_div(i64 %6, i16 %8, i64 %10, i16 %12, %struct.float_status* %34) nounwind
  %36 = extractvalue { i64, i16 } %35, 0
  %37 = extractvalue { i64, i16 } %35, 1
  store i64 %36, i64* %5, align 8
  store i16 %37, i16* %7, align 8
  ret void
}

define void @helper_fdivr_ST0_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %12 = load i16* %11, align 1
  %13 = and i16 %12, 32767
  %14 = icmp eq i16 %13, 0
  %15 = icmp eq i64 %10, 0
  %.demorgan.i = and i1 %14, %15
  br i1 %.demorgan.i, label %16, label %helper_fdiv.exit

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  %18 = load i16* %17, align 2
  %19 = or i16 %18, 4
  store i16 %19, i16* %17, align 2
  %20 = load %struct.CPUX86State** @env, align 8
  %21 = getelementptr inbounds %struct.CPUX86State* %20, i64 0, i32 17
  %22 = load i16* %21, align 2
  %23 = zext i16 %22 to i32
  %24 = getelementptr inbounds %struct.CPUX86State* %20, i64 0, i32 18
  %25 = load i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = and i32 %26, 63
  %28 = xor i32 %27, 63
  %29 = and i32 %28, %23
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %helper_fdiv.exit, label %31

; <label>:31                                      ; preds = %16
  %32 = or i16 %22, -32640
  store i16 %32, i16* %21, align 2
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %helper_fdiv.exit

helper_fdiv.exit:                                 ; preds = %31, %16, %0
  %33 = phi %struct.CPUX86State* [ %1, %0 ], [ %20, %16 ], [ %.pre, %31 ]
  %34 = getelementptr inbounds %struct.CPUX86State* %33, i64 0, i32 25
  %35 = tail call { i64, i16 } @floatx80_div(i64 %6, i16 %8, i64 %10, i16 %12, %struct.float_status* %34) nounwind
  %36 = extractvalue { i64, i16 } %35, 0
  %37 = extractvalue { i64, i16 } %35, 1
  store i64 %36, i64* %9, align 8
  store i16 %37, i16* %11, align 8
  ret void
}

define void @helper_fadd_STN_ST0(i32 %st_index) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, %st_index
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = zext i32 %3 to i64
  %8 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  %12 = load i16* %11, align 1
  %13 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 0
  %14 = load i64* %13, align 1
  %15 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 1
  %16 = load i16* %15, align 1
  %17 = tail call { i64, i16 } @floatx80_add(i64 %10, i16 %12, i64 %14, i16 %16, %struct.float_status* %8) nounwind
  %18 = extractvalue { i64, i16 } %17, 0
  %19 = extractvalue { i64, i16 } %17, 1
  store i64 %18, i64* %9, align 8
  store i16 %19, i16* %11, align 8
  ret void
}

define void @helper_fmul_STN_ST0(i32 %st_index) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, %st_index
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = zext i32 %3 to i64
  %8 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  %12 = load i16* %11, align 1
  %13 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 0
  %14 = load i64* %13, align 1
  %15 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 1
  %16 = load i16* %15, align 1
  %17 = tail call { i64, i16 } @floatx80_mul(i64 %10, i16 %12, i64 %14, i16 %16, %struct.float_status* %8) nounwind
  %18 = extractvalue { i64, i16 } %17, 0
  %19 = extractvalue { i64, i16 } %17, 1
  store i64 %18, i64* %9, align 8
  store i16 %19, i16* %11, align 8
  ret void
}

define void @helper_fsub_STN_ST0(i32 %st_index) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, %st_index
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = zext i32 %3 to i64
  %8 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  %12 = load i16* %11, align 1
  %13 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 0
  %14 = load i64* %13, align 1
  %15 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 1
  %16 = load i16* %15, align 1
  %17 = tail call { i64, i16 } @floatx80_sub(i64 %10, i16 %12, i64 %14, i16 %16, %struct.float_status* %8) nounwind
  %18 = extractvalue { i64, i16 } %17, 0
  %19 = extractvalue { i64, i16 } %17, 1
  store i64 %18, i64* %9, align 8
  store i16 %19, i16* %11, align 8
  ret void
}

define void @helper_fsubr_STN_ST0(i32 %st_index) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, %st_index
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = zext i32 %3 to i64
  %8 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 1
  %12 = load i16* %11, align 1
  %13 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  %14 = load i64* %13, align 1
  %15 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  %16 = load i16* %15, align 1
  %17 = tail call { i64, i16 } @floatx80_sub(i64 %10, i16 %12, i64 %14, i16 %16, %struct.float_status* %8) nounwind
  %18 = extractvalue { i64, i16 } %17, 0
  %19 = extractvalue { i64, i16 } %17, 1
  store i64 %18, i64* %13, align 8
  store i16 %19, i16* %15, align 8
  ret void
}

define void @helper_fdiv_STN_ST0(i32 %st_index) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, %st_index
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = zext i32 %3 to i64
  %8 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  %9 = load i64* %8, align 1
  %10 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  %11 = load i16* %10, align 1
  %12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 0
  %13 = load i64* %12, align 1
  %14 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 1
  %15 = load i16* %14, align 1
  %16 = and i16 %15, 32767
  %17 = icmp eq i16 %16, 0
  %18 = icmp eq i64 %13, 0
  %.demorgan.i = and i1 %17, %18
  br i1 %.demorgan.i, label %19, label %helper_fdiv.exit

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  %21 = load i16* %20, align 2
  %22 = or i16 %21, 4
  store i16 %22, i16* %20, align 2
  %23 = load %struct.CPUX86State** @env, align 8
  %24 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 17
  %25 = load i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 18
  %28 = load i16* %27, align 2
  %29 = zext i16 %28 to i32
  %30 = and i32 %29, 63
  %31 = xor i32 %30, 63
  %32 = and i32 %31, %26
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %helper_fdiv.exit, label %34

; <label>:34                                      ; preds = %19
  %35 = or i16 %25, -32640
  store i16 %35, i16* %24, align 2
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %helper_fdiv.exit

helper_fdiv.exit:                                 ; preds = %34, %19, %0
  %36 = phi %struct.CPUX86State* [ %1, %0 ], [ %23, %19 ], [ %.pre, %34 ]
  %37 = getelementptr inbounds %struct.CPUX86State* %36, i64 0, i32 25
  %38 = tail call { i64, i16 } @floatx80_div(i64 %9, i16 %11, i64 %13, i16 %15, %struct.float_status* %37) nounwind
  %39 = extractvalue { i64, i16 } %38, 0
  %40 = extractvalue { i64, i16 } %38, 1
  store i64 %39, i64* %8, align 8
  store i16 %40, i16* %10, align 8
  ret void
}

define void @helper_fdivr_STN_ST0(i32 %st_index) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, %st_index
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = zext i32 %3 to i64
  %8 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 0
  %9 = load i64* %8, align 1
  %10 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %7, i32 0, i32 1
  %11 = load i16* %10, align 1
  %12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  %13 = load i64* %12, align 1
  %14 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  %15 = load i16* %14, align 1
  %16 = and i16 %15, 32767
  %17 = icmp eq i16 %16, 0
  %18 = icmp eq i64 %13, 0
  %.demorgan.i = and i1 %17, %18
  br i1 %.demorgan.i, label %19, label %helper_fdiv.exit

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  %21 = load i16* %20, align 2
  %22 = or i16 %21, 4
  store i16 %22, i16* %20, align 2
  %23 = load %struct.CPUX86State** @env, align 8
  %24 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 17
  %25 = load i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 18
  %28 = load i16* %27, align 2
  %29 = zext i16 %28 to i32
  %30 = and i32 %29, 63
  %31 = xor i32 %30, 63
  %32 = and i32 %31, %26
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %helper_fdiv.exit, label %34

; <label>:34                                      ; preds = %19
  %35 = or i16 %25, -32640
  store i16 %35, i16* %24, align 2
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %helper_fdiv.exit

helper_fdiv.exit:                                 ; preds = %34, %19, %0
  %36 = phi %struct.CPUX86State* [ %1, %0 ], [ %23, %19 ], [ %.pre, %34 ]
  %37 = getelementptr inbounds %struct.CPUX86State* %36, i64 0, i32 25
  %38 = tail call { i64, i16 } @floatx80_div(i64 %9, i16 %11, i64 %13, i16 %15, %struct.float_status* %37) nounwind
  %39 = extractvalue { i64, i16 } %38, 0
  %40 = extractvalue { i64, i16 } %38, 1
  store i64 %39, i64* %12, align 8
  store i16 %40, i16* %14, align 8
  ret void
}

define void @helper_fchs_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %6 = load i16* %5, align 1
  %7 = xor i16 %6, -32768
  store i16 %7, i16* %5, align 8
  ret void
}

define void @helper_fabs_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %6 = load i16* %5, align 1
  %7 = and i16 %6, 32767
  store i16 %7, i16* %5, align 8
  ret void
}

define void @helper_fld1_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  store i64 -9223372036854775808, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  store i16 16383, i16* %.12, align 8
  ret void
}

define void @helper_fldl2t_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  store i64 -3127054724296373506, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  store i16 16384, i16* %.12, align 8
  ret void
}

define void @helper_fldl2e_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  store i64 -5140230975865229124, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  store i16 16383, i16* %.12, align 8
  ret void
}

define void @helper_fldpi_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  store i64 -3958705157555305931, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  store i16 16384, i16* %.12, align 8
  ret void
}

define void @helper_fldlg2_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  store i64 -7340697496662837351, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  store i16 16381, i16* %.12, align 8
  ret void
}

define void @helper_fldln2_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  store i64 -5660435428506895956, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  store i16 16382, i16* %.12, align 8
  ret void
}

define void @helper_fldz_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  store i64 0, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  store i16 0, i16* %.12, align 8
  ret void
}

define void @helper_fldz_FT0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 0
  store i64 0, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 26, i32 1
  store i16 0, i16* %.12, align 8
  ret void
}

define i32 @helper_fnstsw() nounwind uwtable readonly sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = and i32 %4, 51199
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %7 = load i32* %6, align 4
  %8 = shl i32 %7, 11
  %9 = and i32 %8, 14336
  %10 = or i32 %9, %5
  ret i32 %10
}

define i32 @helper_fnstcw() nounwind uwtable readonly sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 18
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  ret i32 %4
}

define void @helper_fldcw(i32 %val) nounwind uwtable sspreq {
  %1 = trunc i32 %val to i16
  %2 = load %struct.CPUX86State** @env, align 8
  %3 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 18
  store i16 %1, i16* %3, align 2
  %4 = load %struct.CPUX86State** @env, align 8
  %5 = getelementptr inbounds %struct.CPUX86State* %4, i64 0, i32 18
  %6 = load i16* %5, align 2
  %7 = zext i16 %6 to i32
  %8 = and i32 %7, 3072
  switch i32 %8, label %12 [
    i32 3072, label %11
    i32 1024, label %9
    i32 2048, label %10
  ]

; <label>:9                                       ; preds = %0
  br label %12

; <label>:10                                      ; preds = %0
  br label %12

; <label>:11                                      ; preds = %0
  br label %12

; <label>:12                                      ; preds = %11, %10, %9, %0
  %rnd_type.0.i = phi i32 [ 2, %10 ], [ 1, %9 ], [ 3, %11 ], [ 0, %0 ]
  %13 = getelementptr inbounds %struct.CPUX86State* %4, i64 0, i32 25
  tail call void @set_float_rounding_mode(i32 %rnd_type.0.i, %struct.float_status* %13) nounwind
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 18
  %16 = load i16* %15, align 2
  %17 = zext i16 %16 to i32
  %18 = lshr i32 %17, 8
  %19 = and i32 %18, 3
  switch i32 %19, label %21 [
    i32 0, label %update_fp_status.exit
    i32 2, label %20
  ]

; <label>:20                                      ; preds = %12
  br label %update_fp_status.exit

; <label>:21                                      ; preds = %12
  br label %update_fp_status.exit

update_fp_status.exit:                            ; preds = %21, %20, %12
  %rnd_type.1.i = phi i32 [ 80, %21 ], [ 64, %20 ], [ 32, %12 ]
  %22 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 25
  tail call void @set_floatx80_rounding_precision(i32 %rnd_type.1.i, %struct.float_status* %22) nounwind
  ret void
}

define void @helper_fclex() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  %3 = load i16* %2, align 2
  %4 = and i16 %3, 32512
  store i16 %4, i16* %2, align 2
  ret void
}

define void @helper_fwait() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  %3 = load i16* %2, align 2
  %4 = and i16 %3, 128
  %5 = icmp eq i16 %4, 0
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 14, i64 0
  %8 = load i32* %7, align 4
  %9 = and i32 %8, 32
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %fpu_raise_exception.exit, label %11

; <label>:11                                      ; preds = %6
  tail call fastcc void @raise_exception(i32 16) noreturn nounwind
  unreachable

fpu_raise_exception.exit:                         ; preds = %6
  tail call void @cpu_set_ferr(%struct.CPUX86State* %1) nounwind
  br label %12

; <label>:12                                      ; preds = %fpu_raise_exception.exit, %0
  ret void
}

define void @helper_fninit() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  store i16 0, i16* %2, align 2
  %3 = load %struct.CPUX86State** @env, align 8
  %4 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 16
  store i32 0, i32* %4, align 4
  %5 = load %struct.CPUX86State** @env, align 8
  %6 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 18
  store i16 895, i16* %6, align 2
  %7 = load %struct.CPUX86State** @env, align 8
  %8 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 19, i64 0
  store i8 1, i8* %8, align 1
  %9 = load %struct.CPUX86State** @env, align 8
  %10 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 19, i64 1
  store i8 1, i8* %10, align 1
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 19, i64 2
  store i8 1, i8* %12, align 1
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 19, i64 3
  store i8 1, i8* %14, align 1
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 19, i64 4
  store i8 1, i8* %16, align 1
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 19, i64 5
  store i8 1, i8* %18, align 1
  %19 = load %struct.CPUX86State** @env, align 8
  %20 = getelementptr inbounds %struct.CPUX86State* %19, i64 0, i32 19, i64 6
  store i8 1, i8* %20, align 1
  %21 = load %struct.CPUX86State** @env, align 8
  %22 = getelementptr inbounds %struct.CPUX86State* %21, i64 0, i32 19, i64 7
  store i8 1, i8* %22, align 1
  ret void
}

define void @helper_fbld_ST0(i32 %ptr) nounwind uwtable sspreq {
  %1 = add i32 %ptr, 8
  %2 = tail call fastcc i32 @ldub_data(i32 %1)
  %3 = lshr i32 %2, 4
  %4 = mul i32 %3, 10
  %5 = zext i32 %4 to i64
  %6 = and i32 %2, 15
  %7 = zext i32 %6 to i64
  %8 = add i64 %5, %7
  %9 = add i32 %ptr, 7
  %10 = tail call fastcc i32 @ldub_data(i32 %9)
  %11 = mul i64 %8, 100
  %12 = lshr i32 %10, 4
  %13 = mul i32 %12, 10
  %14 = zext i32 %13 to i64
  %15 = and i32 %10, 15
  %16 = zext i32 %15 to i64
  %17 = add i64 %14, %16
  %18 = add i64 %17, %11
  %19 = add i32 %ptr, 6
  %20 = tail call fastcc i32 @ldub_data(i32 %19)
  %21 = mul i64 %18, 100
  %22 = lshr i32 %20, 4
  %23 = mul i32 %22, 10
  %24 = zext i32 %23 to i64
  %25 = and i32 %20, 15
  %26 = zext i32 %25 to i64
  %27 = add i64 %24, %26
  %28 = add i64 %27, %21
  %29 = add i32 %ptr, 5
  %30 = tail call fastcc i32 @ldub_data(i32 %29)
  %31 = mul i64 %28, 100
  %32 = lshr i32 %30, 4
  %33 = mul i32 %32, 10
  %34 = zext i32 %33 to i64
  %35 = and i32 %30, 15
  %36 = zext i32 %35 to i64
  %37 = add i64 %34, %36
  %38 = add i64 %37, %31
  %39 = add i32 %ptr, 4
  %40 = tail call fastcc i32 @ldub_data(i32 %39)
  %41 = mul i64 %38, 100
  %42 = lshr i32 %40, 4
  %43 = mul i32 %42, 10
  %44 = zext i32 %43 to i64
  %45 = and i32 %40, 15
  %46 = zext i32 %45 to i64
  %47 = add i64 %44, %46
  %48 = add i64 %47, %41
  %49 = add i32 %ptr, 3
  %50 = tail call fastcc i32 @ldub_data(i32 %49)
  %51 = mul i64 %48, 100
  %52 = lshr i32 %50, 4
  %53 = mul i32 %52, 10
  %54 = zext i32 %53 to i64
  %55 = and i32 %50, 15
  %56 = zext i32 %55 to i64
  %57 = add i64 %54, %56
  %58 = add i64 %57, %51
  %59 = add i32 %ptr, 2
  %60 = tail call fastcc i32 @ldub_data(i32 %59)
  %61 = mul i64 %58, 100
  %62 = lshr i32 %60, 4
  %63 = mul i32 %62, 10
  %64 = zext i32 %63 to i64
  %65 = and i32 %60, 15
  %66 = zext i32 %65 to i64
  %67 = add i64 %64, %66
  %68 = add i64 %67, %61
  %69 = add i32 %ptr, 1
  %70 = tail call fastcc i32 @ldub_data(i32 %69)
  %71 = mul i64 %68, 100
  %72 = lshr i32 %70, 4
  %73 = mul i32 %72, 10
  %74 = zext i32 %73 to i64
  %75 = and i32 %70, 15
  %76 = zext i32 %75 to i64
  %77 = add i64 %74, %76
  %78 = add i64 %77, %71
  %79 = tail call fastcc i32 @ldub_data(i32 %ptr)
  %80 = mul i64 %78, 100
  %81 = lshr i32 %79, 4
  %82 = mul i32 %81, 10
  %83 = zext i32 %82 to i64
  %84 = and i32 %79, 15
  %85 = zext i32 %84 to i64
  %86 = add i64 %83, %85
  %87 = add i64 %86, %80
  %88 = load %struct.CPUX86State** @env, align 8
  %89 = getelementptr inbounds %struct.CPUX86State* %88, i64 0, i32 25
  %90 = tail call { i64, i16 } @int64_to_floatx80(i64 %87, %struct.float_status* %89) nounwind
  %91 = extractvalue { i64, i16 } %90, 0
  %92 = extractvalue { i64, i16 } %90, 1
  %93 = add i32 %ptr, 9
  %94 = tail call fastcc i32 @ldub_data(i32 %93)
  %95 = load %struct.CPUX86State** @env, align 8
  %96 = getelementptr inbounds %struct.CPUX86State* %95, i64 0, i32 16
  %97 = load i32* %96, align 4
  %98 = add i32 %97, 7
  %99 = and i32 %98, 7
  store i32 %99, i32* %96, align 4
  %100 = load %struct.CPUX86State** @env, align 8
  %101 = getelementptr inbounds %struct.CPUX86State* %100, i64 0, i32 16
  %102 = load i32* %101, align 4
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds %struct.CPUX86State* %100, i64 0, i32 19, i64 %103
  store i8 0, i8* %104, align 1
  %105 = load %struct.CPUX86State** @env, align 8
  %106 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 16
  %107 = load i32* %106, align 4
  %108 = zext i32 %107 to i64
  %.07 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 21, i64 %108, i32 0, i32 0
  store i64 %91, i64* %.07, align 8
  %.19 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 21, i64 %108, i32 0, i32 1
  store i16 %92, i16* %.19, align 8
  ret void
}

define internal fastcc i32 @ldub_data(i32 %ptr) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 7
  %16 = load i32* %15, align 4
  %17 = and i32 %16, 3
  %18 = icmp eq i32 %17, 3
  %19 = zext i1 %18 to i64
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 0
  %21 = load i32* %20, align 4
  %22 = and i32 %8, -4096
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %27, label %24, !prof !0

; <label>:24                                      ; preds = %6
  %25 = zext i1 %18 to i32
  %26 = tail call zeroext i8 @__ldb_mmu(i32 %8, i32 %25)
  br label %35

; <label>:27                                      ; preds = %6
  %28 = and i64 %7, 4294967295
  %29 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 3
  %30 = load i64* %29, align 8
  %31 = add i64 %30, %28
  %32 = inttoptr i64 %31 to i8*
  %33 = load i8* %32, align 1
  %34 = zext i8 %33 to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %28, i64 %31, i64 %34, i32 32, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %35

; <label>:35                                      ; preds = %27, %24
  %res.0.in = phi i8 [ %26, %24 ], [ %33, %27 ]
  %res.0 = zext i8 %res.0.in to i32
  ret i32 %res.0
}

define void @helper_fbst_ST0(i32 %ptr) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = tail call i64 @floatx80_to_int64(i64 %7, i16 %9, %struct.float_status* %5) nounwind
  %11 = add i32 %ptr, 9
  %12 = icmp slt i64 %10, 0
  br i1 %12, label %13, label %15

; <label>:13                                      ; preds = %0
  tail call fastcc void @stb_data(i32 %11, i32 128)
  %14 = sub nsw i64 0, %10
  br label %.preheader2

; <label>:15                                      ; preds = %0
  tail call fastcc void @stb_data(i32 %11, i32 0)
  br label %.preheader2

.preheader2:                                      ; preds = %15, %13
  %val.0.ph = phi i64 [ %14, %13 ], [ %10, %15 ]
  %16 = icmp ugt i32 %ptr, -10
  %17 = icmp eq i64 %val.0.ph, 0
  %or.cond3 = or i1 %16, %17
  br i1 %or.cond3, label %.preheader, label %.lr.ph6

.preheader:                                       ; preds = %.lr.ph6, %.preheader2
  %mem_ref.0.lcssa = phi i32 [ %ptr, %.preheader2 ], [ %26, %.lr.ph6 ]
  %18 = icmp ult i32 %mem_ref.0.lcssa, %11
  br i1 %18, label %.lr.ph, label %._crit_edge

.lr.ph6:                                          ; preds = %.lr.ph6, %.preheader2
  %val.05 = phi i64 [ %21, %.lr.ph6 ], [ %val.0.ph, %.preheader2 ]
  %mem_ref.04 = phi i32 [ %26, %.lr.ph6 ], [ %ptr, %.preheader2 ]
  %19 = srem i64 %val.05, 100
  %20 = trunc i64 %19 to i32
  %21 = sdiv i64 %val.05, 100
  %22 = sdiv i32 %20, 10
  %23 = shl i32 %22, 4
  %24 = srem i32 %20, 10
  %25 = or i32 %23, %24
  %26 = add i32 %mem_ref.04, 1
  tail call fastcc void @stb_data(i32 %mem_ref.04, i32 %25)
  %27 = icmp uge i32 %26, %11
  %val.05.off = add i64 %val.05, 99
  %28 = icmp ult i64 %val.05.off, 199
  %or.cond = or i1 %27, %28
  br i1 %or.cond, label %.preheader, label %.lr.ph6

.lr.ph:                                           ; preds = %.lr.ph, %.preheader
  %mem_ref.11 = phi i32 [ %29, %.lr.ph ], [ %mem_ref.0.lcssa, %.preheader ]
  %29 = add i32 %mem_ref.11, 1
  tail call fastcc void @stb_data(i32 %mem_ref.11, i32 0)
  %exitcond = icmp eq i32 %29, %11
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  ret void
}

define internal fastcc void @stb_data(i32 %ptr, i32 %v) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 7
  %16 = load i32* %15, align 4
  %17 = and i32 %16, 3
  %18 = icmp eq i32 %17, 3
  %19 = zext i1 %18 to i64
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 1
  %21 = load i32* %20, align 4
  %22 = and i32 %8, -4096
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %27, label %24, !prof !0

; <label>:24                                      ; preds = %6
  %25 = zext i1 %18 to i32
  %26 = trunc i32 %v to i8
  tail call void @__stb_mmu(i32 %8, i8 zeroext %26, i32 %25)
  br label %35

; <label>:27                                      ; preds = %6
  %28 = and i64 %7, 4294967295
  %29 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 3
  %30 = load i64* %29, align 8
  %31 = add i64 %30, %28
  %32 = inttoptr i64 %31 to i8*
  %33 = trunc i32 %v to i8
  store i8 %33, i8* %32, align 1
  %34 = zext i32 %v to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %28, i64 %31, i64 %34, i32 32, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %35

; <label>:35                                      ; preds = %27, %24
  ret void
}

define void @helper_f2xm1() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %10 = tail call i64 @floatx80_to_float64(i64 %6, i16 %8, %struct.float_status* %9) nounwind
  %11 = bitcast i64 %10 to double
  %exp2 = tail call double @exp2(double %11) nounwind readonly
  %12 = fadd double %exp2, -1.000000e+00
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 16
  %15 = load i32* %14, align 4
  %16 = zext i32 %15 to i64
  %17 = bitcast double %12 to i64
  %18 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 25
  %19 = tail call { i64, i16 } @float64_to_floatx80(i64 %17, %struct.float_status* %18) nounwind
  %20 = extractvalue { i64, i16 } %19, 0
  %21 = extractvalue { i64, i16 } %19, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 21, i64 %16, i32 0, i32 0
  store i64 %20, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 21, i64 %16, i32 0, i32 1
  store i16 %21, i16* %.12, align 8
  ret void
}

define void @helper_fyl2x() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %10 = tail call i64 @floatx80_to_float64(i64 %6, i16 %8, %struct.float_status* %9) nounwind
  %11 = bitcast i64 %10 to double
  %12 = fcmp ogt double %11, 0.000000e+00
  br i1 %12, label %13, label %51

; <label>:13                                      ; preds = %0
  %14 = tail call double @log(double %11) nounwind
  %15 = fdiv double %14, 0x3FE62E42FEFA39EF
  %16 = load %struct.CPUX86State** @env, align 8
  %17 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 16
  %18 = load i32* %17, align 4
  %19 = add i32 %18, 1
  %20 = and i32 %19, 7
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 21, i64 %21, i32 0, i32 0
  %23 = load i64* %22, align 1
  %24 = getelementptr %struct.CPUX86State* %16, i64 0, i32 21, i64 %21, i32 0, i32 1
  %25 = load i16* %24, align 1
  %26 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 25
  %27 = tail call i64 @floatx80_to_float64(i64 %23, i16 %25, %struct.float_status* %26) nounwind
  %28 = bitcast i64 %27 to double
  %29 = fmul double %15, %28
  %30 = load %struct.CPUX86State** @env, align 8
  %31 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 16
  %32 = load i32* %31, align 4
  %33 = add i32 %32, 1
  %34 = and i32 %33, 7
  %35 = zext i32 %34 to i64
  %36 = bitcast double %29 to i64
  %37 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 25
  %38 = tail call { i64, i16 } @float64_to_floatx80(i64 %36, %struct.float_status* %37) nounwind
  %39 = extractvalue { i64, i16 } %38, 0
  %40 = extractvalue { i64, i16 } %38, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 21, i64 %35, i32 0, i32 0
  store i64 %39, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 21, i64 %35, i32 0, i32 1
  store i16 %40, i16* %.12, align 8
  %41 = load %struct.CPUX86State** @env, align 8
  %42 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 16
  %43 = load i32* %42, align 4
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 19, i64 %44
  store i8 1, i8* %45, align 1
  %46 = load %struct.CPUX86State** @env, align 8
  %47 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 16
  %48 = load i32* %47, align 4
  %49 = add i32 %48, 1
  %50 = and i32 %49, 7
  store i32 %50, i32* %47, align 4
  br label %60

; <label>:51                                      ; preds = %0
  %52 = load %struct.CPUX86State** @env, align 8
  %53 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 17
  %54 = load i16* %53, align 2
  %55 = and i16 %54, -18177
  store i16 %55, i16* %53, align 2
  %56 = load %struct.CPUX86State** @env, align 8
  %57 = getelementptr inbounds %struct.CPUX86State* %56, i64 0, i32 17
  %58 = load i16* %57, align 2
  %59 = or i16 %58, 1024
  store i16 %59, i16* %57, align 2
  br label %60

; <label>:60                                      ; preds = %51, %13
  ret void
}

declare double @log(double) nounwind

define void @helper_fptan() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %10 = tail call i64 @floatx80_to_float64(i64 %6, i16 %8, %struct.float_status* %9) nounwind
  %11 = bitcast i64 %10 to double
  %12 = fcmp ogt double %11, 0x43E0000000000000
  %13 = fcmp olt double %11, 0xC3E0000000000000
  %or.cond = or i1 %12, %13
  br i1 %or.cond, label %14, label %19

; <label>:14                                      ; preds = %0
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 17
  %17 = load i16* %16, align 2
  %18 = or i16 %17, 1024
  store i16 %18, i16* %16, align 2
  br label %48

; <label>:19                                      ; preds = %0
  %20 = tail call double @tan(double %11) nounwind
  %21 = load %struct.CPUX86State** @env, align 8
  %22 = getelementptr inbounds %struct.CPUX86State* %21, i64 0, i32 16
  %23 = load i32* %22, align 4
  %24 = zext i32 %23 to i64
  %25 = bitcast double %20 to i64
  %26 = getelementptr inbounds %struct.CPUX86State* %21, i64 0, i32 25
  %27 = tail call { i64, i16 } @float64_to_floatx80(i64 %25, %struct.float_status* %26) nounwind
  %28 = extractvalue { i64, i16 } %27, 0
  %29 = extractvalue { i64, i16 } %27, 1
  %.07 = getelementptr inbounds %struct.CPUX86State* %21, i64 0, i32 21, i64 %24, i32 0, i32 0
  store i64 %28, i64* %.07, align 8
  %.19 = getelementptr inbounds %struct.CPUX86State* %21, i64 0, i32 21, i64 %24, i32 0, i32 1
  store i16 %29, i16* %.19, align 8
  %30 = load %struct.CPUX86State** @env, align 8
  %31 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 16
  %32 = load i32* %31, align 4
  %33 = add i32 %32, 7
  %34 = and i32 %33, 7
  store i32 %34, i32* %31, align 4
  %35 = load %struct.CPUX86State** @env, align 8
  %36 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 16
  %37 = load i32* %36, align 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 19, i64 %38
  store i8 0, i8* %39, align 1
  %40 = load %struct.CPUX86State** @env, align 8
  %41 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 16
  %42 = load i32* %41, align 4
  %43 = zext i32 %42 to i64
  %.02 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 21, i64 %43, i32 0, i32 0
  store i64 -9223372036854775808, i64* %.02, align 8
  %.13 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 21, i64 %43, i32 0, i32 1
  store i16 16383, i16* %.13, align 8
  %44 = load %struct.CPUX86State** @env, align 8
  %45 = getelementptr inbounds %struct.CPUX86State* %44, i64 0, i32 17
  %46 = load i16* %45, align 2
  %47 = and i16 %46, -1025
  store i16 %47, i16* %45, align 2
  br label %48

; <label>:48                                      ; preds = %19, %14
  ret void
}

declare double @tan(double) nounwind

define void @helper_fpatan() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 1
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  %8 = load i64* %7, align 1
  %9 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  %10 = load i16* %9, align 1
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %12 = tail call i64 @floatx80_to_float64(i64 %8, i16 %10, %struct.float_status* %11) nounwind
  %13 = bitcast i64 %12 to double
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 16
  %16 = load i32* %15, align 4
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 21, i64 %17, i32 0, i32 0
  %19 = load i64* %18, align 1
  %20 = getelementptr %struct.CPUX86State* %14, i64 0, i32 21, i64 %17, i32 0, i32 1
  %21 = load i16* %20, align 1
  %22 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 25
  %23 = tail call i64 @floatx80_to_float64(i64 %19, i16 %21, %struct.float_status* %22) nounwind
  %24 = bitcast i64 %23 to double
  %25 = load %struct.CPUX86State** @env, align 8
  %26 = getelementptr inbounds %struct.CPUX86State* %25, i64 0, i32 16
  %27 = load i32* %26, align 4
  %28 = add i32 %27, 1
  %29 = and i32 %28, 7
  %30 = zext i32 %29 to i64
  %31 = tail call double @atan2(double %13, double %24) nounwind
  %32 = bitcast double %31 to i64
  %33 = load %struct.CPUX86State** @env, align 8
  %34 = getelementptr inbounds %struct.CPUX86State* %33, i64 0, i32 25
  %35 = tail call { i64, i16 } @float64_to_floatx80(i64 %32, %struct.float_status* %34) nounwind
  %36 = extractvalue { i64, i16 } %35, 0
  %37 = extractvalue { i64, i16 } %35, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %25, i64 0, i32 21, i64 %30, i32 0, i32 0
  store i64 %36, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %25, i64 0, i32 21, i64 %30, i32 0, i32 1
  store i16 %37, i16* %.12, align 8
  %38 = load %struct.CPUX86State** @env, align 8
  %39 = getelementptr inbounds %struct.CPUX86State* %38, i64 0, i32 16
  %40 = load i32* %39, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds %struct.CPUX86State* %38, i64 0, i32 19, i64 %41
  store i8 1, i8* %42, align 1
  %43 = load %struct.CPUX86State** @env, align 8
  %44 = getelementptr inbounds %struct.CPUX86State* %43, i64 0, i32 16
  %45 = load i32* %44, align 4
  %46 = add i32 %45, 1
  %47 = and i32 %46, 7
  store i32 %47, i32* %44, align 4
  ret void
}

declare double @atan2(double, double) nounwind

define void @helper_fxtract() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4
  %6 = bitcast %union.FPReg* %5 to i128*
  %srcval = load i128* %6, align 8
  %trunc = trunc i128 %srcval to i64
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = and i16 %8, 32767
  %10 = icmp eq i16 %9, 0
  %11 = icmp eq i64 %trunc, 0
  %.demorgan = and i1 %10, %11
  br i1 %.demorgan, label %12, label %33

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %14 = tail call { i64, i16 } @floatx80_div(i64 -9223372036854775808, i16 -16385, i64 0, i16 0, %struct.float_status* %13) nounwind
  %15 = extractvalue { i64, i16 } %14, 0
  %16 = extractvalue { i64, i16 } %14, 1
  %.06 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  store i64 %15, i64* %.06, align 8
  store i16 %16, i16* %7, align 8
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 16
  %19 = load i32* %18, align 4
  %20 = add i32 %19, 7
  %21 = and i32 %20, 7
  store i32 %21, i32* %18, align 4
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 16
  %24 = load i32* %23, align 4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 19, i64 %25
  store i8 0, i8* %26, align 1
  %27 = load %struct.CPUX86State** @env, align 8
  %28 = getelementptr inbounds %struct.CPUX86State* %27, i64 0, i32 16
  %29 = load i32* %28, align 4
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds %struct.CPUX86State* %27, i64 0, i32 21, i64 %30
  %32 = bitcast %union.FPReg* %31 to i128*
  store i128 %srcval, i128* %32, align 8
  br label %61

; <label>:33                                      ; preds = %0
  %34 = lshr i128 %srcval, 64
  %35 = trunc i128 %34 to i32
  %36 = and i32 %35, 32767
  %37 = add nsw i32 %36, -16383
  %38 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %39 = tail call { i64, i16 } @int32_to_floatx80(i32 %37, %struct.float_status* %38) nounwind
  %40 = extractvalue { i64, i16 } %39, 0
  %41 = extractvalue { i64, i16 } %39, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  store i64 %40, i64* %.01, align 8
  store i16 %41, i16* %7, align 8
  %42 = load %struct.CPUX86State** @env, align 8
  %43 = getelementptr inbounds %struct.CPUX86State* %42, i64 0, i32 16
  %44 = load i32* %43, align 4
  %45 = add i32 %44, 7
  %46 = and i32 %45, 7
  store i32 %46, i32* %43, align 4
  %47 = load %struct.CPUX86State** @env, align 8
  %48 = getelementptr inbounds %struct.CPUX86State* %47, i64 0, i32 16
  %49 = load i32* %48, align 4
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds %struct.CPUX86State* %47, i64 0, i32 19, i64 %50
  store i8 0, i8* %51, align 1
  %52 = and i32 %35, 32768
  %.mask = or i32 %52, 16383
  %53 = zext i32 %.mask to i128
  %54 = shl nuw nsw i128 %53, 64
  %mask = and i128 %srcval, -1208907372870555465154561
  %ins = or i128 %54, %mask
  %55 = load %struct.CPUX86State** @env, align 8
  %56 = getelementptr inbounds %struct.CPUX86State* %55, i64 0, i32 16
  %57 = load i32* %56, align 4
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds %struct.CPUX86State* %55, i64 0, i32 21, i64 %58
  %60 = bitcast %union.FPReg* %59 to i128*
  store i128 %ins, i128* %60, align 8
  br label %61

; <label>:61                                      ; preds = %33, %12
  ret void
}

declare { i64, i16 } @floatx80_div(i64, i16, i64, i16, %struct.float_status*)

define void @helper_fprem1() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %10 = tail call i64 @floatx80_to_float64(i64 %6, i16 %8, %struct.float_status* %9) nounwind
  %11 = bitcast i64 %10 to double
  %12 = load %struct.CPUX86State** @env, align 8
  %13 = getelementptr inbounds %struct.CPUX86State* %12, i64 0, i32 16
  %14 = load i32* %13, align 4
  %15 = add i32 %14, 1
  %16 = and i32 %15, 7
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds %struct.CPUX86State* %12, i64 0, i32 21, i64 %17, i32 0, i32 0
  %19 = load i64* %18, align 1
  %20 = getelementptr %struct.CPUX86State* %12, i64 0, i32 21, i64 %17, i32 0, i32 1
  %21 = load i16* %20, align 1
  %22 = getelementptr inbounds %struct.CPUX86State* %12, i64 0, i32 25
  %23 = tail call i64 @floatx80_to_float64(i64 %19, i16 %21, %struct.float_status* %22) nounwind
  %24 = bitcast i64 %23 to double
  %25 = tail call i32 @__isinf(double %11) nounwind readnone
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %34

; <label>:27                                      ; preds = %0
  %28 = tail call i32 @__isnan(double %11) nounwind readnone
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30                                      ; preds = %27
  %31 = tail call i32 @__isnan(double %24) nounwind readnone
  %32 = icmp ne i32 %31, 0
  %33 = fcmp oeq double %24, 0.000000e+00
  %or.cond = or i1 %32, %33
  br i1 %or.cond, label %34, label %47

; <label>:34                                      ; preds = %30, %27, %0
  %35 = load %struct.CPUX86State** @env, align 8
  %36 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 16
  %37 = load i32* %36, align 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 25
  %40 = tail call { i64, i16 } @float64_to_floatx80(i64 9221120237041090560, %struct.float_status* %39) nounwind
  %41 = extractvalue { i64, i16 } %40, 0
  %42 = extractvalue { i64, i16 } %40, 1
  %.07 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 21, i64 %38, i32 0, i32 0
  store i64 %41, i64* %.07, align 8
  %.18 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 21, i64 %38, i32 0, i32 1
  store i16 %42, i16* %.18, align 8
  %43 = load %struct.CPUX86State** @env, align 8
  %44 = getelementptr inbounds %struct.CPUX86State* %43, i64 0, i32 17
  %45 = load i16* %44, align 2
  %46 = and i16 %45, -18177
  store i16 %46, i16* %44, align 2
  br label %131

; <label>:47                                      ; preds = %30
  %48 = load %struct.CPUX86State** @env, align 8
  %49 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 16
  %50 = load i32* %49, align 4
  %51 = zext i32 %50 to i64
  %.117 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 21, i64 %51, i32 0, i32 1
  %tmp18 = load i16* %.117, align 8
  %52 = add i32 %50, 1
  %53 = and i32 %52, 7
  %54 = zext i32 %53 to i64
  %.112 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 21, i64 %54, i32 0, i32 1
  %tmp13 = load i16* %.112, align 8
  %55 = zext i16 %tmp18 to i32
  %56 = and i32 %55, 32767
  %57 = zext i16 %tmp13 to i32
  %58 = and i32 %57, 32767
  %59 = sub nsw i32 %56, %58
  %60 = icmp slt i32 %59, 0
  br i1 %60, label %61, label %65

; <label>:61                                      ; preds = %47
  %62 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 17
  %63 = load i16* %62, align 2
  %64 = and i16 %63, -18177
  store i16 %64, i16* %62, align 2
  br label %131

; <label>:65                                      ; preds = %47
  %66 = icmp slt i32 %59, 53
  br i1 %66, label %67, label %103

; <label>:67                                      ; preds = %65
  %68 = fdiv double %11, %24
  %69 = tail call double @rint(double %68) nounwind
  %70 = fmul double %24, %69
  %71 = fcmp olt double %69, 0.000000e+00
  br i1 %71, label %72, label %74

; <label>:72                                      ; preds = %67
  %73 = fsub double -0.000000e+00, %69
  br label %74

; <label>:74                                      ; preds = %72, %67
  %q.0.in = phi double [ %73, %72 ], [ %69, %67 ]
  %q.0 = fptosi double %q.0.in to i64
  %75 = load %struct.CPUX86State** @env, align 8
  %76 = getelementptr inbounds %struct.CPUX86State* %75, i64 0, i32 17
  %77 = load i16* %76, align 2
  %78 = and i16 %77, -18177
  store i16 %78, i16* %76, align 2
  %79 = shl i64 %q.0, 6
  %80 = and i64 %79, 256
  %81 = load %struct.CPUX86State** @env, align 8
  %82 = getelementptr inbounds %struct.CPUX86State* %81, i64 0, i32 17
  %83 = load i16* %82, align 2
  %84 = zext i16 %83 to i64
  %85 = or i64 %84, %80
  %86 = trunc i64 %85 to i16
  store i16 %86, i16* %82, align 2
  %87 = shl i64 %q.0, 13
  %88 = and i64 %87, 16384
  %89 = load %struct.CPUX86State** @env, align 8
  %90 = getelementptr inbounds %struct.CPUX86State* %89, i64 0, i32 17
  %91 = load i16* %90, align 2
  %92 = zext i16 %91 to i64
  %93 = or i64 %92, %88
  %94 = trunc i64 %93 to i16
  store i16 %94, i16* %90, align 2
  %95 = shl i64 %q.0, 9
  %96 = and i64 %95, 512
  %97 = load %struct.CPUX86State** @env, align 8
  %98 = getelementptr inbounds %struct.CPUX86State* %97, i64 0, i32 17
  %99 = load i16* %98, align 2
  %100 = zext i16 %99 to i64
  %101 = or i64 %100, %96
  %102 = trunc i64 %101 to i16
  store i16 %102, i16* %98, align 2
  br label %121

; <label>:103                                     ; preds = %65
  %104 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 17
  %105 = load i16* %104, align 2
  %106 = or i16 %105, 1024
  store i16 %106, i16* %104, align 2
  %107 = add nsw i32 %59, -50
  %exp2 = tail call double @ldexp(double 1.000000e+00, i32 %107) nounwind
  %108 = fdiv double %11, %24
  %109 = fdiv double %108, %exp2
  %110 = fcmp olt double %109, 0.000000e+00
  br i1 %110, label %111, label %115

; <label>:111                                     ; preds = %103
  %112 = tail call double @fabs(double %109) nounwind readnone
  %113 = tail call double @floor(double %112) nounwind readnone
  %114 = fsub double -0.000000e+00, %113
  br label %117

; <label>:115                                     ; preds = %103
  %116 = tail call double @floor(double %109) nounwind readnone
  br label %117

; <label>:117                                     ; preds = %115, %111
  %118 = phi double [ %114, %111 ], [ %116, %115 ]
  %119 = fmul double %24, %118
  %120 = fmul double %119, %exp2
  br label %121

; <label>:121                                     ; preds = %117, %74
  %.pn = phi double [ %70, %74 ], [ %120, %117 ]
  %st0.0 = fsub double %11, %.pn
  %122 = load %struct.CPUX86State** @env, align 8
  %123 = getelementptr inbounds %struct.CPUX86State* %122, i64 0, i32 16
  %124 = load i32* %123, align 4
  %125 = zext i32 %124 to i64
  %126 = bitcast double %st0.0 to i64
  %127 = getelementptr inbounds %struct.CPUX86State* %122, i64 0, i32 25
  %128 = tail call { i64, i16 } @float64_to_floatx80(i64 %126, %struct.float_status* %127) nounwind
  %129 = extractvalue { i64, i16 } %128, 0
  %130 = extractvalue { i64, i16 } %128, 1
  %.02 = getelementptr inbounds %struct.CPUX86State* %122, i64 0, i32 21, i64 %125, i32 0, i32 0
  store i64 %129, i64* %.02, align 8
  %.13 = getelementptr inbounds %struct.CPUX86State* %122, i64 0, i32 21, i64 %125, i32 0, i32 1
  store i16 %130, i16* %.13, align 8
  br label %131

; <label>:131                                     ; preds = %121, %61, %34
  ret void
}

declare i32 @__isinf(double) nounwind readnone

declare i32 @__isnan(double) nounwind readnone

declare double @rint(double) nounwind

declare double @floor(double) nounwind readnone

declare double @fabs(double) nounwind readnone

define void @helper_fprem() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %10 = tail call i64 @floatx80_to_float64(i64 %6, i16 %8, %struct.float_status* %9) nounwind
  %11 = bitcast i64 %10 to double
  %12 = load %struct.CPUX86State** @env, align 8
  %13 = getelementptr inbounds %struct.CPUX86State* %12, i64 0, i32 16
  %14 = load i32* %13, align 4
  %15 = add i32 %14, 1
  %16 = and i32 %15, 7
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds %struct.CPUX86State* %12, i64 0, i32 21, i64 %17, i32 0, i32 0
  %19 = load i64* %18, align 1
  %20 = getelementptr %struct.CPUX86State* %12, i64 0, i32 21, i64 %17, i32 0, i32 1
  %21 = load i16* %20, align 1
  %22 = getelementptr inbounds %struct.CPUX86State* %12, i64 0, i32 25
  %23 = tail call i64 @floatx80_to_float64(i64 %19, i16 %21, %struct.float_status* %22) nounwind
  %24 = bitcast i64 %23 to double
  %25 = tail call i32 @__isinf(double %11) nounwind readnone
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %34

; <label>:27                                      ; preds = %0
  %28 = tail call i32 @__isnan(double %11) nounwind readnone
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30                                      ; preds = %27
  %31 = tail call i32 @__isnan(double %24) nounwind readnone
  %32 = icmp ne i32 %31, 0
  %33 = fcmp oeq double %24, 0.000000e+00
  %or.cond = or i1 %32, %33
  br i1 %or.cond, label %34, label %47

; <label>:34                                      ; preds = %30, %27, %0
  %35 = load %struct.CPUX86State** @env, align 8
  %36 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 16
  %37 = load i32* %36, align 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 25
  %40 = tail call { i64, i16 } @float64_to_floatx80(i64 9221120237041090560, %struct.float_status* %39) nounwind
  %41 = extractvalue { i64, i16 } %40, 0
  %42 = extractvalue { i64, i16 } %40, 1
  %.07 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 21, i64 %38, i32 0, i32 0
  store i64 %41, i64* %.07, align 8
  %.18 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 21, i64 %38, i32 0, i32 1
  store i16 %42, i16* %.18, align 8
  %43 = load %struct.CPUX86State** @env, align 8
  %44 = getelementptr inbounds %struct.CPUX86State* %43, i64 0, i32 17
  %45 = load i16* %44, align 2
  %46 = and i16 %45, -18177
  store i16 %46, i16* %44, align 2
  br label %137

; <label>:47                                      ; preds = %30
  %48 = load %struct.CPUX86State** @env, align 8
  %49 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 16
  %50 = load i32* %49, align 4
  %51 = zext i32 %50 to i64
  %.117 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 21, i64 %51, i32 0, i32 1
  %tmp18 = load i16* %.117, align 8
  %52 = add i32 %50, 1
  %53 = and i32 %52, 7
  %54 = zext i32 %53 to i64
  %.112 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 21, i64 %54, i32 0, i32 1
  %tmp13 = load i16* %.112, align 8
  %55 = zext i16 %tmp18 to i32
  %56 = and i32 %55, 32767
  %57 = zext i16 %tmp13 to i32
  %58 = and i32 %57, 32767
  %59 = sub nsw i32 %56, %58
  %60 = icmp slt i32 %59, 0
  br i1 %60, label %61, label %65

; <label>:61                                      ; preds = %47
  %62 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 17
  %63 = load i16* %62, align 2
  %64 = and i16 %63, -18177
  store i16 %64, i16* %62, align 2
  br label %137

; <label>:65                                      ; preds = %47
  %66 = icmp slt i32 %59, 53
  br i1 %66, label %67, label %108

; <label>:67                                      ; preds = %65
  %68 = fdiv double %11, %24
  %69 = fcmp olt double %68, 0.000000e+00
  br i1 %69, label %70, label %72

; <label>:70                                      ; preds = %67
  %71 = tail call double @ceil(double %68) nounwind readnone
  br label %74

; <label>:72                                      ; preds = %67
  %73 = tail call double @floor(double %68) nounwind readnone
  br label %74

; <label>:74                                      ; preds = %72, %70
  %75 = phi double [ %71, %70 ], [ %73, %72 ]
  %76 = fmul double %24, %75
  %77 = fcmp olt double %75, 0.000000e+00
  br i1 %77, label %78, label %80

; <label>:78                                      ; preds = %74
  %79 = fsub double -0.000000e+00, %75
  br label %80

; <label>:80                                      ; preds = %78, %74
  %q.0.in = phi double [ %79, %78 ], [ %75, %74 ]
  %q.0 = fptosi double %q.0.in to i64
  %81 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 17
  %82 = load i16* %81, align 2
  %83 = and i16 %82, -18177
  store i16 %83, i16* %81, align 2
  %84 = shl i64 %q.0, 6
  %85 = and i64 %84, 256
  %86 = load %struct.CPUX86State** @env, align 8
  %87 = getelementptr inbounds %struct.CPUX86State* %86, i64 0, i32 17
  %88 = load i16* %87, align 2
  %89 = zext i16 %88 to i64
  %90 = or i64 %89, %85
  %91 = trunc i64 %90 to i16
  store i16 %91, i16* %87, align 2
  %92 = shl i64 %q.0, 13
  %93 = and i64 %92, 16384
  %94 = load %struct.CPUX86State** @env, align 8
  %95 = getelementptr inbounds %struct.CPUX86State* %94, i64 0, i32 17
  %96 = load i16* %95, align 2
  %97 = zext i16 %96 to i64
  %98 = or i64 %97, %93
  %99 = trunc i64 %98 to i16
  store i16 %99, i16* %95, align 2
  %100 = shl i64 %q.0, 9
  %101 = and i64 %100, 512
  %102 = load %struct.CPUX86State** @env, align 8
  %103 = getelementptr inbounds %struct.CPUX86State* %102, i64 0, i32 17
  %104 = load i16* %103, align 2
  %105 = zext i16 %104 to i64
  %106 = or i64 %105, %101
  %107 = trunc i64 %106 to i16
  store i16 %107, i16* %103, align 2
  br label %127

; <label>:108                                     ; preds = %65
  %109 = srem i32 %59, 32
  %110 = getelementptr inbounds %struct.CPUX86State* %48, i64 0, i32 17
  %111 = load i16* %110, align 2
  %112 = or i16 %111, 1024
  store i16 %112, i16* %110, align 2
  %.neg19 = add i32 %59, -32
  %113 = sub i32 %.neg19, %109
  %exp2 = tail call double @ldexp(double 1.000000e+00, i32 %113) nounwind
  %114 = fdiv double %11, %24
  %115 = fdiv double %114, %exp2
  %116 = fcmp olt double %115, 0.000000e+00
  br i1 %116, label %117, label %121

; <label>:117                                     ; preds = %108
  %118 = tail call double @fabs(double %115) nounwind readnone
  %119 = tail call double @floor(double %118) nounwind readnone
  %120 = fsub double -0.000000e+00, %119
  br label %123

; <label>:121                                     ; preds = %108
  %122 = tail call double @floor(double %115) nounwind readnone
  br label %123

; <label>:123                                     ; preds = %121, %117
  %124 = phi double [ %120, %117 ], [ %122, %121 ]
  %125 = fmul double %24, %124
  %126 = fmul double %125, %exp2
  br label %127

; <label>:127                                     ; preds = %123, %80
  %.pn = phi double [ %76, %80 ], [ %126, %123 ]
  %st0.0 = fsub double %11, %.pn
  %128 = load %struct.CPUX86State** @env, align 8
  %129 = getelementptr inbounds %struct.CPUX86State* %128, i64 0, i32 16
  %130 = load i32* %129, align 4
  %131 = zext i32 %130 to i64
  %132 = bitcast double %st0.0 to i64
  %133 = getelementptr inbounds %struct.CPUX86State* %128, i64 0, i32 25
  %134 = tail call { i64, i16 } @float64_to_floatx80(i64 %132, %struct.float_status* %133) nounwind
  %135 = extractvalue { i64, i16 } %134, 0
  %136 = extractvalue { i64, i16 } %134, 1
  %.02 = getelementptr inbounds %struct.CPUX86State* %128, i64 0, i32 21, i64 %131, i32 0, i32 0
  store i64 %135, i64* %.02, align 8
  %.13 = getelementptr inbounds %struct.CPUX86State* %128, i64 0, i32 21, i64 %131, i32 0, i32 1
  store i16 %136, i16* %.13, align 8
  br label %137

; <label>:137                                     ; preds = %127, %61, %34
  ret void
}

declare double @ceil(double) nounwind readnone

define void @helper_fyl2xp1() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %10 = tail call i64 @floatx80_to_float64(i64 %6, i16 %8, %struct.float_status* %9) nounwind
  %11 = bitcast i64 %10 to double
  %12 = fadd double %11, 1.000000e+00
  %13 = fcmp ogt double %12, 0.000000e+00
  br i1 %13, label %14, label %52

; <label>:14                                      ; preds = %0
  %15 = tail call double @log(double %12) nounwind
  %16 = fdiv double %15, 0x3FE62E42FEFA39EF
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 16
  %19 = load i32* %18, align 4
  %20 = add i32 %19, 1
  %21 = and i32 %20, 7
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 21, i64 %22, i32 0, i32 0
  %24 = load i64* %23, align 1
  %25 = getelementptr %struct.CPUX86State* %17, i64 0, i32 21, i64 %22, i32 0, i32 1
  %26 = load i16* %25, align 1
  %27 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 25
  %28 = tail call i64 @floatx80_to_float64(i64 %24, i16 %26, %struct.float_status* %27) nounwind
  %29 = bitcast i64 %28 to double
  %30 = fmul double %16, %29
  %31 = load %struct.CPUX86State** @env, align 8
  %32 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 16
  %33 = load i32* %32, align 4
  %34 = add i32 %33, 1
  %35 = and i32 %34, 7
  %36 = zext i32 %35 to i64
  %37 = bitcast double %30 to i64
  %38 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 25
  %39 = tail call { i64, i16 } @float64_to_floatx80(i64 %37, %struct.float_status* %38) nounwind
  %40 = extractvalue { i64, i16 } %39, 0
  %41 = extractvalue { i64, i16 } %39, 1
  %.01 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 21, i64 %36, i32 0, i32 0
  store i64 %40, i64* %.01, align 8
  %.12 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 21, i64 %36, i32 0, i32 1
  store i16 %41, i16* %.12, align 8
  %42 = load %struct.CPUX86State** @env, align 8
  %43 = getelementptr inbounds %struct.CPUX86State* %42, i64 0, i32 16
  %44 = load i32* %43, align 4
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds %struct.CPUX86State* %42, i64 0, i32 19, i64 %45
  store i8 1, i8* %46, align 1
  %47 = load %struct.CPUX86State** @env, align 8
  %48 = getelementptr inbounds %struct.CPUX86State* %47, i64 0, i32 16
  %49 = load i32* %48, align 4
  %50 = add i32 %49, 1
  %51 = and i32 %50, 7
  store i32 %51, i32* %48, align 4
  br label %61

; <label>:52                                      ; preds = %0
  %53 = load %struct.CPUX86State** @env, align 8
  %54 = getelementptr inbounds %struct.CPUX86State* %53, i64 0, i32 17
  %55 = load i16* %54, align 2
  %56 = and i16 %55, -18177
  store i16 %56, i16* %54, align 2
  %57 = load %struct.CPUX86State** @env, align 8
  %58 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 17
  %59 = load i16* %58, align 2
  %60 = or i16 %59, 1024
  store i16 %60, i16* %58, align 2
  br label %61

; <label>:61                                      ; preds = %52, %14
  ret void
}

define void @helper_fsqrt() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %6 = load i16* %5, align 1
  %7 = icmp sgt i16 %6, -1
  br i1 %7, label %16, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  %10 = load i16* %9, align 2
  %11 = and i16 %10, -18177
  store i16 %11, i16* %9, align 2
  %12 = load %struct.CPUX86State** @env, align 8
  %13 = getelementptr inbounds %struct.CPUX86State* %12, i64 0, i32 17
  %14 = load i16* %13, align 2
  %15 = or i16 %14, 1024
  store i16 %15, i16* %13, align 2
  %.pre = load %struct.CPUX86State** @env, align 8
  %.phi.trans.insert = getelementptr inbounds %struct.CPUX86State* %.pre, i64 0, i32 16
  %.pre4 = load i32* %.phi.trans.insert, align 4
  %.phi.trans.insert5 = zext i32 %.pre4 to i64
  %.phi.trans.insert6 = getelementptr %struct.CPUX86State* %.pre, i64 0, i32 21, i64 %.phi.trans.insert5, i32 0, i32 1
  %.pre7 = load i16* %.phi.trans.insert6, align 1
  br label %16

; <label>:16                                      ; preds = %8, %0
  %17 = phi i16 [ %6, %0 ], [ %.pre7, %8 ]
  %18 = phi i32 [ %3, %0 ], [ %.pre4, %8 ]
  %19 = phi %struct.CPUX86State* [ %1, %0 ], [ %.pre, %8 ]
  %20 = zext i32 %18 to i64
  %21 = getelementptr inbounds %struct.CPUX86State* %19, i64 0, i32 25
  %22 = getelementptr inbounds %struct.CPUX86State* %19, i64 0, i32 21, i64 %20, i32 0, i32 0
  %23 = load i64* %22, align 1
  %24 = getelementptr %struct.CPUX86State* %19, i64 0, i32 21, i64 %20, i32 0, i32 1
  %25 = tail call { i64, i16 } @floatx80_sqrt(i64 %23, i16 %17, %struct.float_status* %21) nounwind
  %26 = extractvalue { i64, i16 } %25, 0
  %27 = extractvalue { i64, i16 } %25, 1
  store i64 %26, i64* %22, align 8
  store i16 %27, i16* %24, align 8
  ret void
}

declare { i64, i16 } @floatx80_sqrt(i64, i16, %struct.float_status*)

define void @helper_fsincos() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %10 = tail call i64 @floatx80_to_float64(i64 %6, i16 %8, %struct.float_status* %9) nounwind
  %11 = bitcast i64 %10 to double
  %12 = fcmp ogt double %11, 0x43E0000000000000
  %13 = fcmp olt double %11, 0xC3E0000000000000
  %or.cond = or i1 %12, %13
  %14 = load %struct.CPUX86State** @env, align 8
  br i1 %or.cond, label %15, label %19

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 17
  %17 = load i16* %16, align 2
  %18 = or i16 %17, 1024
  store i16 %18, i16* %16, align 2
  br label %53

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 16
  %21 = load i32* %20, align 4
  %22 = zext i32 %21 to i64
  %23 = tail call double @sin(double %11) nounwind readnone
  %24 = bitcast double %23 to i64
  %25 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 25
  %26 = tail call { i64, i16 } @float64_to_floatx80(i64 %24, %struct.float_status* %25) nounwind
  %27 = extractvalue { i64, i16 } %26, 0
  %28 = extractvalue { i64, i16 } %26, 1
  %.07 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 21, i64 %22, i32 0, i32 0
  store i64 %27, i64* %.07, align 8
  %.18 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 21, i64 %22, i32 0, i32 1
  store i16 %28, i16* %.18, align 8
  %29 = load %struct.CPUX86State** @env, align 8
  %30 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 16
  %31 = load i32* %30, align 4
  %32 = add i32 %31, 7
  %33 = and i32 %32, 7
  store i32 %33, i32* %30, align 4
  %34 = load %struct.CPUX86State** @env, align 8
  %35 = getelementptr inbounds %struct.CPUX86State* %34, i64 0, i32 16
  %36 = load i32* %35, align 4
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds %struct.CPUX86State* %34, i64 0, i32 19, i64 %37
  store i8 0, i8* %38, align 1
  %39 = load %struct.CPUX86State** @env, align 8
  %40 = getelementptr inbounds %struct.CPUX86State* %39, i64 0, i32 16
  %41 = load i32* %40, align 4
  %42 = zext i32 %41 to i64
  %43 = tail call double @cos(double %11) nounwind readnone
  %44 = bitcast double %43 to i64
  %45 = getelementptr inbounds %struct.CPUX86State* %39, i64 0, i32 25
  %46 = tail call { i64, i16 } @float64_to_floatx80(i64 %44, %struct.float_status* %45) nounwind
  %47 = extractvalue { i64, i16 } %46, 0
  %48 = extractvalue { i64, i16 } %46, 1
  %.02 = getelementptr inbounds %struct.CPUX86State* %39, i64 0, i32 21, i64 %42, i32 0, i32 0
  store i64 %47, i64* %.02, align 8
  %.13 = getelementptr inbounds %struct.CPUX86State* %39, i64 0, i32 21, i64 %42, i32 0, i32 1
  store i16 %48, i16* %.13, align 8
  %49 = load %struct.CPUX86State** @env, align 8
  %50 = getelementptr inbounds %struct.CPUX86State* %49, i64 0, i32 17
  %51 = load i16* %50, align 2
  %52 = and i16 %51, -1025
  store i16 %52, i16* %50, align 2
  br label %53

; <label>:53                                      ; preds = %19, %15
  ret void
}

declare double @sin(double) nounwind readnone

declare double @cos(double) nounwind readnone

define void @helper_frndint() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %9 = load i16* %8, align 1
  %10 = tail call { i64, i16 } @floatx80_round_to_int(i64 %7, i16 %9, %struct.float_status* %5) nounwind
  %11 = extractvalue { i64, i16 } %10, 0
  %12 = extractvalue { i64, i16 } %10, 1
  store i64 %11, i64* %6, align 8
  store i16 %12, i16* %8, align 8
  ret void
}

declare { i64, i16 } @floatx80_round_to_int(i64, i16, %struct.float_status*)

define void @helper_fscale() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = add i32 %3, 1
  %5 = and i32 %4, 7
  %6 = zext i32 %5 to i64
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = and i16 %8, 32767
  %10 = icmp eq i16 %9, 32767
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0, i32 0
  br i1 %10, label %floatx80_is_any_nan.exit, label %floatx80_is_any_nan.exit.thread

floatx80_is_any_nan.exit:                         ; preds = %0
  %12 = load i64* %11, align 1
  %.mask.i = and i64 %12, 9223372036854775807
  %13 = icmp eq i64 %.mask.i, 0
  br i1 %13, label %floatx80_is_any_nan.exit.thread, label %14

; <label>:14                                      ; preds = %floatx80_is_any_nan.exit
  %15 = zext i32 %3 to i64
  %16 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %15, i32 0
  %17 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %6, i32 0
  %18 = bitcast %struct.floatx80* %16 to i8*
  %19 = bitcast %struct.floatx80* %17 to i8*
  br label %20

; <label>:20                                      ; preds = %23, %14
  %21 = phi i64 [ 0, %14 ], [ %27, %23 ]
  %22 = icmp ult i64 %21, 16
  br i1 %22, label %23, label %43

; <label>:23                                      ; preds = %20
  %24 = getelementptr i8* %19, i64 %21
  %25 = load i8* %24, align 1
  %26 = getelementptr i8* %18, i64 %21
  store i8 %25, i8* %26, align 1
  %27 = add i64 %21, 1
  br label %20

floatx80_is_any_nan.exit.thread:                  ; preds = %0, %floatx80_is_any_nan.exit
  %.pre-phi = phi i64* [ %11, %floatx80_is_any_nan.exit ], [ %11, %0 ]
  %28 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %29 = load i64* %.pre-phi, align 1
  %30 = tail call i32 @floatx80_to_int32_round_to_zero(i64 %29, i16 %8, %struct.float_status* %28) nounwind
  %31 = load %struct.CPUX86State** @env, align 8
  %32 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 16
  %33 = load i32* %32, align 4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 25
  %36 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 21, i64 %34, i32 0, i32 0
  %37 = load i64* %36, align 1
  %38 = getelementptr %struct.CPUX86State* %31, i64 0, i32 21, i64 %34, i32 0, i32 1
  %39 = load i16* %38, align 1
  %40 = tail call { i64, i16 } @floatx80_scalbn(i64 %37, i16 %39, i32 %30, %struct.float_status* %35) nounwind
  %41 = extractvalue { i64, i16 } %40, 0
  %42 = extractvalue { i64, i16 } %40, 1
  store i64 %41, i64* %36, align 8
  store i16 %42, i16* %38, align 8
  br label %43

; <label>:43                                      ; preds = %20, %floatx80_is_any_nan.exit.thread
  ret void
}

declare { i64, i16 } @floatx80_scalbn(i64, i16, i32, %struct.float_status*)

define void @helper_fsin() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %10 = tail call i64 @floatx80_to_float64(i64 %6, i16 %8, %struct.float_status* %9) nounwind
  %11 = bitcast i64 %10 to double
  %12 = fcmp ogt double %11, 0x43E0000000000000
  %13 = fcmp olt double %11, 0xC3E0000000000000
  %or.cond = or i1 %12, %13
  %14 = load %struct.CPUX86State** @env, align 8
  br i1 %or.cond, label %15, label %19

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 17
  %17 = load i16* %16, align 2
  %18 = or i16 %17, 1024
  store i16 %18, i16* %16, align 2
  br label %33

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 16
  %21 = load i32* %20, align 4
  %22 = zext i32 %21 to i64
  %23 = tail call double @sin(double %11) nounwind readnone
  %24 = bitcast double %23 to i64
  %25 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 25
  %26 = tail call { i64, i16 } @float64_to_floatx80(i64 %24, %struct.float_status* %25) nounwind
  %27 = extractvalue { i64, i16 } %26, 0
  %28 = extractvalue { i64, i16 } %26, 1
  %.02 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 21, i64 %22, i32 0, i32 0
  store i64 %27, i64* %.02, align 8
  %.13 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 21, i64 %22, i32 0, i32 1
  store i16 %28, i16* %.13, align 8
  %29 = load %struct.CPUX86State** @env, align 8
  %30 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 17
  %31 = load i16* %30, align 2
  %32 = and i16 %31, -1025
  store i16 %32, i16* %30, align 2
  br label %33

; <label>:33                                      ; preds = %19, %15
  ret void
}

define void @helper_fcos() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %8 = load i16* %7, align 1
  %9 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 25
  %10 = tail call i64 @floatx80_to_float64(i64 %6, i16 %8, %struct.float_status* %9) nounwind
  %11 = bitcast i64 %10 to double
  %12 = fcmp ogt double %11, 0x43E0000000000000
  %13 = fcmp olt double %11, 0xC3E0000000000000
  %or.cond = or i1 %12, %13
  %14 = load %struct.CPUX86State** @env, align 8
  br i1 %or.cond, label %15, label %19

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 17
  %17 = load i16* %16, align 2
  %18 = or i16 %17, 1024
  store i16 %18, i16* %16, align 2
  br label %33

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 16
  %21 = load i32* %20, align 4
  %22 = zext i32 %21 to i64
  %23 = tail call double @cos(double %11) nounwind readnone
  %24 = bitcast double %23 to i64
  %25 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 25
  %26 = tail call { i64, i16 } @float64_to_floatx80(i64 %24, %struct.float_status* %25) nounwind
  %27 = extractvalue { i64, i16 } %26, 0
  %28 = extractvalue { i64, i16 } %26, 1
  %.02 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 21, i64 %22, i32 0, i32 0
  store i64 %27, i64* %.02, align 8
  %.13 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 21, i64 %22, i32 0, i32 1
  store i16 %28, i16* %.13, align 8
  %29 = load %struct.CPUX86State** @env, align 8
  %30 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 17
  %31 = load i16* %30, align 2
  %32 = and i16 %31, -1025
  store i16 %32, i16* %30, align 2
  br label %33

; <label>:33                                      ; preds = %19, %15
  ret void
}

define void @helper_fxam_ST0() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %3 = load i32* %2, align 4
  %4 = zext i32 %3 to i64
  %.01 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 0
  %tmp = load i64* %.01, align 8
  %.1 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %4, i32 0, i32 1
  %tmp2 = load i16* %.1, align 8
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  %6 = load i16* %5, align 2
  %7 = and i16 %6, -18177
  store i16 %7, i16* %5, align 2
  %8 = zext i16 %tmp2 to i32
  %9 = and i32 %8, 32768
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %16, label %11

; <label>:11                                      ; preds = %0
  %12 = load %struct.CPUX86State** @env, align 8
  %13 = getelementptr inbounds %struct.CPUX86State* %12, i64 0, i32 17
  %14 = load i16* %13, align 2
  %15 = or i16 %14, 512
  store i16 %15, i16* %13, align 2
  br label %16

; <label>:16                                      ; preds = %11, %0
  %17 = and i32 %8, 32767
  switch i32 %17, label %36 [
    i32 32767, label %18
    i32 0, label %27
  ]

; <label>:18                                      ; preds = %16
  %19 = icmp eq i64 %tmp, -9223372036854775808
  %20 = load %struct.CPUX86State** @env, align 8
  %21 = getelementptr inbounds %struct.CPUX86State* %20, i64 0, i32 17
  %22 = load i16* %21, align 2
  br i1 %19, label %23, label %25

; <label>:23                                      ; preds = %18
  %24 = or i16 %22, 1280
  store i16 %24, i16* %21, align 2
  br label %41

; <label>:25                                      ; preds = %18
  %26 = or i16 %22, 256
  store i16 %26, i16* %21, align 2
  br label %41

; <label>:27                                      ; preds = %16
  %28 = icmp eq i64 %tmp, 0
  %29 = load %struct.CPUX86State** @env, align 8
  %30 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 17
  %31 = load i16* %30, align 2
  br i1 %28, label %32, label %34

; <label>:32                                      ; preds = %27
  %33 = or i16 %31, 16384
  store i16 %33, i16* %30, align 2
  br label %41

; <label>:34                                      ; preds = %27
  %35 = or i16 %31, 17408
  store i16 %35, i16* %30, align 2
  br label %41

; <label>:36                                      ; preds = %16
  %37 = load %struct.CPUX86State** @env, align 8
  %38 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 17
  %39 = load i16* %38, align 2
  %40 = or i16 %39, 1024
  store i16 %40, i16* %38, align 2
  br label %41

; <label>:41                                      ; preds = %36, %34, %32, %25, %23
  ret void
}

define void @helper_fstenv(i32 %ptr, i32 %data32) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 17
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  %6 = load i32* %5, align 4
  %7 = shl i32 %6, 11
  %8 = and i32 %7, 14336
  br label %9

; <label>:9                                       ; preds = %28, %0
  %indvars.iv = phi i64 [ 7, %0 ], [ %indvars.iv.next, %28 ]
  %fptag.05 = phi i32 [ 0, %0 ], [ %fptag.1, %28 ]
  %10 = shl i32 %fptag.05, 2
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 19, i64 %indvars.iv
  %12 = load i8* %11, align 1
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %16, label %14

; <label>:14                                      ; preds = %9
  %15 = or i32 %10, 3
  br label %28

; <label>:16                                      ; preds = %9
  %.02 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %indvars.iv, i32 0, i32 0
  %tmp = load i64* %.02, align 8
  %.1 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 21, i64 %indvars.iv, i32 0, i32 1
  %tmp3 = load i16* %.1, align 8
  %17 = zext i16 %tmp3 to i32
  %18 = and i32 %17, 32767
  %19 = icmp eq i32 %18, 0
  %20 = icmp eq i64 %tmp, 0
  %or.cond4 = and i1 %19, %20
  br i1 %or.cond4, label %21, label %23

; <label>:21                                      ; preds = %16
  %22 = or i32 %10, 1
  br label %28

; <label>:23                                      ; preds = %16
  switch i32 %18, label %24 [
    i32 32767, label %26
    i32 0, label %26
  ]

; <label>:24                                      ; preds = %23
  %25 = icmp sgt i64 %tmp, -1
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %24, %23, %23
  %27 = or i32 %10, 2
  br label %28

; <label>:28                                      ; preds = %26, %24, %21, %14
  %fptag.1 = phi i32 [ %15, %14 ], [ %22, %21 ], [ %27, %26 ], [ %10, %24 ]
  %indvars.iv.next = add i64 %indvars.iv, -1
  %29 = trunc i64 %indvars.iv to i32
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %9, label %31

; <label>:31                                      ; preds = %28
  %32 = and i32 %4, 51199
  %33 = or i32 %8, %32
  %34 = icmp eq i32 %data32, 0
  %35 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 18
  %36 = load i16* %35, align 2
  %37 = zext i16 %36 to i32
  br i1 %34, label %45, label %38

; <label>:38                                      ; preds = %31
  tail call fastcc void @stl_data(i32 %ptr, i32 %37)
  %39 = add i32 %ptr, 4
  tail call fastcc void @stl_data(i32 %39, i32 %33)
  %40 = add i32 %ptr, 8
  tail call fastcc void @stl_data(i32 %40, i32 %fptag.1)
  %41 = add i32 %ptr, 12
  tail call fastcc void @stl_data(i32 %41, i32 0)
  %42 = add i32 %ptr, 16
  tail call fastcc void @stl_data(i32 %42, i32 0)
  %43 = add i32 %ptr, 20
  tail call fastcc void @stl_data(i32 %43, i32 0)
  %44 = add i32 %ptr, 24
  tail call fastcc void @stl_data(i32 %44, i32 0)
  br label %52

; <label>:45                                      ; preds = %31
  tail call fastcc void @stw_data(i32 %ptr, i32 %37)
  %46 = add i32 %ptr, 2
  tail call fastcc void @stw_data(i32 %46, i32 %33)
  %47 = add i32 %ptr, 4
  tail call fastcc void @stw_data(i32 %47, i32 %fptag.1)
  %48 = add i32 %ptr, 6
  tail call fastcc void @stw_data(i32 %48, i32 0)
  %49 = add i32 %ptr, 8
  tail call fastcc void @stw_data(i32 %49, i32 0)
  %50 = add i32 %ptr, 10
  tail call fastcc void @stw_data(i32 %50, i32 0)
  %51 = add i32 %ptr, 12
  tail call fastcc void @stw_data(i32 %51, i32 0)
  br label %52

; <label>:52                                      ; preds = %45, %38
  ret void
}

define void @helper_fldenv(i32 %ptr, i32 %data32) nounwind uwtable sspreq {
  %1 = icmp eq i32 %data32, 0
  %2 = tail call fastcc i32 @lduw_data(i32 %ptr)
  %3 = trunc i32 %2 to i16
  %4 = load %struct.CPUX86State** @env, align 8
  %5 = getelementptr inbounds %struct.CPUX86State* %4, i64 0, i32 18
  store i16 %3, i16* %5, align 2
  br i1 %1, label %11, label %6

; <label>:6                                       ; preds = %0
  %7 = add i32 %ptr, 4
  %8 = tail call fastcc i32 @lduw_data(i32 %7)
  %9 = add i32 %ptr, 8
  %10 = tail call fastcc i32 @lduw_data(i32 %9)
  br label %16

; <label>:11                                      ; preds = %0
  %12 = add i32 %ptr, 2
  %13 = tail call fastcc i32 @lduw_data(i32 %12)
  %14 = add i32 %ptr, 4
  %15 = tail call fastcc i32 @lduw_data(i32 %14)
  br label %16

; <label>:16                                      ; preds = %11, %6
  %fpus.0 = phi i32 [ %8, %6 ], [ %13, %11 ]
  %fptag.0 = phi i32 [ %10, %6 ], [ %15, %11 ]
  %17 = lshr i32 %fpus.0, 11
  %18 = and i32 %17, 7
  %19 = load %struct.CPUX86State** @env, align 8
  %20 = getelementptr inbounds %struct.CPUX86State* %19, i64 0, i32 16
  store i32 %18, i32* %20, align 4
  %fpus.0.tr = trunc i32 %fpus.0 to i16
  %21 = and i16 %fpus.0.tr, -14337
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 17
  store i16 %21, i16* %23, align 2
  %24 = and i32 %fptag.0, 3
  %25 = icmp eq i32 %24, 3
  %26 = zext i1 %25 to i8
  %27 = load %struct.CPUX86State** @env, align 8
  %28 = getelementptr inbounds %struct.CPUX86State* %27, i64 0, i32 19, i64 0
  store i8 %26, i8* %28, align 1
  %29 = and i32 %fptag.0, 12
  %30 = icmp eq i32 %29, 12
  %31 = zext i1 %30 to i8
  %32 = load %struct.CPUX86State** @env, align 8
  %33 = getelementptr inbounds %struct.CPUX86State* %32, i64 0, i32 19, i64 1
  store i8 %31, i8* %33, align 1
  %34 = and i32 %fptag.0, 48
  %35 = icmp eq i32 %34, 48
  %36 = zext i1 %35 to i8
  %37 = load %struct.CPUX86State** @env, align 8
  %38 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 19, i64 2
  store i8 %36, i8* %38, align 1
  %39 = and i32 %fptag.0, 192
  %40 = icmp eq i32 %39, 192
  %41 = zext i1 %40 to i8
  %42 = load %struct.CPUX86State** @env, align 8
  %43 = getelementptr inbounds %struct.CPUX86State* %42, i64 0, i32 19, i64 3
  store i8 %41, i8* %43, align 1
  %44 = and i32 %fptag.0, 768
  %45 = icmp eq i32 %44, 768
  %46 = zext i1 %45 to i8
  %47 = load %struct.CPUX86State** @env, align 8
  %48 = getelementptr inbounds %struct.CPUX86State* %47, i64 0, i32 19, i64 4
  store i8 %46, i8* %48, align 1
  %49 = and i32 %fptag.0, 3072
  %50 = icmp eq i32 %49, 3072
  %51 = zext i1 %50 to i8
  %52 = load %struct.CPUX86State** @env, align 8
  %53 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 19, i64 5
  store i8 %51, i8* %53, align 1
  %54 = and i32 %fptag.0, 12288
  %55 = icmp eq i32 %54, 12288
  %56 = zext i1 %55 to i8
  %57 = load %struct.CPUX86State** @env, align 8
  %58 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 19, i64 6
  store i8 %56, i8* %58, align 1
  %59 = and i32 %fptag.0, 49152
  %60 = icmp eq i32 %59, 49152
  %61 = zext i1 %60 to i8
  %62 = load %struct.CPUX86State** @env, align 8
  %63 = getelementptr inbounds %struct.CPUX86State* %62, i64 0, i32 19, i64 7
  store i8 %61, i8* %63, align 1
  ret void
}

define void @helper_fsave(i32 %ptr, i32 %data32) nounwind uwtable sspreq {
  tail call void @helper_fstenv(i32 %ptr, i32 %data32)
  %1 = shl i32 14, %data32
  %2 = add i32 %1, %ptr
  %3 = load %struct.CPUX86State** @env, align 8
  br label %4

; <label>:4                                       ; preds = %4, %0
  %5 = phi %struct.CPUX86State* [ %3, %0 ], [ %15, %4 ]
  %.05 = phi i32 [ %2, %0 ], [ %13, %4 ]
  %i.04 = phi i32 [ 0, %0 ], [ %14, %4 ]
  %6 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 16
  %7 = load i32* %6, align 4
  %8 = add i32 %7, %i.04
  %9 = and i32 %8, 7
  %10 = zext i32 %9 to i64
  %.01 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 21, i64 %10, i32 0, i32 0
  %tmp2 = load i64* %.01, align 8
  %.1 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 21, i64 %10, i32 0, i32 1
  %tmp3 = load i16* %.1, align 8
  tail call fastcc void @stq_data(i32 %.05, i64 %tmp2) nounwind
  %11 = add i32 %.05, 8
  %12 = zext i16 %tmp3 to i32
  tail call fastcc void @stw_data(i32 %11, i32 %12) nounwind
  %13 = add i32 %.05, 10
  %14 = add nsw i32 %i.04, 1
  %15 = load %struct.CPUX86State** @env, align 8
  %exitcond = icmp eq i32 %14, 8
  br i1 %exitcond, label %16, label %4

; <label>:16                                      ; preds = %4
  %17 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 17
  store i16 0, i16* %17, align 2
  %18 = load %struct.CPUX86State** @env, align 8
  %19 = getelementptr inbounds %struct.CPUX86State* %18, i64 0, i32 16
  store i32 0, i32* %19, align 4
  %20 = load %struct.CPUX86State** @env, align 8
  %21 = getelementptr inbounds %struct.CPUX86State* %20, i64 0, i32 18
  store i16 895, i16* %21, align 2
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 19, i64 0
  store i8 1, i8* %23, align 1
  %24 = load %struct.CPUX86State** @env, align 8
  %25 = getelementptr inbounds %struct.CPUX86State* %24, i64 0, i32 19, i64 1
  store i8 1, i8* %25, align 1
  %26 = load %struct.CPUX86State** @env, align 8
  %27 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 19, i64 2
  store i8 1, i8* %27, align 1
  %28 = load %struct.CPUX86State** @env, align 8
  %29 = getelementptr inbounds %struct.CPUX86State* %28, i64 0, i32 19, i64 3
  store i8 1, i8* %29, align 1
  %30 = load %struct.CPUX86State** @env, align 8
  %31 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 19, i64 4
  store i8 1, i8* %31, align 1
  %32 = load %struct.CPUX86State** @env, align 8
  %33 = getelementptr inbounds %struct.CPUX86State* %32, i64 0, i32 19, i64 5
  store i8 1, i8* %33, align 1
  %34 = load %struct.CPUX86State** @env, align 8
  %35 = getelementptr inbounds %struct.CPUX86State* %34, i64 0, i32 19, i64 6
  store i8 1, i8* %35, align 1
  %36 = load %struct.CPUX86State** @env, align 8
  %37 = getelementptr inbounds %struct.CPUX86State* %36, i64 0, i32 19, i64 7
  store i8 1, i8* %37, align 1
  ret void
}

define void @helper_frstor(i32 %ptr, i32 %data32) nounwind uwtable sspreq {
  tail call void @helper_fldenv(i32 %ptr, i32 %data32)
  %1 = shl i32 14, %data32
  %2 = add i32 %1, %ptr
  %3 = tail call fastcc i64 @ldq_data(i32 %2) nounwind
  %4 = add i32 %2, 8
  %5 = tail call fastcc i32 @lduw_data(i32 %4) nounwind
  %6 = trunc i32 %5 to i16
  %7 = load %struct.CPUX86State** @env, align 8
  %8 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 16
  %9 = load i32* %8, align 4
  %10 = and i32 %9, 7
  %11 = zext i32 %10 to i64
  %.06 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 21, i64 %11, i32 0, i32 0
  store i64 %3, i64* %.06, align 8
  %.18 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 21, i64 %11, i32 0, i32 1
  store i16 %6, i16* %.18, align 8
  %12 = add i32 %2, 10
  %13 = tail call fastcc i64 @ldq_data(i32 %12) nounwind
  %14 = add i32 %2, 18
  %15 = tail call fastcc i32 @lduw_data(i32 %14) nounwind
  %16 = trunc i32 %15 to i16
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 16
  %19 = load i32* %18, align 4
  %20 = add i32 %19, 1
  %21 = and i32 %20, 7
  %22 = zext i32 %21 to i64
  %.06.1 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 21, i64 %22, i32 0, i32 0
  store i64 %13, i64* %.06.1, align 8
  %.18.1 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 21, i64 %22, i32 0, i32 1
  store i16 %16, i16* %.18.1, align 8
  %23 = add i32 %2, 20
  %24 = tail call fastcc i64 @ldq_data(i32 %23) nounwind
  %25 = add i32 %2, 28
  %26 = tail call fastcc i32 @lduw_data(i32 %25) nounwind
  %27 = trunc i32 %26 to i16
  %28 = load %struct.CPUX86State** @env, align 8
  %29 = getelementptr inbounds %struct.CPUX86State* %28, i64 0, i32 16
  %30 = load i32* %29, align 4
  %31 = add i32 %30, 2
  %32 = and i32 %31, 7
  %33 = zext i32 %32 to i64
  %.06.2 = getelementptr inbounds %struct.CPUX86State* %28, i64 0, i32 21, i64 %33, i32 0, i32 0
  store i64 %24, i64* %.06.2, align 8
  %.18.2 = getelementptr inbounds %struct.CPUX86State* %28, i64 0, i32 21, i64 %33, i32 0, i32 1
  store i16 %27, i16* %.18.2, align 8
  %34 = add i32 %2, 30
  %35 = tail call fastcc i64 @ldq_data(i32 %34) nounwind
  %36 = add i32 %2, 38
  %37 = tail call fastcc i32 @lduw_data(i32 %36) nounwind
  %38 = trunc i32 %37 to i16
  %39 = load %struct.CPUX86State** @env, align 8
  %40 = getelementptr inbounds %struct.CPUX86State* %39, i64 0, i32 16
  %41 = load i32* %40, align 4
  %42 = add i32 %41, 3
  %43 = and i32 %42, 7
  %44 = zext i32 %43 to i64
  %.06.3 = getelementptr inbounds %struct.CPUX86State* %39, i64 0, i32 21, i64 %44, i32 0, i32 0
  store i64 %35, i64* %.06.3, align 8
  %.18.3 = getelementptr inbounds %struct.CPUX86State* %39, i64 0, i32 21, i64 %44, i32 0, i32 1
  store i16 %38, i16* %.18.3, align 8
  %45 = add i32 %2, 40
  %46 = tail call fastcc i64 @ldq_data(i32 %45) nounwind
  %47 = add i32 %2, 48
  %48 = tail call fastcc i32 @lduw_data(i32 %47) nounwind
  %49 = trunc i32 %48 to i16
  %50 = load %struct.CPUX86State** @env, align 8
  %51 = getelementptr inbounds %struct.CPUX86State* %50, i64 0, i32 16
  %52 = load i32* %51, align 4
  %53 = add i32 %52, 4
  %54 = and i32 %53, 7
  %55 = zext i32 %54 to i64
  %.06.4 = getelementptr inbounds %struct.CPUX86State* %50, i64 0, i32 21, i64 %55, i32 0, i32 0
  store i64 %46, i64* %.06.4, align 8
  %.18.4 = getelementptr inbounds %struct.CPUX86State* %50, i64 0, i32 21, i64 %55, i32 0, i32 1
  store i16 %49, i16* %.18.4, align 8
  %56 = add i32 %2, 50
  %57 = tail call fastcc i64 @ldq_data(i32 %56) nounwind
  %58 = add i32 %2, 58
  %59 = tail call fastcc i32 @lduw_data(i32 %58) nounwind
  %60 = trunc i32 %59 to i16
  %61 = load %struct.CPUX86State** @env, align 8
  %62 = getelementptr inbounds %struct.CPUX86State* %61, i64 0, i32 16
  %63 = load i32* %62, align 4
  %64 = add i32 %63, 5
  %65 = and i32 %64, 7
  %66 = zext i32 %65 to i64
  %.06.5 = getelementptr inbounds %struct.CPUX86State* %61, i64 0, i32 21, i64 %66, i32 0, i32 0
  store i64 %57, i64* %.06.5, align 8
  %.18.5 = getelementptr inbounds %struct.CPUX86State* %61, i64 0, i32 21, i64 %66, i32 0, i32 1
  store i16 %60, i16* %.18.5, align 8
  %67 = add i32 %2, 60
  %68 = tail call fastcc i64 @ldq_data(i32 %67) nounwind
  %69 = add i32 %2, 68
  %70 = tail call fastcc i32 @lduw_data(i32 %69) nounwind
  %71 = trunc i32 %70 to i16
  %72 = load %struct.CPUX86State** @env, align 8
  %73 = getelementptr inbounds %struct.CPUX86State* %72, i64 0, i32 16
  %74 = load i32* %73, align 4
  %75 = add i32 %74, 6
  %76 = and i32 %75, 7
  %77 = zext i32 %76 to i64
  %.06.6 = getelementptr inbounds %struct.CPUX86State* %72, i64 0, i32 21, i64 %77, i32 0, i32 0
  store i64 %68, i64* %.06.6, align 8
  %.18.6 = getelementptr inbounds %struct.CPUX86State* %72, i64 0, i32 21, i64 %77, i32 0, i32 1
  store i16 %71, i16* %.18.6, align 8
  %78 = add i32 %2, 70
  %79 = tail call fastcc i64 @ldq_data(i32 %78) nounwind
  %80 = add i32 %2, 78
  %81 = tail call fastcc i32 @lduw_data(i32 %80) nounwind
  %82 = trunc i32 %81 to i16
  %83 = load %struct.CPUX86State** @env, align 8
  %84 = getelementptr inbounds %struct.CPUX86State* %83, i64 0, i32 16
  %85 = load i32* %84, align 4
  %86 = add i32 %85, 7
  %87 = and i32 %86, 7
  %88 = zext i32 %87 to i64
  %.06.7 = getelementptr inbounds %struct.CPUX86State* %83, i64 0, i32 21, i64 %88, i32 0, i32 0
  store i64 %79, i64* %.06.7, align 8
  %.18.7 = getelementptr inbounds %struct.CPUX86State* %83, i64 0, i32 21, i64 %88, i32 0, i32 1
  store i16 %82, i16* %.18.7, align 8
  ret void
}

define void @helper_fxsave(i32 %ptr, i32 %data64) nounwind uwtable sspreq {
  %1 = and i32 %ptr, 15
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %4, label %3

; <label>:3                                       ; preds = %0
  tail call fastcc void @raise_exception(i32 13) noreturn
  unreachable

; <label>:4                                       ; preds = %0
  %5 = load %struct.CPUX86State** @env, align 8
  %6 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 17
  %7 = load i16* %6, align 2
  %8 = zext i16 %7 to i32
  %9 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 16
  %10 = load i32* %9, align 4
  %11 = shl i32 %10, 11
  %12 = and i32 %11, 14336
  %13 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 19, i64 0
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 19, i64 1
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = shl nuw nsw i32 %18, 1
  %20 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 19, i64 2
  %21 = load i8* %20, align 1
  %22 = zext i8 %21 to i32
  %23 = shl nuw nsw i32 %22, 2
  %24 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 19, i64 3
  %25 = load i8* %24, align 1
  %26 = zext i8 %25 to i32
  %27 = shl nuw nsw i32 %26, 3
  %28 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 19, i64 4
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = shl nuw nsw i32 %30, 4
  %32 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 19, i64 5
  %33 = load i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = shl nuw nsw i32 %34, 5
  %36 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 19, i64 6
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = shl nuw nsw i32 %38, 6
  %40 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 19, i64 7
  %41 = load i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = shl nuw nsw i32 %42, 7
  %44 = or i32 %19, %15
  %45 = or i32 %44, %23
  %46 = or i32 %45, %27
  %47 = or i32 %46, %31
  %48 = or i32 %47, %35
  %49 = or i32 %48, %39
  %50 = or i32 %49, %43
  %51 = and i32 %8, 51199
  %52 = or i32 %12, %51
  %53 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 18
  %54 = load i16* %53, align 2
  %55 = zext i16 %54 to i32
  tail call fastcc void @stw_data(i32 %ptr, i32 %55)
  %56 = add i32 %ptr, 2
  tail call fastcc void @stw_data(i32 %56, i32 %52)
  %57 = add i32 %ptr, 4
  %58 = xor i32 %50, 255
  tail call fastcc void @stw_data(i32 %57, i32 %58)
  %59 = add i32 %ptr, 8
  tail call fastcc void @stl_data(i32 %59, i32 0)
  %60 = add i32 %ptr, 12
  tail call fastcc void @stl_data(i32 %60, i32 0)
  %61 = add i32 %ptr, 16
  tail call fastcc void @stl_data(i32 %61, i32 0)
  %62 = add i32 %ptr, 20
  tail call fastcc void @stl_data(i32 %62, i32 0)
  %63 = add i32 %ptr, 32
  %64 = load %struct.CPUX86State** @env, align 8
  br label %65

; <label>:65                                      ; preds = %65, %4
  %66 = phi %struct.CPUX86State* [ %64, %4 ], [ %76, %65 ]
  %addr.07 = phi i32 [ %63, %4 ], [ %74, %65 ]
  %i.16 = phi i32 [ 0, %4 ], [ %75, %65 ]
  %67 = getelementptr inbounds %struct.CPUX86State* %66, i64 0, i32 16
  %68 = load i32* %67, align 4
  %69 = add i32 %68, %i.16
  %70 = and i32 %69, 7
  %71 = zext i32 %70 to i64
  %.0 = getelementptr inbounds %struct.CPUX86State* %66, i64 0, i32 21, i64 %71, i32 0, i32 0
  %tmp1 = load i64* %.0, align 8
  %.1 = getelementptr inbounds %struct.CPUX86State* %66, i64 0, i32 21, i64 %71, i32 0, i32 1
  %tmp2 = load i16* %.1, align 8
  tail call fastcc void @stq_data(i32 %addr.07, i64 %tmp1) nounwind
  %72 = add i32 %addr.07, 8
  %73 = zext i16 %tmp2 to i32
  tail call fastcc void @stw_data(i32 %72, i32 %73) nounwind
  %74 = add i32 %addr.07, 16
  %75 = add nsw i32 %i.16, 1
  %76 = load %struct.CPUX86State** @env, align 8
  %exitcond = icmp eq i32 %75, 8
  br i1 %exitcond, label %77, label %65

; <label>:77                                      ; preds = %65
  %78 = getelementptr inbounds %struct.CPUX86State* %76, i64 0, i32 14, i64 4
  %79 = load i32* %78, align 4
  %80 = and i32 %79, 512
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %.loopexit, label %82

; <label>:82                                      ; preds = %77
  %83 = add i32 %ptr, 24
  %84 = getelementptr inbounds %struct.CPUX86State* %76, i64 0, i32 29
  %85 = load i32* %84, align 4
  tail call fastcc void @stl_data(i32 %83, i32 %85)
  %86 = add i32 %ptr, 28
  tail call fastcc void @stl_data(i32 %86, i32 65535)
  %87 = load %struct.CPUX86State** @env, align 8
  %88 = getelementptr inbounds %struct.CPUX86State* %87, i64 0, i32 7
  %89 = load i32* %88, align 4
  %90 = lshr i32 %89, 12
  %91 = and i32 %90, 8
  %92 = add i32 %91, 8
  %93 = add i32 %ptr, 160
  %94 = getelementptr inbounds %struct.CPUX86State* %87, i64 0, i32 37
  %95 = load i64* %94, align 8
  %96 = and i64 %95, 16384
  %97 = icmp eq i64 %96, 0
  br i1 %97, label %.lr.ph, label %98

; <label>:98                                      ; preds = %82
  %99 = and i32 %89, 16387
  %100 = icmp eq i32 %99, 16384
  br i1 %100, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %98, %82
  %101 = phi %struct.CPUX86State* [ %.pre, %._crit_edge ], [ %87, %98 ], [ %87, %82 ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %98 ], [ 0, %82 ]
  %addr.15 = phi i32 [ %110, %._crit_edge ], [ %93, %98 ], [ %93, %82 ]
  %102 = getelementptr inbounds %struct.CPUX86State* %101, i64 0, i32 30, i64 %indvars.iv, i32 0, i64 0
  %103 = load i64* %102, align 8
  tail call fastcc void @stq_data(i32 %addr.15, i64 %103)
  %104 = add i32 %addr.15, 8
  %105 = load %struct.CPUX86State** @env, align 8
  %106 = getelementptr inbounds %struct.CPUX86State* %105, i64 0, i32 30, i64 %indvars.iv, i32 0, i64 1
  %107 = load i64* %106, align 8
  tail call fastcc void @stq_data(i32 %104, i64 %107)
  %indvars.iv.next = add i64 %indvars.iv, 1
  %108 = trunc i64 %indvars.iv.next to i32
  %109 = icmp slt i32 %108, %92
  br i1 %109, label %._crit_edge, label %.loopexit

._crit_edge:                                      ; preds = %.lr.ph
  %110 = add i32 %addr.15, 16
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %.lr.ph

.loopexit:                                        ; preds = %.lr.ph, %98, %77
  ret void
}

define void @helper_fxrstor(i32 %ptr, i32 %data64) nounwind uwtable sspreq {
  %1 = and i32 %ptr, 15
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %4, label %3

; <label>:3                                       ; preds = %0
  tail call fastcc void @raise_exception(i32 13) noreturn
  unreachable

; <label>:4                                       ; preds = %0
  %5 = tail call fastcc i32 @lduw_data(i32 %ptr)
  %6 = trunc i32 %5 to i16
  %7 = load %struct.CPUX86State** @env, align 8
  %8 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 18
  store i16 %6, i16* %8, align 2
  %9 = add i32 %ptr, 2
  %10 = tail call fastcc i32 @lduw_data(i32 %9)
  %11 = add i32 %ptr, 4
  %12 = tail call fastcc i32 @lduw_data(i32 %11)
  %13 = lshr i32 %10, 11
  %14 = and i32 %13, 7
  %15 = load %struct.CPUX86State** @env, align 8
  %16 = getelementptr inbounds %struct.CPUX86State* %15, i64 0, i32 16
  store i32 %14, i32* %16, align 4
  %.tr = trunc i32 %10 to i16
  %17 = and i16 %.tr, -14337
  %18 = load %struct.CPUX86State** @env, align 8
  %19 = getelementptr inbounds %struct.CPUX86State* %18, i64 0, i32 17
  store i16 %17, i16* %19, align 2
  %20 = xor i32 %12, 255
  %.tr9 = trunc i32 %20 to i8
  %21 = and i8 %.tr9, 1
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 19, i64 0
  store i8 %21, i8* %23, align 1
  %24 = lshr i32 %20, 1
  %.tr9.1 = trunc i32 %24 to i8
  %25 = and i8 %.tr9.1, 1
  %26 = load %struct.CPUX86State** @env, align 8
  %27 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 19, i64 1
  store i8 %25, i8* %27, align 1
  %28 = lshr i32 %20, 2
  %.tr9.2 = trunc i32 %28 to i8
  %29 = and i8 %.tr9.2, 1
  %30 = load %struct.CPUX86State** @env, align 8
  %31 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 19, i64 2
  store i8 %29, i8* %31, align 1
  %32 = lshr i32 %20, 3
  %.tr9.3 = trunc i32 %32 to i8
  %33 = and i8 %.tr9.3, 1
  %34 = load %struct.CPUX86State** @env, align 8
  %35 = getelementptr inbounds %struct.CPUX86State* %34, i64 0, i32 19, i64 3
  store i8 %33, i8* %35, align 1
  %36 = lshr i32 %20, 4
  %.tr9.4 = trunc i32 %36 to i8
  %37 = and i8 %.tr9.4, 1
  %38 = load %struct.CPUX86State** @env, align 8
  %39 = getelementptr inbounds %struct.CPUX86State* %38, i64 0, i32 19, i64 4
  store i8 %37, i8* %39, align 1
  %40 = lshr i32 %20, 5
  %.tr9.5 = trunc i32 %40 to i8
  %41 = and i8 %.tr9.5, 1
  %42 = load %struct.CPUX86State** @env, align 8
  %43 = getelementptr inbounds %struct.CPUX86State* %42, i64 0, i32 19, i64 5
  store i8 %41, i8* %43, align 1
  %44 = lshr i32 %20, 6
  %.tr9.6 = trunc i32 %44 to i8
  %45 = and i8 %.tr9.6, 1
  %46 = load %struct.CPUX86State** @env, align 8
  %47 = getelementptr inbounds %struct.CPUX86State* %46, i64 0, i32 19, i64 6
  store i8 %45, i8* %47, align 1
  %48 = lshr i32 %20, 7
  %.tr9.7 = trunc i32 %48 to i8
  %49 = and i8 %.tr9.7, 1
  %50 = load %struct.CPUX86State** @env, align 8
  %51 = getelementptr inbounds %struct.CPUX86State* %50, i64 0, i32 19, i64 7
  store i8 %49, i8* %51, align 1
  %52 = add i32 %ptr, 32
  %53 = tail call fastcc i64 @ldq_data(i32 %52) nounwind
  %54 = add i32 %ptr, 40
  %55 = tail call fastcc i32 @lduw_data(i32 %54) nounwind
  %56 = trunc i32 %55 to i16
  %57 = load %struct.CPUX86State** @env, align 8
  %58 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 16
  %59 = load i32* %58, align 4
  %60 = and i32 %59, 7
  %61 = zext i32 %60 to i64
  %.05 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 21, i64 %61, i32 0, i32 0
  store i64 %53, i64* %.05, align 8
  %.17 = getelementptr inbounds %struct.CPUX86State* %57, i64 0, i32 21, i64 %61, i32 0, i32 1
  store i16 %56, i16* %.17, align 8
  %62 = add i32 %ptr, 48
  %63 = tail call fastcc i64 @ldq_data(i32 %62) nounwind
  %64 = add i32 %ptr, 56
  %65 = tail call fastcc i32 @lduw_data(i32 %64) nounwind
  %66 = trunc i32 %65 to i16
  %67 = load %struct.CPUX86State** @env, align 8
  %68 = getelementptr inbounds %struct.CPUX86State* %67, i64 0, i32 16
  %69 = load i32* %68, align 4
  %70 = add i32 %69, 1
  %71 = and i32 %70, 7
  %72 = zext i32 %71 to i64
  %.05.1 = getelementptr inbounds %struct.CPUX86State* %67, i64 0, i32 21, i64 %72, i32 0, i32 0
  store i64 %63, i64* %.05.1, align 8
  %.17.1 = getelementptr inbounds %struct.CPUX86State* %67, i64 0, i32 21, i64 %72, i32 0, i32 1
  store i16 %66, i16* %.17.1, align 8
  %73 = add i32 %ptr, 64
  %74 = tail call fastcc i64 @ldq_data(i32 %73) nounwind
  %75 = add i32 %ptr, 72
  %76 = tail call fastcc i32 @lduw_data(i32 %75) nounwind
  %77 = trunc i32 %76 to i16
  %78 = load %struct.CPUX86State** @env, align 8
  %79 = getelementptr inbounds %struct.CPUX86State* %78, i64 0, i32 16
  %80 = load i32* %79, align 4
  %81 = add i32 %80, 2
  %82 = and i32 %81, 7
  %83 = zext i32 %82 to i64
  %.05.2 = getelementptr inbounds %struct.CPUX86State* %78, i64 0, i32 21, i64 %83, i32 0, i32 0
  store i64 %74, i64* %.05.2, align 8
  %.17.2 = getelementptr inbounds %struct.CPUX86State* %78, i64 0, i32 21, i64 %83, i32 0, i32 1
  store i16 %77, i16* %.17.2, align 8
  %84 = add i32 %ptr, 80
  %85 = tail call fastcc i64 @ldq_data(i32 %84) nounwind
  %86 = add i32 %ptr, 88
  %87 = tail call fastcc i32 @lduw_data(i32 %86) nounwind
  %88 = trunc i32 %87 to i16
  %89 = load %struct.CPUX86State** @env, align 8
  %90 = getelementptr inbounds %struct.CPUX86State* %89, i64 0, i32 16
  %91 = load i32* %90, align 4
  %92 = add i32 %91, 3
  %93 = and i32 %92, 7
  %94 = zext i32 %93 to i64
  %.05.3 = getelementptr inbounds %struct.CPUX86State* %89, i64 0, i32 21, i64 %94, i32 0, i32 0
  store i64 %85, i64* %.05.3, align 8
  %.17.3 = getelementptr inbounds %struct.CPUX86State* %89, i64 0, i32 21, i64 %94, i32 0, i32 1
  store i16 %88, i16* %.17.3, align 8
  %95 = add i32 %ptr, 96
  %96 = tail call fastcc i64 @ldq_data(i32 %95) nounwind
  %97 = add i32 %ptr, 104
  %98 = tail call fastcc i32 @lduw_data(i32 %97) nounwind
  %99 = trunc i32 %98 to i16
  %100 = load %struct.CPUX86State** @env, align 8
  %101 = getelementptr inbounds %struct.CPUX86State* %100, i64 0, i32 16
  %102 = load i32* %101, align 4
  %103 = add i32 %102, 4
  %104 = and i32 %103, 7
  %105 = zext i32 %104 to i64
  %.05.4 = getelementptr inbounds %struct.CPUX86State* %100, i64 0, i32 21, i64 %105, i32 0, i32 0
  store i64 %96, i64* %.05.4, align 8
  %.17.4 = getelementptr inbounds %struct.CPUX86State* %100, i64 0, i32 21, i64 %105, i32 0, i32 1
  store i16 %99, i16* %.17.4, align 8
  %106 = add i32 %ptr, 112
  %107 = tail call fastcc i64 @ldq_data(i32 %106) nounwind
  %108 = add i32 %ptr, 120
  %109 = tail call fastcc i32 @lduw_data(i32 %108) nounwind
  %110 = trunc i32 %109 to i16
  %111 = load %struct.CPUX86State** @env, align 8
  %112 = getelementptr inbounds %struct.CPUX86State* %111, i64 0, i32 16
  %113 = load i32* %112, align 4
  %114 = add i32 %113, 5
  %115 = and i32 %114, 7
  %116 = zext i32 %115 to i64
  %.05.5 = getelementptr inbounds %struct.CPUX86State* %111, i64 0, i32 21, i64 %116, i32 0, i32 0
  store i64 %107, i64* %.05.5, align 8
  %.17.5 = getelementptr inbounds %struct.CPUX86State* %111, i64 0, i32 21, i64 %116, i32 0, i32 1
  store i16 %110, i16* %.17.5, align 8
  %117 = add i32 %ptr, 128
  %118 = tail call fastcc i64 @ldq_data(i32 %117) nounwind
  %119 = add i32 %ptr, 136
  %120 = tail call fastcc i32 @lduw_data(i32 %119) nounwind
  %121 = trunc i32 %120 to i16
  %122 = load %struct.CPUX86State** @env, align 8
  %123 = getelementptr inbounds %struct.CPUX86State* %122, i64 0, i32 16
  %124 = load i32* %123, align 4
  %125 = add i32 %124, 6
  %126 = and i32 %125, 7
  %127 = zext i32 %126 to i64
  %.05.6 = getelementptr inbounds %struct.CPUX86State* %122, i64 0, i32 21, i64 %127, i32 0, i32 0
  store i64 %118, i64* %.05.6, align 8
  %.17.6 = getelementptr inbounds %struct.CPUX86State* %122, i64 0, i32 21, i64 %127, i32 0, i32 1
  store i16 %121, i16* %.17.6, align 8
  %128 = add i32 %ptr, 144
  %129 = tail call fastcc i64 @ldq_data(i32 %128) nounwind
  %130 = add i32 %ptr, 152
  %131 = tail call fastcc i32 @lduw_data(i32 %130) nounwind
  %132 = trunc i32 %131 to i16
  %133 = load %struct.CPUX86State** @env, align 8
  %134 = getelementptr inbounds %struct.CPUX86State* %133, i64 0, i32 16
  %135 = load i32* %134, align 4
  %136 = add i32 %135, 7
  %137 = and i32 %136, 7
  %138 = zext i32 %137 to i64
  %.05.7 = getelementptr inbounds %struct.CPUX86State* %133, i64 0, i32 21, i64 %138, i32 0, i32 0
  store i64 %129, i64* %.05.7, align 8
  %.17.7 = getelementptr inbounds %struct.CPUX86State* %133, i64 0, i32 21, i64 %138, i32 0, i32 1
  store i16 %132, i16* %.17.7, align 8
  %139 = load %struct.CPUX86State** @env, align 8
  %140 = getelementptr inbounds %struct.CPUX86State* %139, i64 0, i32 14, i64 4
  %141 = load i32* %140, align 4
  %142 = and i32 %141, 512
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %.loopexit, label %144

; <label>:144                                     ; preds = %4
  %145 = add i32 %ptr, 24
  %146 = tail call fastcc i32 @ldl_data(i32 %145)
  %147 = load %struct.CPUX86State** @env, align 8
  %148 = getelementptr inbounds %struct.CPUX86State* %147, i64 0, i32 29
  store i32 %146, i32* %148, align 4
  %149 = load %struct.CPUX86State** @env, align 8
  %150 = getelementptr inbounds %struct.CPUX86State* %149, i64 0, i32 7
  %151 = load i32* %150, align 4
  %152 = lshr i32 %151, 12
  %153 = and i32 %152, 8
  %154 = add i32 %153, 8
  %155 = add i32 %ptr, 160
  %156 = getelementptr inbounds %struct.CPUX86State* %149, i64 0, i32 37
  %157 = load i64* %156, align 8
  %158 = and i64 %157, 16384
  %159 = icmp eq i64 %158, 0
  br i1 %159, label %.lr.ph, label %160

; <label>:160                                     ; preds = %144
  %161 = and i32 %151, 16387
  %162 = icmp eq i32 %161, 16384
  br i1 %162, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %160, %144
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph ], [ 0, %160 ], [ 0, %144 ]
  %addr.112 = phi i32 [ %170, %.lr.ph ], [ %155, %160 ], [ %155, %144 ]
  %163 = tail call fastcc i64 @ldq_data(i32 %addr.112)
  %164 = load %struct.CPUX86State** @env, align 8
  %165 = getelementptr inbounds %struct.CPUX86State* %164, i64 0, i32 30, i64 %indvars.iv, i32 0, i64 0
  store i64 %163, i64* %165, align 8
  %166 = add i32 %addr.112, 8
  %167 = tail call fastcc i64 @ldq_data(i32 %166)
  %168 = load %struct.CPUX86State** @env, align 8
  %169 = getelementptr inbounds %struct.CPUX86State* %168, i64 0, i32 30, i64 %indvars.iv, i32 0, i64 1
  store i64 %167, i64* %169, align 8
  %170 = add i32 %addr.112, 16
  %indvars.iv.next = add i64 %indvars.iv, 1
  %171 = trunc i64 %indvars.iv.next to i32
  %172 = icmp slt i32 %171, %154
  br i1 %172, label %.lr.ph, label %.loopexit

.loopexit:                                        ; preds = %.lr.ph, %160, %4
  ret void
}

define void @cpu_get_fp80(i64* nocapture %pmant, i16* nocapture %pexp, i64 %f.coerce0, i16 %f.coerce1) nounwind uwtable sspreq {
  store i64 %f.coerce0, i64* %pmant, align 8
  store i16 %f.coerce1, i16* %pexp, align 2
  ret void
}

define { i64, i16 } @cpu_set_fp80(i64 %mant, i16 zeroext %upper) nounwind uwtable readnone sspreq {
  %1 = insertvalue { i64, i16 } undef, i64 %mant, 0
  %2 = insertvalue { i64, i16 } %1, i16 %upper, 1
  ret { i64, i16 } %2
}

define void @helper_hlt(i32 %next_eip_addend) noreturn nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 16777216
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  tail call void @helper_vmexit(i32 120, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 4
  %12 = load i32* %11, align 4
  %13 = add i32 %12, %next_eip_addend
  store i32 %13, i32* %11, align 4
  tail call fastcc void @do_hlt()
  unreachable
}

define internal fastcc void @do_hlt() noreturn nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %4 = and i32 %3, -9
  store i32 %4, i32* %2, align 4
  %5 = load %struct.CPUX86State** @env, align 8
  %6 = getelementptr inbounds %struct.CPUX86State* %5, i64 0, i32 71
  store i32 1, i32* %6, align 4
  %7 = load %struct.CPUX86State** @env, align 8
  %8 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 93
  store i32 65537, i32* %8, align 4
  %9 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_loop_exit(%struct.CPUX86State* %9) noreturn nounwind
  unreachable
}

define void @helper_monitor(i32 %ptr) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 1
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %0
  tail call fastcc void @raise_exception(i32 13) noreturn
  unreachable

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %8 = load i32* %7, align 4
  %.lobit.i = and i32 %8, 2097152
  %9 = icmp eq i32 %.lobit.i, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10, !prof !0

; <label>:10                                      ; preds = %6
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %12 = load i64* %11, align 8
  %13 = and i64 %12, 4398046511104
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %helper_svm_check_intercept_param.exit, label %15

; <label>:15                                      ; preds = %10
  tail call void @helper_vmexit(i32 138, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %10, %6
  ret void
}

define void @helper_mwait(i32 %next_eip_addend) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 1
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %0
  tail call fastcc void @raise_exception(i32 13) noreturn
  unreachable

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %8 = load i32* %7, align 4
  %.lobit.i = and i32 %8, 2097152
  %9 = icmp eq i32 %.lobit.i, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10, !prof !0

; <label>:10                                      ; preds = %6
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %12 = load i64* %11, align 8
  %13 = and i64 %12, 8796093022208
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %helper_svm_check_intercept_param.exit, label %15

; <label>:15                                      ; preds = %10
  tail call void @helper_vmexit(i32 139, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %10, %6
  %16 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 4
  %17 = load i32* %16, align 4
  %18 = add i32 %17, %next_eip_addend
  store i32 %18, i32* %16, align 4
  %19 = load %struct.CPUX86State** @env, align 8
  %20 = getelementptr inbounds %struct.CPUX86State* %19, i64 0, i32 95
  %21 = load i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %28

; <label>:23                                      ; preds = %helper_svm_check_intercept_param.exit
  %24 = getelementptr inbounds %struct.CPUX86State* %19, i64 0, i32 94
  %25 = load %struct.CPUX86State** %24, align 8
  %26 = icmp eq %struct.CPUX86State* %25, null
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %23
  tail call fastcc void @do_hlt()
  unreachable

; <label>:28                                      ; preds = %23, %helper_svm_check_intercept_param.exit
  ret void
}

define void @helper_debug() noreturn nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 93
  store i32 65538, i32* %2, align 4
  %3 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_loop_exit(%struct.CPUX86State* %3) noreturn nounwind
  unreachable
}

declare void @cpu_loop_exit(%struct.CPUX86State*) noreturn

define void @helper_reset_rf() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 6
  %3 = load i32* %2, align 4
  %4 = and i32 %3, -65537
  store i32 %4, i32* %2, align 4
  ret void
}

define void @helper_raise_interrupt(i32 %intno, i32 %next_eip_addend) noreturn nounwind uwtable sspreq {
  tail call fastcc void @raise_interrupt(i32 %intno, i32 1, i32 0, i32 %next_eip_addend) noreturn
  unreachable
}

define void @helper_raise_exception(i32 %exception_index) noreturn nounwind uwtable sspreq {
  tail call fastcc void @raise_exception(i32 %exception_index) noreturn
  unreachable
}

define void @helper_cli() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 6
  %3 = load i32* %2, align 4
  %4 = and i32 %3, -513
  store i32 %4, i32* %2, align 4
  ret void
}

define void @helper_sti() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 6
  %3 = load i32* %2, align 4
  %4 = or i32 %3, 512
  store i32 %4, i32* %2, align 4
  ret void
}

define void @helper_set_inhibit_irq() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %4 = or i32 %3, 8
  store i32 %4, i32* %2, align 4
  ret void
}

define void @helper_reset_inhibit_irq() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %4 = and i32 %3, -9
  store i32 %4, i32* %2, align 4
  ret void
}

define void @helper_boundw(i32 %a0, i32 %v) nounwind uwtable sspreq {
  %1 = tail call fastcc i32 @ldsw_data(i32 %a0)
  %2 = add i32 %a0, 2
  %3 = tail call fastcc i32 @ldsw_data(i32 %2)
  %sext = shl i32 %v, 16
  %4 = ashr exact i32 %sext, 16
  %5 = icmp slt i32 %4, %1
  %6 = icmp sgt i32 %4, %3
  %or.cond = or i1 %5, %6
  br i1 %or.cond, label %7, label %8

; <label>:7                                       ; preds = %0
  tail call fastcc void @raise_exception(i32 5) noreturn
  unreachable

; <label>:8                                       ; preds = %0
  ret void
}

define internal fastcc i32 @ldsw_data(i32 %ptr) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 7
  %16 = load i32* %15, align 4
  %17 = and i32 %16, 3
  %18 = icmp eq i32 %17, 3
  %19 = zext i1 %18 to i64
  %20 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 0
  %21 = load i32* %20, align 4
  %22 = and i32 %8, -4095
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %27, label %24, !prof !0

; <label>:24                                      ; preds = %6
  %25 = zext i1 %18 to i32
  %26 = tail call zeroext i16 @__ldw_mmu(i32 %8, i32 %25)
  br label %35

; <label>:27                                      ; preds = %6
  %28 = and i64 %7, 4294967295
  %29 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 %19, i64 %13, i32 3
  %30 = load i64* %29, align 8
  %31 = add i64 %30, %28
  %32 = inttoptr i64 %31 to i16*
  %33 = load i16* %32, align 2
  %34 = sext i16 %33 to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %28, i64 %31, i64 %34, i32 32, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %35

; <label>:35                                      ; preds = %27, %24
  %res.0.in = phi i16 [ %26, %24 ], [ %33, %27 ]
  %res.0 = sext i16 %res.0.in to i32
  ret i32 %res.0
}

define void @helper_boundl(i32 %a0, i32 %v) nounwind uwtable sspreq {
  %1 = tail call fastcc i32 @ldl_data(i32 %a0)
  %2 = add i32 %a0, 4
  %3 = tail call fastcc i32 @ldl_data(i32 %2)
  %4 = icmp sgt i32 %1, %v
  %5 = icmp slt i32 %3, %v
  %or.cond = or i1 %4, %5
  br i1 %or.cond, label %6, label %7

; <label>:6                                       ; preds = %0
  tail call fastcc void @raise_exception(i32 5) noreturn
  unreachable

; <label>:7                                       ; preds = %0
  ret void
}

define zeroext i8 @io_read_chkb_mmu(i64 %physaddr, i32 %addr, i8* %retaddr) nounwind uwtable inlinehint alwaysinline sspreq {
  %ret.i.i = alloca i8, align 1
  %label = alloca [64 x i8], align 16
  %1 = call %struct.MemoryRegion* @iotlb_to_region(i64 %physaddr) nounwind
  %2 = and i64 %physaddr, 4294963200
  %3 = zext i32 %addr to i64
  %4 = add i64 %3, %2
  %5 = and i64 %4, 4294967295
  %6 = call i32 @s2e_is_mmio_symbolic_b(i64 %5) nounwind
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = trunc i64 %4 to i32
  %10 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 4
  %13 = load i32* %12, align 4
  call void @trace_port(i8* %10, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %9, i32 %13)
  br label %14

; <label>:14                                      ; preds = %8, %0
  %15 = ptrtoint i8* %retaddr to i64
  %16 = load %struct.CPUX86State** @env, align 8
  %17 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 69
  store i64 %15, i64* %17, align 8
  %18 = icmp ne %struct.MemoryRegion* %1, @io_mem_ram
  %19 = icmp ne %struct.MemoryRegion* %1, @io_mem_rom
  %or.cond = and i1 %18, %19
  %20 = icmp ne %struct.MemoryRegion* %1, @io_mem_unassigned
  %or.cond3 = and i1 %or.cond, %20
  %21 = icmp ne %struct.MemoryRegion* %1, @io_mem_notdirty
  %or.cond5 = and i1 %or.cond3, %21
  %22 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not = xor i1 %or.cond5, true
  %23 = load i32* @use_icount, align 4
  %24 = icmp eq i32 %23, 0
  %or.cond7 = or i1 %24, %or.cond5.not
  br i1 %or.cond7, label %can_do_io.exit.thread, label %25

; <label>:25                                      ; preds = %14
  %26 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 67
  %27 = load %struct.TranslationBlock** %26, align 8
  %28 = icmp eq %struct.TranslationBlock* %27, null
  br i1 %28, label %can_do_io.exit.thread, label %can_do_io.exit

can_do_io.exit:                                   ; preds = %25
  %29 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 86
  %30 = load i32* %29, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %can_do_io.exit.thread

; <label>:32                                      ; preds = %can_do_io.exit
  call void @cpu_io_recompile(%struct.CPUX86State* %22, i8* %retaddr) noreturn nounwind
  unreachable

can_do_io.exit.thread:                            ; preds = %can_do_io.exit, %25, %14
  %33 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 70
  store i32 %addr, i32* %33, align 4
  %34 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %1, i32 0) nounwind
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %46, label %36

; <label>:36                                      ; preds = %can_do_io.exit.thread
  %37 = call i64 @s2e_notdirty_mem_write(i64 %physaddr) nounwind
  %38 = inttoptr i64 %37 to i8*
  %39 = load i8* %38, align 1
  br i1 %7, label %40, label %io_read_chk_symb_b.exit

; <label>:40                                      ; preds = %36
  %41 = call i32 @s2e_is_mmio_symbolic_b(i64 %5) nounwind
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %io_read_chk_symb_b.exit, label %43

; <label>:43                                      ; preds = %40
  %44 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  call void @klee_make_symbolic(i8* %ret.i.i, i32 1, i8* %44) nounwind
  %45 = load i8* %ret.i.i, align 1
  br label %io_read_chk_symb_b.exit

; <label>:46                                      ; preds = %can_do_io.exit.thread
  %47 = call zeroext i8 @io_readb_mmu(i64 %physaddr, i32 %addr, i8* %retaddr) nounwind
  br label %io_read_chk_symb_b.exit

io_read_chk_symb_b.exit:                          ; preds = %36, %46, %43, %40
  %.0 = phi i8 [ %47, %46 ], [ %39, %40 ], [ %45, %43 ], [ %39, %36 ]
  ret i8 %.0
}

declare %struct.MemoryRegion* @iotlb_to_region(i64)

declare i32 @s2e_is_mmio_symbolic_b(i64)

declare void @cpu_io_recompile(%struct.CPUX86State*, i8*) noreturn

declare i32 @s2e_ismemfunc(%struct.MemoryRegion*, i32)

declare i64 @s2e_notdirty_mem_write(i64)

declare zeroext i8 @io_readb_mmu(i64, i32, i8*)

define zeroext i8 @__ldb_mmu(i32 %addr, i32 %mmu_idx) nounwind uwtable sspreq {
  %ret.i.i.i = alloca i8, align 1
  %label.i = alloca [64 x i8], align 16
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph, !prof !0

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %83

._crit_edge:                                      ; preds = %83, %6
  %.lcssa3 = phi i32 [ %19, %6 ], [ %87, %83 ]
  %.lcssa2 = phi %struct.CPUX86State* [ %17, %6 ], [ %85, %83 ]
  %24 = and i32 %.lcssa3, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %75, label %26, !prof !0

; <label>:26                                      ; preds = %._crit_edge
  %27 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 76, i64 %16, i64 %15
  %28 = load i64* %27, align 8
  %29 = getelementptr inbounds [64 x i8]* %label.i, i64 0, i64 0
  %30 = call %struct.MemoryRegion* @iotlb_to_region(i64 %28) nounwind
  %31 = and i64 %28, 4294963200
  %fold = add i64 %31, %7
  %32 = and i64 %fold, 4294967295
  %33 = call i32 @s2e_is_mmio_symbolic_b(i64 %32) nounwind
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %40

; <label>:35                                      ; preds = %26
  %36 = trunc i64 %fold to i32
  %37 = load %struct.CPUX86State** @env, align 8
  %38 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 4
  %39 = load i32* %38, align 4
  call void @trace_port(i8* %29, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %36, i32 %39) nounwind
  br label %40

; <label>:40                                      ; preds = %35, %26
  %41 = load %struct.CPUX86State** @env, align 8
  %42 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 69
  store i64 0, i64* %42, align 8
  %43 = icmp ne %struct.MemoryRegion* %30, @io_mem_ram
  %44 = icmp ne %struct.MemoryRegion* %30, @io_mem_rom
  %or.cond.i = and i1 %43, %44
  %45 = icmp ne %struct.MemoryRegion* %30, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %45
  %46 = icmp ne %struct.MemoryRegion* %30, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %46
  %47 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %48 = load i32* @use_icount, align 4
  %49 = icmp eq i32 %48, 0
  %or.cond7.i = or i1 %49, %or.cond5.not.i
  br i1 %or.cond7.i, label %can_do_io.exit.thread.i, label %50

; <label>:50                                      ; preds = %40
  %51 = getelementptr inbounds %struct.CPUX86State* %47, i64 0, i32 67
  %52 = load %struct.TranslationBlock** %51, align 8
  %53 = icmp eq %struct.TranslationBlock* %52, null
  br i1 %53, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %50
  %54 = getelementptr inbounds %struct.CPUX86State* %47, i64 0, i32 86
  %55 = load i32* %54, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %can_do_io.exit.thread.i

; <label>:57                                      ; preds = %can_do_io.exit.i
  call void @cpu_io_recompile(%struct.CPUX86State* %47, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %50, %40
  %58 = getelementptr inbounds %struct.CPUX86State* %47, i64 0, i32 70
  store i32 %8, i32* %58, align 4
  %59 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %30, i32 0) nounwind
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %70, label %61

; <label>:61                                      ; preds = %can_do_io.exit.thread.i
  %62 = call i64 @s2e_notdirty_mem_write(i64 %28) nounwind
  %63 = inttoptr i64 %62 to i8*
  %64 = load i8* %63, align 1
  br i1 %34, label %65, label %io_read_chkb_mmu.exit

; <label>:65                                      ; preds = %61
  %66 = call i32 @s2e_is_mmio_symbolic_b(i64 %32) nounwind
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %io_read_chkb_mmu.exit, label %68

; <label>:68                                      ; preds = %65
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %29) nounwind
  %69 = load i8* %ret.i.i.i, align 1
  br label %io_read_chkb_mmu.exit

; <label>:70                                      ; preds = %can_do_io.exit.thread.i
  %71 = call zeroext i8 @io_readb_mmu(i64 %28, i32 %8, i8* null) nounwind
  br label %io_read_chkb_mmu.exit

io_read_chkb_mmu.exit:                            ; preds = %61, %70, %68, %65
  %.0.i = phi i8 [ %71, %70 ], [ %64, %65 ], [ %69, %68 ], [ %64, %61 ]
  %72 = and i64 %7, 4294967295
  %73 = add i64 %28, %72
  %74 = zext i8 %.0.i to i64
  call void @tcg_llvm_trace_memory_access(i64 %72, i64 %73, i64 %74, i32 8, i8 zeroext 0, i8 zeroext 1) nounwind
  br label %90

; <label>:75                                      ; preds = %._crit_edge
  %76 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %77 = load i64* %76, align 8
  %78 = and i64 %7, 4294967295
  %79 = add i64 %77, %78
  %80 = inttoptr i64 %79 to i8*
  %81 = load i8* %80, align 1
  %82 = zext i8 %81 to i64
  call void @tcg_llvm_trace_memory_access(i64 %78, i64 %79, i64 %82, i32 8, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %90

; <label>:83                                      ; preds = %83, %.lr.ph
  %84 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %85, %83 ]
  call void @tlb_fill(%struct.CPUX86State* %84, i32 %8, i32 %23, i32 0, i32 %mmu_idx, i8* null)
  %85 = load %struct.CPUX86State** @env, align 8
  %86 = getelementptr inbounds %struct.CPUX86State* %85, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %87 = load i32* %86, align 4
  %88 = and i32 %87, -4088
  %89 = icmp eq i32 %20, %88
  br i1 %89, label %._crit_edge, label %83, !prof !0

; <label>:90                                      ; preds = %75, %io_read_chkb_mmu.exit
  %res.0 = phi i8 [ %.0.i, %io_read_chkb_mmu.exit ], [ %81, %75 ]
  ret i8 %res.0
}

declare i64 @tcg_llvm_fork_and_concretize(i64, i64, i64)

declare void @tcg_llvm_trace_memory_access(i64, i64, i64, i32, i8 zeroext, i8 zeroext)

define void @tlb_fill(%struct.CPUX86State* %env1, i32 %addr, i32 %page_addr, i32 %is_write, i32 %mmu_idx, i8* %retaddr) nounwind uwtable sspreq {
  %1 = load %struct.S2E** @g_s2e, align 8
  %2 = load %struct.S2EExecutionState** @g_s2e_state, align 8
  %3 = zext i32 %addr to i64
  tail call void @s2e_on_tlb_miss(%struct.S2E* %1, %struct.S2EExecutionState* %2, i64 %3, i32 %is_write) nounwind
  %4 = load %struct.CPUX86State** @env, align 8
  %5 = tail call i32 @cpu_x86_handle_mmu_fault(%struct.CPUX86State* %4, i32 %page_addr, i32 %is_write, i32 %mmu_idx) nounwind
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %39, label %7

; <label>:7                                       ; preds = %0
  %8 = load %struct.CPUX86State** @env, align 8
  %9 = getelementptr inbounds %struct.CPUX86State* %8, i64 0, i32 93
  %10 = load i32* %9, align 4
  %11 = icmp eq i32 %10, 14
  br i1 %11, label %12, label %23

; <label>:12                                      ; preds = %7
  %13 = getelementptr inbounds %struct.CPUX86State* %8, i64 0, i32 47
  %14 = load i32* %13, align 4
  %15 = and i32 %14, 16384
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %21, label %17

; <label>:17                                      ; preds = %12
  %18 = getelementptr inbounds %struct.CPUX86State* %8, i64 0, i32 40
  %19 = load i64* %18, align 8
  %20 = add i64 %19, 128
  tail call void @stq_phys(i64 %20, i64 %3) nounwind
  br label %23

; <label>:21                                      ; preds = %12
  %22 = getelementptr inbounds %struct.CPUX86State* %8, i64 0, i32 14, i64 2
  store i32 %addr, i32* %22, align 4
  br label %23

; <label>:23                                      ; preds = %21, %17, %7
  %24 = icmp eq i8* %retaddr, null
  br i1 %24, label %31, label %25

; <label>:25                                      ; preds = %23
  %26 = ptrtoint i8* %retaddr to i64
  %27 = tail call %struct.TranslationBlock* @tb_find_pc(i64 %26) nounwind
  %28 = icmp eq %struct.TranslationBlock* %27, null
  br i1 %28, label %31, label %29

; <label>:29                                      ; preds = %25
  %30 = tail call i32 @cpu_restore_state(%struct.TranslationBlock* %27, %struct.CPUX86State* %env1, i64 %26) nounwind
  br label %31

; <label>:31                                      ; preds = %29, %25, %23
  %32 = load %struct.S2E** @g_s2e, align 8
  %33 = load %struct.S2EExecutionState** @g_s2e_state, align 8
  tail call void @s2e_on_page_fault(%struct.S2E* %32, %struct.S2EExecutionState* %33, i64 %3, i32 %is_write) nounwind
  %34 = load %struct.CPUX86State** @env, align 8
  %35 = getelementptr inbounds %struct.CPUX86State* %34, i64 0, i32 93
  %36 = load i32* %35, align 4
  %37 = getelementptr inbounds %struct.CPUX86State* %34, i64 0, i32 56
  %38 = load i32* %37, align 4
  tail call fastcc void @raise_exception_err(i32 %36, i32 %38) noreturn
  unreachable

; <label>:39                                      ; preds = %0
  ret void
}

define void @io_write_chkb_mmu(i64 %physaddr, i8 zeroext %val, i32 %addr, i8* %retaddr) nounwind uwtable inlinehint alwaysinline sspreq {
  %1 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %physaddr) nounwind
  %2 = and i64 %physaddr, -4096
  %3 = zext i32 %addr to i64
  %4 = add i64 %3, %2
  %5 = icmp ne %struct.MemoryRegion* %1, @io_mem_ram
  %6 = icmp ne %struct.MemoryRegion* %1, @io_mem_rom
  %or.cond = and i1 %5, %6
  %7 = icmp ne %struct.MemoryRegion* %1, @io_mem_unassigned
  %or.cond3 = and i1 %or.cond, %7
  %8 = icmp ne %struct.MemoryRegion* %1, @io_mem_notdirty
  %or.cond5 = and i1 %or.cond3, %8
  %9 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not = xor i1 %or.cond5, true
  %10 = load i32* @use_icount, align 4
  %11 = icmp eq i32 %10, 0
  %or.cond8 = or i1 %11, %or.cond5.not
  br i1 %or.cond8, label %can_do_io.exit.thread, label %12

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 67
  %14 = load %struct.TranslationBlock** %13, align 8
  %15 = icmp eq %struct.TranslationBlock* %14, null
  br i1 %15, label %can_do_io.exit.thread, label %can_do_io.exit

can_do_io.exit:                                   ; preds = %12
  %16 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 86
  %17 = load i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %can_do_io.exit.thread

; <label>:19                                      ; preds = %can_do_io.exit
  tail call void @cpu_io_recompile(%struct.CPUX86State* %9, i8* %retaddr) noreturn nounwind
  unreachable

can_do_io.exit.thread:                            ; preds = %can_do_io.exit, %12, %0
  %20 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 70
  store i32 %addr, i32* %20, align 4
  %21 = ptrtoint i8* %retaddr to i64
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 69
  store i64 %21, i64* %23, align 8
  %24 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %1, i32 1) nounwind
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %29, label %26

; <label>:26                                      ; preds = %can_do_io.exit.thread
  %27 = tail call i64 @s2e_notdirty_mem_write(i64 %4) nounwind
  %28 = inttoptr i64 %27 to i8*
  store i8 %val, i8* %28, align 1
  br label %42

; <label>:29                                      ; preds = %can_do_io.exit.thread
  %30 = load i32* @g_s2e_concretize_io_writes, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %36, label %32

; <label>:32                                      ; preds = %29
  %33 = zext i8 %val to i32
  %34 = tail call i32 @klee_get_value(i32 %33) nounwind
  %35 = trunc i32 %34 to i8
  br label %36

; <label>:36                                      ; preds = %32, %29
  %.0 = phi i8 [ %35, %32 ], [ %val, %29 ]
  %37 = load i32* @g_s2e_concretize_io_addresses, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %41, label %39

; <label>:39                                      ; preds = %36
  %40 = tail call i32 @klee_get_value(i32 %addr) nounwind
  br label %41

; <label>:41                                      ; preds = %39, %36
  %.06 = phi i32 [ %40, %39 ], [ %addr, %36 ]
  tail call void @io_writeb_mmu(i64 %physaddr, i8 zeroext %.0, i32 %.06, i8* %retaddr) nounwind
  br label %42

; <label>:42                                      ; preds = %41, %26
  ret void
}

declare void @io_writeb_mmu(i64, i8 zeroext, i32, i8*)

define void @__stb_mmu(i32 %addr, i8 zeroext %val, i32 %mmu_idx) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 1
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph, !prof !0

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %78

._crit_edge:                                      ; preds = %78, %6
  %.lcssa3 = phi i32 [ %19, %6 ], [ %82, %78 ]
  %.lcssa2 = phi %struct.CPUX86State* [ %17, %6 ], [ %80, %78 ]
  %24 = and i32 %.lcssa3, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %71, label %26, !prof !0

; <label>:26                                      ; preds = %._crit_edge
  %27 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 76, i64 %16, i64 %15
  %28 = load i64* %27, align 8
  %29 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %28) nounwind
  %30 = and i64 %28, -4096
  %31 = and i64 %7, 4294967295
  %32 = add i64 %30, %31
  %33 = icmp ne %struct.MemoryRegion* %29, @io_mem_ram
  %34 = icmp ne %struct.MemoryRegion* %29, @io_mem_rom
  %or.cond.i = and i1 %33, %34
  %35 = icmp ne %struct.MemoryRegion* %29, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %35
  %36 = icmp ne %struct.MemoryRegion* %29, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %36
  %37 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %38 = load i32* @use_icount, align 4
  %39 = icmp eq i32 %38, 0
  %or.cond8.i = or i1 %39, %or.cond5.not.i
  br i1 %or.cond8.i, label %can_do_io.exit.thread.i, label %40

; <label>:40                                      ; preds = %26
  %41 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 67
  %42 = load %struct.TranslationBlock** %41, align 8
  %43 = icmp eq %struct.TranslationBlock* %42, null
  br i1 %43, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %40
  %44 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 86
  %45 = load i32* %44, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %can_do_io.exit.thread.i

; <label>:47                                      ; preds = %can_do_io.exit.i
  tail call void @cpu_io_recompile(%struct.CPUX86State* %37, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %40, %26
  %48 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 70
  store i32 %8, i32* %48, align 4
  %49 = load %struct.CPUX86State** @env, align 8
  %50 = getelementptr inbounds %struct.CPUX86State* %49, i64 0, i32 69
  store i64 0, i64* %50, align 8
  %51 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %29, i32 1) nounwind
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %56, label %53

; <label>:53                                      ; preds = %can_do_io.exit.thread.i
  %54 = tail call i64 @s2e_notdirty_mem_write(i64 %32) nounwind
  %55 = inttoptr i64 %54 to i8*
  store i8 %val, i8* %55, align 1
  br label %io_write_chkb_mmu.exit

; <label>:56                                      ; preds = %can_do_io.exit.thread.i
  %57 = load i32* @g_s2e_concretize_io_writes, align 4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %63, label %59

; <label>:59                                      ; preds = %56
  %60 = zext i8 %val to i32
  %61 = tail call i32 @klee_get_value(i32 %60) nounwind
  %62 = trunc i32 %61 to i8
  br label %63

; <label>:63                                      ; preds = %59, %56
  %.0.i = phi i8 [ %62, %59 ], [ %val, %56 ]
  %64 = load i32* @g_s2e_concretize_io_addresses, align 4
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %68, label %66

; <label>:66                                      ; preds = %63
  %67 = tail call i32 @klee_get_value(i32 %8) nounwind
  br label %68

; <label>:68                                      ; preds = %66, %63
  %.06.i = phi i32 [ %67, %66 ], [ %8, %63 ]
  tail call void @io_writeb_mmu(i64 %28, i8 zeroext %.0.i, i32 %.06.i, i8* null) nounwind
  br label %io_write_chkb_mmu.exit

io_write_chkb_mmu.exit:                           ; preds = %68, %53
  %69 = add i64 %28, %31
  %70 = zext i8 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %31, i64 %69, i64 %70, i32 8, i8 zeroext 1, i8 zeroext 1) nounwind
  br label %85

; <label>:71                                      ; preds = %._crit_edge
  %72 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %73 = load i64* %72, align 8
  %74 = and i64 %7, 4294967295
  %75 = add i64 %73, %74
  %76 = inttoptr i64 %75 to i8*
  store i8 %val, i8* %76, align 1
  %77 = zext i8 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %74, i64 %75, i64 %77, i32 8, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %85

; <label>:78                                      ; preds = %78, %.lr.ph
  %79 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %80, %78 ]
  tail call void @tlb_fill(%struct.CPUX86State* %79, i32 %8, i32 %23, i32 1, i32 %mmu_idx, i8* null)
  %80 = load %struct.CPUX86State** @env, align 8
  %81 = getelementptr inbounds %struct.CPUX86State* %80, i64 0, i32 74, i64 %16, i64 %15, i32 1
  %82 = load i32* %81, align 4
  %83 = and i32 %82, -4088
  %84 = icmp eq i32 %20, %83
  br i1 %84, label %._crit_edge, label %78, !prof !0

; <label>:85                                      ; preds = %71, %io_write_chkb_mmu.exit
  ret void
}

define internal fastcc void @slow_stb_mmu(i32 %addr, i8 zeroext %val, i32 %mmu_idx) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 1
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %78

._crit_edge:                                      ; preds = %78, %6
  %.lcssa3 = phi i32 [ %19, %6 ], [ %82, %78 ]
  %.lcssa2 = phi %struct.CPUX86State* [ %17, %6 ], [ %80, %78 ]
  %24 = and i32 %.lcssa3, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %71, label %26

; <label>:26                                      ; preds = %._crit_edge
  %27 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 76, i64 %16, i64 %15
  %28 = load i64* %27, align 8
  %29 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %28) nounwind
  %30 = and i64 %28, -4096
  %31 = and i64 %7, 4294967295
  %32 = add i64 %30, %31
  %33 = icmp ne %struct.MemoryRegion* %29, @io_mem_ram
  %34 = icmp ne %struct.MemoryRegion* %29, @io_mem_rom
  %or.cond.i = and i1 %33, %34
  %35 = icmp ne %struct.MemoryRegion* %29, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %35
  %36 = icmp ne %struct.MemoryRegion* %29, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %36
  %37 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %38 = load i32* @use_icount, align 4
  %39 = icmp eq i32 %38, 0
  %or.cond8.i = or i1 %39, %or.cond5.not.i
  br i1 %or.cond8.i, label %can_do_io.exit.thread.i, label %40

; <label>:40                                      ; preds = %26
  %41 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 67
  %42 = load %struct.TranslationBlock** %41, align 8
  %43 = icmp eq %struct.TranslationBlock* %42, null
  br i1 %43, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %40
  %44 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 86
  %45 = load i32* %44, align 4
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %can_do_io.exit.thread.i

; <label>:47                                      ; preds = %can_do_io.exit.i
  tail call void @cpu_io_recompile(%struct.CPUX86State* %37, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %40, %26
  %48 = getelementptr inbounds %struct.CPUX86State* %37, i64 0, i32 70
  store i32 %8, i32* %48, align 4
  %49 = load %struct.CPUX86State** @env, align 8
  %50 = getelementptr inbounds %struct.CPUX86State* %49, i64 0, i32 69
  store i64 0, i64* %50, align 8
  %51 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %29, i32 1) nounwind
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %56, label %53

; <label>:53                                      ; preds = %can_do_io.exit.thread.i
  %54 = tail call i64 @s2e_notdirty_mem_write(i64 %32) nounwind
  %55 = inttoptr i64 %54 to i8*
  store i8 %val, i8* %55, align 1
  br label %io_write_chkb_mmu.exit

; <label>:56                                      ; preds = %can_do_io.exit.thread.i
  %57 = load i32* @g_s2e_concretize_io_writes, align 4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %63, label %59

; <label>:59                                      ; preds = %56
  %60 = zext i8 %val to i32
  %61 = tail call i32 @klee_get_value(i32 %60) nounwind
  %62 = trunc i32 %61 to i8
  br label %63

; <label>:63                                      ; preds = %59, %56
  %.0.i = phi i8 [ %62, %59 ], [ %val, %56 ]
  %64 = load i32* @g_s2e_concretize_io_addresses, align 4
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %68, label %66

; <label>:66                                      ; preds = %63
  %67 = tail call i32 @klee_get_value(i32 %8) nounwind
  br label %68

; <label>:68                                      ; preds = %66, %63
  %.06.i = phi i32 [ %67, %66 ], [ %8, %63 ]
  tail call void @io_writeb_mmu(i64 %28, i8 zeroext %.0.i, i32 %.06.i, i8* null) nounwind
  br label %io_write_chkb_mmu.exit

io_write_chkb_mmu.exit:                           ; preds = %68, %53
  %69 = add i64 %28, %31
  %70 = zext i8 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %31, i64 %69, i64 %70, i32 8, i8 zeroext 1, i8 zeroext 1) nounwind
  br label %85

; <label>:71                                      ; preds = %._crit_edge
  %72 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %73 = load i64* %72, align 8
  %74 = and i64 %7, 4294967295
  %75 = add i64 %73, %74
  %76 = inttoptr i64 %75 to i8*
  store i8 %val, i8* %76, align 1
  %77 = zext i8 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %74, i64 %75, i64 %77, i32 8, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %85

; <label>:78                                      ; preds = %78, %.lr.ph
  %79 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %80, %78 ]
  tail call void @tlb_fill(%struct.CPUX86State* %79, i32 %8, i32 %23, i32 1, i32 %mmu_idx, i8* null)
  %80 = load %struct.CPUX86State** @env, align 8
  %81 = getelementptr inbounds %struct.CPUX86State* %80, i64 0, i32 74, i64 %16, i64 %15, i32 1
  %82 = load i32* %81, align 4
  %83 = and i32 %82, -4088
  %84 = icmp eq i32 %20, %83
  br i1 %84, label %._crit_edge, label %78

; <label>:85                                      ; preds = %71, %io_write_chkb_mmu.exit
  ret void
}

define zeroext i16 @io_read_chkw_mmu(i64 %physaddr, i32 %addr, i8* %retaddr) nounwind uwtable inlinehint alwaysinline sspreq {
  %ret.i.i = alloca i8, align 1
  %label = alloca [64 x i8], align 16
  %1 = call %struct.MemoryRegion* @iotlb_to_region(i64 %physaddr) nounwind
  %2 = and i64 %physaddr, 4294963200
  %3 = zext i32 %addr to i64
  %4 = add i64 %3, %2
  %5 = trunc i64 %4 to i32
  %6 = and i64 %4, 4294967295
  %7 = call i32 @s2e_is_mmio_symbolic_w(i64 %6) nounwind
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 4
  %13 = load i32* %12, align 4
  call void @trace_port(i8* %10, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %5, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %0
  %15 = ptrtoint i8* %retaddr to i64
  %16 = load %struct.CPUX86State** @env, align 8
  %17 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 69
  store i64 %15, i64* %17, align 8
  %18 = icmp ne %struct.MemoryRegion* %1, @io_mem_ram
  %19 = icmp ne %struct.MemoryRegion* %1, @io_mem_rom
  %or.cond = and i1 %18, %19
  %20 = icmp ne %struct.MemoryRegion* %1, @io_mem_unassigned
  %or.cond3 = and i1 %or.cond, %20
  %21 = icmp ne %struct.MemoryRegion* %1, @io_mem_notdirty
  %or.cond5 = and i1 %or.cond3, %21
  %22 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not = xor i1 %or.cond5, true
  %23 = load i32* @use_icount, align 4
  %24 = icmp eq i32 %23, 0
  %or.cond11 = or i1 %24, %or.cond5.not
  br i1 %or.cond11, label %can_do_io.exit.thread, label %25

; <label>:25                                      ; preds = %14
  %26 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 67
  %27 = load %struct.TranslationBlock** %26, align 8
  %28 = icmp eq %struct.TranslationBlock* %27, null
  br i1 %28, label %can_do_io.exit.thread, label %can_do_io.exit

can_do_io.exit:                                   ; preds = %25
  %29 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 86
  %30 = load i32* %29, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %can_do_io.exit.thread

; <label>:32                                      ; preds = %can_do_io.exit
  call void @cpu_io_recompile(%struct.CPUX86State* %22, i8* %retaddr) noreturn nounwind
  unreachable

can_do_io.exit.thread:                            ; preds = %can_do_io.exit, %25, %14
  %33 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 70
  store i32 %addr, i32* %33, align 4
  %34 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %1, i32 0) nounwind
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %60, label %36

; <label>:36                                      ; preds = %can_do_io.exit.thread
  %37 = call i64 @s2e_notdirty_mem_write(i64 %physaddr) nounwind
  br i1 %8, label %38, label %57

; <label>:38                                      ; preds = %36
  %39 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  %40 = inttoptr i64 %37 to i16*
  %41 = load i16* %40, align 2
  %42 = call i32 @s2e_is_mmio_symbolic_b(i64 %6) nounwind
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %47, label %44

; <label>:44                                      ; preds = %38
  call void @klee_make_symbolic(i8* %ret.i.i, i32 1, i8* %39) nounwind
  %45 = load i8* %ret.i.i, align 1
  %46 = zext i8 %45 to i16
  %mask = and i16 %41, -256
  %ins = or i16 %46, %mask
  br label %47

; <label>:47                                      ; preds = %44, %38
  %48 = phi i16 [ %ins, %44 ], [ %41, %38 ]
  %49 = add i32 %5, 1
  %50 = zext i32 %49 to i64
  %51 = call i32 @s2e_is_mmio_symbolic_b(i64 %50) nounwind
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %io_read_chk_symb_w.exit, label %53

; <label>:53                                      ; preds = %47
  call void @klee_make_symbolic(i8* %ret.i.i, i32 1, i8* %39) nounwind
  %54 = load i8* %ret.i.i, align 1
  %55 = zext i8 %54 to i16
  %56 = shl nuw i16 %55, 8
  %mask7 = and i16 %48, 255
  %ins8 = or i16 %56, %mask7
  br label %io_read_chk_symb_w.exit

; <label>:57                                      ; preds = %36
  %58 = inttoptr i64 %37 to i16*
  %59 = load i16* %58, align 2
  br label %io_read_chk_symb_w.exit

; <label>:60                                      ; preds = %can_do_io.exit.thread
  %61 = call zeroext i16 @io_readw_mmu(i64 %physaddr, i32 %addr, i8* %retaddr) nounwind
  br label %io_read_chk_symb_w.exit

io_read_chk_symb_w.exit:                          ; preds = %60, %57, %53, %47
  %.0 = phi i16 [ %59, %57 ], [ %61, %60 ], [ %48, %47 ], [ %ins8, %53 ]
  ret i16 %.0
}

declare i32 @s2e_is_mmio_symbolic_w(i64)

declare zeroext i16 @io_readw_mmu(i64, i32, i8*)

define zeroext i16 @__ldw_mmu(i32 %addr, i32 %mmu_idx) nounwind uwtable sspreq {
  %ret.i.i.i = alloca i8, align 1
  %label.i = alloca [64 x i8], align 16
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph, !prof !0

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %104

._crit_edge:                                      ; preds = %104, %6
  %.lcssa3 = phi i32 [ %19, %6 ], [ %108, %104 ]
  %.lcssa2 = phi %struct.CPUX86State* [ %17, %6 ], [ %106, %104 ]
  %24 = and i32 %.lcssa3, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %90, label %26, !prof !0

; <label>:26                                      ; preds = %._crit_edge
  %27 = and i32 %8, 1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %94

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 76, i64 %16, i64 %15
  %31 = load i64* %30, align 8
  %32 = getelementptr inbounds [64 x i8]* %label.i, i64 0, i64 0
  %33 = call %struct.MemoryRegion* @iotlb_to_region(i64 %31) nounwind
  %34 = and i64 %31, 4294963200
  %35 = add i64 %34, %7
  %36 = trunc i64 %35 to i32
  %37 = and i64 %35, 4294967295
  %38 = call i32 @s2e_is_mmio_symbolic_w(i64 %37) nounwind
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %29
  %41 = load %struct.CPUX86State** @env, align 8
  %42 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 4
  %43 = load i32* %42, align 4
  call void @trace_port(i8* %32, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %36, i32 %43) nounwind
  br label %44

; <label>:44                                      ; preds = %40, %29
  %45 = load %struct.CPUX86State** @env, align 8
  %46 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 69
  store i64 0, i64* %46, align 8
  %47 = icmp ne %struct.MemoryRegion* %33, @io_mem_ram
  %48 = icmp ne %struct.MemoryRegion* %33, @io_mem_rom
  %or.cond.i = and i1 %47, %48
  %49 = icmp ne %struct.MemoryRegion* %33, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %49
  %50 = icmp ne %struct.MemoryRegion* %33, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %50
  %51 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %52 = load i32* @use_icount, align 4
  %53 = icmp eq i32 %52, 0
  %or.cond11.i = or i1 %53, %or.cond5.not.i
  br i1 %or.cond11.i, label %can_do_io.exit.thread.i, label %54

; <label>:54                                      ; preds = %44
  %55 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 67
  %56 = load %struct.TranslationBlock** %55, align 8
  %57 = icmp eq %struct.TranslationBlock* %56, null
  br i1 %57, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %54
  %58 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 86
  %59 = load i32* %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %can_do_io.exit.thread.i

; <label>:61                                      ; preds = %can_do_io.exit.i
  call void @cpu_io_recompile(%struct.CPUX86State* %51, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %54, %44
  %62 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 70
  store i32 %8, i32* %62, align 4
  %63 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %33, i32 0) nounwind
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %85, label %65

; <label>:65                                      ; preds = %can_do_io.exit.thread.i
  %66 = call i64 @s2e_notdirty_mem_write(i64 %31) nounwind
  %67 = inttoptr i64 %66 to i16*
  %68 = load i16* %67, align 2
  br i1 %39, label %69, label %io_read_chkw_mmu.exit

; <label>:69                                      ; preds = %65
  %70 = call i32 @s2e_is_mmio_symbolic_b(i64 %37) nounwind
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %75, label %72

; <label>:72                                      ; preds = %69
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %73 = load i8* %ret.i.i.i, align 1
  %74 = zext i8 %73 to i16
  %mask.i = and i16 %68, -256
  %ins.i = or i16 %74, %mask.i
  br label %75

; <label>:75                                      ; preds = %72, %69
  %76 = phi i16 [ %ins.i, %72 ], [ %68, %69 ]
  %77 = add i32 %36, 1
  %78 = zext i32 %77 to i64
  %79 = call i32 @s2e_is_mmio_symbolic_b(i64 %78) nounwind
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %io_read_chkw_mmu.exit, label %81

; <label>:81                                      ; preds = %75
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %82 = load i8* %ret.i.i.i, align 1
  %83 = zext i8 %82 to i16
  %84 = shl nuw i16 %83, 8
  %mask7.i = and i16 %76, 255
  %ins8.i = or i16 %84, %mask7.i
  br label %io_read_chkw_mmu.exit

; <label>:85                                      ; preds = %can_do_io.exit.thread.i
  %86 = call zeroext i16 @io_readw_mmu(i64 %31, i32 %8, i8* null) nounwind
  br label %io_read_chkw_mmu.exit

io_read_chkw_mmu.exit:                            ; preds = %85, %81, %75, %65
  %.0.i = phi i16 [ %86, %85 ], [ %76, %75 ], [ %ins8.i, %81 ], [ %68, %65 ]
  %87 = and i64 %7, 4294967295
  %88 = add i64 %31, %87
  %89 = zext i16 %.0.i to i64
  call void @tcg_llvm_trace_memory_access(i64 %87, i64 %88, i64 %89, i32 16, i8 zeroext 0, i8 zeroext 1) nounwind
  br label %111

; <label>:90                                      ; preds = %._crit_edge
  %91 = and i32 %8, 127
  %92 = add i32 %91, 1
  %93 = icmp ugt i32 %92, 127
  br i1 %93, label %94, label %96, !prof !1

; <label>:94                                      ; preds = %90, %26
  %95 = call fastcc zeroext i16 @slow_ldw_mmu(i32 %8, i32 %mmu_idx)
  br label %111

; <label>:96                                      ; preds = %90
  %97 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %98 = load i64* %97, align 8
  %99 = and i64 %7, 4294967295
  %100 = add i64 %98, %99
  %101 = inttoptr i64 %100 to i16*
  %102 = load i16* %101, align 2
  %103 = zext i16 %102 to i64
  call void @tcg_llvm_trace_memory_access(i64 %99, i64 %100, i64 %103, i32 16, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %111

; <label>:104                                     ; preds = %104, %.lr.ph
  %105 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %106, %104 ]
  call void @tlb_fill(%struct.CPUX86State* %105, i32 %8, i32 %23, i32 0, i32 %mmu_idx, i8* null)
  %106 = load %struct.CPUX86State** @env, align 8
  %107 = getelementptr inbounds %struct.CPUX86State* %106, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %108 = load i32* %107, align 4
  %109 = and i32 %108, -4088
  %110 = icmp eq i32 %20, %109
  br i1 %110, label %._crit_edge, label %104, !prof !0

; <label>:111                                     ; preds = %96, %94, %io_read_chkw_mmu.exit
  %res.0 = phi i16 [ %95, %94 ], [ %.0.i, %io_read_chkw_mmu.exit ], [ %102, %96 ]
  ret i16 %res.0
}

define internal fastcc zeroext i16 @slow_ldw_mmu(i32 %addr, i32 %mmu_idx) nounwind uwtable sspreq {
  %ret.i.i.i = alloca i8, align 1
  %label.i = alloca [64 x i8], align 16
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %116

._crit_edge:                                      ; preds = %116, %6
  %.lcssa3 = phi i32 [ %19, %6 ], [ %120, %116 ]
  %.lcssa2 = phi %struct.CPUX86State* [ %17, %6 ], [ %118, %116 ]
  %24 = and i32 %.lcssa3, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %90, label %26

; <label>:26                                      ; preds = %._crit_edge
  %27 = and i32 %8, 1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %94

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 76, i64 %16, i64 %15
  %31 = load i64* %30, align 8
  %32 = getelementptr inbounds [64 x i8]* %label.i, i64 0, i64 0
  %33 = call %struct.MemoryRegion* @iotlb_to_region(i64 %31) nounwind
  %34 = and i64 %31, 4294963200
  %35 = add i64 %34, %7
  %36 = trunc i64 %35 to i32
  %37 = and i64 %35, 4294967295
  %38 = call i32 @s2e_is_mmio_symbolic_w(i64 %37) nounwind
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %29
  %41 = load %struct.CPUX86State** @env, align 8
  %42 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 4
  %43 = load i32* %42, align 4
  call void @trace_port(i8* %32, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %36, i32 %43) nounwind
  br label %44

; <label>:44                                      ; preds = %40, %29
  %45 = load %struct.CPUX86State** @env, align 8
  %46 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 69
  store i64 0, i64* %46, align 8
  %47 = icmp ne %struct.MemoryRegion* %33, @io_mem_ram
  %48 = icmp ne %struct.MemoryRegion* %33, @io_mem_rom
  %or.cond.i = and i1 %47, %48
  %49 = icmp ne %struct.MemoryRegion* %33, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %49
  %50 = icmp ne %struct.MemoryRegion* %33, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %50
  %51 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %52 = load i32* @use_icount, align 4
  %53 = icmp eq i32 %52, 0
  %or.cond11.i = or i1 %53, %or.cond5.not.i
  br i1 %or.cond11.i, label %can_do_io.exit.thread.i, label %54

; <label>:54                                      ; preds = %44
  %55 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 67
  %56 = load %struct.TranslationBlock** %55, align 8
  %57 = icmp eq %struct.TranslationBlock* %56, null
  br i1 %57, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %54
  %58 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 86
  %59 = load i32* %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %can_do_io.exit.thread.i

; <label>:61                                      ; preds = %can_do_io.exit.i
  call void @cpu_io_recompile(%struct.CPUX86State* %51, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %54, %44
  %62 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 70
  store i32 %8, i32* %62, align 4
  %63 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %33, i32 0) nounwind
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %85, label %65

; <label>:65                                      ; preds = %can_do_io.exit.thread.i
  %66 = call i64 @s2e_notdirty_mem_write(i64 %31) nounwind
  %67 = inttoptr i64 %66 to i16*
  %68 = load i16* %67, align 2
  br i1 %39, label %69, label %io_read_chkw_mmu.exit

; <label>:69                                      ; preds = %65
  %70 = call i32 @s2e_is_mmio_symbolic_b(i64 %37) nounwind
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %75, label %72

; <label>:72                                      ; preds = %69
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %73 = load i8* %ret.i.i.i, align 1
  %74 = zext i8 %73 to i16
  %mask.i = and i16 %68, -256
  %ins.i = or i16 %74, %mask.i
  br label %75

; <label>:75                                      ; preds = %72, %69
  %76 = phi i16 [ %ins.i, %72 ], [ %68, %69 ]
  %77 = add i32 %36, 1
  %78 = zext i32 %77 to i64
  %79 = call i32 @s2e_is_mmio_symbolic_b(i64 %78) nounwind
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %io_read_chkw_mmu.exit, label %81

; <label>:81                                      ; preds = %75
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %82 = load i8* %ret.i.i.i, align 1
  %83 = zext i8 %82 to i16
  %84 = shl nuw i16 %83, 8
  %mask7.i = and i16 %76, 255
  %ins8.i = or i16 %84, %mask7.i
  br label %io_read_chkw_mmu.exit

; <label>:85                                      ; preds = %can_do_io.exit.thread.i
  %86 = call zeroext i16 @io_readw_mmu(i64 %31, i32 %8, i8* null) nounwind
  br label %io_read_chkw_mmu.exit

io_read_chkw_mmu.exit:                            ; preds = %85, %81, %75, %65
  %.0.i = phi i16 [ %86, %85 ], [ %76, %75 ], [ %ins8.i, %81 ], [ %68, %65 ]
  %87 = and i64 %7, 4294967295
  %88 = add i64 %31, %87
  %89 = zext i16 %.0.i to i64
  call void @tcg_llvm_trace_memory_access(i64 %87, i64 %88, i64 %89, i32 16, i8 zeroext 0, i8 zeroext 1) nounwind
  br label %123

; <label>:90                                      ; preds = %._crit_edge
  %91 = and i32 %8, 127
  %92 = add i32 %91, 1
  %93 = icmp ugt i32 %92, 127
  br i1 %93, label %94, label %108

; <label>:94                                      ; preds = %90, %26
  %95 = and i32 %8, -2
  %96 = add i32 %95, 2
  %97 = call fastcc zeroext i16 @slow_ldw_mmu(i32 %95, i32 %mmu_idx)
  %98 = call fastcc zeroext i16 @slow_ldw_mmu(i32 %96, i32 %mmu_idx)
  %99 = shl i32 %8, 3
  %100 = and i32 %99, 8
  %101 = zext i16 %97 to i32
  %102 = lshr i32 %101, %100
  %103 = zext i16 %98 to i32
  %104 = sub nsw i32 16, %100
  %105 = shl i32 %103, %104
  %106 = or i32 %105, %102
  %107 = trunc i32 %106 to i16
  br label %123

; <label>:108                                     ; preds = %90
  %109 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %110 = load i64* %109, align 8
  %111 = and i64 %7, 4294967295
  %112 = add i64 %110, %111
  %113 = inttoptr i64 %112 to i16*
  %114 = load i16* %113, align 2
  %115 = zext i16 %114 to i64
  call void @tcg_llvm_trace_memory_access(i64 %111, i64 %112, i64 %115, i32 16, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %123

; <label>:116                                     ; preds = %116, %.lr.ph
  %117 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %118, %116 ]
  call void @tlb_fill(%struct.CPUX86State* %117, i32 %8, i32 %23, i32 0, i32 %mmu_idx, i8* null)
  %118 = load %struct.CPUX86State** @env, align 8
  %119 = getelementptr inbounds %struct.CPUX86State* %118, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %120 = load i32* %119, align 4
  %121 = and i32 %120, -4088
  %122 = icmp eq i32 %20, %121
  br i1 %122, label %._crit_edge, label %116

; <label>:123                                     ; preds = %108, %94, %io_read_chkw_mmu.exit
  %res.0 = phi i16 [ %107, %94 ], [ %.0.i, %io_read_chkw_mmu.exit ], [ %114, %108 ]
  ret i16 %res.0
}

define void @io_write_chkw_mmu(i64 %physaddr, i16 zeroext %val, i32 %addr, i8* %retaddr) nounwind uwtable inlinehint alwaysinline sspreq {
  %1 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %physaddr) nounwind
  %2 = and i64 %physaddr, -4096
  %3 = zext i32 %addr to i64
  %4 = add i64 %3, %2
  %5 = icmp ne %struct.MemoryRegion* %1, @io_mem_ram
  %6 = icmp ne %struct.MemoryRegion* %1, @io_mem_rom
  %or.cond = and i1 %5, %6
  %7 = icmp ne %struct.MemoryRegion* %1, @io_mem_unassigned
  %or.cond3 = and i1 %or.cond, %7
  %8 = icmp ne %struct.MemoryRegion* %1, @io_mem_notdirty
  %or.cond5 = and i1 %or.cond3, %8
  %9 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not = xor i1 %or.cond5, true
  %10 = load i32* @use_icount, align 4
  %11 = icmp eq i32 %10, 0
  %or.cond8 = or i1 %11, %or.cond5.not
  br i1 %or.cond8, label %can_do_io.exit.thread, label %12

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 67
  %14 = load %struct.TranslationBlock** %13, align 8
  %15 = icmp eq %struct.TranslationBlock* %14, null
  br i1 %15, label %can_do_io.exit.thread, label %can_do_io.exit

can_do_io.exit:                                   ; preds = %12
  %16 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 86
  %17 = load i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %can_do_io.exit.thread

; <label>:19                                      ; preds = %can_do_io.exit
  tail call void @cpu_io_recompile(%struct.CPUX86State* %9, i8* %retaddr) noreturn nounwind
  unreachable

can_do_io.exit.thread:                            ; preds = %can_do_io.exit, %12, %0
  %20 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 70
  store i32 %addr, i32* %20, align 4
  %21 = ptrtoint i8* %retaddr to i64
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 69
  store i64 %21, i64* %23, align 8
  %24 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %1, i32 1) nounwind
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %29, label %26

; <label>:26                                      ; preds = %can_do_io.exit.thread
  %27 = tail call i64 @s2e_notdirty_mem_write(i64 %4) nounwind
  %28 = inttoptr i64 %27 to i16*
  store i16 %val, i16* %28, align 2
  br label %42

; <label>:29                                      ; preds = %can_do_io.exit.thread
  %30 = load i32* @g_s2e_concretize_io_writes, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %36, label %32

; <label>:32                                      ; preds = %29
  %33 = zext i16 %val to i32
  %34 = tail call i32 @klee_get_value(i32 %33) nounwind
  %35 = trunc i32 %34 to i16
  br label %36

; <label>:36                                      ; preds = %32, %29
  %.0 = phi i16 [ %35, %32 ], [ %val, %29 ]
  %37 = load i32* @g_s2e_concretize_io_addresses, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %41, label %39

; <label>:39                                      ; preds = %36
  %40 = tail call i32 @klee_get_value(i32 %addr) nounwind
  br label %41

; <label>:41                                      ; preds = %39, %36
  %.06 = phi i32 [ %40, %39 ], [ %addr, %36 ]
  tail call void @io_writew_mmu(i64 %physaddr, i16 zeroext %.0, i32 %.06, i8* %retaddr) nounwind
  br label %42

; <label>:42                                      ; preds = %41, %26
  ret void
}

declare void @io_writew_mmu(i64, i16 zeroext, i32, i8*)

define void @__stw_mmu(i32 %addr, i16 zeroext %val, i32 %mmu_idx) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 1
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph, !prof !0

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %180

._crit_edge:                                      ; preds = %180, %6
  %.lcssa5 = phi i32 [ %19, %6 ], [ %184, %180 ]
  %.lcssa4 = phi %struct.CPUX86State* [ %17, %6 ], [ %182, %180 ]
  %24 = and i32 %.lcssa5, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %74, label %26, !prof !0

; <label>:26                                      ; preds = %._crit_edge
  %27 = and i32 %8, 1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %78

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds %struct.CPUX86State* %.lcssa4, i64 0, i32 76, i64 %16, i64 %15
  %31 = load i64* %30, align 8
  %32 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %31) nounwind
  %33 = and i64 %31, -4096
  %34 = and i64 %7, 4294967295
  %35 = add i64 %33, %34
  %36 = icmp ne %struct.MemoryRegion* %32, @io_mem_ram
  %37 = icmp ne %struct.MemoryRegion* %32, @io_mem_rom
  %or.cond.i = and i1 %36, %37
  %38 = icmp ne %struct.MemoryRegion* %32, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %38
  %39 = icmp ne %struct.MemoryRegion* %32, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %39
  %40 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %41 = load i32* @use_icount, align 4
  %42 = icmp eq i32 %41, 0
  %or.cond8.i = or i1 %42, %or.cond5.not.i
  br i1 %or.cond8.i, label %can_do_io.exit.thread.i, label %43

; <label>:43                                      ; preds = %29
  %44 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 67
  %45 = load %struct.TranslationBlock** %44, align 8
  %46 = icmp eq %struct.TranslationBlock* %45, null
  br i1 %46, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %43
  %47 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 86
  %48 = load i32* %47, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %can_do_io.exit.thread.i

; <label>:50                                      ; preds = %can_do_io.exit.i
  tail call void @cpu_io_recompile(%struct.CPUX86State* %40, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %43, %29
  %51 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 70
  store i32 %8, i32* %51, align 4
  %52 = load %struct.CPUX86State** @env, align 8
  %53 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 69
  store i64 0, i64* %53, align 8
  %54 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %32, i32 1) nounwind
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %59, label %56

; <label>:56                                      ; preds = %can_do_io.exit.thread.i
  %57 = tail call i64 @s2e_notdirty_mem_write(i64 %35) nounwind
  %58 = inttoptr i64 %57 to i16*
  store i16 %val, i16* %58, align 2
  br label %io_write_chkw_mmu.exit

; <label>:59                                      ; preds = %can_do_io.exit.thread.i
  %60 = load i32* @g_s2e_concretize_io_writes, align 4
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %66, label %62

; <label>:62                                      ; preds = %59
  %63 = zext i16 %val to i32
  %64 = tail call i32 @klee_get_value(i32 %63) nounwind
  %65 = trunc i32 %64 to i16
  br label %66

; <label>:66                                      ; preds = %62, %59
  %.0.i = phi i16 [ %65, %62 ], [ %val, %59 ]
  %67 = load i32* @g_s2e_concretize_io_addresses, align 4
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %71, label %69

; <label>:69                                      ; preds = %66
  %70 = tail call i32 @klee_get_value(i32 %8) nounwind
  br label %71

; <label>:71                                      ; preds = %69, %66
  %.06.i = phi i32 [ %70, %69 ], [ %8, %66 ]
  tail call void @io_writew_mmu(i64 %31, i16 zeroext %.0.i, i32 %.06.i, i8* null) nounwind
  br label %io_write_chkw_mmu.exit

io_write_chkw_mmu.exit:                           ; preds = %71, %56
  %72 = add i64 %31, %34
  %73 = zext i16 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %34, i64 %72, i64 %73, i32 16, i8 zeroext 1, i8 zeroext 1) nounwind
  br label %slow_stw_mmu.exit

; <label>:74                                      ; preds = %._crit_edge
  %75 = and i32 %8, 127
  %76 = add i32 %75, 1
  %77 = icmp ugt i32 %76, 127
  br i1 %77, label %78, label %173, !prof !1

; <label>:78                                      ; preds = %74, %26
  %79 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %80 = icmp eq i32 %79, 0
  %81 = and i64 %7, 4294967295
  br i1 %80, label %84, label %82

; <label>:82                                      ; preds = %78
  %83 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %81, i64 0, i64 4294967295) nounwind
  br label %84

; <label>:84                                      ; preds = %82, %78
  %85 = phi i64 [ %83, %82 ], [ %81, %78 ]
  %86 = trunc i64 %85 to i32
  %87 = lshr i32 %86, 7
  %88 = zext i32 %87 to i64
  %89 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %88, i64 0, i64 33554431) nounwind
  %90 = trunc i64 %89 to i32
  %91 = lshr i32 %90, 5
  %92 = and i32 %91, 255
  %93 = zext i32 %92 to i64
  %94 = load %struct.CPUX86State** @env, align 8
  %95 = getelementptr inbounds %struct.CPUX86State* %94, i64 0, i32 74, i64 %16, i64 %93, i32 1
  %96 = load i32* %95, align 4
  %97 = and i32 %86, -4096
  %98 = and i32 %96, -4088
  %99 = icmp eq i32 %97, %98
  br i1 %99, label %._crit_edge.i, label %.lr.ph.i

.lr.ph.i:                                         ; preds = %84
  %100 = shl i32 %90, 7
  br label %166

._crit_edge.i:                                    ; preds = %166, %84
  %.lcssa4.i = phi i32 [ %96, %84 ], [ %170, %166 ]
  %.lcssa3.i = phi %struct.CPUX86State* [ %94, %84 ], [ %168, %166 ]
  %101 = and i32 %.lcssa4.i, 4095
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %151, label %103

; <label>:103                                     ; preds = %._crit_edge.i
  %104 = and i32 %86, 1
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %106, label %.preheader.i

; <label>:106                                     ; preds = %103
  %107 = getelementptr inbounds %struct.CPUX86State* %.lcssa3.i, i64 0, i32 76, i64 %16, i64 %93
  %108 = load i64* %107, align 8
  %109 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %108) nounwind
  %110 = and i64 %108, -4096
  %111 = and i64 %85, 4294967295
  %112 = add i64 %110, %111
  %113 = icmp ne %struct.MemoryRegion* %109, @io_mem_ram
  %114 = icmp ne %struct.MemoryRegion* %109, @io_mem_rom
  %or.cond.i.i = and i1 %113, %114
  %115 = icmp ne %struct.MemoryRegion* %109, @io_mem_unassigned
  %or.cond3.i.i = and i1 %or.cond.i.i, %115
  %116 = icmp ne %struct.MemoryRegion* %109, @io_mem_notdirty
  %or.cond5.i.i = and i1 %or.cond3.i.i, %116
  %117 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i.i = xor i1 %or.cond5.i.i, true
  %118 = load i32* @use_icount, align 4
  %119 = icmp eq i32 %118, 0
  %or.cond8.i.i = or i1 %119, %or.cond5.not.i.i
  br i1 %or.cond8.i.i, label %can_do_io.exit.thread.i.i, label %120

; <label>:120                                     ; preds = %106
  %121 = getelementptr inbounds %struct.CPUX86State* %117, i64 0, i32 67
  %122 = load %struct.TranslationBlock** %121, align 8
  %123 = icmp eq %struct.TranslationBlock* %122, null
  br i1 %123, label %can_do_io.exit.thread.i.i, label %can_do_io.exit.i.i

can_do_io.exit.i.i:                               ; preds = %120
  %124 = getelementptr inbounds %struct.CPUX86State* %117, i64 0, i32 86
  %125 = load i32* %124, align 4
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %127, label %can_do_io.exit.thread.i.i

; <label>:127                                     ; preds = %can_do_io.exit.i.i
  tail call void @cpu_io_recompile(%struct.CPUX86State* %117, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i.i:                        ; preds = %can_do_io.exit.i.i, %120, %106
  %128 = getelementptr inbounds %struct.CPUX86State* %117, i64 0, i32 70
  store i32 %86, i32* %128, align 4
  %129 = load %struct.CPUX86State** @env, align 8
  %130 = getelementptr inbounds %struct.CPUX86State* %129, i64 0, i32 69
  store i64 0, i64* %130, align 8
  %131 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %109, i32 1) nounwind
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %136, label %133

; <label>:133                                     ; preds = %can_do_io.exit.thread.i.i
  %134 = tail call i64 @s2e_notdirty_mem_write(i64 %112) nounwind
  %135 = inttoptr i64 %134 to i16*
  store i16 %val, i16* %135, align 2
  br label %io_write_chkw_mmu.exit.i

; <label>:136                                     ; preds = %can_do_io.exit.thread.i.i
  %137 = load i32* @g_s2e_concretize_io_writes, align 4
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %143, label %139

; <label>:139                                     ; preds = %136
  %140 = zext i16 %val to i32
  %141 = tail call i32 @klee_get_value(i32 %140) nounwind
  %142 = trunc i32 %141 to i16
  br label %143

; <label>:143                                     ; preds = %139, %136
  %.0.i.i = phi i16 [ %142, %139 ], [ %val, %136 ]
  %144 = load i32* @g_s2e_concretize_io_addresses, align 4
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %148, label %146

; <label>:146                                     ; preds = %143
  %147 = tail call i32 @klee_get_value(i32 %86) nounwind
  br label %148

; <label>:148                                     ; preds = %146, %143
  %.06.i.i = phi i32 [ %147, %146 ], [ %86, %143 ]
  tail call void @io_writew_mmu(i64 %108, i16 zeroext %.0.i.i, i32 %.06.i.i, i8* null) nounwind
  br label %io_write_chkw_mmu.exit.i

io_write_chkw_mmu.exit.i:                         ; preds = %148, %133
  %149 = add i64 %108, %111
  %150 = zext i16 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %111, i64 %149, i64 %150, i32 16, i8 zeroext 1, i8 zeroext 1) nounwind
  br label %slow_stw_mmu.exit

; <label>:151                                     ; preds = %._crit_edge.i
  %152 = and i32 %86, 127
  %153 = add i32 %152, 1
  %154 = icmp ugt i32 %153, 127
  br i1 %154, label %.preheader.i, label %159

.preheader.i:                                     ; preds = %151, %103
  %155 = add i32 %86, 1
  %156 = lshr i16 %val, 8
  %157 = trunc i16 %156 to i8
  tail call fastcc void @slow_stb_mmu(i32 %155, i8 zeroext %157, i32 %mmu_idx) nounwind
  %158 = trunc i16 %val to i8
  tail call fastcc void @slow_stb_mmu(i32 %86, i8 zeroext %158, i32 %mmu_idx) nounwind
  br label %slow_stw_mmu.exit

; <label>:159                                     ; preds = %151
  %160 = getelementptr inbounds %struct.CPUX86State* %.lcssa3.i, i64 0, i32 74, i64 %16, i64 %93, i32 3
  %161 = load i64* %160, align 8
  %162 = and i64 %85, 4294967295
  %163 = add i64 %161, %162
  %164 = inttoptr i64 %163 to i16*
  store i16 %val, i16* %164, align 2
  %165 = zext i16 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %162, i64 %163, i64 %165, i32 16, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %slow_stw_mmu.exit

; <label>:166                                     ; preds = %166, %.lr.ph.i
  %167 = phi %struct.CPUX86State* [ %94, %.lr.ph.i ], [ %168, %166 ]
  tail call void @tlb_fill(%struct.CPUX86State* %167, i32 %86, i32 %100, i32 1, i32 %mmu_idx, i8* null) nounwind
  %168 = load %struct.CPUX86State** @env, align 8
  %169 = getelementptr inbounds %struct.CPUX86State* %168, i64 0, i32 74, i64 %16, i64 %93, i32 1
  %170 = load i32* %169, align 4
  %171 = and i32 %170, -4088
  %172 = icmp eq i32 %97, %171
  br i1 %172, label %._crit_edge.i, label %166

; <label>:173                                     ; preds = %74
  %174 = getelementptr inbounds %struct.CPUX86State* %.lcssa4, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %175 = load i64* %174, align 8
  %176 = and i64 %7, 4294967295
  %177 = add i64 %175, %176
  %178 = inttoptr i64 %177 to i16*
  store i16 %val, i16* %178, align 2
  %179 = zext i16 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %176, i64 %177, i64 %179, i32 16, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %slow_stw_mmu.exit

; <label>:180                                     ; preds = %180, %.lr.ph
  %181 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %182, %180 ]
  tail call void @tlb_fill(%struct.CPUX86State* %181, i32 %8, i32 %23, i32 1, i32 %mmu_idx, i8* null)
  %182 = load %struct.CPUX86State** @env, align 8
  %183 = getelementptr inbounds %struct.CPUX86State* %182, i64 0, i32 74, i64 %16, i64 %15, i32 1
  %184 = load i32* %183, align 4
  %185 = and i32 %184, -4088
  %186 = icmp eq i32 %20, %185
  br i1 %186, label %._crit_edge, label %180, !prof !0

slow_stw_mmu.exit:                                ; preds = %173, %159, %.preheader.i, %io_write_chkw_mmu.exit.i, %io_write_chkw_mmu.exit
  ret void
}

define i32 @io_read_chkl_mmu(i64 %physaddr, i32 %addr, i8* %retaddr) nounwind uwtable inlinehint alwaysinline sspreq {
  %ret.i.i = alloca i8, align 1
  %label = alloca [64 x i8], align 16
  %1 = call %struct.MemoryRegion* @iotlb_to_region(i64 %physaddr) nounwind
  %2 = and i64 %physaddr, 4294963200
  %3 = zext i32 %addr to i64
  %4 = add i64 %3, %2
  %5 = trunc i64 %4 to i32
  %6 = and i64 %4, 4294967295
  %7 = call i32 @s2e_is_mmio_symbolic_l(i64 %6) nounwind
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 4
  %13 = load i32* %12, align 4
  call void @trace_port(i8* %10, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %5, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %0
  %15 = ptrtoint i8* %retaddr to i64
  %16 = load %struct.CPUX86State** @env, align 8
  %17 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 69
  store i64 %15, i64* %17, align 8
  %18 = icmp ne %struct.MemoryRegion* %1, @io_mem_ram
  %19 = icmp ne %struct.MemoryRegion* %1, @io_mem_rom
  %or.cond = and i1 %18, %19
  %20 = icmp ne %struct.MemoryRegion* %1, @io_mem_unassigned
  %or.cond3 = and i1 %or.cond, %20
  %21 = icmp ne %struct.MemoryRegion* %1, @io_mem_notdirty
  %or.cond5 = and i1 %or.cond3, %21
  %22 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not = xor i1 %or.cond5, true
  %23 = load i32* @use_icount, align 4
  %24 = icmp eq i32 %23, 0
  %or.cond17 = or i1 %24, %or.cond5.not
  br i1 %or.cond17, label %can_do_io.exit.thread, label %25

; <label>:25                                      ; preds = %14
  %26 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 67
  %27 = load %struct.TranslationBlock** %26, align 8
  %28 = icmp eq %struct.TranslationBlock* %27, null
  br i1 %28, label %can_do_io.exit.thread, label %can_do_io.exit

can_do_io.exit:                                   ; preds = %25
  %29 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 86
  %30 = load i32* %29, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %can_do_io.exit.thread

; <label>:32                                      ; preds = %can_do_io.exit
  call void @cpu_io_recompile(%struct.CPUX86State* %22, i8* %retaddr) noreturn nounwind
  unreachable

can_do_io.exit.thread:                            ; preds = %can_do_io.exit, %25, %14
  %33 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 70
  store i32 %addr, i32* %33, align 4
  %34 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %1, i32 0) nounwind
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %80, label %36

; <label>:36                                      ; preds = %can_do_io.exit.thread
  %37 = call i64 @s2e_notdirty_mem_write(i64 %physaddr) nounwind
  br i1 %8, label %38, label %77

; <label>:38                                      ; preds = %36
  %39 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  %40 = inttoptr i64 %37 to i32*
  %41 = load i32* %40, align 4
  %42 = call i32 @s2e_is_mmio_symbolic_b(i64 %6) nounwind
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %47, label %44

; <label>:44                                      ; preds = %38
  call void @klee_make_symbolic(i8* %ret.i.i, i32 1, i8* %39) nounwind
  %45 = load i8* %ret.i.i, align 1
  %46 = zext i8 %45 to i32
  %mask = and i32 %41, -256
  %ins = or i32 %46, %mask
  br label %47

; <label>:47                                      ; preds = %44, %38
  %48 = phi i32 [ %ins, %44 ], [ %41, %38 ]
  %49 = add i32 %5, 1
  %50 = zext i32 %49 to i64
  %51 = call i32 @s2e_is_mmio_symbolic_b(i64 %50) nounwind
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %57, label %53

; <label>:53                                      ; preds = %47
  call void @klee_make_symbolic(i8* %ret.i.i, i32 1, i8* %39) nounwind
  %54 = load i8* %ret.i.i, align 1
  %55 = zext i8 %54 to i32
  %56 = shl nuw nsw i32 %55, 8
  %mask13 = and i32 %48, -65281
  %ins14 = or i32 %56, %mask13
  br label %57

; <label>:57                                      ; preds = %53, %47
  %58 = phi i32 [ %ins14, %53 ], [ %48, %47 ]
  %59 = add i32 %5, 2
  %60 = zext i32 %59 to i64
  %61 = call i32 @s2e_is_mmio_symbolic_b(i64 %60) nounwind
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %67, label %63

; <label>:63                                      ; preds = %57
  call void @klee_make_symbolic(i8* %ret.i.i, i32 1, i8* %39) nounwind
  %64 = load i8* %ret.i.i, align 1
  %65 = zext i8 %64 to i32
  %66 = shl nuw nsw i32 %65, 16
  %mask10 = and i32 %58, -16711681
  %ins11 = or i32 %66, %mask10
  br label %67

; <label>:67                                      ; preds = %63, %57
  %68 = phi i32 [ %ins11, %63 ], [ %58, %57 ]
  %69 = add i32 %5, 3
  %70 = zext i32 %69 to i64
  %71 = call i32 @s2e_is_mmio_symbolic_b(i64 %70) nounwind
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %io_read_chk_symb_l.exit, label %73

; <label>:73                                      ; preds = %67
  call void @klee_make_symbolic(i8* %ret.i.i, i32 1, i8* %39) nounwind
  %74 = load i8* %ret.i.i, align 1
  %75 = zext i8 %74 to i32
  %76 = shl nuw i32 %75, 24
  %mask7 = and i32 %68, 16777215
  %ins8 = or i32 %76, %mask7
  br label %io_read_chk_symb_l.exit

; <label>:77                                      ; preds = %36
  %78 = inttoptr i64 %37 to i32*
  %79 = load i32* %78, align 4
  br label %io_read_chk_symb_l.exit

; <label>:80                                      ; preds = %can_do_io.exit.thread
  %81 = call i32 @io_readl_mmu(i64 %physaddr, i32 %addr, i8* %retaddr) nounwind
  br label %io_read_chk_symb_l.exit

io_read_chk_symb_l.exit:                          ; preds = %80, %77, %73, %67
  %.0 = phi i32 [ %79, %77 ], [ %81, %80 ], [ %68, %67 ], [ %ins8, %73 ]
  ret i32 %.0
}

declare i32 @s2e_is_mmio_symbolic_l(i64)

declare i32 @io_readl_mmu(i64, i32, i8*)

define i32 @__ldl_mmu(i32 %addr, i32 %mmu_idx) nounwind uwtable sspreq {
  %ret.i.i.i = alloca i8, align 1
  %label.i = alloca [64 x i8], align 16
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph, !prof !0

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %124

._crit_edge:                                      ; preds = %124, %6
  %.lcssa3 = phi i32 [ %19, %6 ], [ %128, %124 ]
  %.lcssa2 = phi %struct.CPUX86State* [ %17, %6 ], [ %126, %124 ]
  %24 = and i32 %.lcssa3, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %110, label %26, !prof !0

; <label>:26                                      ; preds = %._crit_edge
  %27 = and i32 %8, 3
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %114

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 76, i64 %16, i64 %15
  %31 = load i64* %30, align 8
  %32 = getelementptr inbounds [64 x i8]* %label.i, i64 0, i64 0
  %33 = call %struct.MemoryRegion* @iotlb_to_region(i64 %31) nounwind
  %34 = and i64 %31, 4294963200
  %35 = add i64 %34, %7
  %36 = trunc i64 %35 to i32
  %37 = and i64 %35, 4294967295
  %38 = call i32 @s2e_is_mmio_symbolic_l(i64 %37) nounwind
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %29
  %41 = load %struct.CPUX86State** @env, align 8
  %42 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 4
  %43 = load i32* %42, align 4
  call void @trace_port(i8* %32, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %36, i32 %43) nounwind
  br label %44

; <label>:44                                      ; preds = %40, %29
  %45 = load %struct.CPUX86State** @env, align 8
  %46 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 69
  store i64 0, i64* %46, align 8
  %47 = icmp ne %struct.MemoryRegion* %33, @io_mem_ram
  %48 = icmp ne %struct.MemoryRegion* %33, @io_mem_rom
  %or.cond.i = and i1 %47, %48
  %49 = icmp ne %struct.MemoryRegion* %33, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %49
  %50 = icmp ne %struct.MemoryRegion* %33, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %50
  %51 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %52 = load i32* @use_icount, align 4
  %53 = icmp eq i32 %52, 0
  %or.cond17.i = or i1 %53, %or.cond5.not.i
  br i1 %or.cond17.i, label %can_do_io.exit.thread.i, label %54

; <label>:54                                      ; preds = %44
  %55 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 67
  %56 = load %struct.TranslationBlock** %55, align 8
  %57 = icmp eq %struct.TranslationBlock* %56, null
  br i1 %57, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %54
  %58 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 86
  %59 = load i32* %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %can_do_io.exit.thread.i

; <label>:61                                      ; preds = %can_do_io.exit.i
  call void @cpu_io_recompile(%struct.CPUX86State* %51, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %54, %44
  %62 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 70
  store i32 %8, i32* %62, align 4
  %63 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %33, i32 0) nounwind
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %105, label %65

; <label>:65                                      ; preds = %can_do_io.exit.thread.i
  %66 = call i64 @s2e_notdirty_mem_write(i64 %31) nounwind
  %67 = inttoptr i64 %66 to i32*
  %68 = load i32* %67, align 4
  br i1 %39, label %69, label %io_read_chkl_mmu.exit

; <label>:69                                      ; preds = %65
  %70 = call i32 @s2e_is_mmio_symbolic_b(i64 %37) nounwind
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %75, label %72

; <label>:72                                      ; preds = %69
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %73 = load i8* %ret.i.i.i, align 1
  %74 = zext i8 %73 to i32
  %mask.i = and i32 %68, -256
  %ins.i = or i32 %74, %mask.i
  br label %75

; <label>:75                                      ; preds = %72, %69
  %76 = phi i32 [ %ins.i, %72 ], [ %68, %69 ]
  %77 = add i32 %36, 1
  %78 = zext i32 %77 to i64
  %79 = call i32 @s2e_is_mmio_symbolic_b(i64 %78) nounwind
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %85, label %81

; <label>:81                                      ; preds = %75
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %82 = load i8* %ret.i.i.i, align 1
  %83 = zext i8 %82 to i32
  %84 = shl nuw nsw i32 %83, 8
  %mask13.i = and i32 %76, -65281
  %ins14.i = or i32 %84, %mask13.i
  br label %85

; <label>:85                                      ; preds = %81, %75
  %86 = phi i32 [ %ins14.i, %81 ], [ %76, %75 ]
  %87 = add i32 %36, 2
  %88 = zext i32 %87 to i64
  %89 = call i32 @s2e_is_mmio_symbolic_b(i64 %88) nounwind
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %95, label %91

; <label>:91                                      ; preds = %85
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %92 = load i8* %ret.i.i.i, align 1
  %93 = zext i8 %92 to i32
  %94 = shl nuw nsw i32 %93, 16
  %mask10.i = and i32 %86, -16711681
  %ins11.i = or i32 %94, %mask10.i
  br label %95

; <label>:95                                      ; preds = %91, %85
  %96 = phi i32 [ %ins11.i, %91 ], [ %86, %85 ]
  %97 = add i32 %36, 3
  %98 = zext i32 %97 to i64
  %99 = call i32 @s2e_is_mmio_symbolic_b(i64 %98) nounwind
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %io_read_chkl_mmu.exit, label %101

; <label>:101                                     ; preds = %95
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %102 = load i8* %ret.i.i.i, align 1
  %103 = zext i8 %102 to i32
  %104 = shl nuw i32 %103, 24
  %mask7.i = and i32 %96, 16777215
  %ins8.i = or i32 %104, %mask7.i
  br label %io_read_chkl_mmu.exit

; <label>:105                                     ; preds = %can_do_io.exit.thread.i
  %106 = call i32 @io_readl_mmu(i64 %31, i32 %8, i8* null) nounwind
  br label %io_read_chkl_mmu.exit

io_read_chkl_mmu.exit:                            ; preds = %105, %101, %95, %65
  %.0.i = phi i32 [ %106, %105 ], [ %96, %95 ], [ %ins8.i, %101 ], [ %68, %65 ]
  %107 = and i64 %7, 4294967295
  %108 = add i64 %31, %107
  %109 = zext i32 %.0.i to i64
  call void @tcg_llvm_trace_memory_access(i64 %107, i64 %108, i64 %109, i32 32, i8 zeroext 0, i8 zeroext 1) nounwind
  br label %131

; <label>:110                                     ; preds = %._crit_edge
  %111 = and i32 %8, 127
  %112 = add i32 %111, 3
  %113 = icmp ugt i32 %112, 127
  br i1 %113, label %114, label %116, !prof !1

; <label>:114                                     ; preds = %110, %26
  %115 = call fastcc i32 @slow_ldl_mmu(i32 %8, i32 %mmu_idx)
  br label %131

; <label>:116                                     ; preds = %110
  %117 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %118 = load i64* %117, align 8
  %119 = and i64 %7, 4294967295
  %120 = add i64 %118, %119
  %121 = inttoptr i64 %120 to i32*
  %122 = load i32* %121, align 4
  %123 = zext i32 %122 to i64
  call void @tcg_llvm_trace_memory_access(i64 %119, i64 %120, i64 %123, i32 32, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %131

; <label>:124                                     ; preds = %124, %.lr.ph
  %125 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %126, %124 ]
  call void @tlb_fill(%struct.CPUX86State* %125, i32 %8, i32 %23, i32 0, i32 %mmu_idx, i8* null)
  %126 = load %struct.CPUX86State** @env, align 8
  %127 = getelementptr inbounds %struct.CPUX86State* %126, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %128 = load i32* %127, align 4
  %129 = and i32 %128, -4088
  %130 = icmp eq i32 %20, %129
  br i1 %130, label %._crit_edge, label %124, !prof !0

; <label>:131                                     ; preds = %116, %114, %io_read_chkl_mmu.exit
  %res.0 = phi i32 [ %115, %114 ], [ %.0.i, %io_read_chkl_mmu.exit ], [ %122, %116 ]
  ret i32 %res.0
}

define internal fastcc i32 @slow_ldl_mmu(i32 %addr, i32 %mmu_idx) nounwind uwtable sspreq {
  %ret.i.i.i = alloca i8, align 1
  %label.i = alloca [64 x i8], align 16
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %133

._crit_edge:                                      ; preds = %133, %6
  %.lcssa3 = phi i32 [ %19, %6 ], [ %137, %133 ]
  %.lcssa2 = phi %struct.CPUX86State* [ %17, %6 ], [ %135, %133 ]
  %24 = and i32 %.lcssa3, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %110, label %26

; <label>:26                                      ; preds = %._crit_edge
  %27 = and i32 %8, 3
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %114

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 76, i64 %16, i64 %15
  %31 = load i64* %30, align 8
  %32 = getelementptr inbounds [64 x i8]* %label.i, i64 0, i64 0
  %33 = call %struct.MemoryRegion* @iotlb_to_region(i64 %31) nounwind
  %34 = and i64 %31, 4294963200
  %35 = add i64 %34, %7
  %36 = trunc i64 %35 to i32
  %37 = and i64 %35, 4294967295
  %38 = call i32 @s2e_is_mmio_symbolic_l(i64 %37) nounwind
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %29
  %41 = load %struct.CPUX86State** @env, align 8
  %42 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 4
  %43 = load i32* %42, align 4
  call void @trace_port(i8* %32, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %36, i32 %43) nounwind
  br label %44

; <label>:44                                      ; preds = %40, %29
  %45 = load %struct.CPUX86State** @env, align 8
  %46 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 69
  store i64 0, i64* %46, align 8
  %47 = icmp ne %struct.MemoryRegion* %33, @io_mem_ram
  %48 = icmp ne %struct.MemoryRegion* %33, @io_mem_rom
  %or.cond.i = and i1 %47, %48
  %49 = icmp ne %struct.MemoryRegion* %33, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %49
  %50 = icmp ne %struct.MemoryRegion* %33, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %50
  %51 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %52 = load i32* @use_icount, align 4
  %53 = icmp eq i32 %52, 0
  %or.cond17.i = or i1 %53, %or.cond5.not.i
  br i1 %or.cond17.i, label %can_do_io.exit.thread.i, label %54

; <label>:54                                      ; preds = %44
  %55 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 67
  %56 = load %struct.TranslationBlock** %55, align 8
  %57 = icmp eq %struct.TranslationBlock* %56, null
  br i1 %57, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %54
  %58 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 86
  %59 = load i32* %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %can_do_io.exit.thread.i

; <label>:61                                      ; preds = %can_do_io.exit.i
  call void @cpu_io_recompile(%struct.CPUX86State* %51, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %54, %44
  %62 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 70
  store i32 %8, i32* %62, align 4
  %63 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %33, i32 0) nounwind
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %105, label %65

; <label>:65                                      ; preds = %can_do_io.exit.thread.i
  %66 = call i64 @s2e_notdirty_mem_write(i64 %31) nounwind
  %67 = inttoptr i64 %66 to i32*
  %68 = load i32* %67, align 4
  br i1 %39, label %69, label %io_read_chkl_mmu.exit

; <label>:69                                      ; preds = %65
  %70 = call i32 @s2e_is_mmio_symbolic_b(i64 %37) nounwind
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %75, label %72

; <label>:72                                      ; preds = %69
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %73 = load i8* %ret.i.i.i, align 1
  %74 = zext i8 %73 to i32
  %mask.i = and i32 %68, -256
  %ins.i = or i32 %74, %mask.i
  br label %75

; <label>:75                                      ; preds = %72, %69
  %76 = phi i32 [ %ins.i, %72 ], [ %68, %69 ]
  %77 = add i32 %36, 1
  %78 = zext i32 %77 to i64
  %79 = call i32 @s2e_is_mmio_symbolic_b(i64 %78) nounwind
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %85, label %81

; <label>:81                                      ; preds = %75
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %82 = load i8* %ret.i.i.i, align 1
  %83 = zext i8 %82 to i32
  %84 = shl nuw nsw i32 %83, 8
  %mask13.i = and i32 %76, -65281
  %ins14.i = or i32 %84, %mask13.i
  br label %85

; <label>:85                                      ; preds = %81, %75
  %86 = phi i32 [ %ins14.i, %81 ], [ %76, %75 ]
  %87 = add i32 %36, 2
  %88 = zext i32 %87 to i64
  %89 = call i32 @s2e_is_mmio_symbolic_b(i64 %88) nounwind
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %95, label %91

; <label>:91                                      ; preds = %85
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %92 = load i8* %ret.i.i.i, align 1
  %93 = zext i8 %92 to i32
  %94 = shl nuw nsw i32 %93, 16
  %mask10.i = and i32 %86, -16711681
  %ins11.i = or i32 %94, %mask10.i
  br label %95

; <label>:95                                      ; preds = %91, %85
  %96 = phi i32 [ %ins11.i, %91 ], [ %86, %85 ]
  %97 = add i32 %36, 3
  %98 = zext i32 %97 to i64
  %99 = call i32 @s2e_is_mmio_symbolic_b(i64 %98) nounwind
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %io_read_chkl_mmu.exit, label %101

; <label>:101                                     ; preds = %95
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %102 = load i8* %ret.i.i.i, align 1
  %103 = zext i8 %102 to i32
  %104 = shl nuw i32 %103, 24
  %mask7.i = and i32 %96, 16777215
  %ins8.i = or i32 %104, %mask7.i
  br label %io_read_chkl_mmu.exit

; <label>:105                                     ; preds = %can_do_io.exit.thread.i
  %106 = call i32 @io_readl_mmu(i64 %31, i32 %8, i8* null) nounwind
  br label %io_read_chkl_mmu.exit

io_read_chkl_mmu.exit:                            ; preds = %105, %101, %95, %65
  %.0.i = phi i32 [ %106, %105 ], [ %96, %95 ], [ %ins8.i, %101 ], [ %68, %65 ]
  %107 = and i64 %7, 4294967295
  %108 = add i64 %31, %107
  %109 = zext i32 %.0.i to i64
  call void @tcg_llvm_trace_memory_access(i64 %107, i64 %108, i64 %109, i32 32, i8 zeroext 0, i8 zeroext 1) nounwind
  br label %140

; <label>:110                                     ; preds = %._crit_edge
  %111 = and i32 %8, 127
  %112 = add i32 %111, 3
  %113 = icmp ugt i32 %112, 127
  br i1 %113, label %114, label %125

; <label>:114                                     ; preds = %110, %26
  %115 = and i32 %8, -4
  %116 = add i32 %115, 4
  %117 = call fastcc i32 @slow_ldl_mmu(i32 %115, i32 %mmu_idx)
  %118 = call fastcc i32 @slow_ldl_mmu(i32 %116, i32 %mmu_idx)
  %119 = shl i32 %8, 3
  %120 = and i32 %119, 24
  %121 = lshr i32 %117, %120
  %122 = sub nsw i32 32, %120
  %123 = shl i32 %118, %122
  %124 = or i32 %123, %121
  br label %140

; <label>:125                                     ; preds = %110
  %126 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %127 = load i64* %126, align 8
  %128 = and i64 %7, 4294967295
  %129 = add i64 %127, %128
  %130 = inttoptr i64 %129 to i32*
  %131 = load i32* %130, align 4
  %132 = zext i32 %131 to i64
  call void @tcg_llvm_trace_memory_access(i64 %128, i64 %129, i64 %132, i32 32, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %140

; <label>:133                                     ; preds = %133, %.lr.ph
  %134 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %135, %133 ]
  call void @tlb_fill(%struct.CPUX86State* %134, i32 %8, i32 %23, i32 0, i32 %mmu_idx, i8* null)
  %135 = load %struct.CPUX86State** @env, align 8
  %136 = getelementptr inbounds %struct.CPUX86State* %135, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %137 = load i32* %136, align 4
  %138 = and i32 %137, -4088
  %139 = icmp eq i32 %20, %138
  br i1 %139, label %._crit_edge, label %133

; <label>:140                                     ; preds = %125, %114, %io_read_chkl_mmu.exit
  %res.0 = phi i32 [ %124, %114 ], [ %.0.i, %io_read_chkl_mmu.exit ], [ %131, %125 ]
  ret i32 %res.0
}

define void @io_write_chkl_mmu(i64 %physaddr, i32 %val, i32 %addr, i8* %retaddr) nounwind uwtable inlinehint alwaysinline sspreq {
  %1 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %physaddr) nounwind
  %2 = and i64 %physaddr, -4096
  %3 = zext i32 %addr to i64
  %4 = add i64 %3, %2
  %5 = icmp ne %struct.MemoryRegion* %1, @io_mem_ram
  %6 = icmp ne %struct.MemoryRegion* %1, @io_mem_rom
  %or.cond = and i1 %5, %6
  %7 = icmp ne %struct.MemoryRegion* %1, @io_mem_unassigned
  %or.cond3 = and i1 %or.cond, %7
  %8 = icmp ne %struct.MemoryRegion* %1, @io_mem_notdirty
  %or.cond5 = and i1 %or.cond3, %8
  %9 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not = xor i1 %or.cond5, true
  %10 = load i32* @use_icount, align 4
  %11 = icmp eq i32 %10, 0
  %or.cond8 = or i1 %11, %or.cond5.not
  br i1 %or.cond8, label %can_do_io.exit.thread, label %12

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 67
  %14 = load %struct.TranslationBlock** %13, align 8
  %15 = icmp eq %struct.TranslationBlock* %14, null
  br i1 %15, label %can_do_io.exit.thread, label %can_do_io.exit

can_do_io.exit:                                   ; preds = %12
  %16 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 86
  %17 = load i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %can_do_io.exit.thread

; <label>:19                                      ; preds = %can_do_io.exit
  tail call void @cpu_io_recompile(%struct.CPUX86State* %9, i8* %retaddr) noreturn nounwind
  unreachable

can_do_io.exit.thread:                            ; preds = %can_do_io.exit, %12, %0
  %20 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 70
  store i32 %addr, i32* %20, align 4
  %21 = ptrtoint i8* %retaddr to i64
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 69
  store i64 %21, i64* %23, align 8
  %24 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %1, i32 1) nounwind
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %29, label %26

; <label>:26                                      ; preds = %can_do_io.exit.thread
  %27 = tail call i64 @s2e_notdirty_mem_write(i64 %4) nounwind
  %28 = inttoptr i64 %27 to i32*
  store i32 %val, i32* %28, align 4
  br label %40

; <label>:29                                      ; preds = %can_do_io.exit.thread
  %30 = load i32* @g_s2e_concretize_io_writes, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %34, label %32

; <label>:32                                      ; preds = %29
  %33 = tail call i32 @klee_get_value(i32 %val) nounwind
  br label %34

; <label>:34                                      ; preds = %32, %29
  %.0 = phi i32 [ %33, %32 ], [ %val, %29 ]
  %35 = load i32* @g_s2e_concretize_io_addresses, align 4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %39, label %37

; <label>:37                                      ; preds = %34
  %38 = tail call i32 @klee_get_value(i32 %addr) nounwind
  br label %39

; <label>:39                                      ; preds = %37, %34
  %.06 = phi i32 [ %38, %37 ], [ %addr, %34 ]
  tail call void @io_writel_mmu(i64 %physaddr, i32 %.0, i32 %.06, i8* %retaddr) nounwind
  br label %40

; <label>:40                                      ; preds = %39, %26
  ret void
}

declare void @io_writel_mmu(i64, i32, i32, i8*)

define void @__stl_mmu(i32 %addr, i32 %val, i32 %mmu_idx) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 1
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph, !prof !0

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %182

._crit_edge:                                      ; preds = %182, %6
  %.lcssa5 = phi i32 [ %19, %6 ], [ %186, %182 ]
  %.lcssa4 = phi %struct.CPUX86State* [ %17, %6 ], [ %184, %182 ]
  %24 = and i32 %.lcssa5, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %72, label %26, !prof !0

; <label>:26                                      ; preds = %._crit_edge
  %27 = and i32 %8, 3
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %76

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds %struct.CPUX86State* %.lcssa4, i64 0, i32 76, i64 %16, i64 %15
  %31 = load i64* %30, align 8
  %32 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %31) nounwind
  %33 = and i64 %31, -4096
  %34 = and i64 %7, 4294967295
  %35 = add i64 %33, %34
  %36 = icmp ne %struct.MemoryRegion* %32, @io_mem_ram
  %37 = icmp ne %struct.MemoryRegion* %32, @io_mem_rom
  %or.cond.i = and i1 %36, %37
  %38 = icmp ne %struct.MemoryRegion* %32, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %38
  %39 = icmp ne %struct.MemoryRegion* %32, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %39
  %40 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %41 = load i32* @use_icount, align 4
  %42 = icmp eq i32 %41, 0
  %or.cond8.i = or i1 %42, %or.cond5.not.i
  br i1 %or.cond8.i, label %can_do_io.exit.thread.i, label %43

; <label>:43                                      ; preds = %29
  %44 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 67
  %45 = load %struct.TranslationBlock** %44, align 8
  %46 = icmp eq %struct.TranslationBlock* %45, null
  br i1 %46, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %43
  %47 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 86
  %48 = load i32* %47, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %can_do_io.exit.thread.i

; <label>:50                                      ; preds = %can_do_io.exit.i
  tail call void @cpu_io_recompile(%struct.CPUX86State* %40, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %43, %29
  %51 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 70
  store i32 %8, i32* %51, align 4
  %52 = load %struct.CPUX86State** @env, align 8
  %53 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 69
  store i64 0, i64* %53, align 8
  %54 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %32, i32 1) nounwind
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %59, label %56

; <label>:56                                      ; preds = %can_do_io.exit.thread.i
  %57 = tail call i64 @s2e_notdirty_mem_write(i64 %35) nounwind
  %58 = inttoptr i64 %57 to i32*
  store i32 %val, i32* %58, align 4
  br label %io_write_chkl_mmu.exit

; <label>:59                                      ; preds = %can_do_io.exit.thread.i
  %60 = load i32* @g_s2e_concretize_io_writes, align 4
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %64, label %62

; <label>:62                                      ; preds = %59
  %63 = tail call i32 @klee_get_value(i32 %val) nounwind
  br label %64

; <label>:64                                      ; preds = %62, %59
  %.0.i = phi i32 [ %63, %62 ], [ %val, %59 ]
  %65 = load i32* @g_s2e_concretize_io_addresses, align 4
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %69, label %67

; <label>:67                                      ; preds = %64
  %68 = tail call i32 @klee_get_value(i32 %8) nounwind
  br label %69

; <label>:69                                      ; preds = %67, %64
  %.06.i = phi i32 [ %68, %67 ], [ %8, %64 ]
  tail call void @io_writel_mmu(i64 %31, i32 %.0.i, i32 %.06.i, i8* null) nounwind
  br label %io_write_chkl_mmu.exit

io_write_chkl_mmu.exit:                           ; preds = %69, %56
  %70 = add i64 %31, %34
  %71 = zext i32 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %34, i64 %70, i64 %71, i32 32, i8 zeroext 1, i8 zeroext 1) nounwind
  br label %slow_stl_mmu.exit

; <label>:72                                      ; preds = %._crit_edge
  %73 = and i32 %8, 127
  %74 = add i32 %73, 3
  %75 = icmp ugt i32 %74, 127
  br i1 %75, label %76, label %175, !prof !1

; <label>:76                                      ; preds = %72, %26
  %77 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %78 = icmp eq i32 %77, 0
  %79 = and i64 %7, 4294967295
  br i1 %78, label %82, label %80

; <label>:80                                      ; preds = %76
  %81 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %79, i64 0, i64 4294967295) nounwind
  br label %82

; <label>:82                                      ; preds = %80, %76
  %83 = phi i64 [ %81, %80 ], [ %79, %76 ]
  %84 = trunc i64 %83 to i32
  %85 = lshr i32 %84, 7
  %86 = zext i32 %85 to i64
  %87 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %86, i64 0, i64 33554431) nounwind
  %88 = trunc i64 %87 to i32
  %89 = lshr i32 %88, 5
  %90 = and i32 %89, 255
  %91 = zext i32 %90 to i64
  %92 = load %struct.CPUX86State** @env, align 8
  %93 = getelementptr inbounds %struct.CPUX86State* %92, i64 0, i32 74, i64 %16, i64 %91, i32 1
  %94 = load i32* %93, align 4
  %95 = and i32 %84, -4096
  %96 = and i32 %94, -4088
  %97 = icmp eq i32 %95, %96
  br i1 %97, label %._crit_edge.i, label %.lr.ph.i

.lr.ph.i:                                         ; preds = %82
  %98 = shl i32 %88, 7
  br label %168

._crit_edge.i:                                    ; preds = %168, %82
  %.lcssa4.i = phi i32 [ %94, %82 ], [ %172, %168 ]
  %.lcssa3.i = phi %struct.CPUX86State* [ %92, %82 ], [ %170, %168 ]
  %99 = and i32 %.lcssa4.i, 4095
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %147, label %101

; <label>:101                                     ; preds = %._crit_edge.i
  %102 = and i32 %84, 3
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %104, label %.preheader.i

; <label>:104                                     ; preds = %101
  %105 = getelementptr inbounds %struct.CPUX86State* %.lcssa3.i, i64 0, i32 76, i64 %16, i64 %91
  %106 = load i64* %105, align 8
  %107 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %106) nounwind
  %108 = and i64 %106, -4096
  %109 = and i64 %83, 4294967295
  %110 = add i64 %108, %109
  %111 = icmp ne %struct.MemoryRegion* %107, @io_mem_ram
  %112 = icmp ne %struct.MemoryRegion* %107, @io_mem_rom
  %or.cond.i.i = and i1 %111, %112
  %113 = icmp ne %struct.MemoryRegion* %107, @io_mem_unassigned
  %or.cond3.i.i = and i1 %or.cond.i.i, %113
  %114 = icmp ne %struct.MemoryRegion* %107, @io_mem_notdirty
  %or.cond5.i.i = and i1 %or.cond3.i.i, %114
  %115 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i.i = xor i1 %or.cond5.i.i, true
  %116 = load i32* @use_icount, align 4
  %117 = icmp eq i32 %116, 0
  %or.cond8.i.i = or i1 %117, %or.cond5.not.i.i
  br i1 %or.cond8.i.i, label %can_do_io.exit.thread.i.i, label %118

; <label>:118                                     ; preds = %104
  %119 = getelementptr inbounds %struct.CPUX86State* %115, i64 0, i32 67
  %120 = load %struct.TranslationBlock** %119, align 8
  %121 = icmp eq %struct.TranslationBlock* %120, null
  br i1 %121, label %can_do_io.exit.thread.i.i, label %can_do_io.exit.i.i

can_do_io.exit.i.i:                               ; preds = %118
  %122 = getelementptr inbounds %struct.CPUX86State* %115, i64 0, i32 86
  %123 = load i32* %122, align 4
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %125, label %can_do_io.exit.thread.i.i

; <label>:125                                     ; preds = %can_do_io.exit.i.i
  tail call void @cpu_io_recompile(%struct.CPUX86State* %115, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i.i:                        ; preds = %can_do_io.exit.i.i, %118, %104
  %126 = getelementptr inbounds %struct.CPUX86State* %115, i64 0, i32 70
  store i32 %84, i32* %126, align 4
  %127 = load %struct.CPUX86State** @env, align 8
  %128 = getelementptr inbounds %struct.CPUX86State* %127, i64 0, i32 69
  store i64 0, i64* %128, align 8
  %129 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %107, i32 1) nounwind
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %134, label %131

; <label>:131                                     ; preds = %can_do_io.exit.thread.i.i
  %132 = tail call i64 @s2e_notdirty_mem_write(i64 %110) nounwind
  %133 = inttoptr i64 %132 to i32*
  store i32 %val, i32* %133, align 4
  br label %io_write_chkl_mmu.exit.i

; <label>:134                                     ; preds = %can_do_io.exit.thread.i.i
  %135 = load i32* @g_s2e_concretize_io_writes, align 4
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %139, label %137

; <label>:137                                     ; preds = %134
  %138 = tail call i32 @klee_get_value(i32 %val) nounwind
  br label %139

; <label>:139                                     ; preds = %137, %134
  %.0.i.i = phi i32 [ %138, %137 ], [ %val, %134 ]
  %140 = load i32* @g_s2e_concretize_io_addresses, align 4
  %141 = icmp eq i32 %140, 0
  br i1 %141, label %144, label %142

; <label>:142                                     ; preds = %139
  %143 = tail call i32 @klee_get_value(i32 %84) nounwind
  br label %144

; <label>:144                                     ; preds = %142, %139
  %.06.i.i = phi i32 [ %143, %142 ], [ %84, %139 ]
  tail call void @io_writel_mmu(i64 %106, i32 %.0.i.i, i32 %.06.i.i, i8* null) nounwind
  br label %io_write_chkl_mmu.exit.i

io_write_chkl_mmu.exit.i:                         ; preds = %144, %131
  %145 = add i64 %106, %109
  %146 = zext i32 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %109, i64 %145, i64 %146, i32 32, i8 zeroext 1, i8 zeroext 1) nounwind
  br label %slow_stl_mmu.exit

; <label>:147                                     ; preds = %._crit_edge.i
  %148 = and i32 %84, 127
  %149 = add i32 %148, 3
  %150 = icmp ugt i32 %149, 127
  br i1 %150, label %.preheader.i, label %161

.preheader.i:                                     ; preds = %147, %101
  %151 = add i32 %84, 3
  %152 = lshr i32 %val, 24
  %153 = trunc i32 %152 to i8
  tail call fastcc void @slow_stb_mmu(i32 %151, i8 zeroext %153, i32 %mmu_idx) nounwind
  %154 = add i32 %84, 2
  %155 = lshr i32 %val, 16
  %156 = trunc i32 %155 to i8
  tail call fastcc void @slow_stb_mmu(i32 %154, i8 zeroext %156, i32 %mmu_idx) nounwind
  %157 = add i32 %84, 1
  %158 = lshr i32 %val, 8
  %159 = trunc i32 %158 to i8
  tail call fastcc void @slow_stb_mmu(i32 %157, i8 zeroext %159, i32 %mmu_idx) nounwind
  %160 = trunc i32 %val to i8
  tail call fastcc void @slow_stb_mmu(i32 %84, i8 zeroext %160, i32 %mmu_idx) nounwind
  br label %slow_stl_mmu.exit

; <label>:161                                     ; preds = %147
  %162 = getelementptr inbounds %struct.CPUX86State* %.lcssa3.i, i64 0, i32 74, i64 %16, i64 %91, i32 3
  %163 = load i64* %162, align 8
  %164 = and i64 %83, 4294967295
  %165 = add i64 %163, %164
  %166 = inttoptr i64 %165 to i32*
  store i32 %val, i32* %166, align 4
  %167 = zext i32 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %164, i64 %165, i64 %167, i32 32, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %slow_stl_mmu.exit

; <label>:168                                     ; preds = %168, %.lr.ph.i
  %169 = phi %struct.CPUX86State* [ %92, %.lr.ph.i ], [ %170, %168 ]
  tail call void @tlb_fill(%struct.CPUX86State* %169, i32 %84, i32 %98, i32 1, i32 %mmu_idx, i8* null) nounwind
  %170 = load %struct.CPUX86State** @env, align 8
  %171 = getelementptr inbounds %struct.CPUX86State* %170, i64 0, i32 74, i64 %16, i64 %91, i32 1
  %172 = load i32* %171, align 4
  %173 = and i32 %172, -4088
  %174 = icmp eq i32 %95, %173
  br i1 %174, label %._crit_edge.i, label %168

; <label>:175                                     ; preds = %72
  %176 = getelementptr inbounds %struct.CPUX86State* %.lcssa4, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %177 = load i64* %176, align 8
  %178 = and i64 %7, 4294967295
  %179 = add i64 %177, %178
  %180 = inttoptr i64 %179 to i32*
  store i32 %val, i32* %180, align 4
  %181 = zext i32 %val to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %178, i64 %179, i64 %181, i32 32, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %slow_stl_mmu.exit

; <label>:182                                     ; preds = %182, %.lr.ph
  %183 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %184, %182 ]
  tail call void @tlb_fill(%struct.CPUX86State* %183, i32 %8, i32 %23, i32 1, i32 %mmu_idx, i8* null)
  %184 = load %struct.CPUX86State** @env, align 8
  %185 = getelementptr inbounds %struct.CPUX86State* %184, i64 0, i32 74, i64 %16, i64 %15, i32 1
  %186 = load i32* %185, align 4
  %187 = and i32 %186, -4088
  %188 = icmp eq i32 %20, %187
  br i1 %188, label %._crit_edge, label %182, !prof !0

slow_stl_mmu.exit:                                ; preds = %175, %161, %.preheader.i, %io_write_chkl_mmu.exit.i, %io_write_chkl_mmu.exit
  ret void
}

define i64 @io_read_chkq_mmu(i64 %physaddr, i32 %addr, i8* %retaddr) nounwind uwtable inlinehint alwaysinline sspreq {
  %ret.i.i6 = alloca i8, align 1
  %data.i7 = alloca %union.anon.12, align 8
  %ret.i.i = alloca i8, align 1
  %data.i = alloca %union.anon.12, align 8
  %label = alloca [64 x i8], align 16
  %1 = call %struct.MemoryRegion* @iotlb_to_region(i64 %physaddr) nounwind
  %2 = and i64 %physaddr, 4294963200
  %3 = zext i32 %addr to i64
  %4 = add i64 %3, %2
  %5 = trunc i64 %4 to i32
  %6 = and i64 %4, 4294967295
  %7 = call i32 @s2e_is_mmio_symbolic_q(i64 %6) nounwind
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 4
  %13 = load i32* %12, align 4
  call void @trace_port(i8* %10, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %5, i32 %13)
  br label %14

; <label>:14                                      ; preds = %9, %0
  %15 = ptrtoint i8* %retaddr to i64
  %16 = load %struct.CPUX86State** @env, align 8
  %17 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 69
  store i64 %15, i64* %17, align 8
  %18 = icmp ne %struct.MemoryRegion* %1, @io_mem_ram
  %19 = icmp ne %struct.MemoryRegion* %1, @io_mem_rom
  %or.cond = and i1 %18, %19
  %20 = icmp ne %struct.MemoryRegion* %1, @io_mem_unassigned
  %or.cond3 = and i1 %or.cond, %20
  %21 = icmp ne %struct.MemoryRegion* %1, @io_mem_notdirty
  %or.cond5 = and i1 %or.cond3, %21
  %22 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not = xor i1 %or.cond5, true
  %23 = load i32* @use_icount, align 4
  %24 = icmp eq i32 %23, 0
  %or.cond16 = or i1 %24, %or.cond5.not
  br i1 %or.cond16, label %can_do_io.exit.thread, label %25

; <label>:25                                      ; preds = %14
  %26 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 67
  %27 = load %struct.TranslationBlock** %26, align 8
  %28 = icmp eq %struct.TranslationBlock* %27, null
  br i1 %28, label %can_do_io.exit.thread, label %can_do_io.exit

can_do_io.exit:                                   ; preds = %25
  %29 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 86
  %30 = load i32* %29, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %can_do_io.exit.thread

; <label>:32                                      ; preds = %can_do_io.exit
  call void @cpu_io_recompile(%struct.CPUX86State* %22, i8* %retaddr) noreturn nounwind
  unreachable

can_do_io.exit.thread:                            ; preds = %can_do_io.exit, %25, %14
  %33 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 70
  store i32 %addr, i32* %33, align 4
  %34 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %1, i32 0) nounwind
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %81, label %36

; <label>:36                                      ; preds = %can_do_io.exit.thread
  %37 = call i64 @s2e_notdirty_mem_write(i64 %physaddr) nounwind
  br i1 %8, label %38, label %73

; <label>:38                                      ; preds = %36
  %39 = getelementptr inbounds [64 x i8]* %label, i64 0, i64 0
  %40 = inttoptr i64 %37 to i64*
  %41 = load i64* %40, align 8
  %42 = getelementptr inbounds %union.anon.12* %data.i7, i64 0, i32 0
  store i64 %41, i64* %42, align 8
  %43 = bitcast %union.anon.12* %data.i7 to [8 x i8]*
  br label %44

; <label>:44                                      ; preds = %53, %38
  %indvars.iv.i8 = phi i64 [ 0, %38 ], [ %indvars.iv.next.i9, %53 ]
  %45 = trunc i64 %indvars.iv.i8 to i32
  %46 = add i32 %45, %5
  %47 = zext i32 %46 to i64
  %48 = call i32 @s2e_is_mmio_symbolic_b(i64 %47) nounwind
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %53, label %50

; <label>:50                                      ; preds = %44
  call void @klee_make_symbolic(i8* %ret.i.i6, i32 1, i8* %39) nounwind
  %51 = load i8* %ret.i.i6, align 1
  %52 = getelementptr inbounds [8 x i8]* %43, i64 0, i64 %indvars.iv.i8
  store i8 %51, i8* %52, align 1
  br label %53

; <label>:53                                      ; preds = %50, %44
  %indvars.iv.next.i9 = add i64 %indvars.iv.i8, 1
  %lftr.wideiv13 = trunc i64 %indvars.iv.next.i9 to i32
  %exitcond14 = icmp eq i32 %lftr.wideiv13, 8
  br i1 %exitcond14, label %io_read_chk_symb_q.exit12, label %44

io_read_chk_symb_q.exit12:                        ; preds = %53
  %54 = load i64* %42, align 8
  %55 = add i64 %37, 4
  %56 = inttoptr i64 %55 to i64*
  %57 = load i64* %56, align 8
  %58 = getelementptr inbounds %union.anon.12* %data.i, i64 0, i32 0
  store i64 %57, i64* %58, align 8
  %59 = bitcast %union.anon.12* %data.i to [8 x i8]*
  br label %60

; <label>:60                                      ; preds = %69, %io_read_chk_symb_q.exit12
  %indvars.iv.i = phi i64 [ 0, %io_read_chk_symb_q.exit12 ], [ %indvars.iv.next.i, %69 ]
  %61 = trunc i64 %indvars.iv.i to i32
  %62 = add i32 %61, %5
  %63 = zext i32 %62 to i64
  %64 = call i32 @s2e_is_mmio_symbolic_b(i64 %63) nounwind
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %69, label %66

; <label>:66                                      ; preds = %60
  call void @klee_make_symbolic(i8* %ret.i.i, i32 1, i8* %39) nounwind
  %67 = load i8* %ret.i.i, align 1
  %68 = getelementptr inbounds [8 x i8]* %59, i64 0, i64 %indvars.iv.i
  store i8 %67, i8* %68, align 1
  br label %69

; <label>:69                                      ; preds = %66, %60
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 8
  br i1 %exitcond, label %io_read_chk_symb_q.exit, label %60

io_read_chk_symb_q.exit:                          ; preds = %69
  %70 = load i64* %58, align 8
  %71 = shl i64 %70, 32
  %72 = or i64 %71, %54
  br label %83

; <label>:73                                      ; preds = %36
  %74 = inttoptr i64 %37 to i64*
  %75 = load i64* %74, align 8
  %76 = add i64 %37, 4
  %77 = inttoptr i64 %76 to i64*
  %78 = load i64* %77, align 8
  %79 = shl i64 %78, 32
  %80 = or i64 %79, %75
  br label %83

; <label>:81                                      ; preds = %can_do_io.exit.thread
  %82 = call i64 @io_readq_mmu(i64 %physaddr, i32 %addr, i8* %retaddr) nounwind
  br label %83

; <label>:83                                      ; preds = %81, %73, %io_read_chk_symb_q.exit
  %.0 = phi i64 [ %82, %81 ], [ %72, %io_read_chk_symb_q.exit ], [ %80, %73 ]
  ret i64 %.0
}

declare i32 @s2e_is_mmio_symbolic_q(i64)

declare i64 @io_readq_mmu(i64, i32, i8*)

define i64 @__ldq_mmu(i32 %addr, i32 %mmu_idx) nounwind uwtable sspreq {
  %ret.i.i6.i = alloca i8, align 1
  %data.i7.i = alloca %union.anon.12, align 8
  %ret.i.i.i = alloca i8, align 1
  %data.i.i = alloca %union.anon.12, align 8
  %label.i = alloca [64 x i8], align 16
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph, !prof !0

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %124

._crit_edge:                                      ; preds = %124, %6
  %.lcssa3 = phi i32 [ %19, %6 ], [ %128, %124 ]
  %.lcssa2 = phi %struct.CPUX86State* [ %17, %6 ], [ %126, %124 ]
  %24 = and i32 %.lcssa3, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %111, label %26, !prof !0

; <label>:26                                      ; preds = %._crit_edge
  %27 = and i32 %8, 7
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %115

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 76, i64 %16, i64 %15
  %31 = load i64* %30, align 8
  %32 = getelementptr inbounds [64 x i8]* %label.i, i64 0, i64 0
  %33 = call %struct.MemoryRegion* @iotlb_to_region(i64 %31) nounwind
  %34 = and i64 %31, 4294963200
  %35 = add i64 %34, %7
  %36 = trunc i64 %35 to i32
  %37 = and i64 %35, 4294967295
  %38 = call i32 @s2e_is_mmio_symbolic_q(i64 %37) nounwind
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %29
  %41 = load %struct.CPUX86State** @env, align 8
  %42 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 4
  %43 = load i32* %42, align 4
  call void @trace_port(i8* %32, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %36, i32 %43) nounwind
  br label %44

; <label>:44                                      ; preds = %40, %29
  %45 = load %struct.CPUX86State** @env, align 8
  %46 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 69
  store i64 0, i64* %46, align 8
  %47 = icmp ne %struct.MemoryRegion* %33, @io_mem_ram
  %48 = icmp ne %struct.MemoryRegion* %33, @io_mem_rom
  %or.cond.i = and i1 %47, %48
  %49 = icmp ne %struct.MemoryRegion* %33, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %49
  %50 = icmp ne %struct.MemoryRegion* %33, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %50
  %51 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %52 = load i32* @use_icount, align 4
  %53 = icmp eq i32 %52, 0
  %or.cond16.i = or i1 %53, %or.cond5.not.i
  br i1 %or.cond16.i, label %can_do_io.exit.thread.i, label %54

; <label>:54                                      ; preds = %44
  %55 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 67
  %56 = load %struct.TranslationBlock** %55, align 8
  %57 = icmp eq %struct.TranslationBlock* %56, null
  br i1 %57, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %54
  %58 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 86
  %59 = load i32* %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %can_do_io.exit.thread.i

; <label>:61                                      ; preds = %can_do_io.exit.i
  call void @cpu_io_recompile(%struct.CPUX86State* %51, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %54, %44
  %62 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 70
  store i32 %8, i32* %62, align 4
  %63 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %33, i32 0) nounwind
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %107, label %65

; <label>:65                                      ; preds = %can_do_io.exit.thread.i
  %66 = call i64 @s2e_notdirty_mem_write(i64 %31) nounwind
  %67 = inttoptr i64 %66 to i64*
  %68 = load i64* %67, align 8
  br i1 %39, label %69, label %101

; <label>:69                                      ; preds = %65
  %70 = getelementptr inbounds %union.anon.12* %data.i7.i, i64 0, i32 0
  store i64 %68, i64* %70, align 8
  %71 = bitcast %union.anon.12* %data.i7.i to [8 x i8]*
  br label %72

; <label>:72                                      ; preds = %81, %69
  %indvars.iv.i8.i = phi i64 [ 0, %69 ], [ %indvars.iv.next.i9.i, %81 ]
  %73 = trunc i64 %indvars.iv.i8.i to i32
  %74 = add i32 %73, %36
  %75 = zext i32 %74 to i64
  %76 = call i32 @s2e_is_mmio_symbolic_b(i64 %75) nounwind
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %81, label %78

; <label>:78                                      ; preds = %72
  call void @klee_make_symbolic(i8* %ret.i.i6.i, i32 1, i8* %32) nounwind
  %79 = load i8* %ret.i.i6.i, align 1
  %80 = getelementptr inbounds [8 x i8]* %71, i64 0, i64 %indvars.iv.i8.i
  store i8 %79, i8* %80, align 1
  br label %81

; <label>:81                                      ; preds = %78, %72
  %indvars.iv.next.i9.i = add i64 %indvars.iv.i8.i, 1
  %lftr.wideiv7 = trunc i64 %indvars.iv.next.i9.i to i32
  %exitcond8 = icmp eq i32 %lftr.wideiv7, 8
  br i1 %exitcond8, label %io_read_chk_symb_q.exit12.i, label %72

io_read_chk_symb_q.exit12.i:                      ; preds = %81
  %82 = load i64* %70, align 8
  %83 = add i64 %66, 4
  %84 = inttoptr i64 %83 to i64*
  %85 = load i64* %84, align 8
  %86 = getelementptr inbounds %union.anon.12* %data.i.i, i64 0, i32 0
  store i64 %85, i64* %86, align 8
  %87 = bitcast %union.anon.12* %data.i.i to [8 x i8]*
  br label %88

; <label>:88                                      ; preds = %97, %io_read_chk_symb_q.exit12.i
  %indvars.iv.i.i = phi i64 [ 0, %io_read_chk_symb_q.exit12.i ], [ %indvars.iv.next.i.i, %97 ]
  %89 = trunc i64 %indvars.iv.i.i to i32
  %90 = add i32 %89, %36
  %91 = zext i32 %90 to i64
  %92 = call i32 @s2e_is_mmio_symbolic_b(i64 %91) nounwind
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %97, label %94

; <label>:94                                      ; preds = %88
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %95 = load i8* %ret.i.i.i, align 1
  %96 = getelementptr inbounds [8 x i8]* %87, i64 0, i64 %indvars.iv.i.i
  store i8 %95, i8* %96, align 1
  br label %97

; <label>:97                                      ; preds = %94, %88
  %indvars.iv.next.i.i = add i64 %indvars.iv.i.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 8
  br i1 %exitcond, label %io_read_chk_symb_q.exit.i, label %88

io_read_chk_symb_q.exit.i:                        ; preds = %97
  %98 = load i64* %86, align 8
  %99 = shl i64 %98, 32
  %100 = or i64 %99, %82
  br label %io_read_chkq_mmu.exit

; <label>:101                                     ; preds = %65
  %102 = add i64 %66, 4
  %103 = inttoptr i64 %102 to i64*
  %104 = load i64* %103, align 8
  %105 = shl i64 %104, 32
  %106 = or i64 %105, %68
  br label %io_read_chkq_mmu.exit

; <label>:107                                     ; preds = %can_do_io.exit.thread.i
  %108 = call i64 @io_readq_mmu(i64 %31, i32 %8, i8* null) nounwind
  br label %io_read_chkq_mmu.exit

io_read_chkq_mmu.exit:                            ; preds = %107, %101, %io_read_chk_symb_q.exit.i
  %.0.i = phi i64 [ %108, %107 ], [ %100, %io_read_chk_symb_q.exit.i ], [ %106, %101 ]
  %109 = and i64 %7, 4294967295
  %110 = add i64 %31, %109
  call void @tcg_llvm_trace_memory_access(i64 %109, i64 %110, i64 %.0.i, i32 64, i8 zeroext 0, i8 zeroext 1) nounwind
  br label %131

; <label>:111                                     ; preds = %._crit_edge
  %112 = and i32 %8, 127
  %113 = add i32 %112, 7
  %114 = icmp ugt i32 %113, 127
  br i1 %114, label %115, label %117, !prof !1

; <label>:115                                     ; preds = %111, %26
  %116 = call fastcc i64 @slow_ldq_mmu(i32 %8, i32 %mmu_idx)
  br label %131

; <label>:117                                     ; preds = %111
  %118 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %119 = load i64* %118, align 8
  %120 = and i64 %7, 4294967295
  %121 = add i64 %119, %120
  %122 = inttoptr i64 %121 to i64*
  %123 = load i64* %122, align 8
  call void @tcg_llvm_trace_memory_access(i64 %120, i64 %121, i64 %123, i32 64, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %131

; <label>:124                                     ; preds = %124, %.lr.ph
  %125 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %126, %124 ]
  call void @tlb_fill(%struct.CPUX86State* %125, i32 %8, i32 %23, i32 0, i32 %mmu_idx, i8* null)
  %126 = load %struct.CPUX86State** @env, align 8
  %127 = getelementptr inbounds %struct.CPUX86State* %126, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %128 = load i32* %127, align 4
  %129 = and i32 %128, -4088
  %130 = icmp eq i32 %20, %129
  br i1 %130, label %._crit_edge, label %124, !prof !0

; <label>:131                                     ; preds = %117, %115, %io_read_chkq_mmu.exit
  %res.0 = phi i64 [ %116, %115 ], [ %.0.i, %io_read_chkq_mmu.exit ], [ %123, %117 ]
  ret i64 %res.0
}

define internal fastcc i64 @slow_ldq_mmu(i32 %addr, i32 %mmu_idx) nounwind uwtable sspreq {
  %ret.i.i6.i = alloca i8, align 1
  %data.i7.i = alloca %union.anon.12, align 8
  %ret.i.i.i = alloca i8, align 1
  %data.i.i = alloca %union.anon.12, align 8
  %label.i = alloca [64 x i8], align 16
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %135

._crit_edge:                                      ; preds = %135, %6
  %.lcssa3 = phi i32 [ %19, %6 ], [ %139, %135 ]
  %.lcssa2 = phi %struct.CPUX86State* [ %17, %6 ], [ %137, %135 ]
  %24 = and i32 %.lcssa3, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %111, label %26

; <label>:26                                      ; preds = %._crit_edge
  %27 = and i32 %8, 7
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %115

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 76, i64 %16, i64 %15
  %31 = load i64* %30, align 8
  %32 = getelementptr inbounds [64 x i8]* %label.i, i64 0, i64 0
  %33 = call %struct.MemoryRegion* @iotlb_to_region(i64 %31) nounwind
  %34 = and i64 %31, 4294963200
  %35 = add i64 %34, %7
  %36 = trunc i64 %35 to i32
  %37 = and i64 %35, 4294967295
  %38 = call i32 @s2e_is_mmio_symbolic_q(i64 %37) nounwind
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %29
  %41 = load %struct.CPUX86State** @env, align 8
  %42 = getelementptr inbounds %struct.CPUX86State* %41, i64 0, i32 4
  %43 = load i32* %42, align 4
  call void @trace_port(i8* %32, i8* getelementptr inbounds ([11 x i8]* @.str9, i64 0, i64 0), i32 %36, i32 %43) nounwind
  br label %44

; <label>:44                                      ; preds = %40, %29
  %45 = load %struct.CPUX86State** @env, align 8
  %46 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 69
  store i64 0, i64* %46, align 8
  %47 = icmp ne %struct.MemoryRegion* %33, @io_mem_ram
  %48 = icmp ne %struct.MemoryRegion* %33, @io_mem_rom
  %or.cond.i = and i1 %47, %48
  %49 = icmp ne %struct.MemoryRegion* %33, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %49
  %50 = icmp ne %struct.MemoryRegion* %33, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %50
  %51 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %52 = load i32* @use_icount, align 4
  %53 = icmp eq i32 %52, 0
  %or.cond16.i = or i1 %53, %or.cond5.not.i
  br i1 %or.cond16.i, label %can_do_io.exit.thread.i, label %54

; <label>:54                                      ; preds = %44
  %55 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 67
  %56 = load %struct.TranslationBlock** %55, align 8
  %57 = icmp eq %struct.TranslationBlock* %56, null
  br i1 %57, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %54
  %58 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 86
  %59 = load i32* %58, align 4
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %61, label %can_do_io.exit.thread.i

; <label>:61                                      ; preds = %can_do_io.exit.i
  call void @cpu_io_recompile(%struct.CPUX86State* %51, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %54, %44
  %62 = getelementptr inbounds %struct.CPUX86State* %51, i64 0, i32 70
  store i32 %8, i32* %62, align 4
  %63 = call i32 @s2e_ismemfunc(%struct.MemoryRegion* %33, i32 0) nounwind
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %107, label %65

; <label>:65                                      ; preds = %can_do_io.exit.thread.i
  %66 = call i64 @s2e_notdirty_mem_write(i64 %31) nounwind
  %67 = inttoptr i64 %66 to i64*
  %68 = load i64* %67, align 8
  br i1 %39, label %69, label %101

; <label>:69                                      ; preds = %65
  %70 = getelementptr inbounds %union.anon.12* %data.i7.i, i64 0, i32 0
  store i64 %68, i64* %70, align 8
  %71 = bitcast %union.anon.12* %data.i7.i to [8 x i8]*
  br label %72

; <label>:72                                      ; preds = %81, %69
  %indvars.iv.i8.i = phi i64 [ 0, %69 ], [ %indvars.iv.next.i9.i, %81 ]
  %73 = trunc i64 %indvars.iv.i8.i to i32
  %74 = add i32 %73, %36
  %75 = zext i32 %74 to i64
  %76 = call i32 @s2e_is_mmio_symbolic_b(i64 %75) nounwind
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %81, label %78

; <label>:78                                      ; preds = %72
  call void @klee_make_symbolic(i8* %ret.i.i6.i, i32 1, i8* %32) nounwind
  %79 = load i8* %ret.i.i6.i, align 1
  %80 = getelementptr inbounds [8 x i8]* %71, i64 0, i64 %indvars.iv.i8.i
  store i8 %79, i8* %80, align 1
  br label %81

; <label>:81                                      ; preds = %78, %72
  %indvars.iv.next.i9.i = add i64 %indvars.iv.i8.i, 1
  %lftr.wideiv7 = trunc i64 %indvars.iv.next.i9.i to i32
  %exitcond8 = icmp eq i32 %lftr.wideiv7, 8
  br i1 %exitcond8, label %io_read_chk_symb_q.exit12.i, label %72

io_read_chk_symb_q.exit12.i:                      ; preds = %81
  %82 = load i64* %70, align 8
  %83 = add i64 %66, 4
  %84 = inttoptr i64 %83 to i64*
  %85 = load i64* %84, align 8
  %86 = getelementptr inbounds %union.anon.12* %data.i.i, i64 0, i32 0
  store i64 %85, i64* %86, align 8
  %87 = bitcast %union.anon.12* %data.i.i to [8 x i8]*
  br label %88

; <label>:88                                      ; preds = %97, %io_read_chk_symb_q.exit12.i
  %indvars.iv.i.i = phi i64 [ 0, %io_read_chk_symb_q.exit12.i ], [ %indvars.iv.next.i.i, %97 ]
  %89 = trunc i64 %indvars.iv.i.i to i32
  %90 = add i32 %89, %36
  %91 = zext i32 %90 to i64
  %92 = call i32 @s2e_is_mmio_symbolic_b(i64 %91) nounwind
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %97, label %94

; <label>:94                                      ; preds = %88
  call void @klee_make_symbolic(i8* %ret.i.i.i, i32 1, i8* %32) nounwind
  %95 = load i8* %ret.i.i.i, align 1
  %96 = getelementptr inbounds [8 x i8]* %87, i64 0, i64 %indvars.iv.i.i
  store i8 %95, i8* %96, align 1
  br label %97

; <label>:97                                      ; preds = %94, %88
  %indvars.iv.next.i.i = add i64 %indvars.iv.i.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 8
  br i1 %exitcond, label %io_read_chk_symb_q.exit.i, label %88

io_read_chk_symb_q.exit.i:                        ; preds = %97
  %98 = load i64* %86, align 8
  %99 = shl i64 %98, 32
  %100 = or i64 %99, %82
  br label %io_read_chkq_mmu.exit

; <label>:101                                     ; preds = %65
  %102 = add i64 %66, 4
  %103 = inttoptr i64 %102 to i64*
  %104 = load i64* %103, align 8
  %105 = shl i64 %104, 32
  %106 = or i64 %105, %68
  br label %io_read_chkq_mmu.exit

; <label>:107                                     ; preds = %can_do_io.exit.thread.i
  %108 = call i64 @io_readq_mmu(i64 %31, i32 %8, i8* null) nounwind
  br label %io_read_chkq_mmu.exit

io_read_chkq_mmu.exit:                            ; preds = %107, %101, %io_read_chk_symb_q.exit.i
  %.0.i = phi i64 [ %108, %107 ], [ %100, %io_read_chk_symb_q.exit.i ], [ %106, %101 ]
  %109 = and i64 %7, 4294967295
  %110 = add i64 %31, %109
  call void @tcg_llvm_trace_memory_access(i64 %109, i64 %110, i64 %.0.i, i32 64, i8 zeroext 0, i8 zeroext 1) nounwind
  br label %142

; <label>:111                                     ; preds = %._crit_edge
  %112 = and i32 %8, 127
  %113 = add i32 %112, 7
  %114 = icmp ugt i32 %113, 127
  br i1 %114, label %115, label %128

; <label>:115                                     ; preds = %111, %26
  %116 = and i32 %8, -8
  %117 = add i32 %116, 8
  %118 = call fastcc i64 @slow_ldq_mmu(i32 %116, i32 %mmu_idx)
  %119 = call fastcc i64 @slow_ldq_mmu(i32 %117, i32 %mmu_idx)
  %120 = shl i32 %8, 3
  %121 = and i32 %120, 56
  %122 = zext i32 %121 to i64
  %123 = lshr i64 %118, %122
  %124 = sub nsw i32 64, %121
  %125 = zext i32 %124 to i64
  %126 = shl i64 %119, %125
  %127 = or i64 %126, %123
  br label %142

; <label>:128                                     ; preds = %111
  %129 = getelementptr inbounds %struct.CPUX86State* %.lcssa2, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %130 = load i64* %129, align 8
  %131 = and i64 %7, 4294967295
  %132 = add i64 %130, %131
  %133 = inttoptr i64 %132 to i64*
  %134 = load i64* %133, align 8
  call void @tcg_llvm_trace_memory_access(i64 %131, i64 %132, i64 %134, i32 64, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %142

; <label>:135                                     ; preds = %135, %.lr.ph
  %136 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %137, %135 ]
  call void @tlb_fill(%struct.CPUX86State* %136, i32 %8, i32 %23, i32 0, i32 %mmu_idx, i8* null)
  %137 = load %struct.CPUX86State** @env, align 8
  %138 = getelementptr inbounds %struct.CPUX86State* %137, i64 0, i32 74, i64 %16, i64 %15, i32 0
  %139 = load i32* %138, align 4
  %140 = and i32 %139, -4088
  %141 = icmp eq i32 %20, %140
  br i1 %141, label %._crit_edge, label %135

; <label>:142                                     ; preds = %128, %115, %io_read_chkq_mmu.exit
  %res.0 = phi i64 [ %127, %115 ], [ %.0.i, %io_read_chkq_mmu.exit ], [ %134, %128 ]
  ret i64 %res.0
}

define void @io_write_chkq_mmu(i64 %physaddr, i64 %val, i32 %addr, i8* %retaddr) nounwind uwtable inlinehint alwaysinline sspreq {
  %1 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %physaddr) nounwind
  %2 = and i64 %physaddr, -4096
  %3 = zext i32 %addr to i64
  %4 = add i64 %3, %2
  %5 = icmp ne %struct.MemoryRegion* %1, @io_mem_ram
  %6 = icmp ne %struct.MemoryRegion* %1, @io_mem_rom
  %or.cond = and i1 %5, %6
  %7 = icmp ne %struct.MemoryRegion* %1, @io_mem_unassigned
  %or.cond3 = and i1 %or.cond, %7
  %8 = icmp ne %struct.MemoryRegion* %1, @io_mem_notdirty
  %or.cond5 = and i1 %or.cond3, %8
  %9 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not = xor i1 %or.cond5, true
  %10 = load i32* @use_icount, align 4
  %11 = icmp eq i32 %10, 0
  %or.cond8 = or i1 %11, %or.cond5.not
  br i1 %or.cond8, label %can_do_io.exit.thread, label %12

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 67
  %14 = load %struct.TranslationBlock** %13, align 8
  %15 = icmp eq %struct.TranslationBlock* %14, null
  br i1 %15, label %can_do_io.exit.thread, label %can_do_io.exit

can_do_io.exit:                                   ; preds = %12
  %16 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 86
  %17 = load i32* %16, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %can_do_io.exit.thread

; <label>:19                                      ; preds = %can_do_io.exit
  tail call void @cpu_io_recompile(%struct.CPUX86State* %9, i8* %retaddr) noreturn nounwind
  unreachable

can_do_io.exit.thread:                            ; preds = %can_do_io.exit, %12, %0
  %20 = getelementptr inbounds %struct.CPUX86State* %9, i64 0, i32 70
  store i32 %addr, i32* %20, align 4
  %21 = ptrtoint i8* %retaddr to i64
  %22 = load %struct.CPUX86State** @env, align 8
  %23 = getelementptr inbounds %struct.CPUX86State* %22, i64 0, i32 69
  store i64 %21, i64* %23, align 8
  %24 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %1, i32 1) nounwind
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %34, label %26

; <label>:26                                      ; preds = %can_do_io.exit.thread
  %27 = tail call i64 @s2e_notdirty_mem_write(i64 %4) nounwind
  %28 = trunc i64 %val to i32
  %29 = inttoptr i64 %27 to i32*
  store i32 %28, i32* %29, align 4
  %30 = add i64 %27, 4
  %31 = lshr i64 %val, 32
  %32 = trunc i64 %31 to i32
  %33 = inttoptr i64 %30 to i32*
  store i32 %32, i32* %33, align 4
  br label %47

; <label>:34                                      ; preds = %can_do_io.exit.thread
  %35 = load i32* @g_s2e_concretize_io_writes, align 4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %41, label %37

; <label>:37                                      ; preds = %34
  %38 = trunc i64 %val to i32
  %39 = tail call i32 @klee_get_value(i32 %38) nounwind
  %40 = zext i32 %39 to i64
  br label %41

; <label>:41                                      ; preds = %37, %34
  %.0 = phi i64 [ %40, %37 ], [ %val, %34 ]
  %42 = load i32* @g_s2e_concretize_io_addresses, align 4
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %46, label %44

; <label>:44                                      ; preds = %41
  %45 = tail call i32 @klee_get_value(i32 %addr) nounwind
  br label %46

; <label>:46                                      ; preds = %44, %41
  %.06 = phi i32 [ %45, %44 ], [ %addr, %41 ]
  tail call void @io_writeq_mmu(i64 %physaddr, i64 %.0, i32 %.06, i8* %retaddr) nounwind
  br label %47

; <label>:47                                      ; preds = %46, %26
  ret void
}

declare void @io_writeq_mmu(i64, i64, i32, i8*)

define void @__stq_mmu(i32 %addr, i64 %val, i32 %mmu_idx) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %addr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = trunc i64 %11 to i32
  %13 = lshr i32 %12, 5
  %14 = and i32 %13, 255
  %15 = zext i32 %14 to i64
  %16 = sext i32 %mmu_idx to i64
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 74, i64 %16, i64 %15, i32 1
  %19 = load i32* %18, align 4
  %20 = and i32 %8, -4096
  %21 = and i32 %19, -4088
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %._crit_edge, label %.lr.ph, !prof !0

.lr.ph:                                           ; preds = %6
  %23 = shl i32 %12, 7
  br label %204

._crit_edge:                                      ; preds = %204, %6
  %.lcssa5 = phi i32 [ %19, %6 ], [ %208, %204 ]
  %.lcssa4 = phi %struct.CPUX86State* [ %17, %6 ], [ %206, %204 ]
  %24 = and i32 %.lcssa5, 4095
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %78, label %26, !prof !0

; <label>:26                                      ; preds = %._crit_edge
  %27 = and i32 %8, 7
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %82

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds %struct.CPUX86State* %.lcssa4, i64 0, i32 76, i64 %16, i64 %15
  %31 = load i64* %30, align 8
  %32 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %31) nounwind
  %33 = and i64 %31, -4096
  %34 = and i64 %7, 4294967295
  %35 = add i64 %33, %34
  %36 = icmp ne %struct.MemoryRegion* %32, @io_mem_ram
  %37 = icmp ne %struct.MemoryRegion* %32, @io_mem_rom
  %or.cond.i = and i1 %36, %37
  %38 = icmp ne %struct.MemoryRegion* %32, @io_mem_unassigned
  %or.cond3.i = and i1 %or.cond.i, %38
  %39 = icmp ne %struct.MemoryRegion* %32, @io_mem_notdirty
  %or.cond5.i = and i1 %or.cond3.i, %39
  %40 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i = xor i1 %or.cond5.i, true
  %41 = load i32* @use_icount, align 4
  %42 = icmp eq i32 %41, 0
  %or.cond8.i = or i1 %42, %or.cond5.not.i
  br i1 %or.cond8.i, label %can_do_io.exit.thread.i, label %43

; <label>:43                                      ; preds = %29
  %44 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 67
  %45 = load %struct.TranslationBlock** %44, align 8
  %46 = icmp eq %struct.TranslationBlock* %45, null
  br i1 %46, label %can_do_io.exit.thread.i, label %can_do_io.exit.i

can_do_io.exit.i:                                 ; preds = %43
  %47 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 86
  %48 = load i32* %47, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %can_do_io.exit.thread.i

; <label>:50                                      ; preds = %can_do_io.exit.i
  tail call void @cpu_io_recompile(%struct.CPUX86State* %40, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i:                          ; preds = %can_do_io.exit.i, %43, %29
  %51 = getelementptr inbounds %struct.CPUX86State* %40, i64 0, i32 70
  store i32 %8, i32* %51, align 4
  %52 = load %struct.CPUX86State** @env, align 8
  %53 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 69
  store i64 0, i64* %53, align 8
  %54 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %32, i32 1) nounwind
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %64, label %56

; <label>:56                                      ; preds = %can_do_io.exit.thread.i
  %57 = tail call i64 @s2e_notdirty_mem_write(i64 %35) nounwind
  %58 = trunc i64 %val to i32
  %59 = inttoptr i64 %57 to i32*
  store i32 %58, i32* %59, align 4
  %60 = add i64 %57, 4
  %61 = lshr i64 %val, 32
  %62 = trunc i64 %61 to i32
  %63 = inttoptr i64 %60 to i32*
  store i32 %62, i32* %63, align 4
  br label %io_write_chkq_mmu.exit

; <label>:64                                      ; preds = %can_do_io.exit.thread.i
  %65 = load i32* @g_s2e_concretize_io_writes, align 4
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %71, label %67

; <label>:67                                      ; preds = %64
  %68 = trunc i64 %val to i32
  %69 = tail call i32 @klee_get_value(i32 %68) nounwind
  %70 = zext i32 %69 to i64
  br label %71

; <label>:71                                      ; preds = %67, %64
  %.0.i = phi i64 [ %70, %67 ], [ %val, %64 ]
  %72 = load i32* @g_s2e_concretize_io_addresses, align 4
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %76, label %74

; <label>:74                                      ; preds = %71
  %75 = tail call i32 @klee_get_value(i32 %8) nounwind
  br label %76

; <label>:76                                      ; preds = %74, %71
  %.06.i = phi i32 [ %75, %74 ], [ %8, %71 ]
  tail call void @io_writeq_mmu(i64 %31, i64 %.0.i, i32 %.06.i, i8* null) nounwind
  br label %io_write_chkq_mmu.exit

io_write_chkq_mmu.exit:                           ; preds = %76, %56
  %77 = add i64 %31, %34
  tail call void @tcg_llvm_trace_memory_access(i64 %34, i64 %77, i64 %val, i32 64, i8 zeroext 1, i8 zeroext 1) nounwind
  br label %slow_stq_mmu.exit

; <label>:78                                      ; preds = %._crit_edge
  %79 = and i32 %8, 127
  %80 = add i32 %79, 7
  %81 = icmp ugt i32 %80, 127
  br i1 %81, label %82, label %198, !prof !1

; <label>:82                                      ; preds = %78, %26
  %83 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %84 = icmp eq i32 %83, 0
  %85 = and i64 %7, 4294967295
  br i1 %84, label %88, label %86

; <label>:86                                      ; preds = %82
  %87 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %85, i64 0, i64 4294967295) nounwind
  br label %88

; <label>:88                                      ; preds = %86, %82
  %89 = phi i64 [ %87, %86 ], [ %85, %82 ]
  %90 = trunc i64 %89 to i32
  %91 = lshr i32 %90, 7
  %92 = zext i32 %91 to i64
  %93 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %92, i64 0, i64 33554431) nounwind
  %94 = trunc i64 %93 to i32
  %95 = lshr i32 %94, 5
  %96 = and i32 %95, 255
  %97 = zext i32 %96 to i64
  %98 = load %struct.CPUX86State** @env, align 8
  %99 = getelementptr inbounds %struct.CPUX86State* %98, i64 0, i32 74, i64 %16, i64 %97, i32 1
  %100 = load i32* %99, align 4
  %101 = and i32 %90, -4096
  %102 = and i32 %100, -4088
  %103 = icmp eq i32 %101, %102
  br i1 %103, label %._crit_edge.i, label %.lr.ph.i

.lr.ph.i:                                         ; preds = %88
  %104 = shl i32 %94, 7
  br label %191

._crit_edge.i:                                    ; preds = %191, %88
  %.lcssa4.i = phi i32 [ %100, %88 ], [ %195, %191 ]
  %.lcssa3.i = phi %struct.CPUX86State* [ %98, %88 ], [ %193, %191 ]
  %105 = and i32 %.lcssa4.i, 4095
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %159, label %107

; <label>:107                                     ; preds = %._crit_edge.i
  %108 = and i32 %90, 7
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %.preheader.i

; <label>:110                                     ; preds = %107
  %111 = getelementptr inbounds %struct.CPUX86State* %.lcssa3.i, i64 0, i32 76, i64 %16, i64 %97
  %112 = load i64* %111, align 8
  %113 = tail call %struct.MemoryRegion* @iotlb_to_region(i64 %112) nounwind
  %114 = and i64 %112, -4096
  %115 = and i64 %89, 4294967295
  %116 = add i64 %114, %115
  %117 = icmp ne %struct.MemoryRegion* %113, @io_mem_ram
  %118 = icmp ne %struct.MemoryRegion* %113, @io_mem_rom
  %or.cond.i.i = and i1 %117, %118
  %119 = icmp ne %struct.MemoryRegion* %113, @io_mem_unassigned
  %or.cond3.i.i = and i1 %or.cond.i.i, %119
  %120 = icmp ne %struct.MemoryRegion* %113, @io_mem_notdirty
  %or.cond5.i.i = and i1 %or.cond3.i.i, %120
  %121 = load %struct.CPUX86State** @env, align 8
  %or.cond5.not.i.i = xor i1 %or.cond5.i.i, true
  %122 = load i32* @use_icount, align 4
  %123 = icmp eq i32 %122, 0
  %or.cond8.i.i = or i1 %123, %or.cond5.not.i.i
  br i1 %or.cond8.i.i, label %can_do_io.exit.thread.i.i, label %124

; <label>:124                                     ; preds = %110
  %125 = getelementptr inbounds %struct.CPUX86State* %121, i64 0, i32 67
  %126 = load %struct.TranslationBlock** %125, align 8
  %127 = icmp eq %struct.TranslationBlock* %126, null
  br i1 %127, label %can_do_io.exit.thread.i.i, label %can_do_io.exit.i.i

can_do_io.exit.i.i:                               ; preds = %124
  %128 = getelementptr inbounds %struct.CPUX86State* %121, i64 0, i32 86
  %129 = load i32* %128, align 4
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %can_do_io.exit.thread.i.i

; <label>:131                                     ; preds = %can_do_io.exit.i.i
  tail call void @cpu_io_recompile(%struct.CPUX86State* %121, i8* null) noreturn nounwind
  unreachable

can_do_io.exit.thread.i.i:                        ; preds = %can_do_io.exit.i.i, %124, %110
  %132 = getelementptr inbounds %struct.CPUX86State* %121, i64 0, i32 70
  store i32 %90, i32* %132, align 4
  %133 = load %struct.CPUX86State** @env, align 8
  %134 = getelementptr inbounds %struct.CPUX86State* %133, i64 0, i32 69
  store i64 0, i64* %134, align 8
  %135 = tail call i32 @s2e_ismemfunc(%struct.MemoryRegion* %113, i32 1) nounwind
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %145, label %137

; <label>:137                                     ; preds = %can_do_io.exit.thread.i.i
  %138 = tail call i64 @s2e_notdirty_mem_write(i64 %116) nounwind
  %139 = trunc i64 %val to i32
  %140 = inttoptr i64 %138 to i32*
  store i32 %139, i32* %140, align 4
  %141 = add i64 %138, 4
  %142 = lshr i64 %val, 32
  %143 = trunc i64 %142 to i32
  %144 = inttoptr i64 %141 to i32*
  store i32 %143, i32* %144, align 4
  br label %io_write_chkq_mmu.exit.i

; <label>:145                                     ; preds = %can_do_io.exit.thread.i.i
  %146 = load i32* @g_s2e_concretize_io_writes, align 4
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %152, label %148

; <label>:148                                     ; preds = %145
  %149 = trunc i64 %val to i32
  %150 = tail call i32 @klee_get_value(i32 %149) nounwind
  %151 = zext i32 %150 to i64
  br label %152

; <label>:152                                     ; preds = %148, %145
  %.0.i.i = phi i64 [ %151, %148 ], [ %val, %145 ]
  %153 = load i32* @g_s2e_concretize_io_addresses, align 4
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %157, label %155

; <label>:155                                     ; preds = %152
  %156 = tail call i32 @klee_get_value(i32 %90) nounwind
  br label %157

; <label>:157                                     ; preds = %155, %152
  %.06.i.i = phi i32 [ %156, %155 ], [ %90, %152 ]
  tail call void @io_writeq_mmu(i64 %112, i64 %.0.i.i, i32 %.06.i.i, i8* null) nounwind
  br label %io_write_chkq_mmu.exit.i

io_write_chkq_mmu.exit.i:                         ; preds = %157, %137
  %158 = add i64 %112, %115
  tail call void @tcg_llvm_trace_memory_access(i64 %115, i64 %158, i64 %val, i32 64, i8 zeroext 1, i8 zeroext 1) nounwind
  br label %slow_stq_mmu.exit

; <label>:159                                     ; preds = %._crit_edge.i
  %160 = and i32 %90, 127
  %161 = add i32 %160, 7
  %162 = icmp ugt i32 %161, 127
  br i1 %162, label %.preheader.i, label %185

.preheader.i:                                     ; preds = %159, %107
  %163 = add i32 %90, 7
  %164 = lshr i64 %val, 56
  %165 = trunc i64 %164 to i8
  tail call fastcc void @slow_stb_mmu(i32 %163, i8 zeroext %165, i32 %mmu_idx) nounwind
  %166 = add i32 %90, 6
  %167 = lshr i64 %val, 48
  %168 = trunc i64 %167 to i8
  tail call fastcc void @slow_stb_mmu(i32 %166, i8 zeroext %168, i32 %mmu_idx) nounwind
  %169 = add i32 %90, 5
  %170 = lshr i64 %val, 40
  %171 = trunc i64 %170 to i8
  tail call fastcc void @slow_stb_mmu(i32 %169, i8 zeroext %171, i32 %mmu_idx) nounwind
  %172 = add i32 %90, 4
  %173 = lshr i64 %val, 32
  %174 = trunc i64 %173 to i8
  tail call fastcc void @slow_stb_mmu(i32 %172, i8 zeroext %174, i32 %mmu_idx) nounwind
  %175 = add i32 %90, 3
  %176 = lshr i64 %val, 24
  %177 = trunc i64 %176 to i8
  tail call fastcc void @slow_stb_mmu(i32 %175, i8 zeroext %177, i32 %mmu_idx) nounwind
  %178 = add i32 %90, 2
  %179 = lshr i64 %val, 16
  %180 = trunc i64 %179 to i8
  tail call fastcc void @slow_stb_mmu(i32 %178, i8 zeroext %180, i32 %mmu_idx) nounwind
  %181 = add i32 %90, 1
  %182 = lshr i64 %val, 8
  %183 = trunc i64 %182 to i8
  tail call fastcc void @slow_stb_mmu(i32 %181, i8 zeroext %183, i32 %mmu_idx) nounwind
  %184 = trunc i64 %val to i8
  tail call fastcc void @slow_stb_mmu(i32 %90, i8 zeroext %184, i32 %mmu_idx) nounwind
  br label %slow_stq_mmu.exit

; <label>:185                                     ; preds = %159
  %186 = getelementptr inbounds %struct.CPUX86State* %.lcssa3.i, i64 0, i32 74, i64 %16, i64 %97, i32 3
  %187 = load i64* %186, align 8
  %188 = and i64 %89, 4294967295
  %189 = add i64 %187, %188
  %190 = inttoptr i64 %189 to i64*
  store i64 %val, i64* %190, align 8
  tail call void @tcg_llvm_trace_memory_access(i64 %188, i64 %189, i64 %val, i32 64, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %slow_stq_mmu.exit

; <label>:191                                     ; preds = %191, %.lr.ph.i
  %192 = phi %struct.CPUX86State* [ %98, %.lr.ph.i ], [ %193, %191 ]
  tail call void @tlb_fill(%struct.CPUX86State* %192, i32 %90, i32 %104, i32 1, i32 %mmu_idx, i8* null) nounwind
  %193 = load %struct.CPUX86State** @env, align 8
  %194 = getelementptr inbounds %struct.CPUX86State* %193, i64 0, i32 74, i64 %16, i64 %97, i32 1
  %195 = load i32* %194, align 4
  %196 = and i32 %195, -4088
  %197 = icmp eq i32 %101, %196
  br i1 %197, label %._crit_edge.i, label %191

; <label>:198                                     ; preds = %78
  %199 = getelementptr inbounds %struct.CPUX86State* %.lcssa4, i64 0, i32 74, i64 %16, i64 %15, i32 3
  %200 = load i64* %199, align 8
  %201 = and i64 %7, 4294967295
  %202 = add i64 %200, %201
  %203 = inttoptr i64 %202 to i64*
  store i64 %val, i64* %203, align 8
  tail call void @tcg_llvm_trace_memory_access(i64 %201, i64 %202, i64 %val, i32 64, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %slow_stq_mmu.exit

; <label>:204                                     ; preds = %204, %.lr.ph
  %205 = phi %struct.CPUX86State* [ %17, %.lr.ph ], [ %206, %204 ]
  tail call void @tlb_fill(%struct.CPUX86State* %205, i32 %8, i32 %23, i32 1, i32 %mmu_idx, i8* null)
  %206 = load %struct.CPUX86State** @env, align 8
  %207 = getelementptr inbounds %struct.CPUX86State* %206, i64 0, i32 74, i64 %16, i64 %15, i32 1
  %208 = load i32* %207, align 4
  %209 = and i32 %208, -4088
  %210 = icmp eq i32 %20, %209
  br i1 %210, label %._crit_edge, label %204, !prof !0

slow_stq_mmu.exit:                                ; preds = %198, %185, %.preheader.i, %io_write_chkq_mmu.exit.i, %io_write_chkq_mmu.exit
  ret void
}

declare void @s2e_on_tlb_miss(%struct.S2E*, %struct.S2EExecutionState*, i64, i32)

declare i32 @cpu_x86_handle_mmu_fault(%struct.CPUX86State*, i32, i32, i32)

declare void @stq_phys(i64, i64)

declare %struct.TranslationBlock* @tb_find_pc(i64)

declare i32 @cpu_restore_state(%struct.TranslationBlock*, %struct.CPUX86State*, i64)

declare void @s2e_on_page_fault(%struct.S2E*, %struct.S2EExecutionState*, i64, i32)

define void @helper_vmrun(i32 %aflag, i32 %next_eip_addend) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 4294967296
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  tail call void @helper_vmexit(i32 128, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %12 = load i32* %11, align 4
  %13 = load i32* @loglevel, align 4
  %14 = and i32 %13, 2
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %19, label %16

; <label>:16                                      ; preds = %helper_svm_check_intercept_param.exit
  %17 = load %struct._IO_FILE** @logfile, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %17, i32 1, i8* getelementptr inbounds ([13 x i8]* @.str10, i64 0, i64 0), i32 %12) nounwind
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %19

; <label>:19                                      ; preds = %16, %helper_svm_check_intercept_param.exit
  %20 = phi %struct.CPUX86State* [ %1, %helper_svm_check_intercept_param.exit ], [ %.pre, %16 ]
  %21 = zext i32 %12 to i64
  %22 = getelementptr inbounds %struct.CPUX86State* %20, i64 0, i32 40
  store i64 %21, i64* %22, align 8
  %23 = load %struct.CPUX86State** @env, align 8
  %24 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 39
  %25 = load i64* %24, align 8
  %26 = add i64 %25, 1128
  %27 = getelementptr inbounds %struct.CPUX86State* %23, i64 0, i32 12, i32 1
  %28 = load i32* %27, align 4
  %29 = zext i32 %28 to i64
  tail call void @stq_phys(i64 %26, i64 %29) nounwind
  %30 = load %struct.CPUX86State** @env, align 8
  %31 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 39
  %32 = load i64* %31, align 8
  %33 = add i64 %32, 1124
  %34 = getelementptr inbounds %struct.CPUX86State* %30, i64 0, i32 12, i32 2
  %35 = load i32* %34, align 4
  tail call void @stl_phys(i64 %33, i32 %35) nounwind
  %36 = load %struct.CPUX86State** @env, align 8
  %37 = getelementptr inbounds %struct.CPUX86State* %36, i64 0, i32 39
  %38 = load i64* %37, align 8
  %39 = add i64 %38, 1160
  %40 = getelementptr inbounds %struct.CPUX86State* %36, i64 0, i32 13, i32 1
  %41 = load i32* %40, align 4
  %42 = zext i32 %41 to i64
  tail call void @stq_phys(i64 %39, i64 %42) nounwind
  %43 = load %struct.CPUX86State** @env, align 8
  %44 = getelementptr inbounds %struct.CPUX86State* %43, i64 0, i32 39
  %45 = load i64* %44, align 8
  %46 = add i64 %45, 1156
  %47 = getelementptr inbounds %struct.CPUX86State* %43, i64 0, i32 13, i32 2
  %48 = load i32* %47, align 4
  tail call void @stl_phys(i64 %46, i32 %48) nounwind
  %49 = load %struct.CPUX86State** @env, align 8
  %50 = getelementptr inbounds %struct.CPUX86State* %49, i64 0, i32 39
  %51 = load i64* %50, align 8
  %52 = add i64 %51, 1368
  %53 = getelementptr inbounds %struct.CPUX86State* %49, i64 0, i32 14, i64 0
  %54 = load i32* %53, align 4
  %55 = zext i32 %54 to i64
  tail call void @stq_phys(i64 %52, i64 %55) nounwind
  %56 = load %struct.CPUX86State** @env, align 8
  %57 = getelementptr inbounds %struct.CPUX86State* %56, i64 0, i32 39
  %58 = load i64* %57, align 8
  %59 = add i64 %58, 1600
  %60 = getelementptr inbounds %struct.CPUX86State* %56, i64 0, i32 14, i64 2
  %61 = load i32* %60, align 4
  %62 = zext i32 %61 to i64
  tail call void @stq_phys(i64 %59, i64 %62) nounwind
  %63 = load %struct.CPUX86State** @env, align 8
  %64 = getelementptr inbounds %struct.CPUX86State* %63, i64 0, i32 39
  %65 = load i64* %64, align 8
  %66 = add i64 %65, 1360
  %67 = getelementptr inbounds %struct.CPUX86State* %63, i64 0, i32 14, i64 3
  %68 = load i32* %67, align 4
  %69 = zext i32 %68 to i64
  tail call void @stq_phys(i64 %66, i64 %69) nounwind
  %70 = load %struct.CPUX86State** @env, align 8
  %71 = getelementptr inbounds %struct.CPUX86State* %70, i64 0, i32 39
  %72 = load i64* %71, align 8
  %73 = add i64 %72, 1352
  %74 = getelementptr inbounds %struct.CPUX86State* %70, i64 0, i32 14, i64 4
  %75 = load i32* %74, align 4
  %76 = zext i32 %75 to i64
  tail call void @stq_phys(i64 %73, i64 %76) nounwind
  %77 = load %struct.CPUX86State** @env, align 8
  %78 = getelementptr inbounds %struct.CPUX86State* %77, i64 0, i32 39
  %79 = load i64* %78, align 8
  %80 = add i64 %79, 1384
  %81 = getelementptr inbounds %struct.CPUX86State* %77, i64 0, i32 59, i64 6
  %82 = load i32* %81, align 4
  %83 = zext i32 %82 to i64
  tail call void @stq_phys(i64 %80, i64 %83) nounwind
  %84 = load %struct.CPUX86State** @env, align 8
  %85 = getelementptr inbounds %struct.CPUX86State* %84, i64 0, i32 39
  %86 = load i64* %85, align 8
  %87 = add i64 %86, 1376
  %88 = getelementptr inbounds %struct.CPUX86State* %84, i64 0, i32 59, i64 7
  %89 = load i32* %88, align 4
  %90 = zext i32 %89 to i64
  tail call void @stq_phys(i64 %87, i64 %90) nounwind
  %91 = load %struct.CPUX86State** @env, align 8
  %92 = getelementptr inbounds %struct.CPUX86State* %91, i64 0, i32 39
  %93 = load i64* %92, align 8
  %94 = add i64 %93, 1232
  %95 = getelementptr inbounds %struct.CPUX86State* %91, i64 0, i32 37
  %96 = load i64* %95, align 8
  tail call void @stq_phys(i64 %94, i64 %96) nounwind
  %97 = load %struct.CPUX86State** @env, align 8
  %98 = getelementptr inbounds %struct.CPUX86State* %97, i64 0, i32 39
  %99 = load i64* %98, align 8
  %100 = add i64 %99, 1392
  %101 = getelementptr inbounds %struct.CPUX86State* %97, i64 0, i32 6
  %102 = load i32* %101, align 4
  %103 = getelementptr inbounds %struct.CPUX86State* %97, i64 0, i32 3
  %104 = load i32* %103, align 4
  %105 = tail call i32 @helper_cc_compute_all(i32 %104) nounwind
  %106 = getelementptr inbounds %struct.CPUX86State* %97, i64 0, i32 5
  %107 = load i32* %106, align 4
  %108 = and i32 %107, 1024
  %109 = or i32 %105, %102
  %110 = or i32 %109, %108
  %111 = zext i32 %110 to i64
  tail call void @stq_phys(i64 %100, i64 %111) nounwind
  %112 = load %struct.CPUX86State** @env, align 8
  %113 = getelementptr inbounds %struct.CPUX86State* %112, i64 0, i32 39
  %114 = load i64* %113, align 8
  %115 = add i64 %114, 1024
  %116 = getelementptr inbounds %struct.CPUX86State* %112, i64 0, i32 9, i64 0, i32 0
  %117 = load i32* %116, align 4
  tail call void @stw_phys(i64 %115, i32 %117) nounwind
  %118 = add i64 %114, 1032
  %119 = getelementptr inbounds %struct.CPUX86State* %112, i64 0, i32 9, i64 0, i32 1
  %120 = load i32* %119, align 4
  %121 = zext i32 %120 to i64
  tail call void @stq_phys(i64 %118, i64 %121) nounwind
  %122 = add i64 %114, 1028
  %123 = getelementptr inbounds %struct.CPUX86State* %112, i64 0, i32 9, i64 0, i32 2
  %124 = load i32* %123, align 4
  tail call void @stl_phys(i64 %122, i32 %124) nounwind
  %125 = add i64 %114, 1026
  %126 = getelementptr inbounds %struct.CPUX86State* %112, i64 0, i32 9, i64 0, i32 3
  %127 = load i32* %126, align 4
  %128 = lshr i32 %127, 8
  %129 = and i32 %128, 255
  %130 = lshr i32 %127, 12
  %131 = and i32 %130, 3840
  %132 = or i32 %129, %131
  tail call void @stw_phys(i64 %125, i32 %132) nounwind
  %133 = load %struct.CPUX86State** @env, align 8
  %134 = getelementptr inbounds %struct.CPUX86State* %133, i64 0, i32 39
  %135 = load i64* %134, align 8
  %136 = add i64 %135, 1040
  %137 = getelementptr inbounds %struct.CPUX86State* %133, i64 0, i32 9, i64 1, i32 0
  %138 = load i32* %137, align 4
  tail call void @stw_phys(i64 %136, i32 %138) nounwind
  %139 = add i64 %135, 1048
  %140 = getelementptr inbounds %struct.CPUX86State* %133, i64 0, i32 9, i64 1, i32 1
  %141 = load i32* %140, align 4
  %142 = zext i32 %141 to i64
  tail call void @stq_phys(i64 %139, i64 %142) nounwind
  %143 = add i64 %135, 1044
  %144 = getelementptr inbounds %struct.CPUX86State* %133, i64 0, i32 9, i64 1, i32 2
  %145 = load i32* %144, align 4
  tail call void @stl_phys(i64 %143, i32 %145) nounwind
  %146 = add i64 %135, 1042
  %147 = getelementptr inbounds %struct.CPUX86State* %133, i64 0, i32 9, i64 1, i32 3
  %148 = load i32* %147, align 4
  %149 = lshr i32 %148, 8
  %150 = and i32 %149, 255
  %151 = lshr i32 %148, 12
  %152 = and i32 %151, 3840
  %153 = or i32 %150, %152
  tail call void @stw_phys(i64 %146, i32 %153) nounwind
  %154 = load %struct.CPUX86State** @env, align 8
  %155 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 39
  %156 = load i64* %155, align 8
  %157 = add i64 %156, 1056
  %158 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 2, i32 0
  %159 = load i32* %158, align 4
  tail call void @stw_phys(i64 %157, i32 %159) nounwind
  %160 = add i64 %156, 1064
  %161 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 2, i32 1
  %162 = load i32* %161, align 4
  %163 = zext i32 %162 to i64
  tail call void @stq_phys(i64 %160, i64 %163) nounwind
  %164 = add i64 %156, 1060
  %165 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 2, i32 2
  %166 = load i32* %165, align 4
  tail call void @stl_phys(i64 %164, i32 %166) nounwind
  %167 = add i64 %156, 1058
  %168 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 9, i64 2, i32 3
  %169 = load i32* %168, align 4
  %170 = lshr i32 %169, 8
  %171 = and i32 %170, 255
  %172 = lshr i32 %169, 12
  %173 = and i32 %172, 3840
  %174 = or i32 %171, %173
  tail call void @stw_phys(i64 %167, i32 %174) nounwind
  %175 = load %struct.CPUX86State** @env, align 8
  %176 = getelementptr inbounds %struct.CPUX86State* %175, i64 0, i32 39
  %177 = load i64* %176, align 8
  %178 = add i64 %177, 1072
  %179 = getelementptr inbounds %struct.CPUX86State* %175, i64 0, i32 9, i64 3, i32 0
  %180 = load i32* %179, align 4
  tail call void @stw_phys(i64 %178, i32 %180) nounwind
  %181 = add i64 %177, 1080
  %182 = getelementptr inbounds %struct.CPUX86State* %175, i64 0, i32 9, i64 3, i32 1
  %183 = load i32* %182, align 4
  %184 = zext i32 %183 to i64
  tail call void @stq_phys(i64 %181, i64 %184) nounwind
  %185 = add i64 %177, 1076
  %186 = getelementptr inbounds %struct.CPUX86State* %175, i64 0, i32 9, i64 3, i32 2
  %187 = load i32* %186, align 4
  tail call void @stl_phys(i64 %185, i32 %187) nounwind
  %188 = add i64 %177, 1074
  %189 = getelementptr inbounds %struct.CPUX86State* %175, i64 0, i32 9, i64 3, i32 3
  %190 = load i32* %189, align 4
  %191 = lshr i32 %190, 8
  %192 = and i32 %191, 255
  %193 = lshr i32 %190, 12
  %194 = and i32 %193, 3840
  %195 = or i32 %192, %194
  tail call void @stw_phys(i64 %188, i32 %195) nounwind
  %196 = load %struct.CPUX86State** @env, align 8
  %197 = getelementptr inbounds %struct.CPUX86State* %196, i64 0, i32 39
  %198 = load i64* %197, align 8
  %199 = add i64 %198, 1400
  %200 = getelementptr inbounds %struct.CPUX86State* %196, i64 0, i32 4
  %201 = load i32* %200, align 4
  %202 = add i32 %201, %next_eip_addend
  %203 = zext i32 %202 to i64
  tail call void @stq_phys(i64 %199, i64 %203) nounwind
  %204 = load %struct.CPUX86State** @env, align 8
  %205 = getelementptr inbounds %struct.CPUX86State* %204, i64 0, i32 39
  %206 = load i64* %205, align 8
  %207 = add i64 %206, 1496
  %208 = getelementptr inbounds %struct.CPUX86State* %204, i64 0, i32 0, i64 4
  %209 = load i32* %208, align 4
  %210 = zext i32 %209 to i64
  tail call void @stq_phys(i64 %207, i64 %210) nounwind
  %211 = load %struct.CPUX86State** @env, align 8
  %212 = getelementptr inbounds %struct.CPUX86State* %211, i64 0, i32 39
  %213 = load i64* %212, align 8
  %214 = add i64 %213, 1528
  %215 = getelementptr inbounds %struct.CPUX86State* %211, i64 0, i32 0, i64 0
  %216 = load i32* %215, align 4
  %217 = zext i32 %216 to i64
  tail call void @stq_phys(i64 %214, i64 %217) nounwind
  %218 = load %struct.CPUX86State** @env, align 8
  %219 = getelementptr inbounds %struct.CPUX86State* %218, i64 0, i32 40
  %220 = load i64* %219, align 8
  %221 = add i64 %220, 12
  %222 = tail call i64 @ldq_phys(i64 %221) nounwind
  %223 = load %struct.CPUX86State** @env, align 8
  %224 = getelementptr inbounds %struct.CPUX86State* %223, i64 0, i32 42
  store i64 %222, i64* %224, align 8
  %225 = load %struct.CPUX86State** @env, align 8
  %226 = getelementptr inbounds %struct.CPUX86State* %225, i64 0, i32 40
  %227 = load i64* %226, align 8
  %228 = tail call i32 @lduw_phys(i64 %227) nounwind
  %229 = trunc i32 %228 to i16
  %230 = load %struct.CPUX86State** @env, align 8
  %231 = getelementptr inbounds %struct.CPUX86State* %230, i64 0, i32 43
  store i16 %229, i16* %231, align 2
  %232 = load %struct.CPUX86State** @env, align 8
  %233 = getelementptr inbounds %struct.CPUX86State* %232, i64 0, i32 40
  %234 = load i64* %233, align 8
  %235 = add i64 %234, 2
  %236 = tail call i32 @lduw_phys(i64 %235) nounwind
  %237 = trunc i32 %236 to i16
  %238 = load %struct.CPUX86State** @env, align 8
  %239 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 44
  store i16 %237, i16* %239, align 2
  %240 = load %struct.CPUX86State** @env, align 8
  %241 = getelementptr inbounds %struct.CPUX86State* %240, i64 0, i32 40
  %242 = load i64* %241, align 8
  %243 = add i64 %242, 4
  %244 = tail call i32 @lduw_phys(i64 %243) nounwind
  %245 = trunc i32 %244 to i16
  %246 = load %struct.CPUX86State** @env, align 8
  %247 = getelementptr inbounds %struct.CPUX86State* %246, i64 0, i32 45
  store i16 %245, i16* %247, align 2
  %248 = load %struct.CPUX86State** @env, align 8
  %249 = getelementptr inbounds %struct.CPUX86State* %248, i64 0, i32 40
  %250 = load i64* %249, align 8
  %251 = add i64 %250, 6
  %252 = tail call i32 @lduw_phys(i64 %251) nounwind
  %253 = trunc i32 %252 to i16
  %254 = load %struct.CPUX86State** @env, align 8
  %255 = getelementptr inbounds %struct.CPUX86State* %254, i64 0, i32 46
  store i16 %253, i16* %255, align 2
  %256 = load %struct.CPUX86State** @env, align 8
  %257 = getelementptr inbounds %struct.CPUX86State* %256, i64 0, i32 40
  %258 = load i64* %257, align 8
  %259 = add i64 %258, 8
  %260 = tail call i32 @ldl_phys(i64 %259) nounwind
  %261 = load %struct.CPUX86State** @env, align 8
  %262 = getelementptr inbounds %struct.CPUX86State* %261, i64 0, i32 47
  store i32 %260, i32* %262, align 4
  %263 = load %struct.CPUX86State** @env, align 8
  %264 = getelementptr inbounds %struct.CPUX86State* %263, i64 0, i32 7
  %265 = load i32* %264, align 4
  %266 = or i32 %265, 2097152
  store i32 %266, i32* %264, align 4
  %267 = load %struct.CPUX86State** @env, align 8
  %268 = getelementptr inbounds %struct.CPUX86State* %267, i64 0, i32 40
  %269 = load i64* %268, align 8
  %270 = add i64 %269, 80
  %271 = tail call i64 @ldq_phys(i64 %270) nounwind
  %272 = load %struct.CPUX86State** @env, align 8
  %273 = getelementptr inbounds %struct.CPUX86State* %272, i64 0, i32 41
  store i64 %271, i64* %273, align 8
  %274 = load %struct.CPUX86State** @env, align 8
  %275 = getelementptr inbounds %struct.CPUX86State* %274, i64 0, i32 40
  %276 = load i64* %275, align 8
  %277 = add i64 %276, 1128
  %278 = tail call i64 @ldq_phys(i64 %277) nounwind
  %279 = trunc i64 %278 to i32
  %280 = load %struct.CPUX86State** @env, align 8
  %281 = getelementptr inbounds %struct.CPUX86State* %280, i64 0, i32 12, i32 1
  store i32 %279, i32* %281, align 4
  %282 = load %struct.CPUX86State** @env, align 8
  %283 = getelementptr inbounds %struct.CPUX86State* %282, i64 0, i32 40
  %284 = load i64* %283, align 8
  %285 = add i64 %284, 1124
  %286 = tail call i32 @ldl_phys(i64 %285) nounwind
  %287 = load %struct.CPUX86State** @env, align 8
  %288 = getelementptr inbounds %struct.CPUX86State* %287, i64 0, i32 12, i32 2
  store i32 %286, i32* %288, align 4
  %289 = load %struct.CPUX86State** @env, align 8
  %290 = getelementptr inbounds %struct.CPUX86State* %289, i64 0, i32 40
  %291 = load i64* %290, align 8
  %292 = add i64 %291, 1160
  %293 = tail call i64 @ldq_phys(i64 %292) nounwind
  %294 = trunc i64 %293 to i32
  %295 = load %struct.CPUX86State** @env, align 8
  %296 = getelementptr inbounds %struct.CPUX86State* %295, i64 0, i32 13, i32 1
  store i32 %294, i32* %296, align 4
  %297 = load %struct.CPUX86State** @env, align 8
  %298 = getelementptr inbounds %struct.CPUX86State* %297, i64 0, i32 40
  %299 = load i64* %298, align 8
  %300 = add i64 %299, 1156
  %301 = tail call i32 @ldl_phys(i64 %300) nounwind
  %302 = load %struct.CPUX86State** @env, align 8
  %303 = getelementptr inbounds %struct.CPUX86State* %302, i64 0, i32 13, i32 2
  store i32 %301, i32* %303, align 4
  %304 = load %struct.CPUX86State** @env, align 8
  %305 = getelementptr inbounds %struct.CPUX86State* %304, i64 0, i32 40
  %306 = load i64* %305, align 8
  %307 = add i64 %306, 128
  tail call void @stq_phys(i64 %307, i64 0) nounwind
  %308 = load %struct.CPUX86State** @env, align 8
  %309 = getelementptr inbounds %struct.CPUX86State* %308, i64 0, i32 40
  %310 = load i64* %309, align 8
  %311 = add i64 %310, 1368
  %312 = tail call i64 @ldq_phys(i64 %311) nounwind
  %313 = trunc i64 %312 to i32
  tail call void @cpu_x86_update_cr0(%struct.CPUX86State* %308, i32 %313) nounwind
  %314 = load %struct.CPUX86State** @env, align 8
  %315 = getelementptr inbounds %struct.CPUX86State* %314, i64 0, i32 40
  %316 = load i64* %315, align 8
  %317 = add i64 %316, 1352
  %318 = tail call i64 @ldq_phys(i64 %317) nounwind
  %319 = trunc i64 %318 to i32
  tail call void @cpu_x86_update_cr4(%struct.CPUX86State* %314, i32 %319) nounwind
  %320 = load %struct.CPUX86State** @env, align 8
  %321 = getelementptr inbounds %struct.CPUX86State* %320, i64 0, i32 40
  %322 = load i64* %321, align 8
  %323 = add i64 %322, 1360
  %324 = tail call i64 @ldq_phys(i64 %323) nounwind
  %325 = trunc i64 %324 to i32
  tail call void @cpu_x86_update_cr3(%struct.CPUX86State* %320, i32 %325) nounwind
  %326 = load %struct.CPUX86State** @env, align 8
  %327 = getelementptr inbounds %struct.CPUX86State* %326, i64 0, i32 40
  %328 = load i64* %327, align 8
  %329 = add i64 %328, 1600
  %330 = tail call i64 @ldq_phys(i64 %329) nounwind
  %331 = trunc i64 %330 to i32
  %332 = load %struct.CPUX86State** @env, align 8
  %333 = getelementptr inbounds %struct.CPUX86State* %332, i64 0, i32 14, i64 2
  store i32 %331, i32* %333, align 4
  %334 = load %struct.CPUX86State** @env, align 8
  %335 = getelementptr inbounds %struct.CPUX86State* %334, i64 0, i32 40
  %336 = load i64* %335, align 8
  %337 = add i64 %336, 96
  %338 = tail call i32 @ldl_phys(i64 %337) nounwind
  %339 = load %struct.CPUX86State** @env, align 8
  %340 = getelementptr inbounds %struct.CPUX86State* %339, i64 0, i32 8
  %341 = load i32* %340, align 4
  %342 = and i32 %341, -11
  store i32 %342, i32* %340, align 4
  %343 = and i32 %338, 16777216
  %344 = icmp eq i32 %343, 0
  br i1 %344, label %._crit_edge11, label %345

; <label>:345                                     ; preds = %19
  %.tr = trunc i32 %338 to i8
  %346 = and i8 %.tr, 15
  %347 = load %struct.CPUX86State** @env, align 8
  %348 = getelementptr inbounds %struct.CPUX86State* %347, i64 0, i32 48
  store i8 %346, i8* %348, align 1
  %349 = load %struct.CPUX86State** @env, align 8
  %350 = getelementptr inbounds %struct.CPUX86State* %349, i64 0, i32 8
  %351 = load i32* %350, align 4
  %352 = or i32 %351, 8
  store i32 %352, i32* %350, align 4
  %353 = load %struct.CPUX86State** @env, align 8
  %354 = getelementptr inbounds %struct.CPUX86State* %353, i64 0, i32 6
  %355 = load i32* %354, align 4
  %356 = and i32 %355, 512
  %357 = icmp eq i32 %356, 0
  br i1 %357, label %._crit_edge11, label %358

; <label>:358                                     ; preds = %345
  %359 = getelementptr inbounds %struct.CPUX86State* %353, i64 0, i32 8
  %360 = load i32* %359, align 4
  %361 = or i32 %360, 2
  store i32 %361, i32* %359, align 4
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %358, %345, %19
  %362 = load %struct.CPUX86State** @env, align 8
  %363 = getelementptr inbounds %struct.CPUX86State* %362, i64 0, i32 40
  %364 = load i64* %363, align 8
  %365 = add i64 %364, 1232
  %366 = tail call i64 @ldq_phys(i64 %365) nounwind
  %367 = getelementptr inbounds %struct.CPUX86State* %362, i64 0, i32 37
  store i64 %366, i64* %367, align 8
  %368 = getelementptr inbounds %struct.CPUX86State* %362, i64 0, i32 7
  %369 = load i32* %368, align 4
  %370 = and i32 %369, -1064961
  %371 = and i64 %366, 1024
  %372 = icmp eq i64 %371, 0
  %373 = or i32 %370, 16384
  %storemerge.i = select i1 %372, i32 %370, i32 %373
  %374 = and i64 %366, 4096
  %375 = or i32 %storemerge.i, 1048576
  %376 = icmp eq i64 %374, 0
  %storemerge..i = select i1 %376, i32 %storemerge.i, i32 %375
  store i32 %storemerge..i, i32* %368, align 4
  %377 = load %struct.CPUX86State** @env, align 8
  %378 = getelementptr inbounds %struct.CPUX86State* %377, i64 0, i32 6
  store i32 0, i32* %378, align 4
  %379 = load %struct.CPUX86State** @env, align 8
  %380 = getelementptr inbounds %struct.CPUX86State* %379, i64 0, i32 40
  %381 = load i64* %380, align 8
  %382 = add i64 %381, 1392
  %383 = tail call i64 @ldq_phys(i64 %382) nounwind
  %384 = trunc i64 %383 to i32
  %385 = and i32 %384, 2261
  %386 = load %struct.CPUX86State** @env, align 8
  %387 = getelementptr inbounds %struct.CPUX86State* %386, i64 0, i32 1
  store i32 %385, i32* %387, align 4
  %388 = lshr i32 %384, 9
  %389 = and i32 %388, 2
  %390 = xor i32 %389, 2
  %391 = add i32 %390, -1
  %392 = load %struct.CPUX86State** @env, align 8
  %393 = getelementptr inbounds %struct.CPUX86State* %392, i64 0, i32 5
  store i32 %391, i32* %393, align 4
  %394 = load %struct.CPUX86State** @env, align 8
  %395 = getelementptr inbounds %struct.CPUX86State* %394, i64 0, i32 6
  %396 = load i32* %395, align 4
  %397 = and i32 %396, 3285
  %398 = and i32 %384, -3286
  %399 = or i32 %397, %398
  store i32 %399, i32* %395, align 4
  %400 = load %struct.CPUX86State** @env, align 8
  %401 = getelementptr inbounds %struct.CPUX86State* %400, i64 0, i32 3
  store i32 1, i32* %401, align 4
  %402 = load %struct.CPUX86State** @env, align 8
  %403 = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 40
  %404 = load i64* %403, align 8
  %405 = add i64 %404, 1024
  %406 = tail call i32 @lduw_phys(i64 %405) nounwind
  %407 = add i64 %404, 1032
  %408 = tail call i64 @ldq_phys(i64 %407) nounwind
  %409 = trunc i64 %408 to i32
  %410 = add i64 %404, 1028
  %411 = tail call i32 @ldl_phys(i64 %410) nounwind
  %412 = add i64 %404, 1026
  %413 = tail call i32 @lduw_phys(i64 %412) nounwind
  %414 = shl i32 %413, 8
  %415 = and i32 %414, 65280
  %416 = shl i32 %413, 12
  %417 = and i32 %416, 15728640
  %418 = or i32 %415, %417
  %419 = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 9, i64 0, i32 0
  store i32 %406, i32* %419, align 4
  %420 = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 9, i64 0, i32 1
  store i32 %409, i32* %420, align 4
  %421 = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 9, i64 0, i32 2
  store i32 %411, i32* %421, align 4
  %422 = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 9, i64 0, i32 3
  store i32 %418, i32* %422, align 4
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 7
  %.pre.i.i = load i32* %.phi.trans.insert.i.i, align 4
  %423 = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 9, i64 2, i32 3
  %424 = load i32* %423, align 4
  %425 = lshr i32 %424, 17
  %426 = and i32 %425, 32
  %427 = and i32 %.pre.i.i, 32768
  %428 = icmp eq i32 %427, 0
  br i1 %428, label %429, label %455

; <label>:429                                     ; preds = %._crit_edge11
  %430 = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 14, i64 0
  %431 = load i32* %430, align 4
  %432 = and i32 %431, 1
  %433 = icmp eq i32 %432, 0
  br i1 %433, label %442, label %434

; <label>:434                                     ; preds = %429
  %435 = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 6
  %436 = load i32* %435, align 4
  %437 = and i32 %436, 131072
  %438 = icmp eq i32 %437, 0
  br i1 %438, label %439, label %442

; <label>:439                                     ; preds = %434
  %440 = and i32 %.pre.i.i, 16
  %441 = icmp eq i32 %440, 0
  br i1 %441, label %442, label %444

; <label>:442                                     ; preds = %439, %434, %429
  %443 = or i32 %426, 64
  br label %455

; <label>:444                                     ; preds = %439
  %445 = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 9, i64 3, i32 1
  %446 = load i32* %445, align 4
  %447 = getelementptr inbounds %struct.CPUX86State* %402, i64 0, i32 9, i64 2, i32 1
  %448 = load i32* %447, align 4
  %449 = or i32 %446, %409
  %450 = or i32 %449, %448
  %451 = icmp ne i32 %450, 0
  %452 = zext i1 %451 to i32
  %453 = shl nuw nsw i32 %452, 6
  %454 = or i32 %453, %426
  br label %455

; <label>:455                                     ; preds = %444, %442, %._crit_edge11
  %new_hflags.0.i.i = phi i32 [ %426, %._crit_edge11 ], [ %443, %442 ], [ %454, %444 ]
  %456 = and i32 %.pre.i.i, -97
  %457 = or i32 %new_hflags.0.i.i, %456
  store i32 %457, i32* %.phi.trans.insert.i.i, align 4
  %458 = load %struct.CPUX86State** @env, align 8
  %459 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 40
  %460 = load i64* %459, align 8
  %461 = add i64 %460, 1040
  %462 = tail call i32 @lduw_phys(i64 %461) nounwind
  %463 = add i64 %460, 1048
  %464 = tail call i64 @ldq_phys(i64 %463) nounwind
  %465 = trunc i64 %464 to i32
  %466 = add i64 %460, 1044
  %467 = tail call i32 @ldl_phys(i64 %466) nounwind
  %468 = add i64 %460, 1042
  %469 = tail call i32 @lduw_phys(i64 %468) nounwind
  %470 = shl i32 %469, 8
  %471 = and i32 %470, 65280
  %472 = shl i32 %469, 12
  %473 = and i32 %472, 15728640
  %474 = or i32 %471, %473
  %475 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 9, i64 1, i32 0
  store i32 %462, i32* %475, align 4
  %476 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 9, i64 1, i32 1
  store i32 %465, i32* %476, align 4
  %477 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 9, i64 1, i32 2
  store i32 %467, i32* %477, align 4
  %478 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 9, i64 1, i32 3
  store i32 %474, i32* %478, align 4
  %479 = lshr exact i32 %473, 18
  %480 = and i32 %479, 16
  %481 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 7
  %482 = load i32* %481, align 4
  %483 = and i32 %482, -32785
  %484 = or i32 %480, %483
  store i32 %484, i32* %481, align 4
  %485 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 9, i64 2, i32 3
  %486 = load i32* %485, align 4
  %487 = lshr i32 %486, 17
  %488 = and i32 %487, 32
  %489 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 14, i64 0
  %490 = load i32* %489, align 4
  %491 = and i32 %490, 1
  %492 = icmp eq i32 %491, 0
  br i1 %492, label %499, label %493

; <label>:493                                     ; preds = %455
  %494 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 6
  %495 = load i32* %494, align 4
  %496 = and i32 %495, 131072
  %497 = icmp ne i32 %496, 0
  %498 = icmp eq i32 %480, 0
  %or.cond = or i1 %497, %498
  br i1 %or.cond, label %499, label %501

; <label>:499                                     ; preds = %493, %455
  %500 = or i32 %488, 64
  br label %514

; <label>:501                                     ; preds = %493
  %502 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 9, i64 3, i32 1
  %503 = load i32* %502, align 4
  %504 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 9, i64 0, i32 1
  %505 = load i32* %504, align 4
  %506 = getelementptr inbounds %struct.CPUX86State* %458, i64 0, i32 9, i64 2, i32 1
  %507 = load i32* %506, align 4
  %508 = or i32 %505, %503
  %509 = or i32 %508, %507
  %510 = icmp ne i32 %509, 0
  %511 = zext i1 %510 to i32
  %512 = shl nuw nsw i32 %511, 6
  %513 = or i32 %512, %488
  br label %514

; <label>:514                                     ; preds = %501, %499
  %new_hflags.0.i.i1 = phi i32 [ %500, %499 ], [ %513, %501 ]
  %515 = and i32 %484, -32865
  %516 = or i32 %new_hflags.0.i.i1, %515
  store i32 %516, i32* %481, align 4
  %517 = load %struct.CPUX86State** @env, align 8
  %518 = getelementptr inbounds %struct.CPUX86State* %517, i64 0, i32 40
  %519 = load i64* %518, align 8
  %520 = add i64 %519, 1056
  %521 = tail call i32 @lduw_phys(i64 %520) nounwind
  %522 = add i64 %519, 1064
  %523 = tail call i64 @ldq_phys(i64 %522) nounwind
  %524 = trunc i64 %523 to i32
  %525 = add i64 %519, 1060
  %526 = tail call i32 @ldl_phys(i64 %525) nounwind
  %527 = add i64 %519, 1058
  %528 = tail call i32 @lduw_phys(i64 %527) nounwind
  %529 = shl i32 %528, 8
  %530 = and i32 %529, 65280
  %531 = shl i32 %528, 12
  %532 = and i32 %531, 15728640
  %533 = or i32 %530, %532
  %534 = getelementptr inbounds %struct.CPUX86State* %517, i64 0, i32 9, i64 2, i32 0
  store i32 %521, i32* %534, align 4
  %535 = getelementptr inbounds %struct.CPUX86State* %517, i64 0, i32 9, i64 2, i32 1
  store i32 %524, i32* %535, align 4
  %536 = getelementptr inbounds %struct.CPUX86State* %517, i64 0, i32 9, i64 2, i32 2
  store i32 %526, i32* %536, align 4
  %537 = getelementptr inbounds %struct.CPUX86State* %517, i64 0, i32 9, i64 2, i32 3
  store i32 %533, i32* %537, align 4
  %.phi.trans.insert.i.i3 = getelementptr inbounds %struct.CPUX86State* %517, i64 0, i32 7
  %.pre.i.i4 = load i32* %.phi.trans.insert.i.i3, align 4
  %538 = lshr exact i32 %532, 17
  %539 = and i32 %538, 32
  %540 = and i32 %.pre.i.i4, 32768
  %541 = icmp eq i32 %540, 0
  br i1 %541, label %542, label %568

; <label>:542                                     ; preds = %514
  %543 = getelementptr inbounds %struct.CPUX86State* %517, i64 0, i32 14, i64 0
  %544 = load i32* %543, align 4
  %545 = and i32 %544, 1
  %546 = icmp eq i32 %545, 0
  br i1 %546, label %555, label %547

; <label>:547                                     ; preds = %542
  %548 = getelementptr inbounds %struct.CPUX86State* %517, i64 0, i32 6
  %549 = load i32* %548, align 4
  %550 = and i32 %549, 131072
  %551 = icmp eq i32 %550, 0
  br i1 %551, label %552, label %555

; <label>:552                                     ; preds = %547
  %553 = and i32 %.pre.i.i4, 16
  %554 = icmp eq i32 %553, 0
  br i1 %554, label %555, label %557

; <label>:555                                     ; preds = %552, %547, %542
  %556 = or i32 %539, 64
  br label %568

; <label>:557                                     ; preds = %552
  %558 = getelementptr inbounds %struct.CPUX86State* %517, i64 0, i32 9, i64 3, i32 1
  %559 = load i32* %558, align 4
  %560 = getelementptr inbounds %struct.CPUX86State* %517, i64 0, i32 9, i64 0, i32 1
  %561 = load i32* %560, align 4
  %562 = or i32 %559, %524
  %563 = or i32 %562, %561
  %564 = icmp ne i32 %563, 0
  %565 = zext i1 %564 to i32
  %566 = shl nuw nsw i32 %565, 6
  %567 = or i32 %566, %539
  br label %568

; <label>:568                                     ; preds = %557, %555, %514
  %new_hflags.0.i.i5 = phi i32 [ %539, %514 ], [ %556, %555 ], [ %567, %557 ]
  %569 = and i32 %.pre.i.i4, -97
  %570 = or i32 %new_hflags.0.i.i5, %569
  store i32 %570, i32* %.phi.trans.insert.i.i3, align 4
  %571 = load %struct.CPUX86State** @env, align 8
  %572 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 40
  %573 = load i64* %572, align 8
  %574 = add i64 %573, 1072
  %575 = tail call i32 @lduw_phys(i64 %574) nounwind
  %576 = add i64 %573, 1080
  %577 = tail call i64 @ldq_phys(i64 %576) nounwind
  %578 = trunc i64 %577 to i32
  %579 = add i64 %573, 1076
  %580 = tail call i32 @ldl_phys(i64 %579) nounwind
  %581 = add i64 %573, 1074
  %582 = tail call i32 @lduw_phys(i64 %581) nounwind
  %583 = shl i32 %582, 8
  %584 = and i32 %583, 65280
  %585 = shl i32 %582, 12
  %586 = and i32 %585, 15728640
  %587 = or i32 %584, %586
  %588 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 9, i64 3, i32 0
  store i32 %575, i32* %588, align 4
  %589 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 9, i64 3, i32 1
  store i32 %578, i32* %589, align 4
  %590 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 9, i64 3, i32 2
  store i32 %580, i32* %590, align 4
  %591 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 9, i64 3, i32 3
  store i32 %587, i32* %591, align 4
  %.phi.trans.insert.i.i7 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 7
  %.pre.i.i8 = load i32* %.phi.trans.insert.i.i7, align 4
  %592 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 9, i64 2, i32 3
  %593 = load i32* %592, align 4
  %594 = lshr i32 %593, 17
  %595 = and i32 %594, 32
  %596 = and i32 %.pre.i.i8, 32768
  %597 = icmp eq i32 %596, 0
  br i1 %597, label %598, label %svm_load_seg_cache.exit10

; <label>:598                                     ; preds = %568
  %599 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 14, i64 0
  %600 = load i32* %599, align 4
  %601 = and i32 %600, 1
  %602 = icmp eq i32 %601, 0
  br i1 %602, label %611, label %603

; <label>:603                                     ; preds = %598
  %604 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 6
  %605 = load i32* %604, align 4
  %606 = and i32 %605, 131072
  %607 = icmp eq i32 %606, 0
  br i1 %607, label %608, label %611

; <label>:608                                     ; preds = %603
  %609 = and i32 %.pre.i.i8, 16
  %610 = icmp eq i32 %609, 0
  br i1 %610, label %611, label %613

; <label>:611                                     ; preds = %608, %603, %598
  %612 = or i32 %595, 64
  br label %svm_load_seg_cache.exit10

; <label>:613                                     ; preds = %608
  %614 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 9, i64 0, i32 1
  %615 = load i32* %614, align 4
  %616 = getelementptr inbounds %struct.CPUX86State* %571, i64 0, i32 9, i64 2, i32 1
  %617 = load i32* %616, align 4
  %618 = or i32 %615, %578
  %619 = or i32 %618, %617
  %620 = icmp ne i32 %619, 0
  %621 = zext i1 %620 to i32
  %622 = shl nuw nsw i32 %621, 6
  %623 = or i32 %622, %595
  br label %svm_load_seg_cache.exit10

svm_load_seg_cache.exit10:                        ; preds = %613, %611, %568
  %new_hflags.0.i.i9 = phi i32 [ %595, %568 ], [ %612, %611 ], [ %623, %613 ]
  %624 = and i32 %.pre.i.i8, -97
  %625 = or i32 %new_hflags.0.i.i9, %624
  store i32 %625, i32* %.phi.trans.insert.i.i7, align 4
  %626 = load %struct.CPUX86State** @env, align 8
  %627 = getelementptr inbounds %struct.CPUX86State* %626, i64 0, i32 40
  %628 = load i64* %627, align 8
  %629 = add i64 %628, 1400
  %630 = tail call i64 @ldq_phys(i64 %629) nounwind
  %631 = trunc i64 %630 to i32
  %632 = load %struct.CPUX86State** @env, align 8
  %633 = getelementptr inbounds %struct.CPUX86State* %632, i64 0, i32 4
  store i32 %631, i32* %633, align 4
  %634 = load %struct.CPUX86State** @env, align 8
  %635 = getelementptr inbounds %struct.CPUX86State* %634, i64 0, i32 40
  %636 = load i64* %635, align 8
  %637 = add i64 %636, 1496
  %638 = tail call i64 @ldq_phys(i64 %637) nounwind
  %639 = trunc i64 %638 to i32
  %640 = load %struct.CPUX86State** @env, align 8
  %641 = getelementptr inbounds %struct.CPUX86State* %640, i64 0, i32 0, i64 4
  store i32 %639, i32* %641, align 4
  %642 = load %struct.CPUX86State** @env, align 8
  %643 = getelementptr inbounds %struct.CPUX86State* %642, i64 0, i32 40
  %644 = load i64* %643, align 8
  %645 = add i64 %644, 1528
  %646 = tail call i64 @ldq_phys(i64 %645) nounwind
  %647 = trunc i64 %646 to i32
  %648 = load %struct.CPUX86State** @env, align 8
  %649 = getelementptr inbounds %struct.CPUX86State* %648, i64 0, i32 0, i64 0
  store i32 %647, i32* %649, align 4
  %650 = load %struct.CPUX86State** @env, align 8
  %651 = getelementptr inbounds %struct.CPUX86State* %650, i64 0, i32 40
  %652 = load i64* %651, align 8
  %653 = add i64 %652, 1376
  %654 = tail call i64 @ldq_phys(i64 %653) nounwind
  %655 = trunc i64 %654 to i32
  %656 = load %struct.CPUX86State** @env, align 8
  %657 = getelementptr inbounds %struct.CPUX86State* %656, i64 0, i32 59, i64 7
  store i32 %655, i32* %657, align 4
  %658 = load %struct.CPUX86State** @env, align 8
  %659 = getelementptr inbounds %struct.CPUX86State* %658, i64 0, i32 40
  %660 = load i64* %659, align 8
  %661 = add i64 %660, 1384
  %662 = tail call i64 @ldq_phys(i64 %661) nounwind
  %663 = trunc i64 %662 to i32
  %664 = load %struct.CPUX86State** @env, align 8
  %665 = getelementptr inbounds %struct.CPUX86State* %664, i64 0, i32 59, i64 6
  store i32 %663, i32* %665, align 4
  %666 = load %struct.CPUX86State** @env, align 8
  %667 = getelementptr inbounds %struct.CPUX86State* %666, i64 0, i32 40
  %668 = load i64* %667, align 8
  %669 = add i64 %668, 1227
  %670 = tail call i32 @ldub_phys(i64 %669) nounwind
  %671 = getelementptr inbounds %struct.CPUX86State* %666, i64 0, i32 7
  %672 = load i32* %671, align 4
  %673 = and i32 %672, 3
  tail call void @s2e_on_privilege_change(i32 %673, i32 %670) nounwind
  %674 = load i32* %671, align 4
  %675 = and i32 %674, -4
  %676 = or i32 %675, %670
  store i32 %676, i32* %671, align 4
  %677 = load %struct.CPUX86State** @env, align 8
  %678 = getelementptr inbounds %struct.CPUX86State* %677, i64 0, i32 40
  %679 = load i64* %678, align 8
  %680 = add i64 %679, 92
  %681 = tail call i32 @ldub_phys(i64 %680) nounwind
  %cond = icmp eq i32 %681, 1
  br i1 %cond, label %682, label %684

; <label>:682                                     ; preds = %svm_load_seg_cache.exit10
  %683 = load %struct.CPUX86State** @env, align 8
  tail call void @tlb_flush(%struct.CPUX86State* %683, i32 1) nounwind
  br label %684

; <label>:684                                     ; preds = %682, %svm_load_seg_cache.exit10
  %685 = load %struct.CPUX86State** @env, align 8
  %686 = getelementptr inbounds %struct.CPUX86State* %685, i64 0, i32 8
  %687 = load i32* %686, align 4
  %688 = or i32 %687, 1
  store i32 %688, i32* %686, align 4
  %689 = and i32 %338, 256
  %690 = icmp eq i32 %689, 0
  br i1 %690, label %696, label %691

; <label>:691                                     ; preds = %684
  %692 = load %struct.CPUX86State** @env, align 8
  %693 = getelementptr inbounds %struct.CPUX86State* %692, i64 0, i32 72
  %694 = load i32* %693, align 4
  %695 = or i32 %694, 256
  store i32 %695, i32* %693, align 4
  br label %696

; <label>:696                                     ; preds = %691, %684
  %697 = load %struct.CPUX86State** @env, align 8
  %698 = getelementptr inbounds %struct.CPUX86State* %697, i64 0, i32 40
  %699 = load i64* %698, align 8
  %700 = add i64 %699, 168
  %701 = tail call i32 @ldl_phys(i64 %700) nounwind
  %702 = icmp slt i32 %701, 0
  br i1 %702, label %703, label %803

; <label>:703                                     ; preds = %696
  %704 = load %struct.CPUX86State** @env, align 8
  %705 = getelementptr inbounds %struct.CPUX86State* %704, i64 0, i32 40
  %706 = load i64* %705, align 8
  %707 = add i64 %706, 172
  %708 = tail call i32 @ldl_phys(i64 %707) nounwind
  %709 = load i32* @loglevel, align 4
  %710 = and i32 %709, 2
  %711 = icmp eq i32 %710, 0
  br i1 %711, label %716, label %712

; <label>:712                                     ; preds = %703
  %713 = and i32 %701, 2048
  %714 = load %struct._IO_FILE** @logfile, align 8
  %715 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %714, i32 1, i8* getelementptr inbounds ([18 x i8]* @.str11, i64 0, i64 0), i32 %713) nounwind
  br label %716

; <label>:716                                     ; preds = %712, %703
  %717 = and i32 %701, 1792
  switch i32 %717, label %._crit_edge [
    i32 0, label %718
    i32 512, label %735
    i32 768, label %754
    i32 1024, label %772
  ]

; <label>:718                                     ; preds = %716
  %719 = and i32 %701, 255
  %720 = load %struct.CPUX86State** @env, align 8
  %721 = getelementptr inbounds %struct.CPUX86State* %720, i64 0, i32 93
  store i32 %719, i32* %721, align 4
  %722 = load %struct.CPUX86State** @env, align 8
  %723 = getelementptr inbounds %struct.CPUX86State* %722, i64 0, i32 56
  store i32 %708, i32* %723, align 4
  %724 = load %struct.CPUX86State** @env, align 8
  %725 = getelementptr inbounds %struct.CPUX86State* %724, i64 0, i32 57
  store i32 0, i32* %725, align 4
  %726 = load %struct.CPUX86State** @env, align 8
  %727 = getelementptr inbounds %struct.CPUX86State* %726, i64 0, i32 58
  store i32 -1, i32* %727, align 4
  %728 = load i32* @loglevel, align 4
  %729 = and i32 %728, 2
  %730 = icmp eq i32 %729, 0
  br i1 %730, label %734, label %731

; <label>:731                                     ; preds = %718
  %732 = load %struct._IO_FILE** @logfile, align 8
  %733 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %732, i32 1, i8* getelementptr inbounds ([5 x i8]* @.str12, i64 0, i64 0)) nounwind
  br label %734

; <label>:734                                     ; preds = %731, %718
  tail call void @do_interrupt_all(i32 %719, i32 0, i32 0, i32 0, i32 1) nounwind
  br label %._crit_edge

; <label>:735                                     ; preds = %716
  %736 = load %struct.CPUX86State** @env, align 8
  %737 = getelementptr inbounds %struct.CPUX86State* %736, i64 0, i32 93
  store i32 2, i32* %737, align 4
  %738 = load %struct.CPUX86State** @env, align 8
  %739 = getelementptr inbounds %struct.CPUX86State* %738, i64 0, i32 56
  store i32 %708, i32* %739, align 4
  %740 = load %struct.CPUX86State** @env, align 8
  %741 = getelementptr inbounds %struct.CPUX86State* %740, i64 0, i32 57
  store i32 0, i32* %741, align 4
  %742 = load %struct.CPUX86State** @env, align 8
  %743 = getelementptr inbounds %struct.CPUX86State* %742, i64 0, i32 4
  %744 = load i32* %743, align 4
  %745 = getelementptr inbounds %struct.CPUX86State* %742, i64 0, i32 58
  store i32 %744, i32* %745, align 4
  %746 = load i32* @loglevel, align 4
  %747 = and i32 %746, 2
  %748 = icmp eq i32 %747, 0
  br i1 %748, label %752, label %749

; <label>:749                                     ; preds = %735
  %750 = load %struct._IO_FILE** @logfile, align 8
  %751 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %750, i32 1, i8* getelementptr inbounds ([4 x i8]* @.str13, i64 0, i64 0)) nounwind
  br label %752

; <label>:752                                     ; preds = %749, %735
  %753 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_loop_exit(%struct.CPUX86State* %753) noreturn nounwind
  unreachable

; <label>:754                                     ; preds = %716
  %755 = and i32 %701, 255
  %756 = load %struct.CPUX86State** @env, align 8
  %757 = getelementptr inbounds %struct.CPUX86State* %756, i64 0, i32 93
  store i32 %755, i32* %757, align 4
  %758 = load %struct.CPUX86State** @env, align 8
  %759 = getelementptr inbounds %struct.CPUX86State* %758, i64 0, i32 56
  store i32 %708, i32* %759, align 4
  %760 = load %struct.CPUX86State** @env, align 8
  %761 = getelementptr inbounds %struct.CPUX86State* %760, i64 0, i32 57
  store i32 0, i32* %761, align 4
  %762 = load %struct.CPUX86State** @env, align 8
  %763 = getelementptr inbounds %struct.CPUX86State* %762, i64 0, i32 58
  store i32 -1, i32* %763, align 4
  %764 = load i32* @loglevel, align 4
  %765 = and i32 %764, 2
  %766 = icmp eq i32 %765, 0
  br i1 %766, label %770, label %767

; <label>:767                                     ; preds = %754
  %768 = load %struct._IO_FILE** @logfile, align 8
  %769 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %768, i32 1, i8* getelementptr inbounds ([6 x i8]* @.str14, i64 0, i64 0)) nounwind
  br label %770

; <label>:770                                     ; preds = %767, %754
  %771 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_loop_exit(%struct.CPUX86State* %771) noreturn nounwind
  unreachable

; <label>:772                                     ; preds = %716
  %773 = and i32 %701, 255
  %774 = load %struct.CPUX86State** @env, align 8
  %775 = getelementptr inbounds %struct.CPUX86State* %774, i64 0, i32 93
  store i32 %773, i32* %775, align 4
  %776 = load %struct.CPUX86State** @env, align 8
  %777 = getelementptr inbounds %struct.CPUX86State* %776, i64 0, i32 56
  store i32 %708, i32* %777, align 4
  %778 = load %struct.CPUX86State** @env, align 8
  %779 = getelementptr inbounds %struct.CPUX86State* %778, i64 0, i32 57
  store i32 1, i32* %779, align 4
  %780 = load %struct.CPUX86State** @env, align 8
  %781 = getelementptr inbounds %struct.CPUX86State* %780, i64 0, i32 4
  %782 = load i32* %781, align 4
  %783 = getelementptr inbounds %struct.CPUX86State* %780, i64 0, i32 58
  store i32 %782, i32* %783, align 4
  %784 = load i32* @loglevel, align 4
  %785 = and i32 %784, 2
  %786 = icmp eq i32 %785, 0
  br i1 %786, label %790, label %787

; <label>:787                                     ; preds = %772
  %788 = load %struct._IO_FILE** @logfile, align 8
  %789 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %788, i32 1, i8* getelementptr inbounds ([5 x i8]* @.str15, i64 0, i64 0)) nounwind
  br label %790

; <label>:790                                     ; preds = %787, %772
  %791 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_loop_exit(%struct.CPUX86State* %791) noreturn nounwind
  unreachable

._crit_edge:                                      ; preds = %734, %716
  %792 = load i32* @loglevel, align 4
  %793 = and i32 %792, 2
  %794 = icmp eq i32 %793, 0
  br i1 %794, label %803, label %795

; <label>:795                                     ; preds = %._crit_edge
  %796 = load %struct._IO_FILE** @logfile, align 8
  %797 = load %struct.CPUX86State** @env, align 8
  %798 = getelementptr inbounds %struct.CPUX86State* %797, i64 0, i32 93
  %799 = load i32* %798, align 4
  %800 = getelementptr inbounds %struct.CPUX86State* %797, i64 0, i32 56
  %801 = load i32* %800, align 4
  %802 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %796, i32 1, i8* getelementptr inbounds ([10 x i8]* @.str16, i64 0, i64 0), i32 %799, i32 %801) nounwind
  br label %803

; <label>:803                                     ; preds = %795, %._crit_edge, %696
  ret void
}

declare i64 @ldq_phys(i64)

declare i32 @lduw_phys(i64)

declare i32 @ldub_phys(i64)

declare void @tlb_flush(%struct.CPUX86State*, i32)

define void @helper_vmmcall() noreturn nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 8589934592
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  tail call void @helper_vmexit(i32 129, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  tail call fastcc void @raise_exception(i32 6) noreturn
  unreachable
}

define void @helper_vmload(i32 %aflag) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 17179869184
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  tail call void @helper_vmexit(i32 130, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %12 = load i32* %11, align 4
  %13 = load i32* @loglevel, align 4
  %14 = and i32 %13, 2
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %helper_svm_check_intercept_param.exit._crit_edge, label %16

helper_svm_check_intercept_param.exit._crit_edge: ; preds = %helper_svm_check_intercept_param.exit
  %.pre5 = zext i32 %12 to i64
  %.pre6 = add i64 %.pre5, 1096
  br label %25

; <label>:16                                      ; preds = %helper_svm_check_intercept_param.exit
  %17 = load %struct._IO_FILE** @logfile, align 8
  %18 = zext i32 %12 to i64
  %19 = add i64 %18, 1096
  %20 = tail call i64 @ldq_phys(i64 %19) nounwind
  %21 = load %struct.CPUX86State** @env, align 8
  %22 = getelementptr inbounds %struct.CPUX86State* %21, i64 0, i32 9, i64 4, i32 1
  %23 = load i32* %22, align 4
  %24 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %17, i32 1, i8* getelementptr inbounds ([32 x i8]* @.str17, i64 0, i64 0), i32 %12, i64 %20, i32 %23) nounwind
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %25

; <label>:25                                      ; preds = %16, %helper_svm_check_intercept_param.exit._crit_edge
  %.pre-phi7 = phi i64 [ %.pre6, %helper_svm_check_intercept_param.exit._crit_edge ], [ %19, %16 ]
  %.pre-phi = phi i64 [ %.pre5, %helper_svm_check_intercept_param.exit._crit_edge ], [ %18, %16 ]
  %26 = phi %struct.CPUX86State* [ %1, %helper_svm_check_intercept_param.exit._crit_edge ], [ %.pre, %16 ]
  %27 = add i64 %.pre-phi, 1088
  %28 = tail call i32 @lduw_phys(i64 %27) nounwind
  %29 = tail call i64 @ldq_phys(i64 %.pre-phi7) nounwind
  %30 = trunc i64 %29 to i32
  %31 = add i64 %.pre-phi, 1092
  %32 = tail call i32 @ldl_phys(i64 %31) nounwind
  %33 = add i64 %.pre-phi, 1090
  %34 = tail call i32 @lduw_phys(i64 %33) nounwind
  %35 = shl i32 %34, 8
  %36 = and i32 %35, 65280
  %37 = shl i32 %34, 12
  %38 = and i32 %37, 15728640
  %39 = or i32 %36, %38
  %40 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 4, i32 0
  store i32 %28, i32* %40, align 4
  %41 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 4, i32 1
  store i32 %30, i32* %41, align 4
  %42 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 4, i32 2
  store i32 %32, i32* %42, align 4
  %43 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 4, i32 3
  store i32 %39, i32* %43, align 4
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 7
  %.pre.i.i = load i32* %.phi.trans.insert.i.i, align 4
  %44 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 2, i32 3
  %45 = load i32* %44, align 4
  %46 = lshr i32 %45, 17
  %47 = and i32 %46, 32
  %48 = and i32 %.pre.i.i, 32768
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %78

; <label>:50                                      ; preds = %25
  %51 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 14, i64 0
  %52 = load i32* %51, align 4
  %53 = and i32 %52, 1
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %63, label %55

; <label>:55                                      ; preds = %50
  %56 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 6
  %57 = load i32* %56, align 4
  %58 = and i32 %57, 131072
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %63

; <label>:60                                      ; preds = %55
  %61 = and i32 %.pre.i.i, 16
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %60, %55, %50
  %64 = or i32 %47, 64
  br label %78

; <label>:65                                      ; preds = %60
  %66 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 3, i32 1
  %67 = load i32* %66, align 4
  %68 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 0, i32 1
  %69 = load i32* %68, align 4
  %70 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 2, i32 1
  %71 = load i32* %70, align 4
  %72 = or i32 %69, %67
  %73 = or i32 %72, %71
  %74 = icmp ne i32 %73, 0
  %75 = zext i1 %74 to i32
  %76 = shl nuw nsw i32 %75, 6
  %77 = or i32 %76, %47
  br label %78

; <label>:78                                      ; preds = %65, %63, %25
  %new_hflags.0.i.i = phi i32 [ %47, %25 ], [ %64, %63 ], [ %77, %65 ]
  %79 = and i32 %.pre.i.i, -97
  %80 = or i32 %new_hflags.0.i.i, %79
  store i32 %80, i32* %.phi.trans.insert.i.i, align 4
  %81 = add i64 %.pre-phi, 1104
  %82 = load %struct.CPUX86State** @env, align 8
  %83 = tail call i32 @lduw_phys(i64 %81) nounwind
  %84 = add i64 %.pre-phi, 1112
  %85 = tail call i64 @ldq_phys(i64 %84) nounwind
  %86 = trunc i64 %85 to i32
  %87 = add i64 %.pre-phi, 1108
  %88 = tail call i32 @ldl_phys(i64 %87) nounwind
  %89 = add i64 %.pre-phi, 1106
  %90 = tail call i32 @lduw_phys(i64 %89) nounwind
  %91 = shl i32 %90, 8
  %92 = and i32 %91, 65280
  %93 = shl i32 %90, 12
  %94 = and i32 %93, 15728640
  %95 = or i32 %92, %94
  %96 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 9, i64 5, i32 0
  store i32 %83, i32* %96, align 4
  %97 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 9, i64 5, i32 1
  store i32 %86, i32* %97, align 4
  %98 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 9, i64 5, i32 2
  store i32 %88, i32* %98, align 4
  %99 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 9, i64 5, i32 3
  store i32 %95, i32* %99, align 4
  %.phi.trans.insert.i.i1 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 7
  %.pre.i.i2 = load i32* %.phi.trans.insert.i.i1, align 4
  %100 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 9, i64 2, i32 3
  %101 = load i32* %100, align 4
  %102 = lshr i32 %101, 17
  %103 = and i32 %102, 32
  %104 = and i32 %.pre.i.i2, 32768
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %106, label %svm_load_seg_cache.exit4

; <label>:106                                     ; preds = %78
  %107 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 14, i64 0
  %108 = load i32* %107, align 4
  %109 = and i32 %108, 1
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %119, label %111

; <label>:111                                     ; preds = %106
  %112 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 6
  %113 = load i32* %112, align 4
  %114 = and i32 %113, 131072
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %116, label %119

; <label>:116                                     ; preds = %111
  %117 = and i32 %.pre.i.i2, 16
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %119, label %121

; <label>:119                                     ; preds = %116, %111, %106
  %120 = or i32 %103, 64
  br label %svm_load_seg_cache.exit4

; <label>:121                                     ; preds = %116
  %122 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 9, i64 3, i32 1
  %123 = load i32* %122, align 4
  %124 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 9, i64 0, i32 1
  %125 = load i32* %124, align 4
  %126 = getelementptr inbounds %struct.CPUX86State* %82, i64 0, i32 9, i64 2, i32 1
  %127 = load i32* %126, align 4
  %128 = or i32 %125, %123
  %129 = or i32 %128, %127
  %130 = icmp ne i32 %129, 0
  %131 = zext i1 %130 to i32
  %132 = shl nuw nsw i32 %131, 6
  %133 = or i32 %132, %103
  br label %svm_load_seg_cache.exit4

svm_load_seg_cache.exit4:                         ; preds = %121, %119, %78
  %new_hflags.0.i.i3 = phi i32 [ %103, %78 ], [ %120, %119 ], [ %133, %121 ]
  %134 = and i32 %.pre.i.i2, -97
  %135 = or i32 %new_hflags.0.i.i3, %134
  store i32 %135, i32* %.phi.trans.insert.i.i1, align 4
  %136 = add i64 %.pre-phi, 1168
  %137 = load %struct.CPUX86State** @env, align 8
  %138 = tail call i32 @lduw_phys(i64 %136) nounwind
  %139 = getelementptr inbounds %struct.CPUX86State* %137, i64 0, i32 11, i32 0
  store i32 %138, i32* %139, align 4
  %140 = add i64 %.pre-phi, 1176
  %141 = tail call i64 @ldq_phys(i64 %140) nounwind
  %142 = trunc i64 %141 to i32
  %143 = getelementptr inbounds %struct.CPUX86State* %137, i64 0, i32 11, i32 1
  store i32 %142, i32* %143, align 4
  %144 = add i64 %.pre-phi, 1172
  %145 = tail call i32 @ldl_phys(i64 %144) nounwind
  %146 = getelementptr inbounds %struct.CPUX86State* %137, i64 0, i32 11, i32 2
  store i32 %145, i32* %146, align 4
  %147 = add i64 %.pre-phi, 1170
  %148 = tail call i32 @lduw_phys(i64 %147) nounwind
  %149 = shl i32 %148, 8
  %150 = and i32 %149, 65280
  %151 = shl i32 %148, 12
  %152 = and i32 %151, 15728640
  %153 = or i32 %150, %152
  %154 = getelementptr inbounds %struct.CPUX86State* %137, i64 0, i32 11, i32 3
  store i32 %153, i32* %154, align 4
  %155 = add i64 %.pre-phi, 1136
  %156 = load %struct.CPUX86State** @env, align 8
  %157 = tail call i32 @lduw_phys(i64 %155) nounwind
  %158 = getelementptr inbounds %struct.CPUX86State* %156, i64 0, i32 10, i32 0
  store i32 %157, i32* %158, align 4
  %159 = add i64 %.pre-phi, 1144
  %160 = tail call i64 @ldq_phys(i64 %159) nounwind
  %161 = trunc i64 %160 to i32
  %162 = getelementptr inbounds %struct.CPUX86State* %156, i64 0, i32 10, i32 1
  store i32 %161, i32* %162, align 4
  %163 = add i64 %.pre-phi, 1140
  %164 = tail call i32 @ldl_phys(i64 %163) nounwind
  %165 = getelementptr inbounds %struct.CPUX86State* %156, i64 0, i32 10, i32 2
  store i32 %164, i32* %165, align 4
  %166 = add i64 %.pre-phi, 1138
  %167 = tail call i32 @lduw_phys(i64 %166) nounwind
  %168 = shl i32 %167, 8
  %169 = and i32 %168, 65280
  %170 = shl i32 %167, 12
  %171 = and i32 %170, 15728640
  %172 = or i32 %169, %171
  %173 = getelementptr inbounds %struct.CPUX86State* %156, i64 0, i32 10, i32 3
  store i32 %172, i32* %173, align 4
  %174 = add i64 %.pre-phi, 1536
  %175 = tail call i64 @ldq_phys(i64 %174) nounwind
  %176 = load %struct.CPUX86State** @env, align 8
  %177 = getelementptr inbounds %struct.CPUX86State* %176, i64 0, i32 38
  store i64 %175, i64* %177, align 8
  %178 = add i64 %.pre-phi, 1576
  %179 = tail call i64 @ldq_phys(i64 %178) nounwind
  %180 = trunc i64 %179 to i32
  %181 = load %struct.CPUX86State** @env, align 8
  %182 = getelementptr inbounds %struct.CPUX86State* %181, i64 0, i32 34
  store i32 %180, i32* %182, align 4
  %183 = add i64 %.pre-phi, 1584
  %184 = tail call i64 @ldq_phys(i64 %183) nounwind
  %185 = trunc i64 %184 to i32
  %186 = load %struct.CPUX86State** @env, align 8
  %187 = getelementptr inbounds %struct.CPUX86State* %186, i64 0, i32 35
  store i32 %185, i32* %187, align 4
  %188 = add i64 %.pre-phi, 1592
  %189 = tail call i64 @ldq_phys(i64 %188) nounwind
  %190 = trunc i64 %189 to i32
  %191 = load %struct.CPUX86State** @env, align 8
  %192 = getelementptr inbounds %struct.CPUX86State* %191, i64 0, i32 36
  store i32 %190, i32* %192, align 4
  ret void
}

define void @helper_vmsave(i32 %aflag) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 34359738368
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  tail call void @helper_vmexit(i32 131, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %12 = load i32* %11, align 4
  %13 = load i32* @loglevel, align 4
  %14 = and i32 %13, 2
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %helper_svm_check_intercept_param.exit._crit_edge, label %16

helper_svm_check_intercept_param.exit._crit_edge: ; preds = %helper_svm_check_intercept_param.exit
  %.pre1 = zext i32 %12 to i64
  %.pre2 = add i64 %.pre1, 1096
  br label %25

; <label>:16                                      ; preds = %helper_svm_check_intercept_param.exit
  %17 = load %struct._IO_FILE** @logfile, align 8
  %18 = zext i32 %12 to i64
  %19 = add i64 %18, 1096
  %20 = tail call i64 @ldq_phys(i64 %19) nounwind
  %21 = load %struct.CPUX86State** @env, align 8
  %22 = getelementptr inbounds %struct.CPUX86State* %21, i64 0, i32 9, i64 4, i32 1
  %23 = load i32* %22, align 4
  %24 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %17, i32 1, i8* getelementptr inbounds ([32 x i8]* @.str18, i64 0, i64 0), i32 %12, i64 %20, i32 %23) nounwind
  %.pre = load %struct.CPUX86State** @env, align 8
  br label %25

; <label>:25                                      ; preds = %16, %helper_svm_check_intercept_param.exit._crit_edge
  %.pre-phi3 = phi i64 [ %.pre2, %helper_svm_check_intercept_param.exit._crit_edge ], [ %19, %16 ]
  %.pre-phi = phi i64 [ %.pre1, %helper_svm_check_intercept_param.exit._crit_edge ], [ %18, %16 ]
  %26 = phi %struct.CPUX86State* [ %1, %helper_svm_check_intercept_param.exit._crit_edge ], [ %.pre, %16 ]
  %27 = add i64 %.pre-phi, 1088
  %28 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 4, i32 0
  %29 = load i32* %28, align 4
  tail call void @stw_phys(i64 %27, i32 %29) nounwind
  %30 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 4, i32 1
  %31 = load i32* %30, align 4
  %32 = zext i32 %31 to i64
  tail call void @stq_phys(i64 %.pre-phi3, i64 %32) nounwind
  %33 = add i64 %.pre-phi, 1092
  %34 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 4, i32 2
  %35 = load i32* %34, align 4
  tail call void @stl_phys(i64 %33, i32 %35) nounwind
  %36 = add i64 %.pre-phi, 1090
  %37 = getelementptr inbounds %struct.CPUX86State* %26, i64 0, i32 9, i64 4, i32 3
  %38 = load i32* %37, align 4
  %39 = lshr i32 %38, 8
  %40 = and i32 %39, 255
  %41 = lshr i32 %38, 12
  %42 = and i32 %41, 3840
  %43 = or i32 %40, %42
  tail call void @stw_phys(i64 %36, i32 %43) nounwind
  %44 = add i64 %.pre-phi, 1104
  %45 = load %struct.CPUX86State** @env, align 8
  %46 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 9, i64 5, i32 0
  %47 = load i32* %46, align 4
  tail call void @stw_phys(i64 %44, i32 %47) nounwind
  %48 = add i64 %.pre-phi, 1112
  %49 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 9, i64 5, i32 1
  %50 = load i32* %49, align 4
  %51 = zext i32 %50 to i64
  tail call void @stq_phys(i64 %48, i64 %51) nounwind
  %52 = add i64 %.pre-phi, 1108
  %53 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 9, i64 5, i32 2
  %54 = load i32* %53, align 4
  tail call void @stl_phys(i64 %52, i32 %54) nounwind
  %55 = add i64 %.pre-phi, 1106
  %56 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 9, i64 5, i32 3
  %57 = load i32* %56, align 4
  %58 = lshr i32 %57, 8
  %59 = and i32 %58, 255
  %60 = lshr i32 %57, 12
  %61 = and i32 %60, 3840
  %62 = or i32 %59, %61
  tail call void @stw_phys(i64 %55, i32 %62) nounwind
  %63 = add i64 %.pre-phi, 1168
  %64 = load %struct.CPUX86State** @env, align 8
  %65 = getelementptr inbounds %struct.CPUX86State* %64, i64 0, i32 11, i32 0
  %66 = load i32* %65, align 4
  tail call void @stw_phys(i64 %63, i32 %66) nounwind
  %67 = add i64 %.pre-phi, 1176
  %68 = getelementptr inbounds %struct.CPUX86State* %64, i64 0, i32 11, i32 1
  %69 = load i32* %68, align 4
  %70 = zext i32 %69 to i64
  tail call void @stq_phys(i64 %67, i64 %70) nounwind
  %71 = add i64 %.pre-phi, 1172
  %72 = getelementptr inbounds %struct.CPUX86State* %64, i64 0, i32 11, i32 2
  %73 = load i32* %72, align 4
  tail call void @stl_phys(i64 %71, i32 %73) nounwind
  %74 = add i64 %.pre-phi, 1170
  %75 = getelementptr inbounds %struct.CPUX86State* %64, i64 0, i32 11, i32 3
  %76 = load i32* %75, align 4
  %77 = lshr i32 %76, 8
  %78 = and i32 %77, 255
  %79 = lshr i32 %76, 12
  %80 = and i32 %79, 3840
  %81 = or i32 %78, %80
  tail call void @stw_phys(i64 %74, i32 %81) nounwind
  %82 = add i64 %.pre-phi, 1136
  %83 = load %struct.CPUX86State** @env, align 8
  %84 = getelementptr inbounds %struct.CPUX86State* %83, i64 0, i32 10, i32 0
  %85 = load i32* %84, align 4
  tail call void @stw_phys(i64 %82, i32 %85) nounwind
  %86 = add i64 %.pre-phi, 1144
  %87 = getelementptr inbounds %struct.CPUX86State* %83, i64 0, i32 10, i32 1
  %88 = load i32* %87, align 4
  %89 = zext i32 %88 to i64
  tail call void @stq_phys(i64 %86, i64 %89) nounwind
  %90 = add i64 %.pre-phi, 1140
  %91 = getelementptr inbounds %struct.CPUX86State* %83, i64 0, i32 10, i32 2
  %92 = load i32* %91, align 4
  tail call void @stl_phys(i64 %90, i32 %92) nounwind
  %93 = add i64 %.pre-phi, 1138
  %94 = getelementptr inbounds %struct.CPUX86State* %83, i64 0, i32 10, i32 3
  %95 = load i32* %94, align 4
  %96 = lshr i32 %95, 8
  %97 = and i32 %96, 255
  %98 = lshr i32 %95, 12
  %99 = and i32 %98, 3840
  %100 = or i32 %97, %99
  tail call void @stw_phys(i64 %93, i32 %100) nounwind
  %101 = add i64 %.pre-phi, 1536
  %102 = load %struct.CPUX86State** @env, align 8
  %103 = getelementptr inbounds %struct.CPUX86State* %102, i64 0, i32 38
  %104 = load i64* %103, align 8
  tail call void @stq_phys(i64 %101, i64 %104) nounwind
  %105 = add i64 %.pre-phi, 1576
  %106 = load %struct.CPUX86State** @env, align 8
  %107 = getelementptr inbounds %struct.CPUX86State* %106, i64 0, i32 34
  %108 = load i32* %107, align 4
  %109 = zext i32 %108 to i64
  tail call void @stq_phys(i64 %105, i64 %109) nounwind
  %110 = add i64 %.pre-phi, 1584
  %111 = load %struct.CPUX86State** @env, align 8
  %112 = getelementptr inbounds %struct.CPUX86State* %111, i64 0, i32 35
  %113 = load i32* %112, align 4
  %114 = zext i32 %113 to i64
  tail call void @stq_phys(i64 %110, i64 %114) nounwind
  %115 = add i64 %.pre-phi, 1592
  %116 = load %struct.CPUX86State** @env, align 8
  %117 = getelementptr inbounds %struct.CPUX86State* %116, i64 0, i32 36
  %118 = load i32* %117, align 4
  %119 = zext i32 %118 to i64
  tail call void @stq_phys(i64 %115, i64 %119) nounwind
  ret void
}

define void @helper_stgi() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 68719476736
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  tail call void @helper_vmexit(i32 132, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 8
  %12 = load i32* %11, align 4
  %13 = or i32 %12, 1
  store i32 %13, i32* %11, align 4
  ret void
}

define void @helper_clgi() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 137438953472
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  tail call void @helper_vmexit(i32 133, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 8
  %12 = load i32* %11, align 4
  %13 = and i32 %12, -2
  store i32 %13, i32* %11, align 4
  ret void
}

define void @helper_skinit() noreturn nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 274877906944
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  tail call void @helper_vmexit(i32 134, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  tail call fastcc void @raise_exception(i32 6) noreturn
  unreachable
}

define void @helper_invlpga(i32 %aflag) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 7
  %3 = load i32* %2, align 4
  %.lobit.i = and i32 %3, 2097152
  %4 = icmp eq i32 %.lobit.i, 0
  br i1 %4, label %helper_svm_check_intercept_param.exit, label %5, !prof !0

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %7 = load i64* %6, align 8
  %8 = and i64 %7, 67108864
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %helper_svm_check_intercept_param.exit, label %10

; <label>:10                                      ; preds = %5
  tail call void @helper_vmexit(i32 122, i64 0) nounwind
  unreachable

helper_svm_check_intercept_param.exit:            ; preds = %5, %0
  %11 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 0, i64 0
  %12 = load i32* %11, align 4
  tail call void @tlb_flush_page(%struct.CPUX86State* %1, i32 %12) nounwind
  ret void
}

define void @helper_vmexit(i32 %exit_code, i64 %exit_info_1) noreturn nounwind uwtable sspreq {
  %1 = load i32* @loglevel, align 4
  %2 = and i32 %1, 2
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %15, label %4

; <label>:4                                       ; preds = %0
  %5 = load %struct._IO_FILE** @logfile, align 8
  %6 = load %struct.CPUX86State** @env, align 8
  %7 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 40
  %8 = load i64* %7, align 8
  %9 = add i64 %8, 128
  %10 = tail call i64 @ldq_phys(i64 %9) nounwind
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 4
  %13 = load i32* %12, align 4
  %14 = tail call i32 (%struct._IO_FILE*, i32, i8*, ...)* @__fprintf_chk(%struct._IO_FILE* %5, i32 1, i8* getelementptr inbounds ([37 x i8]* @.str19, i64 0, i64 0), i32 %exit_code, i64 %exit_info_1, i64 %10, i32 %13) nounwind
  br label %15

; <label>:15                                      ; preds = %4, %0
  %16 = load %struct.CPUX86State** @env, align 8
  %17 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 7
  %18 = load i32* %17, align 4
  %19 = and i32 %18, 8
  %20 = icmp eq i32 %19, 0
  %21 = getelementptr inbounds %struct.CPUX86State* %16, i64 0, i32 40
  %22 = load i64* %21, align 8
  %23 = add i64 %22, 104
  br i1 %20, label %29, label %24

; <label>:24                                      ; preds = %15
  tail call void @stl_phys(i64 %23, i32 1) nounwind
  %25 = load %struct.CPUX86State** @env, align 8
  %26 = getelementptr inbounds %struct.CPUX86State* %25, i64 0, i32 7
  %27 = load i32* %26, align 4
  %28 = and i32 %27, -9
  store i32 %28, i32* %26, align 4
  br label %30

; <label>:29                                      ; preds = %15
  tail call void @stl_phys(i64 %23, i32 0) nounwind
  br label %30

; <label>:30                                      ; preds = %29, %24
  %31 = load %struct.CPUX86State** @env, align 8
  %32 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 40
  %33 = load i64* %32, align 8
  %34 = add i64 %33, 1024
  %35 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 9, i64 0, i32 0
  %36 = load i32* %35, align 4
  tail call void @stw_phys(i64 %34, i32 %36) nounwind
  %37 = add i64 %33, 1032
  %38 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 9, i64 0, i32 1
  %39 = load i32* %38, align 4
  %40 = zext i32 %39 to i64
  tail call void @stq_phys(i64 %37, i64 %40) nounwind
  %41 = add i64 %33, 1028
  %42 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 9, i64 0, i32 2
  %43 = load i32* %42, align 4
  tail call void @stl_phys(i64 %41, i32 %43) nounwind
  %44 = add i64 %33, 1026
  %45 = getelementptr inbounds %struct.CPUX86State* %31, i64 0, i32 9, i64 0, i32 3
  %46 = load i32* %45, align 4
  %47 = lshr i32 %46, 8
  %48 = and i32 %47, 255
  %49 = lshr i32 %46, 12
  %50 = and i32 %49, 3840
  %51 = or i32 %48, %50
  tail call void @stw_phys(i64 %44, i32 %51) nounwind
  %52 = load %struct.CPUX86State** @env, align 8
  %53 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 40
  %54 = load i64* %53, align 8
  %55 = add i64 %54, 1040
  %56 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 9, i64 1, i32 0
  %57 = load i32* %56, align 4
  tail call void @stw_phys(i64 %55, i32 %57) nounwind
  %58 = add i64 %54, 1048
  %59 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 9, i64 1, i32 1
  %60 = load i32* %59, align 4
  %61 = zext i32 %60 to i64
  tail call void @stq_phys(i64 %58, i64 %61) nounwind
  %62 = add i64 %54, 1044
  %63 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 9, i64 1, i32 2
  %64 = load i32* %63, align 4
  tail call void @stl_phys(i64 %62, i32 %64) nounwind
  %65 = add i64 %54, 1042
  %66 = getelementptr inbounds %struct.CPUX86State* %52, i64 0, i32 9, i64 1, i32 3
  %67 = load i32* %66, align 4
  %68 = lshr i32 %67, 8
  %69 = and i32 %68, 255
  %70 = lshr i32 %67, 12
  %71 = and i32 %70, 3840
  %72 = or i32 %69, %71
  tail call void @stw_phys(i64 %65, i32 %72) nounwind
  %73 = load %struct.CPUX86State** @env, align 8
  %74 = getelementptr inbounds %struct.CPUX86State* %73, i64 0, i32 40
  %75 = load i64* %74, align 8
  %76 = add i64 %75, 1056
  %77 = getelementptr inbounds %struct.CPUX86State* %73, i64 0, i32 9, i64 2, i32 0
  %78 = load i32* %77, align 4
  tail call void @stw_phys(i64 %76, i32 %78) nounwind
  %79 = add i64 %75, 1064
  %80 = getelementptr inbounds %struct.CPUX86State* %73, i64 0, i32 9, i64 2, i32 1
  %81 = load i32* %80, align 4
  %82 = zext i32 %81 to i64
  tail call void @stq_phys(i64 %79, i64 %82) nounwind
  %83 = add i64 %75, 1060
  %84 = getelementptr inbounds %struct.CPUX86State* %73, i64 0, i32 9, i64 2, i32 2
  %85 = load i32* %84, align 4
  tail call void @stl_phys(i64 %83, i32 %85) nounwind
  %86 = add i64 %75, 1058
  %87 = getelementptr inbounds %struct.CPUX86State* %73, i64 0, i32 9, i64 2, i32 3
  %88 = load i32* %87, align 4
  %89 = lshr i32 %88, 8
  %90 = and i32 %89, 255
  %91 = lshr i32 %88, 12
  %92 = and i32 %91, 3840
  %93 = or i32 %90, %92
  tail call void @stw_phys(i64 %86, i32 %93) nounwind
  %94 = load %struct.CPUX86State** @env, align 8
  %95 = getelementptr inbounds %struct.CPUX86State* %94, i64 0, i32 40
  %96 = load i64* %95, align 8
  %97 = add i64 %96, 1072
  %98 = getelementptr inbounds %struct.CPUX86State* %94, i64 0, i32 9, i64 3, i32 0
  %99 = load i32* %98, align 4
  tail call void @stw_phys(i64 %97, i32 %99) nounwind
  %100 = add i64 %96, 1080
  %101 = getelementptr inbounds %struct.CPUX86State* %94, i64 0, i32 9, i64 3, i32 1
  %102 = load i32* %101, align 4
  %103 = zext i32 %102 to i64
  tail call void @stq_phys(i64 %100, i64 %103) nounwind
  %104 = add i64 %96, 1076
  %105 = getelementptr inbounds %struct.CPUX86State* %94, i64 0, i32 9, i64 3, i32 2
  %106 = load i32* %105, align 4
  tail call void @stl_phys(i64 %104, i32 %106) nounwind
  %107 = add i64 %96, 1074
  %108 = getelementptr inbounds %struct.CPUX86State* %94, i64 0, i32 9, i64 3, i32 3
  %109 = load i32* %108, align 4
  %110 = lshr i32 %109, 8
  %111 = and i32 %110, 255
  %112 = lshr i32 %109, 12
  %113 = and i32 %112, 3840
  %114 = or i32 %111, %113
  tail call void @stw_phys(i64 %107, i32 %114) nounwind
  %115 = load %struct.CPUX86State** @env, align 8
  %116 = getelementptr inbounds %struct.CPUX86State* %115, i64 0, i32 40
  %117 = load i64* %116, align 8
  %118 = add i64 %117, 1128
  %119 = getelementptr inbounds %struct.CPUX86State* %115, i64 0, i32 12, i32 1
  %120 = load i32* %119, align 4
  %121 = zext i32 %120 to i64
  tail call void @stq_phys(i64 %118, i64 %121) nounwind
  %122 = load %struct.CPUX86State** @env, align 8
  %123 = getelementptr inbounds %struct.CPUX86State* %122, i64 0, i32 40
  %124 = load i64* %123, align 8
  %125 = add i64 %124, 1124
  %126 = getelementptr inbounds %struct.CPUX86State* %122, i64 0, i32 12, i32 2
  %127 = load i32* %126, align 4
  tail call void @stl_phys(i64 %125, i32 %127) nounwind
  %128 = load %struct.CPUX86State** @env, align 8
  %129 = getelementptr inbounds %struct.CPUX86State* %128, i64 0, i32 40
  %130 = load i64* %129, align 8
  %131 = add i64 %130, 1160
  %132 = getelementptr inbounds %struct.CPUX86State* %128, i64 0, i32 13, i32 1
  %133 = load i32* %132, align 4
  %134 = zext i32 %133 to i64
  tail call void @stq_phys(i64 %131, i64 %134) nounwind
  %135 = load %struct.CPUX86State** @env, align 8
  %136 = getelementptr inbounds %struct.CPUX86State* %135, i64 0, i32 40
  %137 = load i64* %136, align 8
  %138 = add i64 %137, 1156
  %139 = getelementptr inbounds %struct.CPUX86State* %135, i64 0, i32 13, i32 2
  %140 = load i32* %139, align 4
  tail call void @stl_phys(i64 %138, i32 %140) nounwind
  %141 = load %struct.CPUX86State** @env, align 8
  %142 = getelementptr inbounds %struct.CPUX86State* %141, i64 0, i32 40
  %143 = load i64* %142, align 8
  %144 = add i64 %143, 1232
  %145 = getelementptr inbounds %struct.CPUX86State* %141, i64 0, i32 37
  %146 = load i64* %145, align 8
  tail call void @stq_phys(i64 %144, i64 %146) nounwind
  %147 = load %struct.CPUX86State** @env, align 8
  %148 = getelementptr inbounds %struct.CPUX86State* %147, i64 0, i32 40
  %149 = load i64* %148, align 8
  %150 = add i64 %149, 1368
  %151 = getelementptr inbounds %struct.CPUX86State* %147, i64 0, i32 14, i64 0
  %152 = load i32* %151, align 4
  %153 = zext i32 %152 to i64
  tail call void @stq_phys(i64 %150, i64 %153) nounwind
  %154 = load %struct.CPUX86State** @env, align 8
  %155 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 40
  %156 = load i64* %155, align 8
  %157 = add i64 %156, 1600
  %158 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 14, i64 2
  %159 = load i32* %158, align 4
  %160 = zext i32 %159 to i64
  tail call void @stq_phys(i64 %157, i64 %160) nounwind
  %161 = load %struct.CPUX86State** @env, align 8
  %162 = getelementptr inbounds %struct.CPUX86State* %161, i64 0, i32 40
  %163 = load i64* %162, align 8
  %164 = add i64 %163, 1360
  %165 = getelementptr inbounds %struct.CPUX86State* %161, i64 0, i32 14, i64 3
  %166 = load i32* %165, align 4
  %167 = zext i32 %166 to i64
  tail call void @stq_phys(i64 %164, i64 %167) nounwind
  %168 = load %struct.CPUX86State** @env, align 8
  %169 = getelementptr inbounds %struct.CPUX86State* %168, i64 0, i32 40
  %170 = load i64* %169, align 8
  %171 = add i64 %170, 1352
  %172 = getelementptr inbounds %struct.CPUX86State* %168, i64 0, i32 14, i64 4
  %173 = load i32* %172, align 4
  %174 = zext i32 %173 to i64
  tail call void @stq_phys(i64 %171, i64 %174) nounwind
  %175 = load %struct.CPUX86State** @env, align 8
  %176 = getelementptr inbounds %struct.CPUX86State* %175, i64 0, i32 40
  %177 = load i64* %176, align 8
  %178 = add i64 %177, 96
  %179 = tail call i32 @ldl_phys(i64 %178) nounwind
  %180 = and i32 %179, -272
  %181 = load %struct.CPUX86State** @env, align 8
  %182 = getelementptr inbounds %struct.CPUX86State* %181, i64 0, i32 48
  %183 = load i8* %182, align 1
  %184 = zext i8 %183 to i32
  %185 = and i32 %184, 15
  %186 = or i32 %185, %180
  %187 = getelementptr inbounds %struct.CPUX86State* %181, i64 0, i32 72
  %188 = load i32* %187, align 4
  %189 = and i32 %188, 256
  %190 = icmp eq i32 %189, 0
  %191 = or i32 %186, 256
  %int_ctl.0 = select i1 %190, i32 %186, i32 %191
  %192 = getelementptr inbounds %struct.CPUX86State* %181, i64 0, i32 40
  %193 = load i64* %192, align 8
  %194 = add i64 %193, 96
  tail call void @stl_phys(i64 %194, i32 %int_ctl.0) nounwind
  %195 = load %struct.CPUX86State** @env, align 8
  %196 = getelementptr inbounds %struct.CPUX86State* %195, i64 0, i32 40
  %197 = load i64* %196, align 8
  %198 = add i64 %197, 1392
  %199 = getelementptr inbounds %struct.CPUX86State* %195, i64 0, i32 6
  %200 = load i32* %199, align 4
  %201 = getelementptr inbounds %struct.CPUX86State* %195, i64 0, i32 3
  %202 = load i32* %201, align 4
  %203 = tail call i32 @helper_cc_compute_all(i32 %202) nounwind
  %204 = getelementptr inbounds %struct.CPUX86State* %195, i64 0, i32 5
  %205 = load i32* %204, align 4
  %206 = and i32 %205, 1024
  %207 = or i32 %203, %200
  %208 = or i32 %207, %206
  %209 = zext i32 %208 to i64
  tail call void @stq_phys(i64 %198, i64 %209) nounwind
  %210 = load %struct.CPUX86State** @env, align 8
  %211 = getelementptr inbounds %struct.CPUX86State* %210, i64 0, i32 40
  %212 = load i64* %211, align 8
  %213 = add i64 %212, 1400
  %214 = getelementptr inbounds %struct.CPUX86State* %210, i64 0, i32 4
  %215 = load i32* %214, align 4
  %216 = zext i32 %215 to i64
  tail call void @stq_phys(i64 %213, i64 %216) nounwind
  %217 = load %struct.CPUX86State** @env, align 8
  %218 = getelementptr inbounds %struct.CPUX86State* %217, i64 0, i32 40
  %219 = load i64* %218, align 8
  %220 = add i64 %219, 1496
  %221 = getelementptr inbounds %struct.CPUX86State* %217, i64 0, i32 0, i64 4
  %222 = load i32* %221, align 4
  %223 = zext i32 %222 to i64
  tail call void @stq_phys(i64 %220, i64 %223) nounwind
  %224 = load %struct.CPUX86State** @env, align 8
  %225 = getelementptr inbounds %struct.CPUX86State* %224, i64 0, i32 40
  %226 = load i64* %225, align 8
  %227 = add i64 %226, 1528
  %228 = getelementptr inbounds %struct.CPUX86State* %224, i64 0, i32 0, i64 0
  %229 = load i32* %228, align 4
  %230 = zext i32 %229 to i64
  tail call void @stq_phys(i64 %227, i64 %230) nounwind
  %231 = load %struct.CPUX86State** @env, align 8
  %232 = getelementptr inbounds %struct.CPUX86State* %231, i64 0, i32 40
  %233 = load i64* %232, align 8
  %234 = add i64 %233, 1376
  %235 = getelementptr inbounds %struct.CPUX86State* %231, i64 0, i32 59, i64 7
  %236 = load i32* %235, align 4
  %237 = zext i32 %236 to i64
  tail call void @stq_phys(i64 %234, i64 %237) nounwind
  %238 = load %struct.CPUX86State** @env, align 8
  %239 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 40
  %240 = load i64* %239, align 8
  %241 = add i64 %240, 1384
  %242 = getelementptr inbounds %struct.CPUX86State* %238, i64 0, i32 59, i64 6
  %243 = load i32* %242, align 4
  %244 = zext i32 %243 to i64
  tail call void @stq_phys(i64 %241, i64 %244) nounwind
  %245 = load %struct.CPUX86State** @env, align 8
  %246 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 40
  %247 = load i64* %246, align 8
  %248 = add i64 %247, 1227
  %249 = getelementptr inbounds %struct.CPUX86State* %245, i64 0, i32 7
  %250 = load i32* %249, align 4
  %251 = and i32 %250, 3
  tail call void @stb_phys(i64 %248, i32 %251) nounwind
  %252 = load %struct.CPUX86State** @env, align 8
  %253 = getelementptr inbounds %struct.CPUX86State* %252, i64 0, i32 8
  %254 = load i32* %253, align 4
  %255 = and i32 %254, -11
  store i32 %255, i32* %253, align 4
  %256 = load %struct.CPUX86State** @env, align 8
  %257 = getelementptr inbounds %struct.CPUX86State* %256, i64 0, i32 7
  %258 = load i32* %257, align 4
  %259 = and i32 %258, -2097153
  store i32 %259, i32* %257, align 4
  %260 = load %struct.CPUX86State** @env, align 8
  %261 = getelementptr inbounds %struct.CPUX86State* %260, i64 0, i32 42
  store i64 0, i64* %261, align 8
  %262 = load %struct.CPUX86State** @env, align 8
  %263 = getelementptr inbounds %struct.CPUX86State* %262, i64 0, i32 47
  store i32 0, i32* %263, align 4
  %264 = load %struct.CPUX86State** @env, align 8
  %265 = getelementptr inbounds %struct.CPUX86State* %264, i64 0, i32 72
  %266 = load i32* %265, align 4
  %267 = and i32 %266, -257
  store i32 %267, i32* %265, align 4
  %268 = load %struct.CPUX86State** @env, align 8
  %269 = getelementptr inbounds %struct.CPUX86State* %268, i64 0, i32 41
  store i64 0, i64* %269, align 8
  %270 = load %struct.CPUX86State** @env, align 8
  %271 = getelementptr inbounds %struct.CPUX86State* %270, i64 0, i32 39
  %272 = load i64* %271, align 8
  %273 = add i64 %272, 1128
  %274 = tail call i64 @ldq_phys(i64 %273) nounwind
  %275 = trunc i64 %274 to i32
  %276 = load %struct.CPUX86State** @env, align 8
  %277 = getelementptr inbounds %struct.CPUX86State* %276, i64 0, i32 12, i32 1
  store i32 %275, i32* %277, align 4
  %278 = load %struct.CPUX86State** @env, align 8
  %279 = getelementptr inbounds %struct.CPUX86State* %278, i64 0, i32 39
  %280 = load i64* %279, align 8
  %281 = add i64 %280, 1124
  %282 = tail call i32 @ldl_phys(i64 %281) nounwind
  %283 = load %struct.CPUX86State** @env, align 8
  %284 = getelementptr inbounds %struct.CPUX86State* %283, i64 0, i32 12, i32 2
  store i32 %282, i32* %284, align 4
  %285 = load %struct.CPUX86State** @env, align 8
  %286 = getelementptr inbounds %struct.CPUX86State* %285, i64 0, i32 39
  %287 = load i64* %286, align 8
  %288 = add i64 %287, 1160
  %289 = tail call i64 @ldq_phys(i64 %288) nounwind
  %290 = trunc i64 %289 to i32
  %291 = load %struct.CPUX86State** @env, align 8
  %292 = getelementptr inbounds %struct.CPUX86State* %291, i64 0, i32 13, i32 1
  store i32 %290, i32* %292, align 4
  %293 = load %struct.CPUX86State** @env, align 8
  %294 = getelementptr inbounds %struct.CPUX86State* %293, i64 0, i32 39
  %295 = load i64* %294, align 8
  %296 = add i64 %295, 1156
  %297 = tail call i32 @ldl_phys(i64 %296) nounwind
  %298 = load %struct.CPUX86State** @env, align 8
  %299 = getelementptr inbounds %struct.CPUX86State* %298, i64 0, i32 13, i32 2
  store i32 %297, i32* %299, align 4
  %300 = load %struct.CPUX86State** @env, align 8
  %301 = getelementptr inbounds %struct.CPUX86State* %300, i64 0, i32 39
  %302 = load i64* %301, align 8
  %303 = add i64 %302, 1368
  %304 = tail call i64 @ldq_phys(i64 %303) nounwind
  %305 = or i64 %304, 1
  %306 = trunc i64 %305 to i32
  tail call void @cpu_x86_update_cr0(%struct.CPUX86State* %300, i32 %306) nounwind
  %307 = load %struct.CPUX86State** @env, align 8
  %308 = getelementptr inbounds %struct.CPUX86State* %307, i64 0, i32 39
  %309 = load i64* %308, align 8
  %310 = add i64 %309, 1352
  %311 = tail call i64 @ldq_phys(i64 %310) nounwind
  %312 = trunc i64 %311 to i32
  tail call void @cpu_x86_update_cr4(%struct.CPUX86State* %307, i32 %312) nounwind
  %313 = load %struct.CPUX86State** @env, align 8
  %314 = getelementptr inbounds %struct.CPUX86State* %313, i64 0, i32 39
  %315 = load i64* %314, align 8
  %316 = add i64 %315, 1360
  %317 = tail call i64 @ldq_phys(i64 %316) nounwind
  %318 = trunc i64 %317 to i32
  tail call void @cpu_x86_update_cr3(%struct.CPUX86State* %313, i32 %318) nounwind
  %319 = load %struct.CPUX86State** @env, align 8
  %320 = getelementptr inbounds %struct.CPUX86State* %319, i64 0, i32 39
  %321 = load i64* %320, align 8
  %322 = add i64 %321, 1232
  %323 = tail call i64 @ldq_phys(i64 %322) nounwind
  %324 = getelementptr inbounds %struct.CPUX86State* %319, i64 0, i32 37
  store i64 %323, i64* %324, align 8
  %325 = getelementptr inbounds %struct.CPUX86State* %319, i64 0, i32 7
  %326 = load i32* %325, align 4
  %327 = and i32 %326, -1064961
  %328 = and i64 %323, 1024
  %329 = icmp eq i64 %328, 0
  %330 = or i32 %327, 16384
  %storemerge.i = select i1 %329, i32 %327, i32 %330
  %331 = and i64 %323, 4096
  %332 = or i32 %storemerge.i, 1048576
  %333 = icmp eq i64 %331, 0
  %storemerge..i = select i1 %333, i32 %storemerge.i, i32 %332
  store i32 %storemerge..i, i32* %325, align 4
  %334 = load %struct.CPUX86State** @env, align 8
  %335 = getelementptr inbounds %struct.CPUX86State* %334, i64 0, i32 6
  store i32 0, i32* %335, align 4
  %336 = load %struct.CPUX86State** @env, align 8
  %337 = getelementptr inbounds %struct.CPUX86State* %336, i64 0, i32 39
  %338 = load i64* %337, align 8
  %339 = add i64 %338, 1392
  %340 = tail call i64 @ldq_phys(i64 %339) nounwind
  %341 = trunc i64 %340 to i32
  %342 = and i32 %341, 2261
  %343 = load %struct.CPUX86State** @env, align 8
  %344 = getelementptr inbounds %struct.CPUX86State* %343, i64 0, i32 1
  store i32 %342, i32* %344, align 4
  %345 = lshr i32 %341, 9
  %346 = and i32 %345, 2
  %347 = xor i32 %346, 2
  %348 = add i32 %347, -1
  %349 = load %struct.CPUX86State** @env, align 8
  %350 = getelementptr inbounds %struct.CPUX86State* %349, i64 0, i32 5
  store i32 %348, i32* %350, align 4
  %351 = load %struct.CPUX86State** @env, align 8
  %352 = getelementptr inbounds %struct.CPUX86State* %351, i64 0, i32 6
  %353 = load i32* %352, align 4
  %354 = and i32 %353, 3285
  %355 = and i32 %341, -3286
  %356 = or i32 %354, %355
  store i32 %356, i32* %352, align 4
  %357 = load %struct.CPUX86State** @env, align 8
  %358 = getelementptr inbounds %struct.CPUX86State* %357, i64 0, i32 3
  store i32 1, i32* %358, align 4
  %359 = load %struct.CPUX86State** @env, align 8
  %360 = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 39
  %361 = load i64* %360, align 8
  %362 = add i64 %361, 1024
  %363 = tail call i32 @lduw_phys(i64 %362) nounwind
  %364 = add i64 %361, 1032
  %365 = tail call i64 @ldq_phys(i64 %364) nounwind
  %366 = trunc i64 %365 to i32
  %367 = add i64 %361, 1028
  %368 = tail call i32 @ldl_phys(i64 %367) nounwind
  %369 = add i64 %361, 1026
  %370 = tail call i32 @lduw_phys(i64 %369) nounwind
  %371 = shl i32 %370, 8
  %372 = and i32 %371, 65280
  %373 = shl i32 %370, 12
  %374 = and i32 %373, 15728640
  %375 = or i32 %372, %374
  %376 = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 9, i64 0, i32 0
  store i32 %363, i32* %376, align 4
  %377 = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 9, i64 0, i32 1
  store i32 %366, i32* %377, align 4
  %378 = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 9, i64 0, i32 2
  store i32 %368, i32* %378, align 4
  %379 = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 9, i64 0, i32 3
  store i32 %375, i32* %379, align 4
  %.phi.trans.insert.i.i = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 7
  %.pre.i.i = load i32* %.phi.trans.insert.i.i, align 4
  %380 = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 9, i64 2, i32 3
  %381 = load i32* %380, align 4
  %382 = lshr i32 %381, 17
  %383 = and i32 %382, 32
  %384 = and i32 %.pre.i.i, 32768
  %385 = icmp eq i32 %384, 0
  br i1 %385, label %386, label %412

; <label>:386                                     ; preds = %30
  %387 = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 14, i64 0
  %388 = load i32* %387, align 4
  %389 = and i32 %388, 1
  %390 = icmp eq i32 %389, 0
  br i1 %390, label %399, label %391

; <label>:391                                     ; preds = %386
  %392 = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 6
  %393 = load i32* %392, align 4
  %394 = and i32 %393, 131072
  %395 = icmp eq i32 %394, 0
  br i1 %395, label %396, label %399

; <label>:396                                     ; preds = %391
  %397 = and i32 %.pre.i.i, 16
  %398 = icmp eq i32 %397, 0
  br i1 %398, label %399, label %401

; <label>:399                                     ; preds = %396, %391, %386
  %400 = or i32 %383, 64
  br label %412

; <label>:401                                     ; preds = %396
  %402 = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 9, i64 3, i32 1
  %403 = load i32* %402, align 4
  %404 = getelementptr inbounds %struct.CPUX86State* %359, i64 0, i32 9, i64 2, i32 1
  %405 = load i32* %404, align 4
  %406 = or i32 %403, %366
  %407 = or i32 %406, %405
  %408 = icmp ne i32 %407, 0
  %409 = zext i1 %408 to i32
  %410 = shl nuw nsw i32 %409, 6
  %411 = or i32 %410, %383
  br label %412

; <label>:412                                     ; preds = %401, %399, %30
  %new_hflags.0.i.i = phi i32 [ %383, %30 ], [ %400, %399 ], [ %411, %401 ]
  %413 = and i32 %.pre.i.i, -97
  %414 = or i32 %new_hflags.0.i.i, %413
  store i32 %414, i32* %.phi.trans.insert.i.i, align 4
  %415 = load %struct.CPUX86State** @env, align 8
  %416 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 39
  %417 = load i64* %416, align 8
  %418 = add i64 %417, 1040
  %419 = tail call i32 @lduw_phys(i64 %418) nounwind
  %420 = add i64 %417, 1048
  %421 = tail call i64 @ldq_phys(i64 %420) nounwind
  %422 = trunc i64 %421 to i32
  %423 = add i64 %417, 1044
  %424 = tail call i32 @ldl_phys(i64 %423) nounwind
  %425 = add i64 %417, 1042
  %426 = tail call i32 @lduw_phys(i64 %425) nounwind
  %427 = shl i32 %426, 8
  %428 = and i32 %427, 65280
  %429 = shl i32 %426, 12
  %430 = and i32 %429, 15728640
  %431 = or i32 %428, %430
  %432 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 1, i32 0
  store i32 %419, i32* %432, align 4
  %433 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 1, i32 1
  store i32 %422, i32* %433, align 4
  %434 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 1, i32 2
  store i32 %424, i32* %434, align 4
  %435 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 1, i32 3
  store i32 %431, i32* %435, align 4
  %436 = lshr exact i32 %430, 18
  %437 = and i32 %436, 16
  %438 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 7
  %439 = load i32* %438, align 4
  %440 = and i32 %439, -32785
  %441 = or i32 %437, %440
  store i32 %441, i32* %438, align 4
  %442 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 2, i32 3
  %443 = load i32* %442, align 4
  %444 = lshr i32 %443, 17
  %445 = and i32 %444, 32
  %446 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 14, i64 0
  %447 = load i32* %446, align 4
  %448 = and i32 %447, 1
  %449 = icmp eq i32 %448, 0
  br i1 %449, label %456, label %450

; <label>:450                                     ; preds = %412
  %451 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 6
  %452 = load i32* %451, align 4
  %453 = and i32 %452, 131072
  %454 = icmp ne i32 %453, 0
  %455 = icmp eq i32 %437, 0
  %or.cond = or i1 %454, %455
  br i1 %or.cond, label %456, label %458

; <label>:456                                     ; preds = %450, %412
  %457 = or i32 %445, 64
  br label %471

; <label>:458                                     ; preds = %450
  %459 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 3, i32 1
  %460 = load i32* %459, align 4
  %461 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 0, i32 1
  %462 = load i32* %461, align 4
  %463 = getelementptr inbounds %struct.CPUX86State* %415, i64 0, i32 9, i64 2, i32 1
  %464 = load i32* %463, align 4
  %465 = or i32 %462, %460
  %466 = or i32 %465, %464
  %467 = icmp ne i32 %466, 0
  %468 = zext i1 %467 to i32
  %469 = shl nuw nsw i32 %468, 6
  %470 = or i32 %469, %445
  br label %471

; <label>:471                                     ; preds = %458, %456
  %new_hflags.0.i.i1 = phi i32 [ %457, %456 ], [ %470, %458 ]
  %472 = and i32 %441, -32865
  %473 = or i32 %new_hflags.0.i.i1, %472
  store i32 %473, i32* %438, align 4
  %474 = load %struct.CPUX86State** @env, align 8
  %475 = getelementptr inbounds %struct.CPUX86State* %474, i64 0, i32 39
  %476 = load i64* %475, align 8
  %477 = add i64 %476, 1056
  %478 = tail call i32 @lduw_phys(i64 %477) nounwind
  %479 = add i64 %476, 1064
  %480 = tail call i64 @ldq_phys(i64 %479) nounwind
  %481 = trunc i64 %480 to i32
  %482 = add i64 %476, 1060
  %483 = tail call i32 @ldl_phys(i64 %482) nounwind
  %484 = add i64 %476, 1058
  %485 = tail call i32 @lduw_phys(i64 %484) nounwind
  %486 = shl i32 %485, 8
  %487 = and i32 %486, 65280
  %488 = shl i32 %485, 12
  %489 = and i32 %488, 15728640
  %490 = or i32 %487, %489
  %491 = getelementptr inbounds %struct.CPUX86State* %474, i64 0, i32 9, i64 2, i32 0
  store i32 %478, i32* %491, align 4
  %492 = getelementptr inbounds %struct.CPUX86State* %474, i64 0, i32 9, i64 2, i32 1
  store i32 %481, i32* %492, align 4
  %493 = getelementptr inbounds %struct.CPUX86State* %474, i64 0, i32 9, i64 2, i32 2
  store i32 %483, i32* %493, align 4
  %494 = getelementptr inbounds %struct.CPUX86State* %474, i64 0, i32 9, i64 2, i32 3
  store i32 %490, i32* %494, align 4
  %.phi.trans.insert.i.i3 = getelementptr inbounds %struct.CPUX86State* %474, i64 0, i32 7
  %.pre.i.i4 = load i32* %.phi.trans.insert.i.i3, align 4
  %495 = lshr exact i32 %489, 17
  %496 = and i32 %495, 32
  %497 = and i32 %.pre.i.i4, 32768
  %498 = icmp eq i32 %497, 0
  br i1 %498, label %499, label %525

; <label>:499                                     ; preds = %471
  %500 = getelementptr inbounds %struct.CPUX86State* %474, i64 0, i32 14, i64 0
  %501 = load i32* %500, align 4
  %502 = and i32 %501, 1
  %503 = icmp eq i32 %502, 0
  br i1 %503, label %512, label %504

; <label>:504                                     ; preds = %499
  %505 = getelementptr inbounds %struct.CPUX86State* %474, i64 0, i32 6
  %506 = load i32* %505, align 4
  %507 = and i32 %506, 131072
  %508 = icmp eq i32 %507, 0
  br i1 %508, label %509, label %512

; <label>:509                                     ; preds = %504
  %510 = and i32 %.pre.i.i4, 16
  %511 = icmp eq i32 %510, 0
  br i1 %511, label %512, label %514

; <label>:512                                     ; preds = %509, %504, %499
  %513 = or i32 %496, 64
  br label %525

; <label>:514                                     ; preds = %509
  %515 = getelementptr inbounds %struct.CPUX86State* %474, i64 0, i32 9, i64 3, i32 1
  %516 = load i32* %515, align 4
  %517 = getelementptr inbounds %struct.CPUX86State* %474, i64 0, i32 9, i64 0, i32 1
  %518 = load i32* %517, align 4
  %519 = or i32 %516, %481
  %520 = or i32 %519, %518
  %521 = icmp ne i32 %520, 0
  %522 = zext i1 %521 to i32
  %523 = shl nuw nsw i32 %522, 6
  %524 = or i32 %523, %496
  br label %525

; <label>:525                                     ; preds = %514, %512, %471
  %new_hflags.0.i.i5 = phi i32 [ %496, %471 ], [ %513, %512 ], [ %524, %514 ]
  %526 = and i32 %.pre.i.i4, -97
  %527 = or i32 %new_hflags.0.i.i5, %526
  store i32 %527, i32* %.phi.trans.insert.i.i3, align 4
  %528 = load %struct.CPUX86State** @env, align 8
  %529 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 39
  %530 = load i64* %529, align 8
  %531 = add i64 %530, 1072
  %532 = tail call i32 @lduw_phys(i64 %531) nounwind
  %533 = add i64 %530, 1080
  %534 = tail call i64 @ldq_phys(i64 %533) nounwind
  %535 = trunc i64 %534 to i32
  %536 = add i64 %530, 1076
  %537 = tail call i32 @ldl_phys(i64 %536) nounwind
  %538 = add i64 %530, 1074
  %539 = tail call i32 @lduw_phys(i64 %538) nounwind
  %540 = shl i32 %539, 8
  %541 = and i32 %540, 65280
  %542 = shl i32 %539, 12
  %543 = and i32 %542, 15728640
  %544 = or i32 %541, %543
  %545 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 9, i64 3, i32 0
  store i32 %532, i32* %545, align 4
  %546 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 9, i64 3, i32 1
  store i32 %535, i32* %546, align 4
  %547 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 9, i64 3, i32 2
  store i32 %537, i32* %547, align 4
  %548 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 9, i64 3, i32 3
  store i32 %544, i32* %548, align 4
  %.phi.trans.insert.i.i7 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 7
  %.pre.i.i8 = load i32* %.phi.trans.insert.i.i7, align 4
  %549 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 9, i64 2, i32 3
  %550 = load i32* %549, align 4
  %551 = lshr i32 %550, 17
  %552 = and i32 %551, 32
  %553 = and i32 %.pre.i.i8, 32768
  %554 = icmp eq i32 %553, 0
  br i1 %554, label %555, label %svm_load_seg_cache.exit10

; <label>:555                                     ; preds = %525
  %556 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 14, i64 0
  %557 = load i32* %556, align 4
  %558 = and i32 %557, 1
  %559 = icmp eq i32 %558, 0
  br i1 %559, label %568, label %560

; <label>:560                                     ; preds = %555
  %561 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 6
  %562 = load i32* %561, align 4
  %563 = and i32 %562, 131072
  %564 = icmp eq i32 %563, 0
  br i1 %564, label %565, label %568

; <label>:565                                     ; preds = %560
  %566 = and i32 %.pre.i.i8, 16
  %567 = icmp eq i32 %566, 0
  br i1 %567, label %568, label %570

; <label>:568                                     ; preds = %565, %560, %555
  %569 = or i32 %552, 64
  br label %svm_load_seg_cache.exit10

; <label>:570                                     ; preds = %565
  %571 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 9, i64 0, i32 1
  %572 = load i32* %571, align 4
  %573 = getelementptr inbounds %struct.CPUX86State* %528, i64 0, i32 9, i64 2, i32 1
  %574 = load i32* %573, align 4
  %575 = or i32 %572, %535
  %576 = or i32 %575, %574
  %577 = icmp ne i32 %576, 0
  %578 = zext i1 %577 to i32
  %579 = shl nuw nsw i32 %578, 6
  %580 = or i32 %579, %552
  br label %svm_load_seg_cache.exit10

svm_load_seg_cache.exit10:                        ; preds = %570, %568, %525
  %new_hflags.0.i.i9 = phi i32 [ %552, %525 ], [ %569, %568 ], [ %580, %570 ]
  %581 = and i32 %.pre.i.i8, -97
  %582 = or i32 %new_hflags.0.i.i9, %581
  store i32 %582, i32* %.phi.trans.insert.i.i7, align 4
  %583 = load %struct.CPUX86State** @env, align 8
  %584 = getelementptr inbounds %struct.CPUX86State* %583, i64 0, i32 39
  %585 = load i64* %584, align 8
  %586 = add i64 %585, 1400
  %587 = tail call i64 @ldq_phys(i64 %586) nounwind
  %588 = trunc i64 %587 to i32
  %589 = load %struct.CPUX86State** @env, align 8
  %590 = getelementptr inbounds %struct.CPUX86State* %589, i64 0, i32 4
  store i32 %588, i32* %590, align 4
  %591 = load %struct.CPUX86State** @env, align 8
  %592 = getelementptr inbounds %struct.CPUX86State* %591, i64 0, i32 39
  %593 = load i64* %592, align 8
  %594 = add i64 %593, 1496
  %595 = tail call i64 @ldq_phys(i64 %594) nounwind
  %596 = trunc i64 %595 to i32
  %597 = load %struct.CPUX86State** @env, align 8
  %598 = getelementptr inbounds %struct.CPUX86State* %597, i64 0, i32 0, i64 4
  store i32 %596, i32* %598, align 4
  %599 = load %struct.CPUX86State** @env, align 8
  %600 = getelementptr inbounds %struct.CPUX86State* %599, i64 0, i32 39
  %601 = load i64* %600, align 8
  %602 = add i64 %601, 1528
  %603 = tail call i64 @ldq_phys(i64 %602) nounwind
  %604 = trunc i64 %603 to i32
  %605 = load %struct.CPUX86State** @env, align 8
  %606 = getelementptr inbounds %struct.CPUX86State* %605, i64 0, i32 0, i64 0
  store i32 %604, i32* %606, align 4
  %607 = load %struct.CPUX86State** @env, align 8
  %608 = getelementptr inbounds %struct.CPUX86State* %607, i64 0, i32 39
  %609 = load i64* %608, align 8
  %610 = add i64 %609, 1384
  %611 = tail call i64 @ldq_phys(i64 %610) nounwind
  %612 = trunc i64 %611 to i32
  %613 = load %struct.CPUX86State** @env, align 8
  %614 = getelementptr inbounds %struct.CPUX86State* %613, i64 0, i32 59, i64 6
  store i32 %612, i32* %614, align 4
  %615 = load %struct.CPUX86State** @env, align 8
  %616 = getelementptr inbounds %struct.CPUX86State* %615, i64 0, i32 39
  %617 = load i64* %616, align 8
  %618 = add i64 %617, 1376
  %619 = tail call i64 @ldq_phys(i64 %618) nounwind
  %620 = trunc i64 %619 to i32
  %621 = load %struct.CPUX86State** @env, align 8
  %622 = getelementptr inbounds %struct.CPUX86State* %621, i64 0, i32 59, i64 7
  store i32 %620, i32* %622, align 4
  %623 = load %struct.CPUX86State** @env, align 8
  %624 = getelementptr inbounds %struct.CPUX86State* %623, i64 0, i32 7
  %625 = load i32* %624, align 4
  %626 = and i32 %625, 3
  tail call void @s2e_on_privilege_change(i32 %626, i32 0) nounwind
  %627 = load i32* %624, align 4
  %628 = and i32 %627, -4
  store i32 %628, i32* %624, align 4
  %629 = load %struct.CPUX86State** @env, align 8
  %630 = getelementptr inbounds %struct.CPUX86State* %629, i64 0, i32 40
  %631 = load i64* %630, align 8
  %632 = add i64 %631, 112
  %633 = zext i32 %exit_code to i64
  tail call void @stq_phys(i64 %632, i64 %633) nounwind
  %634 = load %struct.CPUX86State** @env, align 8
  %635 = getelementptr inbounds %struct.CPUX86State* %634, i64 0, i32 40
  %636 = load i64* %635, align 8
  %637 = add i64 %636, 120
  tail call void @stq_phys(i64 %637, i64 %exit_info_1) nounwind
  %638 = load %struct.CPUX86State** @env, align 8
  %639 = getelementptr inbounds %struct.CPUX86State* %638, i64 0, i32 40
  %640 = load i64* %639, align 8
  %641 = add i64 %640, 136
  %642 = add i64 %640, 168
  %643 = tail call i32 @ldl_phys(i64 %642) nounwind
  tail call void @stl_phys(i64 %641, i32 %643) nounwind
  %644 = load %struct.CPUX86State** @env, align 8
  %645 = getelementptr inbounds %struct.CPUX86State* %644, i64 0, i32 40
  %646 = load i64* %645, align 8
  %647 = add i64 %646, 140
  %648 = add i64 %646, 172
  %649 = tail call i32 @ldl_phys(i64 %648) nounwind
  tail call void @stl_phys(i64 %647, i32 %649) nounwind
  %650 = load %struct.CPUX86State** @env, align 8
  %651 = getelementptr inbounds %struct.CPUX86State* %650, i64 0, i32 40
  %652 = load i64* %651, align 8
  %653 = add i64 %652, 168
  tail call void @stl_phys(i64 %653, i32 0) nounwind
  %654 = load %struct.CPUX86State** @env, align 8
  %655 = getelementptr inbounds %struct.CPUX86State* %654, i64 0, i32 8
  %656 = load i32* %655, align 4
  %657 = and i32 %656, -2
  store i32 %657, i32* %655, align 4
  %658 = load %struct.CPUX86State** @env, align 8
  %659 = getelementptr inbounds %struct.CPUX86State* %658, i64 0, i32 14, i64 0
  %660 = load i32* %659, align 4
  %661 = or i32 %660, 1
  store i32 %661, i32* %659, align 4
  %662 = load %struct.CPUX86State** @env, align 8
  %663 = getelementptr inbounds %struct.CPUX86State* %662, i64 0, i32 6
  %664 = load i32* %663, align 4
  %665 = and i32 %664, -131073
  store i32 %665, i32* %663, align 4
  %666 = load %struct.CPUX86State** @env, align 8
  %667 = getelementptr inbounds %struct.CPUX86State* %666, i64 0, i32 93
  store i32 -1, i32* %667, align 4
  %668 = load %struct.CPUX86State** @env, align 8
  %669 = getelementptr inbounds %struct.CPUX86State* %668, i64 0, i32 56
  store i32 0, i32* %669, align 4
  %670 = load %struct.CPUX86State** @env, align 8
  %671 = getelementptr inbounds %struct.CPUX86State* %670, i64 0, i32 62
  store i32 -1, i32* %671, align 4
  %672 = load %struct.CPUX86State** @env, align 8
  tail call void @cpu_loop_exit(%struct.CPUX86State* %672) noreturn nounwind
  unreachable
}

define void @svm_check_intercept(%struct.CPUX86State* %env1, i32 %type) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  store %struct.CPUX86State* %env1, %struct.CPUX86State** @env, align 8
  tail call void @helper_svm_check_intercept_param(i32 %type, i64 0)
  store %struct.CPUX86State* %1, %struct.CPUX86State** @env, align 8
  ret void
}

define void @helper_svm_check_io(i32 %port, i32 %param, i32 %next_eip_addend) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 42
  %3 = load i64* %2, align 8
  %4 = and i64 %3, 134217728
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %36, label %6

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 40
  %8 = load i64* %7, align 8
  %9 = add i64 %8, 64
  %10 = tail call i64 @ldq_phys(i64 %9) nounwind
  %11 = lshr i32 %param, 4
  %12 = and i32 %11, 7
  %13 = shl i32 1, %12
  %14 = add nsw i32 %13, 65535
  %15 = lshr i32 %port, 3
  %16 = zext i32 %15 to i64
  %17 = add i64 %10, %16
  %18 = tail call i32 @lduw_phys(i64 %17) nounwind
  %19 = and i32 %14, 65535
  %20 = and i32 %port, 7
  %21 = shl i32 %19, %20
  %22 = and i32 %18, %21
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %36, label %24

; <label>:24                                      ; preds = %6
  %25 = load %struct.CPUX86State** @env, align 8
  %26 = getelementptr inbounds %struct.CPUX86State* %25, i64 0, i32 40
  %27 = load i64* %26, align 8
  %28 = add i64 %27, 128
  %29 = getelementptr inbounds %struct.CPUX86State* %25, i64 0, i32 4
  %30 = load i32* %29, align 4
  %31 = add i32 %30, %next_eip_addend
  %32 = zext i32 %31 to i64
  tail call void @stq_phys(i64 %28, i64 %32) nounwind
  %33 = shl i32 %port, 16
  %34 = or i32 %33, %param
  %35 = zext i32 %34 to i64
  tail call void @helper_vmexit(i32 123, i64 %35)
  unreachable

; <label>:36                                      ; preds = %6, %0
  ret void
}

declare void @stb_phys(i64, i32)

define void @helper_ldmxcsr(i32 %val) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 29
  store i32 %val, i32* %2, align 4
  %3 = load %struct.CPUX86State** @env, align 8
  %4 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 29
  %5 = load i32* %4, align 4
  %6 = and i32 %5, 24576
  switch i32 %6, label %update_sse_status.exit [
    i32 24576, label %9
    i32 8192, label %7
    i32 16384, label %8
  ]

; <label>:7                                       ; preds = %0
  br label %update_sse_status.exit

; <label>:8                                       ; preds = %0
  br label %update_sse_status.exit

; <label>:9                                       ; preds = %0
  br label %update_sse_status.exit

update_sse_status.exit:                           ; preds = %9, %8, %7, %0
  %rnd_type.0.i = phi i32 [ 2, %8 ], [ 1, %7 ], [ 3, %9 ], [ 0, %0 ]
  %10 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 28
  tail call void @set_float_rounding_mode(i32 %rnd_type.0.i, %struct.float_status* %10) nounwind
  %11 = load %struct.CPUX86State** @env, align 8
  %12 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 29
  %13 = load i32* %12, align 4
  %14 = lshr i32 %13, 6
  %.tr.i = trunc i32 %14 to i8
  %15 = and i8 %.tr.i, 1
  %16 = getelementptr inbounds %struct.CPUX86State* %11, i64 0, i32 28, i32 5
  store i8 %15, i8* %16, align 1
  %17 = load %struct.CPUX86State** @env, align 8
  %18 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 29
  %19 = load i32* %18, align 4
  %20 = lshr i32 %19, 15
  %.tr1.i = trunc i32 %20 to i8
  %21 = and i8 %.tr1.i, 1
  %22 = getelementptr inbounds %struct.CPUX86State* %17, i64 0, i32 25, i32 4
  store i8 %21, i8* %22, align 1
  ret void
}

define void @helper_enter_mmx() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 16
  store i32 0, i32* %2, align 4
  %3 = load %struct.CPUX86State** @env, align 8
  %4 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 19, i64 0
  %5 = bitcast i8* %4 to i32*
  store i32 0, i32* %5, align 4
  %6 = load %struct.CPUX86State** @env, align 8
  %7 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 19, i64 4
  %8 = bitcast i8* %7 to i32*
  store i32 0, i32* %8, align 4
  ret void
}

define void @helper_emms() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 19, i64 0
  %3 = bitcast i8* %2 to i32*
  store i32 16843009, i32* %3, align 4
  %4 = load %struct.CPUX86State** @env, align 8
  %5 = getelementptr inbounds %struct.CPUX86State* %4, i64 0, i32 19, i64 4
  %6 = bitcast i8* %5 to i32*
  store i32 16843009, i32* %6, align 4
  ret void
}

define void @helper_movq(i8* nocapture %d, i8* nocapture %s) nounwind uwtable sspreq {
  %1 = bitcast i8* %s to i64*
  %2 = load i64* %1, align 8
  %3 = bitcast i8* %d to i64*
  store i64 %2, i64* %3, align 8
  ret void
}

define i32 @helper_rclb(i32 %t0, i32 %t1) nounwind uwtable sspreq {
  %1 = and i32 %t1, 31
  %2 = zext i32 %1 to i64
  %3 = getelementptr inbounds [32 x i8]* @rclb_table, i64 0, i64 %2
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i8 %4, 0
  %7 = load %struct.CPUX86State** @env, align 8
  br i1 %6, label %33, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 3
  %10 = load i32* %9, align 4
  %11 = tail call i32 @helper_cc_compute_all(i32 %10)
  %12 = and i32 %t0, 255
  %13 = shl i32 %12, %5
  %14 = and i32 %11, 1
  %15 = add nsw i32 %5, -1
  %16 = shl i32 %14, %15
  %17 = or i32 %16, %13
  %18 = icmp ugt i8 %4, 1
  br i1 %18, label %19, label %lshift.exit

; <label>:19                                      ; preds = %8
  %20 = sub nsw i32 9, %5
  %21 = lshr i32 %12, %20
  %22 = or i32 %17, %21
  br label %lshift.exit

lshift.exit:                                      ; preds = %19, %8
  %res.0 = phi i32 [ %22, %19 ], [ %17, %8 ]
  %23 = and i32 %11, -2050
  %24 = xor i32 %res.0, %t0
  %25 = shl i32 %24, 4
  %26 = and i32 %25, 2048
  %27 = sub nsw i32 8, %5
  %28 = lshr i32 %12, %27
  %29 = and i32 %28, 1
  %30 = or i32 %23, %29
  %31 = or i32 %30, %26
  %32 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 33
  store i32 %31, i32* %32, align 4
  br label %35

; <label>:33                                      ; preds = %0
  %34 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 33
  store i32 -1, i32* %34, align 4
  br label %35

; <label>:35                                      ; preds = %33, %lshift.exit
  %.0 = phi i32 [ %res.0, %lshift.exit ], [ %t0, %33 ]
  ret i32 %.0
}

define i32 @helper_rcrb(i32 %t0, i32 %t1) nounwind uwtable sspreq {
  %1 = and i32 %t1, 31
  %2 = zext i32 %1 to i64
  %3 = getelementptr inbounds [32 x i8]* @rclb_table, i64 0, i64 %2
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i8 %4, 0
  %7 = load %struct.CPUX86State** @env, align 8
  br i1 %6, label %33, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 3
  %10 = load i32* %9, align 4
  %11 = tail call i32 @helper_cc_compute_all(i32 %10)
  %12 = and i32 %t0, 255
  %13 = lshr i32 %12, %5
  %14 = and i32 %11, 1
  %15 = sub nsw i32 8, %5
  %16 = shl i32 %14, %15
  %17 = or i32 %16, %13
  %18 = icmp ugt i8 %4, 1
  br i1 %18, label %19, label %lshift.exit

; <label>:19                                      ; preds = %8
  %20 = sub nsw i32 9, %5
  %21 = shl i32 %12, %20
  %22 = or i32 %17, %21
  br label %lshift.exit

lshift.exit:                                      ; preds = %19, %8
  %res.0 = phi i32 [ %22, %19 ], [ %17, %8 ]
  %23 = and i32 %11, -2050
  %24 = xor i32 %res.0, %t0
  %25 = shl i32 %24, 4
  %26 = and i32 %25, 2048
  %27 = add nsw i32 %5, -1
  %28 = lshr i32 %12, %27
  %29 = and i32 %28, 1
  %30 = or i32 %23, %29
  %31 = or i32 %30, %26
  %32 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 33
  store i32 %31, i32* %32, align 4
  br label %35

; <label>:33                                      ; preds = %0
  %34 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 33
  store i32 -1, i32* %34, align 4
  br label %35

; <label>:35                                      ; preds = %33, %lshift.exit
  %.0 = phi i32 [ %res.0, %lshift.exit ], [ %t0, %33 ]
  ret i32 %.0
}

define i32 @helper_rclw(i32 %t0, i32 %t1) nounwind uwtable sspreq {
  %1 = and i32 %t1, 31
  %2 = zext i32 %1 to i64
  %3 = getelementptr inbounds [32 x i8]* @rclw_table, i64 0, i64 %2
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i8 %4, 0
  %7 = load %struct.CPUX86State** @env, align 8
  br i1 %6, label %33, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 3
  %10 = load i32* %9, align 4
  %11 = tail call i32 @helper_cc_compute_all(i32 %10)
  %12 = and i32 %t0, 65535
  %13 = shl i32 %12, %5
  %14 = and i32 %11, 1
  %15 = add nsw i32 %5, -1
  %16 = shl i32 %14, %15
  %17 = or i32 %16, %13
  %18 = icmp ugt i8 %4, 1
  br i1 %18, label %19, label %lshift.exit

; <label>:19                                      ; preds = %8
  %20 = sub nsw i32 17, %5
  %21 = lshr i32 %12, %20
  %22 = or i32 %17, %21
  br label %lshift.exit

lshift.exit:                                      ; preds = %19, %8
  %res.0 = phi i32 [ %22, %19 ], [ %17, %8 ]
  %23 = and i32 %11, -2050
  %24 = xor i32 %res.0, %t0
  %25 = lshr i32 %24, 4
  %26 = and i32 %25, 2048
  %27 = sub nsw i32 16, %5
  %28 = lshr i32 %12, %27
  %29 = and i32 %28, 1
  %30 = or i32 %23, %29
  %31 = or i32 %30, %26
  %32 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 33
  store i32 %31, i32* %32, align 4
  br label %35

; <label>:33                                      ; preds = %0
  %34 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 33
  store i32 -1, i32* %34, align 4
  br label %35

; <label>:35                                      ; preds = %33, %lshift.exit
  %.0 = phi i32 [ %res.0, %lshift.exit ], [ %t0, %33 ]
  ret i32 %.0
}

define i32 @helper_rcrw(i32 %t0, i32 %t1) nounwind uwtable sspreq {
  %1 = and i32 %t1, 31
  %2 = zext i32 %1 to i64
  %3 = getelementptr inbounds [32 x i8]* @rclw_table, i64 0, i64 %2
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i8 %4, 0
  %7 = load %struct.CPUX86State** @env, align 8
  br i1 %6, label %33, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 3
  %10 = load i32* %9, align 4
  %11 = tail call i32 @helper_cc_compute_all(i32 %10)
  %12 = and i32 %t0, 65535
  %13 = lshr i32 %12, %5
  %14 = and i32 %11, 1
  %15 = sub nsw i32 16, %5
  %16 = shl i32 %14, %15
  %17 = or i32 %16, %13
  %18 = icmp ugt i8 %4, 1
  br i1 %18, label %19, label %lshift.exit

; <label>:19                                      ; preds = %8
  %20 = sub nsw i32 17, %5
  %21 = shl i32 %12, %20
  %22 = or i32 %17, %21
  br label %lshift.exit

lshift.exit:                                      ; preds = %19, %8
  %res.0 = phi i32 [ %22, %19 ], [ %17, %8 ]
  %23 = and i32 %11, -2050
  %24 = xor i32 %res.0, %t0
  %25 = lshr i32 %24, 4
  %26 = and i32 %25, 2048
  %27 = add nsw i32 %5, -1
  %28 = lshr i32 %12, %27
  %29 = and i32 %28, 1
  %30 = or i32 %23, %29
  %31 = or i32 %30, %26
  %32 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 33
  store i32 %31, i32* %32, align 4
  br label %35

; <label>:33                                      ; preds = %0
  %34 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 33
  store i32 -1, i32* %34, align 4
  br label %35

; <label>:35                                      ; preds = %33, %lshift.exit
  %.0 = phi i32 [ %res.0, %lshift.exit ], [ %t0, %33 ]
  ret i32 %.0
}

define i32 @helper_rcll(i32 %t0, i32 %t1) nounwind uwtable sspreq {
  %1 = and i32 %t1, 31
  %2 = icmp eq i32 %1, 0
  %3 = load %struct.CPUX86State** @env, align 8
  br i1 %2, label %28, label %4

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 3
  %6 = load i32* %5, align 4
  %7 = tail call i32 @helper_cc_compute_all(i32 %6)
  %8 = shl i32 %t0, %1
  %9 = and i32 %7, 1
  %10 = add nsw i32 %1, -1
  %11 = shl i32 %9, %10
  %12 = or i32 %11, %8
  %13 = icmp ugt i32 %1, 1
  br i1 %13, label %14, label %lshift.exit

; <label>:14                                      ; preds = %4
  %15 = sub nsw i32 33, %1
  %16 = lshr i32 %t0, %15
  %17 = or i32 %12, %16
  br label %lshift.exit

lshift.exit:                                      ; preds = %14, %4
  %res.0 = phi i32 [ %17, %14 ], [ %12, %4 ]
  %18 = and i32 %7, -2050
  %19 = xor i32 %res.0, %t0
  %20 = lshr i32 %19, 20
  %21 = and i32 %20, 2048
  %22 = sub nsw i32 32, %1
  %23 = lshr i32 %t0, %22
  %24 = and i32 %23, 1
  %25 = or i32 %18, %24
  %26 = or i32 %25, %21
  %27 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 33
  store i32 %26, i32* %27, align 4
  br label %30

; <label>:28                                      ; preds = %0
  %29 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 33
  store i32 -1, i32* %29, align 4
  br label %30

; <label>:30                                      ; preds = %28, %lshift.exit
  %.0 = phi i32 [ %res.0, %lshift.exit ], [ %t0, %28 ]
  ret i32 %.0
}

define i32 @helper_rcrl(i32 %t0, i32 %t1) nounwind uwtable sspreq {
  %1 = and i32 %t1, 31
  %2 = icmp eq i32 %1, 0
  %3 = load %struct.CPUX86State** @env, align 8
  br i1 %2, label %28, label %4

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 3
  %6 = load i32* %5, align 4
  %7 = tail call i32 @helper_cc_compute_all(i32 %6)
  %8 = lshr i32 %t0, %1
  %9 = and i32 %7, 1
  %10 = sub nsw i32 32, %1
  %11 = shl i32 %9, %10
  %12 = or i32 %11, %8
  %13 = icmp ugt i32 %1, 1
  br i1 %13, label %14, label %lshift.exit

; <label>:14                                      ; preds = %4
  %15 = sub nsw i32 33, %1
  %16 = shl i32 %t0, %15
  %17 = or i32 %12, %16
  br label %lshift.exit

lshift.exit:                                      ; preds = %14, %4
  %res.0 = phi i32 [ %17, %14 ], [ %12, %4 ]
  %18 = and i32 %7, -2050
  %19 = xor i32 %res.0, %t0
  %20 = lshr i32 %19, 20
  %21 = and i32 %20, 2048
  %22 = add nsw i32 %1, -1
  %23 = lshr i32 %t0, %22
  %24 = and i32 %23, 1
  %25 = or i32 %18, %24
  %26 = or i32 %25, %21
  %27 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 33
  store i32 %26, i32* %27, align 4
  br label %30

; <label>:28                                      ; preds = %0
  %29 = getelementptr inbounds %struct.CPUX86State* %3, i64 0, i32 33
  store i32 -1, i32* %29, align 4
  br label %30

; <label>:30                                      ; preds = %28, %lshift.exit
  %.0 = phi i32 [ %res.0, %lshift.exit ], [ %t0, %28 ]
  ret i32 %.0
}

define i32 @helper_bsf(i32 %t0) nounwind uwtable readnone sspreq {
  %1 = and i32 %t0, 1
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph, %0
  %res.02 = phi i32 [ %4, %.lr.ph ], [ %t0, %0 ]
  %count.01 = phi i32 [ %3, %.lr.ph ], [ 0, %0 ]
  %3 = add nsw i32 %count.01, 1
  %4 = lshr i32 %res.02, 1
  %5 = and i32 %4, 1
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %0
  %count.0.lcssa = phi i32 [ 0, %0 ], [ %3, %.lr.ph ]
  ret i32 %count.0.lcssa
}

define i32 @helper_lzcnt(i32 %t0, i32 %wordsize) nounwind uwtable readnone sspreq {
  %1 = icmp sgt i32 %wordsize, 0
  %2 = icmp eq i32 %t0, 0
  %or.cond = and i1 %1, %2
  br i1 %or.cond, label %10, label %.preheader

.preheader:                                       ; preds = %0
  %3 = icmp sgt i32 %t0, -1
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph, %.preheader
  %res.02 = phi i32 [ %5, %.lr.ph ], [ %t0, %.preheader ]
  %count.01 = phi i32 [ %4, %.lr.ph ], [ 31, %.preheader ]
  %4 = add nsw i32 %count.01, -1
  %5 = shl i32 %res.02, 1
  %6 = icmp sgt i32 %5, -1
  br i1 %6, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %.preheader
  %count.0.lcssa = phi i32 [ 31, %.preheader ], [ %4, %.lr.ph ]
  br i1 %1, label %7, label %10

; <label>:7                                       ; preds = %._crit_edge
  %8 = add i32 %wordsize, -1
  %9 = sub i32 %8, %count.0.lcssa
  br label %10

; <label>:10                                      ; preds = %7, %._crit_edge, %0
  %.0 = phi i32 [ %9, %7 ], [ %wordsize, %0 ], [ %count.0.lcssa, %._crit_edge ]
  ret i32 %.0
}

define i32 @helper_bsr(i32 %t0) nounwind uwtable readnone sspreq {
.preheader.i:
  %0 = icmp sgt i32 %t0, -1
  br i1 %0, label %.lr.ph.i, label %helper_lzcnt.exit

.lr.ph.i:                                         ; preds = %.lr.ph.i, %.preheader.i
  %res.02.i = phi i32 [ %2, %.lr.ph.i ], [ %t0, %.preheader.i ]
  %count.01.i = phi i32 [ %1, %.lr.ph.i ], [ 31, %.preheader.i ]
  %1 = add nsw i32 %count.01.i, -1
  %2 = shl i32 %res.02.i, 1
  %3 = icmp sgt i32 %2, -1
  br i1 %3, label %.lr.ph.i, label %helper_lzcnt.exit

helper_lzcnt.exit:                                ; preds = %.lr.ph.i, %.preheader.i
  %count.0.lcssa.i = phi i32 [ 31, %.preheader.i ], [ %1, %.lr.ph.i ]
  ret i32 %count.0.lcssa.i
}

define i32 @cpu_cc_compute_all(%struct.CPUX86State* %env1, i32 %op) nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  store %struct.CPUX86State* %env1, %struct.CPUX86State** @env, align 8
  %2 = tail call i32 @helper_cc_compute_all(i32 %op)
  store %struct.CPUX86State* %1, %struct.CPUX86State** @env, align 8
  ret i32 %2
}

define i32 @helper_cc_compute_c(i32 %op) nounwind uwtable readonly sspreq {
  switch i32 %op, label %201 [
    i32 1, label %1
    i32 2, label %6
    i32 3, label %12
    i32 4, label %18
    i32 6, label %24
    i32 7, label %34
    i32 8, label %44
    i32 10, label %52
    i32 11, label %62
    i32 12, label %72
    i32 14, label %80
    i32 15, label %91
    i32 16, label %102
    i32 18, label %111
    i32 19, label %123
    i32 20, label %135
    i32 40, label %196
    i32 39, label %191
    i32 38, label %186
    i32 26, label %145
    i32 27, label %149
    i32 28, label %153
    i32 30, label %157
    i32 31, label %161
    i32 32, label %165
    i32 34, label %169
    i32 35, label %175
    i32 36, label %181
  ]

; <label>:1                                       ; preds = %0
  %2 = load %struct.CPUX86State** @env, align 8
  %3 = getelementptr inbounds %struct.CPUX86State* %2, i64 0, i32 1
  %4 = load i32* %3, align 4
  %5 = and i32 %4, 1
  br label %201

; <label>:6                                       ; preds = %0
  %7 = load %struct.CPUX86State** @env, align 8
  %8 = getelementptr inbounds %struct.CPUX86State* %7, i64 0, i32 1
  %9 = load i32* %8, align 4
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i32
  br label %201

; <label>:12                                      ; preds = %0
  %13 = load %struct.CPUX86State** @env, align 8
  %14 = getelementptr inbounds %struct.CPUX86State* %13, i64 0, i32 1
  %15 = load i32* %14, align 4
  %16 = icmp ne i32 %15, 0
  %17 = zext i1 %16 to i32
  br label %201

; <label>:18                                      ; preds = %0
  %19 = load %struct.CPUX86State** @env, align 8
  %20 = getelementptr inbounds %struct.CPUX86State* %19, i64 0, i32 1
  %21 = load i32* %20, align 4
  %22 = icmp ne i32 %21, 0
  %23 = zext i1 %22 to i32
  br label %201

; <label>:24                                      ; preds = %0
  %25 = load %struct.CPUX86State** @env, align 8
  %26 = getelementptr inbounds %struct.CPUX86State* %25, i64 0, i32 1
  %27 = load i32* %26, align 4
  %28 = getelementptr inbounds %struct.CPUX86State* %25, i64 0, i32 2
  %29 = load i32* %28, align 4
  %30 = and i32 %29, 255
  %31 = and i32 %27, 255
  %32 = icmp ult i32 %30, %31
  %33 = zext i1 %32 to i32
  br label %201

; <label>:34                                      ; preds = %0
  %35 = load %struct.CPUX86State** @env, align 8
  %36 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 1
  %37 = load i32* %36, align 4
  %38 = getelementptr inbounds %struct.CPUX86State* %35, i64 0, i32 2
  %39 = load i32* %38, align 4
  %40 = and i32 %39, 65535
  %41 = and i32 %37, 65535
  %42 = icmp ult i32 %40, %41
  %43 = zext i1 %42 to i32
  br label %201

; <label>:44                                      ; preds = %0
  %45 = load %struct.CPUX86State** @env, align 8
  %46 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 1
  %47 = load i32* %46, align 4
  %48 = getelementptr inbounds %struct.CPUX86State* %45, i64 0, i32 2
  %49 = load i32* %48, align 4
  %50 = icmp ult i32 %49, %47
  %51 = zext i1 %50 to i32
  br label %201

; <label>:52                                      ; preds = %0
  %53 = load %struct.CPUX86State** @env, align 8
  %54 = getelementptr inbounds %struct.CPUX86State* %53, i64 0, i32 1
  %55 = load i32* %54, align 4
  %56 = getelementptr inbounds %struct.CPUX86State* %53, i64 0, i32 2
  %57 = load i32* %56, align 4
  %58 = and i32 %57, 255
  %59 = and i32 %55, 255
  %60 = icmp ule i32 %58, %59
  %61 = zext i1 %60 to i32
  br label %201

; <label>:62                                      ; preds = %0
  %63 = load %struct.CPUX86State** @env, align 8
  %64 = getelementptr inbounds %struct.CPUX86State* %63, i64 0, i32 1
  %65 = load i32* %64, align 4
  %66 = getelementptr inbounds %struct.CPUX86State* %63, i64 0, i32 2
  %67 = load i32* %66, align 4
  %68 = and i32 %67, 65535
  %69 = and i32 %65, 65535
  %70 = icmp ule i32 %68, %69
  %71 = zext i1 %70 to i32
  br label %201

; <label>:72                                      ; preds = %0
  %73 = load %struct.CPUX86State** @env, align 8
  %74 = getelementptr inbounds %struct.CPUX86State* %73, i64 0, i32 1
  %75 = load i32* %74, align 4
  %76 = getelementptr inbounds %struct.CPUX86State* %73, i64 0, i32 2
  %77 = load i32* %76, align 4
  %78 = icmp ule i32 %77, %75
  %79 = zext i1 %78 to i32
  br label %201

; <label>:80                                      ; preds = %0
  %81 = load %struct.CPUX86State** @env, align 8
  %82 = getelementptr inbounds %struct.CPUX86State* %81, i64 0, i32 2
  %83 = load i32* %82, align 4
  %84 = getelementptr inbounds %struct.CPUX86State* %81, i64 0, i32 1
  %85 = load i32* %84, align 4
  %86 = add i32 %85, %83
  %87 = and i32 %86, 255
  %88 = and i32 %85, 255
  %89 = icmp ult i32 %87, %88
  %90 = zext i1 %89 to i32
  br label %201

; <label>:91                                      ; preds = %0
  %92 = load %struct.CPUX86State** @env, align 8
  %93 = getelementptr inbounds %struct.CPUX86State* %92, i64 0, i32 2
  %94 = load i32* %93, align 4
  %95 = getelementptr inbounds %struct.CPUX86State* %92, i64 0, i32 1
  %96 = load i32* %95, align 4
  %97 = add i32 %96, %94
  %98 = and i32 %97, 65535
  %99 = and i32 %96, 65535
  %100 = icmp ult i32 %98, %99
  %101 = zext i1 %100 to i32
  br label %201

; <label>:102                                     ; preds = %0
  %103 = load %struct.CPUX86State** @env, align 8
  %104 = getelementptr inbounds %struct.CPUX86State* %103, i64 0, i32 2
  %105 = load i32* %104, align 4
  %106 = getelementptr inbounds %struct.CPUX86State* %103, i64 0, i32 1
  %107 = load i32* %106, align 4
  %108 = alloca i32, align 4
  %109 = call i1 @uadd(i32* %108, i32 %105, i32 %107)
  %110 = zext i1 %109 to i32
  br label %201

; <label>:111                                     ; preds = %0
  %112 = load %struct.CPUX86State** @env, align 8
  %113 = getelementptr inbounds %struct.CPUX86State* %112, i64 0, i32 2
  %114 = load i32* %113, align 4
  %115 = getelementptr inbounds %struct.CPUX86State* %112, i64 0, i32 1
  %116 = load i32* %115, align 4
  %117 = add i32 %114, 1
  %118 = add i32 %117, %116
  %119 = and i32 %118, 255
  %120 = and i32 %116, 255
  %121 = icmp ule i32 %119, %120
  %122 = zext i1 %121 to i32
  br label %201

; <label>:123                                     ; preds = %0
  %124 = load %struct.CPUX86State** @env, align 8
  %125 = getelementptr inbounds %struct.CPUX86State* %124, i64 0, i32 2
  %126 = load i32* %125, align 4
  %127 = getelementptr inbounds %struct.CPUX86State* %124, i64 0, i32 1
  %128 = load i32* %127, align 4
  %129 = add i32 %126, 1
  %130 = add i32 %129, %128
  %131 = and i32 %130, 65535
  %132 = and i32 %128, 65535
  %133 = icmp ule i32 %131, %132
  %134 = zext i1 %133 to i32
  br label %201

; <label>:135                                     ; preds = %0
  %136 = load %struct.CPUX86State** @env, align 8
  %137 = getelementptr inbounds %struct.CPUX86State* %136, i64 0, i32 2
  %138 = load i32* %137, align 4
  %139 = getelementptr inbounds %struct.CPUX86State* %136, i64 0, i32 1
  %140 = load i32* %139, align 4
  %141 = add i32 %138, 1
  %142 = add i32 %141, %140
  %143 = icmp ule i32 %142, %140
  %144 = zext i1 %143 to i32
  br label %201

; <label>:145                                     ; preds = %0
  %146 = load %struct.CPUX86State** @env, align 8
  %147 = getelementptr inbounds %struct.CPUX86State* %146, i64 0, i32 1
  %148 = load i32* %147, align 4
  br label %201

; <label>:149                                     ; preds = %0
  %150 = load %struct.CPUX86State** @env, align 8
  %151 = getelementptr inbounds %struct.CPUX86State* %150, i64 0, i32 1
  %152 = load i32* %151, align 4
  br label %201

; <label>:153                                     ; preds = %0
  %154 = load %struct.CPUX86State** @env, align 8
  %155 = getelementptr inbounds %struct.CPUX86State* %154, i64 0, i32 1
  %156 = load i32* %155, align 4
  br label %201

; <label>:157                                     ; preds = %0
  %158 = load %struct.CPUX86State** @env, align 8
  %159 = getelementptr inbounds %struct.CPUX86State* %158, i64 0, i32 1
  %160 = load i32* %159, align 4
  br label %201

; <label>:161                                     ; preds = %0
  %162 = load %struct.CPUX86State** @env, align 8
  %163 = getelementptr inbounds %struct.CPUX86State* %162, i64 0, i32 1
  %164 = load i32* %163, align 4
  br label %201

; <label>:165                                     ; preds = %0
  %166 = load %struct.CPUX86State** @env, align 8
  %167 = getelementptr inbounds %struct.CPUX86State* %166, i64 0, i32 1
  %168 = load i32* %167, align 4
  br label %201

; <label>:169                                     ; preds = %0
  %170 = load %struct.CPUX86State** @env, align 8
  %171 = getelementptr inbounds %struct.CPUX86State* %170, i64 0, i32 1
  %172 = load i32* %171, align 4
  %173 = lshr i32 %172, 7
  %174 = and i32 %173, 1
  br label %201

; <label>:175                                     ; preds = %0
  %176 = load %struct.CPUX86State** @env, align 8
  %177 = getelementptr inbounds %struct.CPUX86State* %176, i64 0, i32 1
  %178 = load i32* %177, align 4
  %179 = lshr i32 %178, 15
  %180 = and i32 %179, 1
  br label %201

; <label>:181                                     ; preds = %0
  %182 = load %struct.CPUX86State** @env, align 8
  %183 = getelementptr inbounds %struct.CPUX86State* %182, i64 0, i32 1
  %184 = load i32* %183, align 4
  %185 = lshr i32 %184, 31
  br label %201

; <label>:186                                     ; preds = %0
  %187 = load %struct.CPUX86State** @env, align 8
  %188 = getelementptr inbounds %struct.CPUX86State* %187, i64 0, i32 1
  %189 = load i32* %188, align 4
  %190 = and i32 %189, 1
  br label %201

; <label>:191                                     ; preds = %0
  %192 = load %struct.CPUX86State** @env, align 8
  %193 = getelementptr inbounds %struct.CPUX86State* %192, i64 0, i32 1
  %194 = load i32* %193, align 4
  %195 = and i32 %194, 1
  br label %201

; <label>:196                                     ; preds = %0
  %197 = load %struct.CPUX86State** @env, align 8
  %198 = getelementptr inbounds %struct.CPUX86State* %197, i64 0, i32 1
  %199 = load i32* %198, align 4
  %200 = and i32 %199, 1
  br label %201

; <label>:201                                     ; preds = %196, %191, %186, %181, %175, %169, %165, %161, %157, %153, %149, %145, %135, %123, %111, %102, %91, %80, %72, %62, %52, %44, %34, %24, %18, %12, %6, %1, %0
  %.0 = phi i32 [ %200, %196 ], [ %195, %191 ], [ %190, %186 ], [ %185, %181 ], [ %180, %175 ], [ %174, %169 ], [ %168, %165 ], [ %164, %161 ], [ %160, %157 ], [ %156, %153 ], [ %152, %149 ], [ %148, %145 ], [ %144, %135 ], [ %134, %123 ], [ %122, %111 ]
  ret i32 %.0
}

define i64 @helper_set_cc_op_eflags() nounwind uwtable sspreq {
  %1 = load %struct.CPUX86State** @env, align 8
  %2 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 3
  %3 = load i32* %2, align 4
  %4 = tail call i32 @helper_cc_compute_all(i32 %3)
  %5 = getelementptr inbounds %struct.CPUX86State* %1, i64 0, i32 1
  store i32 %4, i32* %5, align 4
  %6 = load %struct.CPUX86State** @env, align 8
  %7 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 3
  store i32 1, i32* %7, align 4
  ret i64 0
}

define void @s2e_ensure_symbolic(%struct.S2E* nocapture %s2e, %struct.S2EExecutionState* nocapture %state) nounwind uwtable readnone sspreq {
  ret void
}

declare void @set_float_rounding_mode(i32, %struct.float_status*)

declare void @stw_phys(i64, i32)

declare void @cpu_set_ferr(%struct.CPUX86State*)

declare void @set_floatx80_rounding_precision(i32, %struct.float_status*)

declare void @s2e_on_privilege_change(i32, i32)

declare void @cpu_abort(%struct.CPUX86State*, i8*, ...) noreturn

define internal fastcc i32 @ldub_kernel(i32 %ptr) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 0
  %16 = load i32* %15, align 4
  %17 = and i32 %8, -4096
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %21, label %19, !prof !0

; <label>:19                                      ; preds = %6
  %20 = tail call zeroext i8 @__ldb_mmu(i32 %8, i32 0)
  br label %29

; <label>:21                                      ; preds = %6
  %22 = and i64 %7, 4294967295
  %23 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 3
  %24 = load i64* %23, align 8
  %25 = add i64 %24, %22
  %26 = inttoptr i64 %25 to i8*
  %27 = load i8* %26, align 1
  %28 = zext i8 %27 to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %22, i64 %25, i64 %28, i32 32, i8 zeroext 0, i8 zeroext 0) nounwind
  br label %29

; <label>:29                                      ; preds = %21, %19
  %res.0.in = phi i8 [ %20, %19 ], [ %27, %21 ]
  %res.0 = zext i8 %res.0.in to i32
  ret i32 %res.0
}

define internal fastcc void @stb_kernel(i32 %ptr, i32 %v) nounwind uwtable sspreq {
  %1 = load i32* @g_s2e_fork_on_symbolic_address, align 4
  %2 = icmp eq i32 %1, 0
  %3 = zext i32 %ptr to i64
  br i1 %2, label %6, label %4

; <label>:4                                       ; preds = %0
  %5 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %3, i64 0, i64 4294967295) nounwind
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = phi i64 [ %5, %4 ], [ %3, %0 ]
  %8 = trunc i64 %7 to i32
  %9 = lshr i32 %8, 7
  %10 = zext i32 %9 to i64
  %11 = tail call i64 @tcg_llvm_fork_and_concretize(i64 %10, i64 0, i64 33554431) nounwind
  %12 = lshr i64 %11, 5
  %13 = and i64 %12, 255
  %14 = load %struct.CPUX86State** @env, align 8
  %15 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 1
  %16 = load i32* %15, align 4
  %17 = and i32 %8, -4096
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %21, label %19, !prof !0

; <label>:19                                      ; preds = %6
  %20 = trunc i32 %v to i8
  tail call void @__stb_mmu(i32 %8, i8 zeroext %20, i32 0)
  br label %29

; <label>:21                                      ; preds = %6
  %22 = and i64 %7, 4294967295
  %23 = getelementptr inbounds %struct.CPUX86State* %14, i64 0, i32 74, i64 0, i64 %13, i32 3
  %24 = load i64* %23, align 8
  %25 = add i64 %24, %22
  %26 = inttoptr i64 %25 to i8*
  %27 = trunc i32 %v to i8
  store i8 %27, i8* %26, align 1
  %28 = zext i32 %v to i64
  tail call void @tcg_llvm_trace_memory_access(i64 %22, i64 %25, i64 %28, i32 32, i8 zeroext 1, i8 zeroext 0) nounwind
  br label %29

; <label>:29                                      ; preds = %21, %19
  ret void
}

define internal fastcc void @tss_load_seg(i32 %seg_reg, i32 %selector) nounwind uwtable sspreq {
  %1 = and i32 %selector, 65532
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %136, label %3

; <label>:3                                       ; preds = %0
  %4 = and i32 %selector, 4
  %5 = icmp eq i32 %4, 0
  %6 = load %struct.CPUX86State** @env, align 8
  %7 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 10
  %8 = getelementptr inbounds %struct.CPUX86State* %6, i64 0, i32 12
  %dt.0.i = select i1 %5, %struct.SegmentCache* %8, %struct.SegmentCache* %7
  %9 = or i32 %selector, 7
  %10 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 2
  %11 = load i32* %10, align 4
  %12 = icmp ugt i32 %9, %11
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %3
  tail call fastcc void @raise_exception_err(i32 10, i32 %1) noreturn
  unreachable

; <label>:14                                      ; preds = %3
  %15 = and i32 %selector, -8
  %16 = getelementptr inbounds %struct.SegmentCache* %dt.0.i, i64 0, i32 1
  %17 = load i32* %16, align 4
  %18 = add i32 %17, %15
  %19 = tail call fastcc i32 @ldl_kernel(i32 %18) nounwind
  %20 = add i32 %18, 4
  %21 = tail call fastcc i32 @ldl_kernel(i32 %20) nounwind
  %22 = and i32 %21, 4096
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %14
  tail call fastcc void @raise_exception_err(i32 10, i32 %1) noreturn
  unreachable

; <label>:25                                      ; preds = %14
  %26 = and i32 %selector, 3
  %27 = lshr i32 %21, 13
  %28 = and i32 %27, 3
  %29 = load %struct.CPUX86State** @env, align 8
  %30 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 7
  %31 = load i32* %30, align 4
  %32 = and i32 %31, 3
  %33 = icmp eq i32 %seg_reg, 1
  br i1 %33, label %34, label %46

; <label>:34                                      ; preds = %25
  %35 = and i32 %21, 2048
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %34
  tail call fastcc void @raise_exception_err(i32 10, i32 %1) noreturn
  unreachable

; <label>:38                                      ; preds = %34
  %39 = icmp eq i32 %28, %26
  br i1 %39, label %41, label %40

; <label>:40                                      ; preds = %38
  tail call fastcc void @raise_exception_err(i32 10, i32 %1) noreturn
  unreachable

; <label>:41                                      ; preds = %38
  %42 = and i32 %21, 1024
  %43 = icmp ne i32 %42, 0
  %44 = icmp ugt i32 %28, %26
  %or.cond = and i1 %43, %44
  br i1 %or.cond, label %45, label %66

; <label>:45                                      ; preds = %41
  tail call fastcc void @raise_exception_err(i32 10, i32 %1) noreturn
  unreachable

; <label>:46                                      ; preds = %25
  %47 = icmp eq i32 %seg_reg, 2
  %48 = and i32 %21, 2560
  br i1 %47, label %49, label %56

; <label>:49                                      ; preds = %46
  %50 = icmp eq i32 %48, 512
  br i1 %50, label %52, label %51

; <label>:51                                      ; preds = %49
  tail call fastcc void @raise_exception_err(i32 10, i32 %1) noreturn
  unreachable

; <label>:52                                      ; preds = %49
  %53 = icmp eq i32 %28, %32
  %54 = icmp eq i32 %28, %26
  %or.cond4 = and i1 %53, %54
  br i1 %or.cond4, label %66, label %55

; <label>:55                                      ; preds = %52
  tail call fastcc void @raise_exception_err(i32 10, i32 %1) noreturn
  unreachable

; <label>:56                                      ; preds = %46
  %57 = icmp eq i32 %48, 2048
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %56
  tail call fastcc void @raise_exception_err(i32 10, i32 %1) noreturn
  unreachable

; <label>:59                                      ; preds = %56
  %60 = and i32 %21, 3072
  %61 = icmp ult i32 %60, 3072
  br i1 %61, label %62, label %66

; <label>:62                                      ; preds = %59
  %63 = icmp ult i32 %28, %32
  %64 = icmp ult i32 %28, %26
  %or.cond7 = or i1 %63, %64
  br i1 %or.cond7, label %65, label %66

; <label>:65                                      ; preds = %62
  tail call fastcc void @raise_exception_err(i32 10, i32 %1) noreturn
  unreachable

; <label>:66                                      ; preds = %62, %59, %52, %41
  %67 = and i32 %21, 32768
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %70

; <label>:69                                      ; preds = %66
  tail call fastcc void @raise_exception_err(i32 11, i32 %1) noreturn
  unreachable

; <label>:70                                      ; preds = %66
  %71 = lshr i32 %19, 16
  %72 = shl i32 %21, 16
  %73 = and i32 %72, 16711680
  %74 = and i32 %21, -16777216
  %75 = or i32 %74, %71
  %76 = or i32 %75, %73
  %77 = and i32 %19, 65535
  %78 = and i32 %21, 983040
  %79 = or i32 %78, %77
  %80 = and i32 %21, 8388608
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %get_seg_limit.exit, label %82

; <label>:82                                      ; preds = %70
  %83 = shl nuw i32 %79, 12
  %84 = or i32 %83, 4095
  br label %get_seg_limit.exit

get_seg_limit.exit:                               ; preds = %82, %70
  %limit.0.i = phi i32 [ %84, %82 ], [ %79, %70 ]
  %85 = sext i32 %seg_reg to i64
  %86 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 9, i64 %85, i32 0
  store i32 %selector, i32* %86, align 4
  %87 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 9, i64 %85, i32 1
  store i32 %76, i32* %87, align 4
  %88 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 9, i64 %85, i32 2
  store i32 %limit.0.i, i32* %88, align 4
  %89 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 9, i64 %85, i32 3
  store i32 %21, i32* %89, align 4
  br i1 %33, label %90, label %._crit_edge.i

._crit_edge.i:                                    ; preds = %get_seg_limit.exit
  %.pre.i = load i32* %30, align 4
  br label %98

; <label>:90                                      ; preds = %get_seg_limit.exit
  %91 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 9, i64 1, i32 3
  %92 = load i32* %91, align 4
  %93 = lshr i32 %92, 18
  %94 = and i32 %93, 16
  %95 = load i32* %30, align 4
  %96 = and i32 %95, -32785
  %97 = or i32 %96, %94
  store i32 %97, i32* %30, align 4
  br label %98

; <label>:98                                      ; preds = %90, %._crit_edge.i
  %99 = phi i32 [ %.pre.i, %._crit_edge.i ], [ %97, %90 ]
  %100 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 9, i64 2, i32 3
  %101 = load i32* %100, align 4
  %102 = lshr i32 %101, 17
  %103 = and i32 %102, 32
  %104 = and i32 %99, 32768
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %106, label %cpu_x86_load_seg_cache.exit

; <label>:106                                     ; preds = %98
  %107 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 14, i64 0
  %108 = load i32* %107, align 4
  %109 = and i32 %108, 1
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %119, label %111

; <label>:111                                     ; preds = %106
  %112 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 6
  %113 = load i32* %112, align 4
  %114 = and i32 %113, 131072
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %116, label %119

; <label>:116                                     ; preds = %111
  %117 = and i32 %99, 16
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %119, label %121

; <label>:119                                     ; preds = %116, %111, %106
  %120 = or i32 %103, 64
  br label %cpu_x86_load_seg_cache.exit

; <label>:121                                     ; preds = %116
  %122 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 9, i64 3, i32 1
  %123 = load i32* %122, align 4
  %124 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 9, i64 0, i32 1
  %125 = load i32* %124, align 4
  %126 = getelementptr inbounds %struct.CPUX86State* %29, i64 0, i32 9, i64 2, i32 1
  %127 = load i32* %126, align 4
  %128 = or i32 %125, %123
  %129 = or i32 %128, %127
  %130 = icmp ne i32 %129, 0
  %131 = zext i1 %130 to i32
  %132 = shl nuw nsw i32 %131, 6
  %133 = or i32 %132, %103
  br label %cpu_x86_load_seg_cache.exit

cpu_x86_load_seg_cache.exit:                      ; preds = %121, %119, %98
  %new_hflags.0.i = phi i32 [ %103, %98 ], [ %120, %119 ], [ %133, %121 ]
  %134 = and i32 %99, -97
  %135 = or i32 %new_hflags.0.i, %134
  store i32 %135, i32* %30, align 4
  br label %139

; <label>:136                                     ; preds = %0
  %seg_reg.off = add i32 %seg_reg, -1
  %137 = icmp ult i32 %seg_reg.off, 2
  br i1 %137, label %138, label %139

; <label>:138                                     ; preds = %136
  tail call fastcc void @raise_exception_err(i32 10, i32 0) noreturn
  unreachable

; <label>:139                                     ; preds = %136, %cpu_x86_load_seg_cache.exit
  ret void
}

declare void @qemu_system_reset_request()

declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) nounwind readnone

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare double @exp2(double)

declare double @ldexp(double, i32)

!0 = metadata !{metadata !"branch_weights", i32 64, i32 4}
!1 = metadata !{metadata !"branch_weights", i32 4, i32 64}
