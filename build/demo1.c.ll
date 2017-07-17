; ModuleID = 'testbench\c\demo1.c'
target datalayout = "E-p:64:64:64-i1:8:64-i8:8:64-i16:16:64-i32:32:64-f64:64-a:0:64-n64"
target triple = "fisc-unknown-unknown"

%struct.IO = type { %struct.anon, %struct.anon.0, %struct.anon.1 }
%struct.anon = type { i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.anon.0 = type <{ i8, i8, i32, i8 }>
%struct.anon.1 = type <{ i8, i8, i16, i16, i8, i8, i8, [50 x i64] }>
%struct.rgbpack_t = type { %struct.rgb_t, %struct.rgb_t }
%struct.rgb_t = type { i8, i8, i8, i8 }

@.str = private unnamed_addr global [7 x i8] c"(null)\00", align 1
@io = internal global %struct.IO* inttoptr (i64 20480 to %struct.IO*), section ".data", align 4
@__printf_buff__ = internal global [256 x i8] zeroinitializer, section ".data", align 1
@alloc_head = global i32 131072, section ".data", align 4
@video_render_counter = internal global i32 0, section ".data", align 4
@.str.1 = private unnamed_addr global [58 x i8] c"\0A________________________________________________________\00", align 1
@.str.2 = private unnamed_addr global [45 x i8] c"\0A\0A            W E L C O M E    T O    T H E \00", align 1
@.str.3 = private unnamed_addr global [52 x i8] c"\0A      F I S C    V I R T U A L      M A C H I N E\0A\00", align 1
@.str.4 = private unnamed_addr global [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr global [3 x i8] c"\0A\0A\00", align 1
@.str.6 = private unnamed_addr global [39 x i8] c"\0A\0A> Closing the FISC CPU ...\0A> Goodbye\00", align 1
@.str.7 = private unnamed_addr global [2 x i8] c"\0A\00", align 1
@video_test.video_x = internal global i16 0, section ".data", align 2
@video_test.video_y = internal global i16 0, section ".data", align 2
@video_test.video_colorinfo = internal global i64 0, section ".data", align 8
@video_test.inc = internal global i8 0, section ".data", align 1
@.str.8 = private unnamed_addr global [21 x i8] c"\0A> This is demo # 1\0A\00", align 1
@.str.9 = private unnamed_addr global [17 x i8] c"0123456789abcdef\00", align 1

; Function Attrs: nounwind
define i32 @strlen(i8* %str) #0 {
  %1 = alloca i8*, align 4
  %size = alloca i32, align 4
  store i8* %str, i8** %1, align 4
  store i32 0, i32* %size, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32, i32* %size, align 4
  %4 = load i8*, i8** %1, align 4
  %5 = getelementptr inbounds i8, i8* %4, i32 %3
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %2
  %10 = load i32, i32* %size, align 4
  %11 = add i32 %10, 1
  store i32 %11, i32* %size, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load i32, i32* %size, align 4
  ret i32 %13
}

; Function Attrs: nounwind
define i32 @div10(i32 %dividend) #0 {
  %1 = alloca i32, align 4
  %invDivisor = alloca i64, align 8
  store i32 %dividend, i32* %1, align 4
  store i64 429496730, i64* %invDivisor, align 8
  %2 = load i64, i64* %invDivisor, align 8
  %3 = load i32, i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = mul nsw i64 %2, %4
  %6 = ashr i64 %5, 32
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

; Function Attrs: nounwind
define i32 @mod10(i32 %a) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %1, align 4
  %4 = call i32 @div10(i32 %3) #2
  %5 = mul nsw i32 10, %4
  %6 = sub nsw i32 %2, %5
  ret i32 %6
}

; Function Attrs: nounwind
define i32 @vasprintf(i8* %buf, i8* %fmt, i8* %args) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %3 = alloca i8*, align 4
  %i = alloca i32, align 4
  %s = alloca i8*, align 4
  %b = alloca i8*, align 4
  %ctr = alloca i32, align 4
  %f = alloca i8*, align 4
  %arg_width = alloca i32, align 4
  %4 = alloca i8*, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i8* %buf, i8** %1, align 4
  store i8* %fmt, i8** %2, align 4
  store i8* %args, i8** %3, align 4
  store i32 0, i32* %i, align 4
  %8 = load i8*, i8** %1, align 4
  store i8* %8, i8** %b, align 4
  store i32 0, i32* %ctr, align 4
  %9 = load i8*, i8** %2, align 4
  store i8* %9, i8** %f, align 4
  br label %10

; <label>:10                                      ; preds = %117, %0
  %11 = load i8*, i8** %f, align 4
  %12 = load i8, i8* %11, align 1
  %13 = icmp ne i8 %12, 0
  br i1 %13, label %14, label %120

; <label>:14                                      ; preds = %10
  %15 = load i8*, i8** %f, align 4
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp ne i32 %17, 37
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %14
  %20 = load i8*, i8** %f, align 4
  %21 = load i8, i8* %20, align 1
  %22 = load i8*, i8** %b, align 4
  %23 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %23, i8** %b, align 4
  store i8 %21, i8* %22, align 1
  %24 = load i32, i32* %ctr, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %ctr, align 4
  br label %117

; <label>:26                                      ; preds = %14
  %27 = load i8*, i8** %f, align 4
  %28 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %28, i8** %f, align 4
  store i32 0, i32* %arg_width, align 4
  br label %29

; <label>:29                                      ; preds = %41, %26
  %30 = load i8*, i8** %f, align 4
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp sge i32 %32, 48
  br i1 %33, label %34, label %39

