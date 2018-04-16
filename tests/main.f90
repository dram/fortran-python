program main
  use iso_c_binding

  implicit none

  block
    use python

    character(:), allocatable, target :: command, name
    integer(c_int) res
    integer(c_size_t) size
    type(c_ptr) cptr, globals, res_obj

    call py_initialize()

    command = "print('foo')" // c_null_char
    res = py_run_simple_string(c_loc(command))

    globals = py_dict_new()

    name ="__builtins__" // c_null_char
    res = py_dict_set_item_string(globals, c_loc(name), py_eval_get_builtins())

    command = "print('foo')" // c_null_char
    res_obj = py_run_string(c_loc(command), py_eval_input, globals, c_null_ptr)

    command = "'f' + 'oo'" // c_null_char
    res_obj = py_run_string(c_loc(command), py_eval_input, globals, c_null_ptr)

    if (c_associated(res_obj)) then
       cptr = py_unicode_as_utf8_and_size(res_obj, size)
       block
         character(size), pointer :: fptr
         call c_f_pointer(cptr, fptr)
         print *, size, fptr
       end block
    else
       call py_err_print()
    end if

    call py_finalize()
  end block
end program main
