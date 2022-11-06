import 'package:flutter/material.dart';
import 'package:flutter_layout/model/product.dart';
import 'package:provider/provider.dart';

class PhotoSection extends StatelessWidget {
  const PhotoSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = context.watch<Product>();
    return Container(
      width: 386,
      height: 434,
      
      child: Expanded(
        
        child: Image.asset(product.imageUrl),
      ),
    );
  }
}