; <label>:34                                      ; preds = %29
  %35 = load i8*, i8** %f, align 4
  %36 = load i8, i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp sle i32 %37, 57
  br label %39

; <label>:39                                      ; preds = %34, %29
  %40 = phi i1 [ false, %29 ], [ %38, %34 ]
  br i1 %40, label %41, label %52

; <label>:41                                      ; preds = %39
  %42 = load i32, i32* %arg_width, align 4
  %43 = mul i32 %42, 10
  store i32 %43, i32* %arg_width, align 4
  %44 = load i8*, i8** %f, align 4
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = sub nsw i32 %46, 48
  %48 = load i32, i32* %arg_width, align 4
  %49 = add i32 %48, %47
  store i32 %49, i32* %arg_width, align 4
  %50 = load i8*, i8** %f, align 4
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %f, align 4
  br label %29

; <label>:52                                      ; preds = %39
  %53 = load i8*, i8** %f, align 4
  %54 = load i8, i8* %53, align 1
  %55 = sext i8 %54 to i32
  switch i32 %55, label %109 [
    i32 115, label %56
    i32 99, label %76
    i32 120, label %84
    i32 100, label %94
    i32 37, label %104
  ]

; <label>:56                                      ; preds = %52
  %57 = va_arg i8** %3, i8*
  store i8* %57, i8** %4, align 4
  %58 = load i8*, i8** %4, align 4
  store i8* %58, i8** %s, align 4
  %59 = load i8*, i8** %s, align 4
  %60 = icmp eq i8* %59, null
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %56
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i8** %s, align 4
  br label %62

; <label>:62                                      ; preds = %61, %56
  br label %63

; <label>:63                                      ; preds = %67, %62
  %64 = load i8*, i8** %s, align 4
  %65 = load i8, i8* %64, align 1
  %66 = icmp ne i8 %65, 0
  br i1 %66, label %67, label %75

; <label>:67                                      ; preds = %63
  %68 = load i8*, i8** %s, align 4
  %69 = getelementptr inbounds i8, i8* %68, i32 1
  store i8* %69, i8** %s, align 4
  %70 = load i8, i8* %68, align 1
  %71 = load i8*, i8** %b, align 4
  %72 = getelementptr inbounds i8, i8* %71, i32 1
  store i8* %72, i8** %b, align 4
  store i8 %70, i8* %71, align 1
  %73 = load i32, i32* %ctr, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %ctr, align 4
  br label %63

; <label>:75                                      ; preds = %63
  br label %116

; <label>:76                                      ; preds = %52
  %77 = va_arg i8** %3, i32
  store i32 %77, i32* %5, align 4
  %78 = load i32, i32* %5, align 4
  %79 = trunc i32 %78 to i8
  %80 = load i8*, i8** %b, align 4
  %81 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %81, i8** %b, align 4
  store i8 %79, i8* %80, align 1
  %82 = load i32, i32* %ctr, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %ctr, align 4
  br label %116

; <label>:84                                      ; preds = %52
  %85 = load i32, i32* %ctr, align 4
  store i32 %85, i32* %i, align 4
  %86 = va_arg i8** %3, i32
  store i32 %86, i32* %6, align 4
  %87 = load i32, i32* %6, align 4
  %88 = load i32, i32* %arg_width, align 4
  %89 = load i8*, i8** %1, align 4
  call void @print_hex(i32 %87, i32 %88, i8* %89, i32* %i) #2
  %90 = load i32, i32* %i, align 4
  store i32 %90, i32* %ctr, align 4
  %91 = load i8*, i8** %1, align 4
  %92 = load i32, i32* %i, align 4
  %93 = getelementptr inbounds i8, i8* %91, i32 %92
  store i8* %93, i8** %b, align 4
  br label %116

; <label>:94                                      ; preds = %52
  %95 = load i32, i32* %ctr, align 4
  store i32 %95, i32* %i, align 4
  %96 = va_arg i8** %3, i32
  store i32 %96, i32* %7, align 4
  %97 = load i32, i32* %7, align 4
  %98 = load i32, i32* %arg_width, align 4
  %99 = load i8*, i8** %1, align 4
  call void @print_dec(i32 %97, i32 %98, i8* %99, i32* %i) #2
  %100 = load i32, i32* %i, align 4
  store i32 %100, i32* %ctr, align 4
  %101 = load i8*, i8** %1, align 4
  %102 = load i32, i32* %i, align 4
  %103 = getelementptr inbounds i8, i8* %101, i32 %102
  store i8* %103, i8** %b, align 4
  br label %116

; <label>:104                                     ; preds = %52
  %105 = load i8*, i8** %b, align 4
  %106 = getelementptr inbounds i8, i8* %105, i32 1
  store i8* %106, i8** %b, align 4
  store i8 37, i8* %105, align 1
  %107 = load i32, i32* %ctr, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %ctr, align 4
  br label %116

; <label>:109                                     ; preds = %52
  %110 = load i8*, i8** %f, align 4
  %111 = load i8, i8* %110, align 1
  %112 = load i8*, i8** %b, align 4
  %113 = getelementptr inbounds i8, i8* %112, i32 1
  store i8* %113, i8** %b, align 4
  store i8 %111, i8* %112, align 1
  %114 = load i32, i32* %ctr, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %ctr, align 4
  br label %116

; <label>:116                                     ; preds = %109, %104, %94, %84, %76, %75
  br label %117

; <label>:117                                     ; preds = %116, %19
  %118 = load i8*, i8** %f, align 4
  %119 = getelementptr inbounds i8, i8* %118, i32 1
  store i8* %119, i8** %f, align 4
  br label %10

