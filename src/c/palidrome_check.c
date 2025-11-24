#include <stdio.h>
#include <string.h>

int main() {
    char str[100], reversed[100];
    int i, len;

    printf("Enter a string: ");
    gets(str);

    len = strlen(str);

    for (i = 0; i < len; i++) {
        reversed[i] = str[len - 1 - i];
    }
    reversed[i] = '\0'; // Null-terminate the string

    if (strcmp(str, reversed) == 0)
        printf("The string is a palindrome.\n");
    else
        printf("The string is not a palindrome.\n");

    return 0;
}
