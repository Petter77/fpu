#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>
#include <float.h>

extern double addition(double, double);
extern double subtraction(double, double);
extern double multiplication(double, double);
extern double division(double, double);

extern void round_to_nearest();
extern void round_toward_positive_infinity();
extern void round_toward_negative_infinity();
extern void round_toward_zero();

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
    switch (atoi(rounding_mode)) {
      case 0: {
        //0x027F
        round_to_nearest();
        break;
      }
      case 1: {
        //0x087F
        round_toward_positive_infinity();
        break;
      }
      case 2: {
        //0x047F
        round_toward_negative_infinity();
        break;
      }
      case 3: {
        //0x0F7F
        round_toward_zero();
        break;
      }
    }
  }
/*
  printf("Number1: %f\n", number1);
  printf("Number2: %f\n", number2);
  printf("Operator: %c\n", operator);
*/

  switch (operator) {
    case '+': {
      printf("Result: %f\n", addition(number1, number2));
      break;
    }
    case '-': {
      printf("Result: %f\n", subtraction(number1, number2));
      break;
    }
    case 'x': {
      printf("Result: %f\n", multiplication(number1, number2));
      break;
    }
    case '/': {
      printf("Result: %.10f\n", division(number1, number2));
      break;
    }
  }
  return 0;
}