; <label>:120                                     ; preds = %10
  %121 = load i8*, i8** %b, align 4
  store i8 0, i8* %121, align 1
  %122 = load i8*, i8** %b, align 4
  %123 = load i8*, i8** %1, align 4
  %124 = ptrtoint i8* %122 to i32
  %125 = ptrtoint i8* %123 to i32
  %126 = sub i32 %124, %125
  ret i32 %126
}

; Function Attrs: nounwind
define internal void @print_hex(i32 %value, i32 %width, i8* %buf, i32* %ptr) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 4
  %4 = alloca i32*, align 4
  %i = alloca i32, align 4
  %n_width = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %value, i32* %1, align 4
  store i32 %width, i32* %2, align 4
  store i8* %buf, i8** %3, align 4
  store i32* %ptr, i32** %4, align 4
  %5 = load i32, i32* %2, align 4
  store i32 %5, i32* %i, align 4
  %6 = load i32, i32* %i, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store i32 8, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %8, %0
  store i32 1, i32* %n_width, align 4
  store i32 15, i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %19, %9
  %11 = load i32, i32* %1, align 4
  %12 = load i32, i32* %j, align 4
  %13 = icmp ugt i32 %11, %12
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %10
  %15 = load i32, i32* %j, align 4
  %16 = icmp ult i32 %15, -1
  br label %17

; <label>:17                                      ; preds = %14, %10
  %18 = phi i1 [ false, %10 ], [ %16, %14 ]
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %17
  %20 = load i32, i32* %n_width, align 4
  %21 = add i32 %20, 1
  store i32 %21, i32* %n_width, align 4
  %22 = load i32, i32* %j, align 4
  %23 = mul i32 %22, 16
  store i32 %23, i32* %j, align 4
  %24 = load i32, i32* %j, align 4
  %25 = add i32 %24, 15
  store i32 %25, i32* %j, align 4
  br label %10

; <label>:26                                      ; preds = %17
  br label %27

; <label>:27                                      ; preds = %31, %26
  %28 = load i32, i32* %i, align 4
  %29 = load i32, i32* %n_width, align 4
  %30 = icmp sgt i32 %28, %29
  br i1 %30, label %31, label %41

; <label>:31                                      ; preds = %27
  %32 = load i32*, i32** %4, align 4
  %33 = load i32, i32* %32, align 4
  %34 = load i8*, i8** %3, align 4
  %35 = getelementptr inbounds i8, i8* %34, i32 %33
  store i8 48, i8* %35, align 1
  %36 = load i32*, i32** %4, align 4
  %37 = load i32, i32* %36, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %36, align 4
  %39 = load i32, i32* %i, align 4
  %40 = add nsw i32 %39, -1
  store i32 %40, i32* %i, align 4
  br label %27

; <label>:41                                      ; preds = %27
  %42 = load i32, i32* %n_width, align 4
  store i32 %42, i32* %i, align 4
  %43 = load i32, i32* %1, align 4
  %44 = mul i32 %43, 2
  store i32 %44, i32* %1, align 4
  br label %45

; <label>:45                                      ; preds = %49, %41
  %46 = load i32, i32* %i, align 4
  %47 = add nsw i32 %46, -1
  store i32 %47, i32* %i, align 4
  %48 = icmp sgt i32 %46, 0
  br i1 %48, label %49, label %64

; <label>:49                                      ; preds = %45
  %50 = load i32, i32* %1, align 4
  %51 = load i32, i32* %i, align 4
  %52 = mul nsw i32 %51, 4
  %53 = lshr i32 %50, %52
  %54 = and i32 %53, 15
  %55 = getelementptr inbounds [17 x i8], [17 x i8]* @.str.9, i32 0, i32 %54
  %56 = load i8, i8* %55, align 1
  %57 = load i32*, i32** %4, align 4
  %58 = load i32, i32* %57, align 4
  %59 = load i8*, i8** %3, align 4
  %60 = getelementptr inbounds i8, i8* %59, i32 %58
  store i8 %56, i8* %60, align 1
  %61 = load i32*, i32** %4, align 4
  %62 = load i32, i32* %61, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %61, align 4
  br label %45

; <label>:64                                      ; preds = %45
  ret void
}

; Function Attrs: nounwind
define internal void @print_dec(i32 %value, i32 %width, i8* %buf, i32* %ptr) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 4
  %4 = alloca i32*, align 4
  %n_width = alloca i32, align 4
  %i = alloca i32, align 4
  %printed = alloca i32, align 4
  %n = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %value, i32* %1, align 4
  store i32 %width, i32* %2, align 4
  store i8* %buf, i8** %3, align 4
  store i32* %ptr, i32** %4, align 4
  store i32 1, i32* %n_width, align 4
  store i32 9, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %14, %0
  %6 = load i32, i32* %1, align 4
  %7 = load i32, i32* %i, align 4
  %8 = icmp ugt i32 %6, %7
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %5
  %10 = load i32, i32* %i, align 4
  %11 = icmp ult i32 %10, -1
  br label %12

; <label>:12                                      ; preds = %9, %5
  %13 = phi i1 [ false, %5 ], [ %11, %9 ]
  br i1 %13, label %14, label %21

; <label>:14                                      ; preds = %12
  %15 = load i32, i32* %n_width, align 4
  %16 = add i32 %15, 1
  store i32 %16, i32* %n_width, align 4
  %17 = load i32, i32* %i, align 4
  %18 = mul i32 %17, 10
  store i32 %18, i32* %i, align 4
  %19 = load i32, i32* %i, align 4
  %20 = add i32 %19, 9
  store i32 %20, i32* %i, align 4
  br label %5

