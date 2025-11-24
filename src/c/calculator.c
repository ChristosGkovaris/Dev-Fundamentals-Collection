#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // Define strings for the operations (addition, subtraction, multiplication, division)
    char add[] = "+", sub[] = "-", mul[] = "x", div[] = "/", zero[] = "0";
    int i, val, val1, val2, val3, res = 0;
    
    // Check if the first argument is the addition symbol "+"
    if (strcmp(argv[1], add) == 0) {
        // Loop through remaining arguments, converting each to integer and adding to `res`
        for (i = 2; i < argc; i++) {
            val = atoi(argv[i]);
            res = res + val;
        }
    }
    // Check if the first argument is the subtraction symbol "-"
    else if (strcmp(argv[1], sub) == 0) {
        // Initialize `res` with the first number
        val1 = atoi(argv[2]);
        res = val1;
        // Loop through the rest of the arguments, subtracting each from `res`
        for (i = 3; i < argc; i++) {
            val = atoi(argv[i]);
            res = res - val;
        }
    }
    // Check if the first argument is the multiplication symbol "x"
    else if (strcmp(argv[1], mul) == 0) {
        // Initialize `res` with the first number
        val2 = atoi(argv[2]);
        res = val2;
        // Loop through the rest of the arguments, multiplying each with `res`
        for (i = 3; i < argc; i++) {
            val = atoi(argv[i]);
            res = res * val;
        }
    }
    // Check if the first argument is the division symbol "/"
    else if (strcmp(argv[1], div) == 0) {
        // Initialize `res` with the first number
        val3 = atoi(argv[2]);
        res = val3;
        // Loop through the rest of the arguments, dividing `res` by each argument
        for (i = 3; i < argc; i++) {
            // Ensure the argument is not zero (to avoid division by zero)
            if (argv[i] != zero) {
                val = atoi(argv[i]);
                res = res / val;
            } else {
                // If a division by zero is attempted, set `res` to 0 as an error handling
                res = 0;
            }
        }
    }
    // If the first argument doesn't match any operation symbol, print an error
    else {
        printf("The input is wrong. Check again !!");
    }
    
    // Print the final result
    printf("Result: %d\n", res);
    return 0;
}
