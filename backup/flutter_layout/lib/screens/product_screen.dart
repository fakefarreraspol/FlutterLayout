import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout/model/product.dart';
import 'package:flutter_layout/widgets/big_button.dart';
import 'package:flutter_layout/widgets/custom_back_button.dart';

import 'package:flutter_layout/widgets/info_section.dart';
import 'package:flutter_layout/widgets/photo_section.dart';
import 'package:provider/provider.dart';
import 'package:flutter_layout/widgets/like_button.dart';
class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const double photoHeight = 434/1.5;
    const double photoWidth = 286/1.5;
    const double infoH = 150;
    return Provider.value(
      value: product,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
                children: [
                  SizedBox(
                    width: screenSize.width/2,
                    height: screenSize.height/4 + 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenSize.width/2 -20,
                        height: screenSize.height/4 +40,
                      ),
                      SizedBox(                
                        height: photoHeight,
                        width: photoWidth,
                        child: const PhotoSection(),
                      ),

                    ],
                  ),
                  
                ],
            ),
            Align(
              // width: screenSize.width,
              // height: screenSize.height,
              alignment: Alignment.topLeft,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    SizedBox(
                      
                      height: infoH,
                      width: screenSize.width,
                    ),
                    const InfoSection(),
                  ],
                ),
            ),
            
            const Align(
              alignment: Alignment.topLeft,
              child: CustomBackButton(),
            ),
            const Align(
              alignment: Alignment.topRight,
              child: LikeButton(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(left: paddingSize, right: paddingSize, bottom: paddingSize),
                color: Colors.white,
                child: const BigButton(text: "ADD TO CART",),
              ),
            )
          ],
        ),
      ),
    );
  }
}
