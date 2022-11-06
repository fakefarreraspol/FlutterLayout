import 'package:flutter/material.dart';
import 'package:flutter_layout/model/product.dart';
import 'package:flutter_layout/screens/product_screen.dart';

void main() {
  runApp(const PetAdoptionApp());
}

class PetAdoptionApp extends StatelessWidget {
  const PetAdoptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductScreen(
        product: Product(
          name: "SUPER BEANS",
          imageUrl: 'assets/product_image.png',
          breed: "BINTU AMBELA WASHED",
          
          description: "Coffee contains a lot of antioxidants, that work " 
          "as little warriors fighting and protecting against " 
          "free radicals within your body & Caffeine " 
          "decreases your insulin sensitivity",
          aspects: [
            Aspect("WEIGHT", "500 GM"),
            Aspect("SUGER", "139"),
            Aspect("GLUCOSE", "94"),
            Aspect("DELIVERY", "5 - 7 DAYS"),
            
          ],
          price: "260",
          amount: "2",
          stars: 1,
        ),
      ),
    );
  }
}
