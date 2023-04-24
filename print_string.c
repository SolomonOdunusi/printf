#include "main.h"

/**
 * print_string - Prints a string
 * @types: List of arguments
 * @buffer: Buffer array to handle print
 * @flags: Calculates active flags
 * @width: get width
 * @precision: Precision specification
 * @size: Size specifier
 * Return: returns the number of chars printed.
 */
int print_string(va_list types, char buffer[],
		int flags, int width, int precision, int size)
{
	int length = 0, i;
	char *str = va_arg(types, char *);

	UNUSED(buffer);
	UNUSED(flags);
	UNUSED(width);
	UNUSED(precision);
	UNUSED(size);

	if (str == NULL)
		str = "(null)";

	while (str[length] != '\0')
		length++;

	if (precision >= 0 && precision < length)
		length = precision;

	if (width > length && !(flags & F_MINUS))
	{
		for (i = 0; i < width - length; i++)
			write(1, " ", 1);
	}

	write(1, str, length);

	if (width > length && (flags & F_MINUS))
	{
		for (i = 0; i < width - length; i++)
			write(1, " ", 1);
	}

	return (width > length ? width : length);
}
