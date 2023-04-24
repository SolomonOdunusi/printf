#include <unistd.h>
#include "main.h"

/**
 * _putchar - print character
 * @c: char
 * Return: return On success 1
*/

int _putchar(char c)
{
	return (write(1, &c, 1));
}
