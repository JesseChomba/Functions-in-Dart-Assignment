void main() {
  final cart = [12.99, 19.99, 7.50, 35.75];
  final discountPercentage = 0.20; // 20% discount

  final totalBeforeDiscount = calculateTotal(cart);
  print('Total before discount: \$${totalBeforeDiscount.toStringAsFixed(2)}');

  final totalAfterDiscount = applyDiscount(cart, discountFunction);
  print('Total after discount: \$${totalAfterDiscount.toStringAsFixed(2)}');

  final filteredCart = cart.where(priceThreshold).toList();
  print('Filtered cart (items above \$10): $filteredCart');

  final totalWithTax = calculateTotal(filteredCart, tax: 0.08);
  print('Total with tax: \$${totalWithTax.toStringAsFixed(2)}');

  final factorialDiscount = calculateFactorialDiscount(filteredCart.length);
  final totalWithFactorialDiscount = totalWithTax * (1 - factorialDiscount);
  print('Total with factorial discount: \$${totalWithFactorialDiscount.toStringAsFixed(2)}');
}

// Standard Functions
double calculateTotal(List<double> prices, {double tax = 0.0}) {
  double total = 0.0;
  for (final price in prices) {
    total += price;
  }
  return total * (1 + tax);
}

// Anonymous Functions
bool priceThreshold(double price) => price >= 10.0;

// Higher-Order Functions
double discountFunction(double price) => price * (1 - 0.20);
double applyDiscount(List<double> prices, double Function(double) discount) {
  double total = 0.0;
  for (final price in prices) {
    total += discount(price);
  }
  return total;
}

// Recursive Functions
double calculateFactorialDiscount(int n) {
  if (n == 0 || n == 1) {
    return 0.0;
  }
  return (n / 100.0) + calculateFactorialDiscount(n - 1);
}
