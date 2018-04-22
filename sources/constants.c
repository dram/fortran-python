#include <Python.h>
#include <stdio.h>

#define INT_PARAMETER "integer(c_int), parameter :: "

int main(void)
{
	printf(INT_PARAMETER "py_eval_input = %d\n", Py_eval_input);
	printf(INT_PARAMETER "py_file_input = %d\n", Py_file_input);
	printf(INT_PARAMETER "py_single_input = %d\n", Py_single_input);

	return 0;
}
