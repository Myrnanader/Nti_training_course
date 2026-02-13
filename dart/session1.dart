void main() {
  //Convert a total number of seconds into hours, minutes, and remaining seconds.
  int totalSeconds = 3665;
  int hours = totalSeconds ~/ 3600;
  int minutes = (totalSeconds % 3600) ~/ 60;
  int seconds = totalSeconds % 60;
  print("${hours}h ${minutes}m ${seconds}s");

  //Determine if a specific year is a leap year using only a boolean expression and logical operators.

  int year = 2025;
  bool isLeap = (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  print("Year $year is leapYear? $isLeap");

  // The Bill Splitter
  double billAmount = 120.50;
  double taxRate = 0.10;
  int numPeople = 3;

  double totalbillwithtax = billAmount + (billAmount * taxRate);
  double totalPerPerson = totalbillwithtax / numPeople;
  String cleanString = totalPerPerson.toStringAsFixed(2);
  print(cleanString);

  //The E-Commerce Order Validator
  String? couponCode;
  String finalCopon = couponCode ?? "NO_COUPON";
  print("Coupon: $finalCopon");

  //switch Shipping Cost
  double orderTotal = 35.0;

  double shippingCost = switch (orderTotal) {
    > 50 => 0.0, // free shipping
    >= 20 && <= 50 => 5.0, // medium range
    _ => 10.0, // otherwise
  };
  print("Shipping Cost: \$${shippingCost}");

  // Guard Clauses
  (String, bool) statusTuple = ("Pending", true);

  switch (statusTuple) {
    case ("Pending", true) when statusTuple.$2 == true:
      print("Priority Processing");
    case ("Pending", _):
      print("Standard Queue");
    default:
      print("Check Status");
  }
}
