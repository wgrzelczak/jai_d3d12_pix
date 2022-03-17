#include <windows.h>
#include <dxgi1_3.h>
#include <d3d12.h>
#include "../pix_src/Include/WinPixEventRuntime/pix3.h"

HRESULT pix_load_capturer();
HRESULT pix_begin_capture(PIXCaptureParameters* params);
HRESULT pix_end_capture();
HRESULT pix_set_target_window(HWND hwnd);
HRESULT pix_gpu_capture_next_frames(PCWSTR file_name, INT32 frames_count);

void pix_begin_event(UINT64 color, PCWSTR str);
void pix_end_event();

void pix_begin_event(ID3D12GraphicsCommandList* cmd_list, UINT64 color, PCWSTR str);
void pix_end_event(ID3D12GraphicsCommandList* cmd_list);

void pix_set_marker(UINT64 color, PCWSTR str);
void pix_set_marker(ID3D12GraphicsCommandList* cmd_list, UINT64 color, PCWSTR str);

// Decide which events are recorded on your own.
/*
inline void PIXBeginRetailEvent(void*, UINT64, _In_ PCSTR, ...) {}
inline void PIXBeginRetailEvent(void*, UINT64, _In_ PCWSTR, ...) {}
inline void PIXEndRetailEvent(void*) {}
inline void PIXSetRetailMarker(void*, UINT64, _In_ PCSTR, ...) {}
inline void PIXSetRetailMarker(void*, UINT64, _In_ PCWSTR, ...) {}
*/

// RAII stuff, just use `defer pix_end_event();`.
/*
inline void PIXScopedEvent(UINT64, _In_ PCSTR, ...) {}
inline void PIXScopedEvent(UINT64, _In_ PCWSTR, ...) {}
inline void PIXScopedEvent(void*, UINT64, _In_ PCSTR, ...) {}
inline void PIXScopedEvent(void*, UINT64, _In_ PCWSTR, ...) {}
*/