; <label>:21                                      ; preds = %12
  store i32 0, i32* %printed, align 4
  br label %22

; <label>:22                                      ; preds = %28, %21
  %23 = load i32, i32* %n_width, align 4
  %24 = load i32, i32* %printed, align 4
  %25 = add i32 %23, %24
  %26 = load i32, i32* %2, align 4
  %27 = icmp ult i32 %25, %26
  br i1 %27, label %28, label %38

; <label>:28                                      ; preds = %22
  %29 = load i32*, i32** %4, align 4
  %30 = load i32, i32* %29, align 4
  %31 = load i8*, i8** %3, align 4
  %32 = getelementptr inbounds i8, i8* %31, i32 %30
  store i8 48, i8* %32, align 1
  %33 = load i32*, i32** %4, align 4
  %34 = load i32, i32* %33, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %33, align 4
  %36 = load i32, i32* %printed, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %printed, align 4
  br label %22

; <label>:38                                      ; preds = %22
  %39 = load i32, i32* %n_width, align 4
  store i32 %39, i32* %i, align 4
  br label %40

; <label>:40                                      ; preds = %43, %38
  %41 = load i32, i32* %i, align 4
  %42 = icmp ugt i32 %41, 0
  br i1 %42, label %43, label %61

; <label>:43                                      ; preds = %40
  %44 = load i32, i32* %1, align 4
  %45 = call i32 @div10(i32 %44) #2
  store i32 %45, i32* %n, align 4
  %46 = load i32, i32* %1, align 4
  %47 = call i32 @mod10(i32 %46) #2
  store i32 %47, i32* %r, align 4
  %48 = load i32, i32* %r, align 4
  %49 = add nsw i32 %48, 48
  %50 = trunc i32 %49 to i8
  %51 = load i32*, i32** %4, align 4
  %52 = load i32, i32* %51, align 4
  %53 = load i32, i32* %i, align 4
  %54 = add i32 %52, %53
  %55 = sub i32 %54, 1
  %56 = load i8*, i8** %3, align 4
  %57 = getelementptr inbounds i8, i8* %56, i32 %55
  store i8 %50, i8* %57, align 1
  %58 = load i32, i32* %i, align 4
  %59 = add i32 %58, -1
  store i32 %59, i32* %i, align 4
  %60 = load i32, i32* %n, align 4
  store i32 %60, i32* %1, align 4
  br label %40

; <label>:61                                      ; preds = %40
  %62 = load i32, i32* %n_width, align 4
  %63 = load i32*, i32** %4, align 4
  %64 = load i32, i32* %63, align 4
  %65 = add i32 %64, %62
  store i32 %65, i32* %63, align 4
  ret void
}

; Function Attrs: nounwind
define i32 @_sprintf(i8* %buf, i8* %fmt, ...) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %args = alloca i8*, align 4
  %out = alloca i32, align 4
  store i8* %buf, i8** %1, align 4
  store i8* %fmt, i8** %2, align 4
  %3 = bitcast i8** %args to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load i8*, i8** %1, align 4
  %5 = load i8*, i8** %2, align 4
  %6 = load i8*, i8** %args, align 4
  %7 = call i32 @vasprintf(i8* %4, i8* %5, i8* %6) #2
  store i32 %7, i32* %out, align 4
  %8 = bitcast i8** %args to i8*
  call void @llvm.va_end(i8* %8)
  %9 = load i32, i32* %out, align 4
  ret i32 %9
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind
define void @wait_stdout_flush() #0 {
  br label %1

; <label>:1                                       ; preds = %8, %0
  %2 = load %struct.IO*, %struct.IO** @io, align 4
  %3 = getelementptr inbounds %struct.IO, %struct.IO* %2, i32 0, i32 0
  %4 = getelementptr inbounds %struct.anon, %struct.anon* %3, i32 0, i32 5
  %5 = load i8, i8* %4, align 1
  %6 = icmp ne i8 %5, 0
  %7 = xor i1 %6, true
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %1
  br label %1

; <label>:9                                       ; preds = %1
  ret void
}

; Function Attrs: nounwind
define void @putc(i8 signext %ch) #0 {
  %1 = alloca i8, align 1
  store i8 %ch, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = load %struct.IO*, %struct.IO** @io, align 4
  %4 = getelementptr inbounds %struct.IO, %struct.IO* %3, i32 0, i32 0
  %5 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 4
  store i8 %2, i8* %5, align 1
  ret void
}

; Function Attrs: nounwind
define void @puts(i8* %str) #0 {
  %1 = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %str, i8** %1, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32, i32* %i, align 4
  %4 = load i8*, i8** %1, align 4
  %5 = call i32 @strlen(i8* %4) #2
  %6 = icmp ult i32 %3, %5
  br i1 %6, label %7, label %15

; <label>:7                                       ; preds = %2
  %8 = load i32, i32* %i, align 4
  %9 = load i8*, i8** %1, align 4
  %10 = getelementptr inbounds i8, i8* %9, i32 %8
  %11 = load i8, i8* %10, align 1
  call void @putc(i8 signext %11) #2
  br label %12

; <label>:12                                      ; preds = %7
  %13 = load i32, i32* %i, align 4
  %14 = add i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %2

; <label>:15                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind
define i32 @printf(i8* %fmt, ...) #0 {
  %1 = alloca i8*, align 4
  %args = alloca i8*, align 4
  store i8* %fmt, i8** %1, align 4
  br label %2

