COMPILE :: true;
COMPILE_DEBUG :: false;

#run {
    set_build_options_dc(.{do_output=false});
    
#if COMPILE {
        src_files: [..] string;
        array_add(*src_files, "pix/pix_wrapper.cpp");
#if OS == .WINDOWS {
            make_directory_if_it_does_not_exist("pix/x64");
            build_cpp_static_lib("pix/x64/pix_wrapper", ..src_files, debug=COMPILE_DEBUG);
        } else {
            assert(false);
        }
    }
    
    
    write_file := true;
    user_args := compiler_get_command_line_arguments();
    for user_args {
        if it == "-no_write"    write_file = false;
    }
    generate_bindings(write_file = write_file);
}

generate_bindings :: (write_file := true) {
    output_filename: string;
    opts: Generate_Bindings_Options;
    {
        using opts;

        #if OS != .WINDOWS {
            assert(false);
        }

        output_filename = "pix_bindings.jai";
        array_add(*libpaths, "pix/x64");
        array_add(*libnames, "pix_wrapper");

        array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);
        array_add(*include_paths, "pix");
        array_add(*source_files, "pix_wrapper.h");
        //array_add(*include_paths, "pix_src/Include/WinPixEventRuntime");
        //array_add(*source_files, "pix3.h");
        
        array_add(*extra_clang_arguments, "-x", "c++", "-fms-extensions");

        mimic_spacing_flags &= ~Mimic_Spacing_Flags.VTABLE;
        generate_compile_time_struct_checks = false;
    }

    bindings_builder, success := generate_bindings(opts);
    if !success     return;
    defer free_buffers(*bindings_builder);
    show_generator_results();
    
    if write_file {
        success = write_entire_file(output_filename, bindings_builder);
        if !success {
            log_error("Could not write generated output to \"%\"\n", output_filename);
            return;
        }    
        log("\nOK! generated '%'\n", output_filename);
    }
}
#scope_file

#import "Basic";
#import "Bindings_Generator";
#import "BuildCpp";
#import "Compiler";
#import "File";
#import "String";
#import "System";
#import "Windows_Resources";