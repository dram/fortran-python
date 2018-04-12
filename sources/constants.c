#include <Python.h>

#include <stdio.h>

int main(void)
{
	printf("integer(c_int) :: py_eval_input = %d\n", Py_eval_input);
	printf("integer(c_int) :: py_file_input = %d\n", Py_file_input);
	printf("integer(c_int) :: py_single_input = %d\n", Py_single_input);

	return 0;
}