; <label>:2                                       ; preds = %0
  %3 = bitcast i8** %args to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load i8*, i8** %1, align 4
  %5 = load i8*, i8** %args, align 4
  %6 = call i32 @vasprintf(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @__printf_buff__, i32 0, i32 0), i8* %4, i8* %5) #2
  %7 = bitcast i8** %args to i8*
  call void @llvm.va_end(i8* %7)
  br label %8

; <label>:8                                       ; preds = %2
  call void @puts(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @__printf_buff__, i32 0, i32 0)) #2
  %9 = call i32 @strlen(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @__printf_buff__, i32 0, i32 0)) #2
  ret i32 %9
}

; Function Attrs: nounwind
define signext i8 @kbhit() #0 {
  %1 = load %struct.IO*, %struct.IO** @io, align 4
  %2 = getelementptr inbounds %struct.IO, %struct.IO* %1, i32 0, i32 0
  %3 = getelementptr inbounds %struct.anon, %struct.anon* %2, i32 0, i32 7
  %4 = load i8, i8* %3, align 1
  ret i8 %4
}

; Function Attrs: nounwind
define signext i8 @getch() #0 {
  br label %1

; <label>:1                                       ; preds = %5, %0
  %2 = call signext i8 @kbhit() #2
  %3 = icmp ne i8 %2, 0
  %4 = xor i1 %3, true
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %1
  br label %1

; <label>:6                                       ; preds = %1
  %7 = load %struct.IO*, %struct.IO** @io, align 4
  %8 = getelementptr inbounds %struct.IO, %struct.IO* %7, i32 0, i32 0
  %9 = getelementptr inbounds %struct.anon, %struct.anon* %8, i32 0, i32 6
  %10 = load i8, i8* %9, align 1
  ret i8 %10
}

; Function Attrs: nounwind
define signext i8 @getch_async() #0 {
  %1 = load %struct.IO*, %struct.IO** @io, align 4
  %2 = getelementptr inbounds %struct.IO, %struct.IO* %1, i32 0, i32 0
  %3 = getelementptr inbounds %struct.anon, %struct.anon* %2, i32 0, i32 6
  %4 = load i8, i8* %3, align 1
  ret i8 %4
}

; Function Attrs: nounwind
define i8* @malloc(i32 %size) #0 {
  %1 = alloca i32, align 4
  %thisloc = alloca i32, align 4
  store i32 %size, i32* %1, align 4
  %2 = load i32, i32* @alloc_head, align 4
  store i32 %2, i32* %thisloc, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* @alloc_head, align 4
  %5 = add i32 %4, %3
  store i32 %5, i32* @alloc_head, align 4
  %6 = load i32, i32* %thisloc, align 4
  %7 = inttoptr i32 %6 to i8*
  ret i8* %7
}

; Function Attrs: nounwind
define i8* @memcpy(i8* %dst, i8* %src, i32 %len) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %3 = alloca i32, align 4
  %dst_ = alloca i8*, align 4
  %src_ = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %dst, i8** %1, align 4
  store i8* %src, i8** %2, align 4
  store i32 %len, i32* %3, align 4
  %4 = load i8*, i8** %1, align 4
  store i8* %4, i8** %dst_, align 4
  %5 = load i8*, i8** %2, align 4
  store i8* %5, i8** %src_, align 4
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %18, %0
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %3, align 4
  %9 = icmp ult i32 %7, %8
  br i1 %9, label %10, label %21

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %i, align 4
  %12 = load i8*, i8** %src_, align 4
  %13 = getelementptr inbounds i8, i8* %12, i32 %11
  %14 = load i8, i8* %13, align 1
  %15 = load i32, i32* %i, align 4
  %16 = load i8*, i8** %dst_, align 4
  %17 = getelementptr inbounds i8, i8* %16, i32 %15
  store i8 %14, i8* %17, align 1
  br label %18

; <label>:18                                      ; preds = %10
  %19 = load i32, i32* %i, align 4
  %20 = add i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %6

; <label>:21                                      ; preds = %6
  %22 = load i8*, i8** %1, align 4
  ret i8* %22
}

; Function Attrs: nounwind
define i8* @memset(i8* %dst, i32 %val, i32 %len) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %dst_ = alloca i8*, align 4
  %i = alloca i32, align 4
  store i8* %dst, i8** %1, align 4
  store i32 %val, i32* %2, align 4
  store i32 %len, i32* %3, align 4
  %4 = load i8*, i8** %1, align 4
  store i8* %4, i8** %dst_, align 4
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %15, %0
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %3, align 4
  %8 = icmp ult i32 %6, %7
  br i1 %8, label %9, label %18

; <label>:9                                       ; preds = %5
  %10 = load i32, i32* %2, align 4
  %11 = trunc i32 %10 to i8
  %12 = load i32, i32* %i, align 4
  %13 = load i8*, i8** %dst_, align 4
  %14 = getelementptr inbounds i8, i8* %13, i32 %12
  store i8 %11, i8* %14, align 1
  br label %15

; <label>:15                                      ; preds = %9
  %16 = load i32, i32* %i, align 4
  %17 = add i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %5

; <label>:18                                      ; preds = %5
  %19 = load i8*, i8** %1, align 4
  ret i8* %19
}

; Function Attrs: nounwind
define signext i8 @video_is_enabled() #0 {
  %1 = load %struct.IO*, %struct.IO** @io, align 4
  %2 = getelementptr inbounds %struct.IO, %struct.IO* %1, i32 0, i32 2
  %3 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %2, i32 0, i32 1
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = and i32 %5, 2
  %7 = trunc i32 %6 to i8
  ret i8 %7
}

