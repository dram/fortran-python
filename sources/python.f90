module python
  use iso_c_binding

  implicit none

  !! FIXME:
  !!   all are macros, need a better way to do this kind map.
  integer(c_int) :: py_single_input = 256
  integer(c_int) :: py_file_input = 257
  integer(c_int) :: py_eval_input = 258

  interface
     function py_dict_new() result(res) &
          bind(c, name="PyDict_New")
       use iso_c_binding, only: c_ptr
       type(c_ptr) :: res
     end function py_dict_new

     function py_dict_set_item_string(p, key, val) result(res) &
          bind(c, name="PyDict_SetItemString")
       use iso_c_binding, only: c_char, c_int, c_ptr
       type(c_ptr), value :: p, val
       character(kind=c_char), intent(in) :: key (*)
       integer(c_int) :: res
     end function py_dict_set_item_string

     subroutine py_err_print() &
          bind(c, name="PyErr_Print")
     end subroutine py_err_print

     function py_eval_get_builtins() result(res) &
          bind(c, name="PyEval_GetBuiltins")
       use iso_c_binding, only: c_ptr
       type(c_ptr) :: res
     end function py_eval_get_builtins

     subroutine py_finalize() &
          bind(c, name="Py_Finalize")
     end subroutine py_finalize

     subroutine py_initialize() &
          bind(c, name="Py_Initialize")
     end subroutine py_initialize

     function py_run_simple_string(command) result(res) &
          bind(c, name="PyRun_SimpleString")
       use iso_c_binding, only: c_char, c_int
       character(kind=c_char), intent(in) :: command (*)
       integer(c_int) :: res
     end function py_run_simple_string

     function py_run_string(str, start, globals, locals) result(res) &
          bind(c, name="PyRun_String")
       use iso_c_binding, only: c_char, c_int, c_ptr
       character(kind=c_char), intent(in) :: str (*)
       integer(c_int), value :: start
       type(c_ptr), value :: globals, locals
       type(c_ptr) :: res
     end function py_run_string

     function py_unicode_as_utf8_and_size(unicode, size) &
          result(res) &
          bind(c, name="PyUnicode_AsUTF8AndSize")
       use iso_c_binding, only: c_ptr, c_size_t
       type(c_ptr), value :: unicode
       integer(c_size_t), intent(out) :: size
       type(c_ptr) :: res
     end function py_unicode_as_utf8_and_size
  end interface
end module python
