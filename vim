#include "main.h"

/**
 * print_pointer - Prints the value of a pointer variable
 * @types: List a of arguments
 * @buffer: Buffer array to handle print
 * @flags: Calculates active flags
 * @width: get width
 * @precision: Precision specification
 * @size: Size specifier
 * Return: returns the number of chars printed.
 */
int print_pointer(va_list types, char buffer[],
		int flags, int width, int precision, int size)
{
	char extra_c = 0, padd = '0';
	int ind = BUFF_SIZE - 2, length = 0; /* length=0, to exclude '0x' */
	uintptr_t num_addrs;
	void *addrs = va_arg(types, void *);

	UNUSED(width);
	UNUSED(size);
	UNUSED(precision);

	if (addrs == NULL)
		return (write(1, "(nil)", 5));

	buffer[BUFF_SIZE - 1] = '\0';
	num_addrs = (uintptr_t)addrs;

	while (num_addrs > 0)
	{
		buffer[ind--] = "0123456789abcdef"[num_addrs % 16];
		num_addrs /= 16;
		length++;
	}

	if ((flags & F_ZERO) && !(flags & F_MINUS))
		padd = '0';

	if (flags & F_PLUS)
		extra_c = '+', length++;
	else if (flags & F_SPACE)
		extra_c = ' ', length++;

	ind++;
	return (write_pointer(buffer, ind, length, width, flags, padd, extra_c, 0)); /* exclude '0x' */
}