; Function Attrs: nounwind
define signext i8 @video_is_init() #0 {
  %1 = load %struct.IO*, %struct.IO** @io, align 4
  %2 = getelementptr inbounds %struct.IO, %struct.IO* %1, i32 0, i32 2
  %3 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %2, i32 0, i32 1
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = and i32 %5, 4
  %7 = trunc i32 %6 to i8
  ret i8 %7
}

; Function Attrs: nounwind
define void @initialize_video() #0 {
  %1 = load %struct.IO*, %struct.IO** @io, align 4
  %2 = getelementptr inbounds %struct.IO, %struct.IO* %1, i32 0, i32 2
  %3 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %2, i32 0, i32 0
  store i8 1, i8* %3, align 1
  %4 = load %struct.IO*, %struct.IO** @io, align 4
  %5 = getelementptr inbounds %struct.IO, %struct.IO* %4, i32 0, i32 2
  %6 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %5, i32 0, i32 2
  store i16 0, i16* %6, align 1
  %7 = load %struct.IO*, %struct.IO** @io, align 4
  %8 = getelementptr inbounds %struct.IO, %struct.IO* %7, i32 0, i32 2
  %9 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %8, i32 0, i32 3
  store i16 0, i16* %9, align 1
  %10 = load %struct.IO*, %struct.IO** @io, align 4
  %11 = getelementptr inbounds %struct.IO, %struct.IO* %10, i32 0, i32 2
  %12 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %11, i32 0, i32 4
  store i8 0, i8* %12, align 1
  %13 = load %struct.IO*, %struct.IO** @io, align 4
  %14 = getelementptr inbounds %struct.IO, %struct.IO* %13, i32 0, i32 2
  %15 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %14, i32 0, i32 5
  store i8 0, i8* %15, align 1
  br label %16

; <label>:16                                      ; preds = %20, %0
  %17 = call signext i8 @video_is_init() #2
  %18 = icmp ne i8 %17, 0
  %19 = xor i1 %18, true
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16
  br label %16

; <label>:21                                      ; preds = %16
  ret void
}

; Function Attrs: nounwind
define void @video_backend_setaddress(i16 zeroext %x, i16 zeroext %y) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  %ptr = alloca i16*, align 4
  store i16 %x, i16* %1, align 2
  store i16 %y, i16* %2, align 2
  %3 = load %struct.IO*, %struct.IO** @io, align 4
  %4 = getelementptr inbounds %struct.IO, %struct.IO* %3, i32 0, i32 2
  %5 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %4, i32 0, i32 2
  store i16* %5, i16** %ptr, align 4
  %6 = load i16, i16* %1, align 2
  %7 = load i16*, i16** %ptr, align 4
  store i16 %6, i16* %7, align 2
  %8 = load %struct.IO*, %struct.IO** @io, align 4
  %9 = getelementptr inbounds %struct.IO, %struct.IO* %8, i32 0, i32 2
  %10 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %9, i32 0, i32 3
  store i16* %10, i16** %ptr, align 4
  %11 = load i16, i16* %2, align 2
  %12 = load i16*, i16** %ptr, align 4
  store i16 %11, i16* %12, align 2
  ret void
}

; Function Attrs: nounwind
define void @video_pixels_pack(i32 %loc, %struct.rgbpack_t* %rgbpack) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.rgbpack_t*, align 4
  %rgbpack_64cast = alloca i64*, align 4
  %pxdata_ptr = alloca i64*, align 4
  store i32 %loc, i32* %1, align 4
  store %struct.rgbpack_t* %rgbpack, %struct.rgbpack_t** %2, align 4
  %3 = load %struct.rgbpack_t*, %struct.rgbpack_t** %2, align 4
  %4 = bitcast %struct.rgbpack_t* %3 to i64*
  store i64* %4, i64** %rgbpack_64cast, align 4
  %5 = load %struct.IO*, %struct.IO** @io, align 4
  %6 = getelementptr inbounds %struct.IO, %struct.IO* %5, i32 0, i32 2
  %7 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %6, i32 0, i32 7
  %8 = getelementptr inbounds [50 x i64], [50 x i64]* %7, i32 0, i32 0
  store i64* %8, i64** %pxdata_ptr, align 4
  %9 = load i64*, i64** %rgbpack_64cast, align 4
  %10 = load i64, i64* %9, align 8
  %11 = load i32, i32* %1, align 4
  %12 = load i64*, i64** %pxdata_ptr, align 4
  %13 = getelementptr inbounds i64, i64* %12, i32 %11
  store i64 %10, i64* %13, align 8
  ret void
}

; Function Attrs: nounwind
define void @video_backend_render() #0 {
  %1 = load %struct.IO*, %struct.IO** @io, align 4
  %2 = getelementptr inbounds %struct.IO, %struct.IO* %1, i32 0, i32 2
  %3 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %2, i32 0, i32 5
  store i8 1, i8* %3, align 1
  ret void
}

; Function Attrs: nounwind
define void @video_backend_render_block(i32 %blocksize) #0 {
  %1 = alloca i32, align 4
  store i32 %blocksize, i32* %1, align 4
  %2 = load i32, i32* @video_render_counter, align 4
  %3 = add i32 %2, 1
  store i32 %3, i32* @video_render_counter, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp uge i32 %2, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i32 0, i32* @video_render_counter, align 4
  call void @video_backend_render() #2
  br label %7

