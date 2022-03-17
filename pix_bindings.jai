//
// This file was auto-generated using the following command:
//
// jai pix_generate.jai
//



PIX_CAPTURE_TIMING :: 1 << 0;
PIX_CAPTURE_GPU :: 1 << 1;
PIX_CAPTURE_FUNCTION_SUMMARY :: 1 << 2;
PIX_CAPTURE_FUNCTION_DETAILS :: 1 << 3;
PIX_CAPTURE_CALLGRAPH :: 1 << 4;
PIX_CAPTURE_INSTRUCTION_TRACE :: 1 << 5;
PIX_CAPTURE_SYSTEM_MONITOR_COUNTERS :: 1 << 6;
PIX_CAPTURE_VIDEO :: 1 << 7;
PIX_CAPTURE_AUDIO :: 1 << 8;
PIX_CAPTURE_RESERVED :: 1 << 15;

WINPIX_EVENT_UNICODE_VERSION :: 0;
WINPIX_EVENT_ANSI_VERSION :: 1;
WINPIX_EVENT_PIX3BLOB_VERSION :: 2;

PIXCaptureParameters :: union {
    PIXCaptureStorage :: enum s32 {
        Memory :: 0;
    }

    GpuCaptureParameters :: struct {
        FileName: PCWSTR;
    }

    GpuCaptureParameters_:    GpuCaptureParameters;

    TimingCaptureParameters :: struct {
        FileName:                   PCWSTR;
        MaximumToolingMemorySizeMb: u32;
        CaptureStorage:             PIXCaptureStorage;

        CaptureGpuTiming:           BOOL;

        CaptureCallstacks:          BOOL;
        CaptureCpuSamples:          BOOL;
        CpuSamplesPerSecond:        u32;

        CaptureFileIO:              BOOL;

        CaptureVirtualAllocEvents:  BOOL;
        CaptureHeapAllocEvents:     BOOL;
        CaptureXMemEvents:          BOOL; // Xbox only
        CapturePixMemEvents:        BOOL; // Xbox only
    }

    TimingCaptureParameters_: TimingCaptureParameters;
}

PPIXCaptureParameters :: *PIXCaptureParameters;

// PIXEventsThreadInfo is defined in PIXEventsCommon.h
PIXEventsThreadInfo :: struct {}

PIXGetTimestampCounter :: () -> u64 #foreign pix_wrapper "?PIXGetTimestampCounter@@YA_KXZ";

PIXGpuCaptureNextFrames :: (unk0: PCWSTR, unk1: u32) -> HRESULT #foreign pix_wrapper "?PIXGpuCaptureNextFrames@@YAJPEB_WI@Z";
PIXSetTargetWindow :: (unk0: HWND) -> HRESULT #foreign pix_wrapper "?PIXSetTargetWindow@@YAJPEAUHWND__@@@Z";
PIXLoadLatestWinPixGpuCapturerLibrary :: () -> HMODULE #foreign pix_wrapper "?PIXLoadLatestWinPixGpuCapturerLibrary@@YAPEAUHINSTANCE__@@XZ";

PIXEndEvent :: () -> void #foreign pix_wrapper "?PIXEndEvent@@YAXXZ";

PIX_COLOR_INDEX :: (i: u8) -> u32 #foreign pix_wrapper "?PIX_COLOR_INDEX@@YAIE@Z";

pix_load_capturer :: () -> HRESULT #foreign pix_wrapper "?pix_load_capturer@@YAJXZ";
pix_begin_capture :: (params: *PIXCaptureParameters) -> HRESULT #foreign pix_wrapper "?pix_begin_capture@@YAJPEATPIXCaptureParameters@@@Z";
pix_end_capture :: () -> HRESULT #foreign pix_wrapper "?pix_end_capture@@YAJXZ";
pix_set_target_window :: (hwnd: HWND) -> HRESULT #foreign pix_wrapper "?pix_set_target_window@@YAJPEAUHWND__@@@Z";
pix_gpu_capture_next_frames :: (file_name: PCWSTR, frames_count: s32) -> HRESULT #foreign pix_wrapper "?pix_gpu_capture_next_frames@@YAJPEB_WH@Z";

pix_begin_event :: (color: u64, str: PCWSTR) -> void #foreign pix_wrapper "?pix_begin_event@@YAX_KPEB_W@Z";
pix_end_event :: () -> void #foreign pix_wrapper "?pix_end_event@@YAXXZ";

pix_begin_event :: (cmd_list: *ID3D12GraphicsCommandList, color: u64, str: PCWSTR) -> void #foreign pix_wrapper "?pix_begin_event@@YAXPEAUID3D12GraphicsCommandList@@_KPEB_W@Z";
pix_end_event :: (cmd_list: *ID3D12GraphicsCommandList) -> void #foreign pix_wrapper "?pix_end_event@@YAXPEAUID3D12GraphicsCommandList@@@Z";

pix_set_marker :: (color: u64, str: PCWSTR) -> void #foreign pix_wrapper "?pix_set_marker@@YAX_KPEB_W@Z";
pix_set_marker :: (cmd_list: *ID3D12GraphicsCommandList, color: u64, str: PCWSTR) -> void #foreign pix_wrapper "?pix_set_marker@@YAXPEAUID3D12GraphicsCommandList@@_KPEB_W@Z";

#scope_file

pix_wrapper :: #foreign_library,no_dll "pix/x64/pix_wrapper";
