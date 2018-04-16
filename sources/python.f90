module python
  use iso_c_binding

  implicit none

  include "constants.f90"

  interface
     function py_dict_new() &
          bind(c, name="PyDict_New")
       use iso_c_binding, only: c_ptr
       type(c_ptr) py_dict_new
     end function py_dict_new

     function py_dict_set_item_string(p, key, val) &
          bind(c, name="PyDict_SetItemString")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: p, key, val
       integer(c_int) py_dict_set_item_string
     end function py_dict_set_item_string

     subroutine py_err_print() &
          bind(c, name="PyErr_Print")
     end subroutine py_err_print

     function py_eval_get_builtins() &
          bind(c, name="PyEval_GetBuiltins")
       use iso_c_binding, only: c_ptr
       type(c_ptr) :: py_eval_get_builtins
     end function py_eval_get_builtins

     subroutine py_finalize() &
          bind(c, name="Py_Finalize")
     end subroutine py_finalize

     subroutine py_initialize() &
          bind(c, name="Py_Initialize")
     end subroutine py_initialize

     function py_run_simple_string(command) &
          bind(c, name="PyRun_SimpleString")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: command
       integer(c_int) py_run_simple_string
     end function py_run_simple_string

     function py_run_string(str, start, globals, locals) &
          bind(c, name="PyRun_String")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: str, globals, locals
       integer(c_int), value :: start
       type(c_ptr) py_run_string
     end function py_run_string

     function py_unicode_as_utf8_and_size(unicode, size) &
          bind(c, name="PyUnicode_AsUTF8AndSize")
       use iso_c_binding, only: c_ptr, c_size_t
       type(c_ptr), value :: unicode
       integer(c_size_t), intent(out) :: size
       type(c_ptr) py_unicode_as_utf8_and_size
     end function py_unicode_as_utf8_and_size
  end interface
end module python