; <label>:7                                       ; preds = %6, %0
  ret void
}

; Function Attrs: nounwind
define void @initialize_stdout() #0 {
  %1 = load %struct.IO*, %struct.IO** @io, align 4
  %2 = getelementptr inbounds %struct.IO, %struct.IO* %1, i32 0, i32 0
  %3 = getelementptr inbounds %struct.anon, %struct.anon* %2, i32 0, i32 0
  store i8 1, i8* %3, align 1
  %4 = load %struct.IO*, %struct.IO** @io, align 4
  %5 = getelementptr inbounds %struct.IO, %struct.IO* %4, i32 0, i32 0
  %6 = getelementptr inbounds %struct.anon, %struct.anon* %5, i32 0, i32 1
  store i8 1, i8* %6, align 1
  ret void
}

; Function Attrs: nounwind
define void @initialize_stdin() #0 {
  %1 = load %struct.IO*, %struct.IO** @io, align 4
  %2 = getelementptr inbounds %struct.IO, %struct.IO* %1, i32 0, i32 0
  %3 = getelementptr inbounds %struct.anon, %struct.anon* %2, i32 0, i32 0
  store i8 1, i8* %3, align 1
  %4 = load %struct.IO*, %struct.IO** @io, align 4
  %5 = getelementptr inbounds %struct.IO, %struct.IO* %4, i32 0, i32 0
  %6 = getelementptr inbounds %struct.anon, %struct.anon* %5, i32 0, i32 2
  store i8 1, i8* %6, align 1
  ret void
}

; Function Attrs: nounwind
define void @enable_timer() #0 {
  %1 = load %struct.IO*, %struct.IO** @io, align 4
  %2 = getelementptr inbounds %struct.IO, %struct.IO* %1, i32 0, i32 1
  %3 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %2, i32 0, i32 0
  store i8 1, i8* %3, align 1
  %4 = load %struct.IO*, %struct.IO** @io, align 4
  %5 = getelementptr inbounds %struct.IO, %struct.IO* %4, i32 0, i32 1
  %6 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %5, i32 0, i32 1
  store i8 1, i8* %6, align 1
  ret void
}

; Function Attrs: nounwind
define void @initialize_fisc_machine() #0 {
  call void @initialize_stdout() #2
  call void @initialize_stdin() #2
  call void @initialize_video() #2
  ret void
}

; Function Attrs: nounwind
define void @showHeaderFooterLine() #0 {
  call void @puts(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.1, i32 0, i32 0)) #2
  ret void
}

; Function Attrs: nounwind
define void @welcome() #0 {
  call void @initialize_fisc_machine() #2
  call void @showHeaderFooterLine() #2
  call void @puts(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i32 0, i32 0)) #2
  call void @puts(i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.3, i32 0, i32 0)) #2
  call void @showHeaderFooterLine() #2
  call void @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0)) #2
  ret void
}

; Function Attrs: nounwind
define void @goodbye() #0 {
  call void @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0)) #2
  call void @showHeaderFooterLine() #2
  call void @puts(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.6, i32 0, i32 0)) #2
  call void @showHeaderFooterLine() #2
  call void @puts(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0)) #2
  ret void
}

; Function Attrs: nounwind
define void @video_test() #0 {
  %rgbs = alloca %struct.rgbpack_t*, align 4
  %i = alloca i32, align 4
  store %struct.rgbpack_t* bitcast (i64* @video_test.video_colorinfo to %struct.rgbpack_t*), %struct.rgbpack_t** %rgbs, align 4
  %1 = load i16, i16* @video_test.video_y, align 2
  %2 = zext i16 %1 to i32
  %3 = icmp slt i32 %2, 600
  br i1 %3, label %4, label %140

; <label>:4                                       ; preds = %0
  %5 = load i16, i16* @video_test.video_x, align 2
  %6 = load i16, i16* @video_test.video_y, align 2
  call void @video_backend_setaddress(i16 zeroext %5, i16 zeroext %6) #2
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %13, %4
  %8 = load i32, i32* %i, align 4
  %9 = icmp slt i32 %8, 50
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* %i, align 4
  %12 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  call void @video_pixels_pack(i32 %11, %struct.rgbpack_t* %12) #2
  br label %13

; <label>:13                                      ; preds = %10
  %14 = load i32, i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %7

; <label>:16                                      ; preds = %7
  %17 = load i16, i16* @video_test.video_x, align 2
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 %18, 100
  %20 = trunc i32 %19 to i16
  store i16 %20, i16* @video_test.video_x, align 2
  %21 = load i16, i16* @video_test.video_x, align 2
  %22 = zext i16 %21 to i32
  %23 = icmp sgt i32 %22, 800
  br i1 %23, label %24, label %139

; <label>:24                                      ; preds = %16
  store i16 0, i16* @video_test.video_x, align 2
  %25 = load i16, i16* @video_test.video_y, align 2
  %26 = add i16 %25, 1
  store i16 %26, i16* @video_test.video_y, align 2
  %27 = load i8, i8* @video_test.inc, align 1
  %28 = icmp ne i8 %27, 0
  br i1 %28, label %29, label %82

; <label>:29                                      ; preds = %24
  %30 = load i16, i16* @video_test.video_y, align 2
  %31 = zext i16 %30 to i32
  %32 = icmp sge i32 %31, 254
  br i1 %32, label %33, label %39

; <label>:33                                      ; preds = %29
  %34 = load i8, i8* @video_test.inc, align 1
  %35 = icmp ne i8 %34, 0
  %36 = xor i1 %35, true
  %37 = zext i1 %36 to i32
  %38 = trunc i32 %37 to i8
  store i8 %38, i8* @video_test.inc, align 1
  br label %39

