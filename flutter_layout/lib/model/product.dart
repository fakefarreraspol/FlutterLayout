class Aspect {
  final String name;
  final String characteristic;
  Aspect(this.name, this.characteristic);
}

class Product {
  final String name, imageUrl, breed, description, price, amount;
  final double stars;
  final List<Aspect> aspects;
  //, delivery, suger, weight, glucose
  const Product({
    required this.name,
    required this.imageUrl,
    required this.breed,
    required this.description,
    
    required this.price,
    required this.amount,
    required this.stars,
    this.aspects = const [],
  });
}
