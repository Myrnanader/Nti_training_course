void main() {
  // The Factorial Calculator
  int n = 6;
  int factorial = 1;
  for (int i = 1; i <= n; i++) {
    factorial = factorial * i;
  }
  print("factorial $n is $factorial");

  // The Digit Counter
  int number = 98765;
  int count = 0;
  while (number > 0) {
    number = number ~/ 10;
    count++;
  }
  print("Number of digits is $count");

  //The Collatz Conjecture
  int num = 12;
  while (num != 1) {
    print(num);

    if (num % 2 == 0) {
      num = num ~/ 2;
    } else {
      num = (num * 3 + 1);
    }
  }
  print(num);

  //list 
  // Shopping Cart
  List<String> cart = ["Milk", "Eggs", "Bread"];
  cart.add("Butter");        
  cart.remove("Eggs");       
  print("First item: ${cart[0]}"); 

//The Price Filter 
  List<int> prices = [12, 45, 6, 89, 10, 23];
  List<int> expensiveItems = [];

  for (int price in prices) {
    if (price > 20) {
      expensiveItems.add(price);
    }
  }

  print("Expensive Items: $expensiveItems");

// set 
// The Duplicate Remover
List<String> emails = ['a@b.com', 'x@y.com', 'a@b.com', 'z@z.com'];
  Set<String> uniqueEmails = emails.toSet();

  print("Unique Emails: $uniqueEmails");
  print("Total unique emails: ${uniqueEmails.length}");

//The Class Reunion
Set<String> mathClass = {'Alice', 'Bob', 'Charlie', 'David'};
  Set<String> scienceClass = {'Charlie', 'David', 'Eve', 'Frank'};

  Set<String> both = mathClass.intersection(scienceClass);
  Set<String> mathOnly = mathClass.difference(scienceClass);

  print("Both: $both");
  print("Math Only: $mathOnly");

}