; <label>:39                                      ; preds = %33, %29
  %40 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %41 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %40, i32 0, i32 0
  %42 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %41, i32 0, i32 0
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = add nsw i32 %44, 2
  %46 = trunc i32 %45 to i8
  store i8 %46, i8* %42, align 1
  %47 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %48 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %47, i32 0, i32 0
  %49 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %48, i32 0, i32 1
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = add nsw i32 %51, 3
  %53 = trunc i32 %52 to i8
  store i8 %53, i8* %49, align 1
  %54 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %55 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %54, i32 0, i32 0
  %56 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %55, i32 0, i32 2
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = add nsw i32 %58, 4
  %60 = trunc i32 %59 to i8
  store i8 %60, i8* %56, align 1
  %61 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %62 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %61, i32 0, i32 1
  %63 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %62, i32 0, i32 0
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = add nsw i32 %65, 2
  %67 = trunc i32 %66 to i8
  store i8 %67, i8* %63, align 1
  %68 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %69 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %68, i32 0, i32 1
  %70 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %69, i32 0, i32 1
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = add nsw i32 %72, 3
  %74 = trunc i32 %73 to i8
  store i8 %74, i8* %70, align 1
  %75 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %76 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %75, i32 0, i32 1
  %77 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %76, i32 0, i32 2
  %78 = load i8, i8* %77, align 1
  %79 = zext i8 %78 to i32
  %80 = add nsw i32 %79, 4
  %81 = trunc i32 %80 to i8
  store i8 %81, i8* %77, align 1
  br label %138

; <label>:82                                      ; preds = %24
  %83 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %84 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %83, i32 0, i32 0
  %85 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %84, i32 0, i32 0
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i32
  %88 = sub nsw i32 %87, 2
  %89 = trunc i32 %88 to i8
  store i8 %89, i8* %85, align 1
  %90 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %91 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %90, i32 0, i32 0
  %92 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %91, i32 0, i32 1
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = sub nsw i32 %94, 2
  %96 = trunc i32 %95 to i8
  store i8 %96, i8* %92, align 1
  %97 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %98 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %97, i32 0, i32 0
  %99 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %98, i32 0, i32 2
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = sub nsw i32 %101, 2
  %103 = trunc i32 %102 to i8
  store i8 %103, i8* %99, align 1
  %104 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %105 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %104, i32 0, i32 1
  %106 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %105, i32 0, i32 0
  %107 = load i8, i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = sub nsw i32 %108, 2
  %110 = trunc i32 %109 to i8
  store i8 %110, i8* %106, align 1
  %111 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %112 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %111, i32 0, i32 1
  %113 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %112, i32 0, i32 1
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = sub nsw i32 %115, 2
  %117 = trunc i32 %116 to i8
  store i8 %117, i8* %113, align 1
  %118 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %119 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %118, i32 0, i32 1
  %120 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %119, i32 0, i32 2
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = sub nsw i32 %122, 2
  %124 = trunc i32 %123 to i8
  store i8 %124, i8* %120, align 1
  %125 = load %struct.rgbpack_t*, %struct.rgbpack_t** %rgbs, align 4
  %126 = getelementptr inbounds %struct.rgbpack_t, %struct.rgbpack_t* %125, i32 0, i32 0
  %127 = getelementptr inbounds %struct.rgb_t, %struct.rgb_t* %126, i32 0, i32 0
  %128 = load i8, i8* %127, align 1
  %129 = zext i8 %128 to i32
  %130 = icmp sle i32 %129, 0
  br i1 %130, label %131, label %137

; <label>:131                                     ; preds = %82
  %132 = load i8, i8* @video_test.inc, align 1
  %133 = icmp ne i8 %132, 0
  %134 = xor i1 %133, true
  %135 = zext i1 %134 to i32
  %136 = trunc i32 %135 to i8
  store i8 %136, i8* @video_test.inc, align 1
  br label %137

; <label>:137                                     ; preds = %131, %82
  br label %138

; <label>:138                                     ; preds = %137, %39
  br label %139

; <label>:139                                     ; preds = %138, %16
  call void @video_backend_render_block(i32 40) #2
  br label %141

; <label>:140                                     ; preds = %0
  call void @video_backend_render_block(i32 0) #2
  br label %141

; <label>:141                                     ; preds = %140, %139
  ret void
}

; Function Attrs: nounwind
define void @start() #0 {
  %ch = alloca i8, align 1
  call void @welcome() #2
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.8, i32 0, i32 0)) #2
  br label %2

; <label>:2                                       ; preds = %0, %17
  %3 = call signext i8 @video_is_enabled() #2
  %4 = icmp ne i8 %3, 0
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %2
  br label %18

; <label>:6                                       ; preds = %2
  call void @video_test() #2
  %7 = call signext i8 @kbhit() #2
  %8 = icmp ne i8 %7, 0
  br i1 %8, label %9, label %17

; <label>:9                                       ; preds = %6
  %10 = call signext i8 @getch_async() #2
  store i8 %10, i8* %ch, align 1
  %11 = load i8, i8* %ch, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 113
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %9
  br label %18

; <label>:15                                      ; preds = %9
  %16 = load i8, i8* %ch, align 1
  call void @putc(i8 signext %16) #2
  br label %17

; <label>:17                                      ; preds = %15, %6
  br label %2

; <label>:18                                      ; preds = %14, %5
  call void @goodbye() #2
  ret void
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nobuiltin }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.1 "}