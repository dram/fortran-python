program main
  use iso_c_binding

  implicit none

  block
    use python

    type(c_ptr) :: cptr, globals, res_obj
    integer(c_int) :: res
    integer(c_size_t) :: size

    call py_initialize()

    res = py_run_simple_string("print('foo')" // c_null_char)

    globals = py_dict_new()

    res = py_dict_set_item_string( &
         globals, "__builtins__" // c_null_char, py_eval_get_builtins())

    res_obj = py_run_string( &
         "print('foo')" // c_null_char, py_eval_input, &
         globals, c_null_ptr)

    res_obj = py_run_string( &
         "'f' + 'oo'" // c_null_char, py_eval_input, &
         globals, c_null_ptr)

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
