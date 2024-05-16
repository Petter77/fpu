#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>
#include <float.h>

extern double addition(double, double);
extern double subtraction(double, double);
extern double multiplication(double, double);
extern double division(double, double);
extern void set_round(char);
extern void exception_handling(void);

int main(int argc, char *argv[]) {
  if (argc < 4 || argc > 5) {
    printf("Usage: %s number1 operator number2 [rounding_mode]\n", argv[0]);
    return 1;
  }

  char *endptr;
  double number1 = strtod(argv[1], &endptr);
  char operator = argv[2][0];
  double number2 = strtod(argv[3], &endptr);
  char *rounding_mode = argv[4];

  if (operator != '+' && operator != '-' && operator != 'x' && operator != '/') {
    printf("Invalid operator. Operator must be +, -, x or /.\n");
    return 1;
  }
  if (argc == 5) {
    set_round(*rounding_mode);
  }

  switch (operator) {
    case '+': {
      printf("Result: %.10f\n", addition(number1, number2));
      break;
    }
    case '-': {
      printf("Result: %.10f\n", subtraction(number1, number2));
      break;
    }
    case 'x': {
      printf("Result: %.10f\n", multiplication(number1, number2));
      break;
    }
    case '/': {
      printf("Result: %.10f\n", division(number1, number2));
      break;
    }
  }
  exception_handling();
  return 0;
}