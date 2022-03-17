// Only x64 Windows is supported.
// Only gpu features have been tested.
// String formating has been removed to keep api slightly cleaner.
// Jai-friendly wrappers have been provided, which convert string to wchar*.
// PIXRetail and PIXScopedEvent functions are not supported.
// XBOX features are not supported.

// TODO:
// - cpu sampler (doesn't work for now, custom linker command will be needed)
// - automatically copy WinPixEventRuntime.dll

// Functions to use:
#load "pix_bindings.jai";

// Jai-friendly wrappers:
pix_gpu_capture_next_frames :: (file_name : string, frames_count : s32) -> HRESULT {
    return pix_gpu_capture_next_frames(utf8_to_wide(file_name), frames_count);
}
pix_begin_event :: (str: string, color: u64 = 0) {
    pix_begin_event(color, utf8_to_wide(str));
}
pix_begin_event :: (cmd_list: *ID3D12GraphicsCommandList, str: string, color: u64 = 0) {
    pix_begin_event(cmd_list, color, utf8_to_wide(str));
}
pix_set_marker :: (str: string, color: u64 = 0) {
    pix_begin_event(color, utf8_to_wide(str));
}
pix_set_marker :: (cmd_list: *ID3D12GraphicsCommandList, str: string, color: u64 = 0) {
    pix_begin_event(cmd_list, color, utf8_to_wide(str));
}


PCWSTR :: *u16; //@Cleanup: probably should be in Windows module

#scope_file
#import "Windows_Utf8";
#import "Windows_Resources";
pix_runtime :: #foreign_library,no_dll "pix_src/bin/x64/WinPixEventRuntime";