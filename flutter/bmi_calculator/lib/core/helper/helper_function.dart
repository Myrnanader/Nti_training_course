double calculateBmi(int weight, double height) {
  return weight / ((height / 100) * (height / 100));
}

int calcBmiIndex(double bmi) {
  if (bmi < 18.5) {
    return 0; // Underweight
  } else if (bmi < 25) {
    return 1; // Normal weight
  } else if (bmi < 30) {
    return 2; // Overweight
  } else {
    return 3; // Obesity
  }
}