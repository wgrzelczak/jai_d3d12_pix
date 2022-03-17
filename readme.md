# PIX module for jai

### Based on version 1.0.220124001

## Setup
- copy all files from here to d3d12 official module (`modules/d3d12/`)
- download https://www.nuget.org/packages/WinPixEventRuntime
- change it's extension to .zip
- make a new directory `pix_src` and copy there all files from the zip (`modules/d3d12/pix_src`)

- modify `modules/d3d12/module.jai`:
  - add `load "pix.jai";` after `#load "d3d12_bindings.jai";`
- copy `modules/d3d12/pix_src/bin/x64/WinPixEventRuntime.dll` to project's working directory

- add `pix_load_capturer()` call before creating D3D12Device

## Example
- copy `WinPixEventRuntime.dll` to `modules/d3d12/examples` directory
- edit `modules/d3d12/examples/example.jai`
  - in main:
    ```
    w_hwnd := (...); //existing line
    pix_load_capturer();
    pix_set_target_window(w_hwnd); 
    pix_gpu_capture_next_frames("my_file.wpix", 5); 
    ```
  - in draw_one_frame:
    ```
    pix_begin_event(cmd_list, "Draw");
    ID3D12GraphicsCommandList_DrawInstanced(cmd_list, 3, 1, 0, 0); //existing line
    pix_end_event(cmd_list);
    ```
- compile and run `modules/d3d12/examples/example_pix.jai`
- open newly created `my_file.wpix` file in pix