#define USE_PIX (1)
#define USE_PIX_SUPPORTED_ARCHITECTURE (1)
#include "pix_wrapper.h"

HRESULT pix_load_capturer() {
    return PIXLoadLatestWinPixGpuCapturerLibrary() != nullptr ? S_OK : E_FAIL;
}
HRESULT pix_begin_capture(PIXCaptureParameters* params) {
	return PIXBeginCapture2(PIX_CAPTURE_GPU, params);
}
HRESULT pix_end_capture() {
	return PIXEndCapture(FALSE);
}
HRESULT pix_set_target_window(HWND hwnd) {
    return PIXSetTargetWindow(hwnd);
}
HRESULT pix_gpu_capture_next_frames(PCWSTR file_name, INT32 frames_count) {
    return PIXGpuCaptureNextFrames(file_name, frames_count);
}

void pix_begin_event(UINT64 color, PCWSTR str) {
    PIXBeginEvent(color, str);
}
void pix_end_event() {
    PIXEndEvent();
}
void pix_begin_event(ID3D12GraphicsCommandList* cmd_list, UINT64 color, PCWSTR str) {
    PIXBeginEvent(cmd_list, color, str);
}
void pix_end_event(ID3D12GraphicsCommandList* cmd_list) {
    PIXEndEvent(cmd_list);    
}
void pix_set_marker(UINT64 color, PCWSTR str) {
    PIXSetMarker(color, str);
}
void pix_set_marker(ID3D12GraphicsCommandList* cmd_list, UINT64 color, PCWSTR str) {
    PIXSetMarker(cmd_list, color, str);
}

