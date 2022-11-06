import 'package:flutter/material.dart';
import 'package:flutter_layout/model/product.dart';
import 'package:flutter_layout/widgets/big_button.dart';

import 'package:provider/provider.dart';

const double paddingSize = 24;
const double infoSectionRadius = 40;

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  Widget _pad(Widget child) => Padding(
        padding: const EdgeInsets.fromLTRB(paddingSize, 0, paddingSize, 0),
        child: child,
      );

  SizedBox _space(double h) => SizedBox(height: h);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _space(0),
            _pad(const _Header()),
            const _ratings(),
            _space(12),
            const _GeneralSection(),
            _space(2),
            const _AboutSection(),
            _space(15),
            const _price(),
            const SizedBox(height: bigButtonHeight + paddingSize * 2),
          ],
        ),
      ],
    );
  }
}

class _ratings extends StatelessWidget {
  const _ratings({super.key});

  @override
  Widget build(BuildContext context) {
    double nstars = context.watch<Product>().stars;
    return Row(
      children: [
        SizedBox(
          height: 10,
          width: 24,
        ),
        for (int i = 0; i < 5; i++) ...[
          Icon(
            Icons.star,
            size: 20,
          ),
        ],
        Text(
          "246 Review",
          style: TextStyle(
            color: Colors.deepOrange,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.wavy,
            decorationColor: Colors.deepOrange,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}

class _price extends StatelessWidget {
  const _price({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20,
          width: 24,
        ),
        Text(
          "\$  ",
          style: TextStyle(
            fontSize: 28,
            color: Colors.deepOrange,
          ),
        ),
        Text(
          context.watch<Product>().price,
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: 20,
          width: 140,
        ),
        Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "-",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          width: 10,
        ),
        Text(
          context.watch<Product>().amount,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 20,
          width: 10,
        ),
        Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "+",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Container extends StatelessWidget {
  final Widget child;
  const _Container({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(infoSectionRadius),
          topRight: Radius.circular(infoSectionRadius),
        ),
      ),
      child: child,
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.watch<Product>().name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                
              ),
            ),
            const SizedBox(height: 4),
            Text(
              context.watch<Product>().breed,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _GeneralSection extends StatelessWidget {
  const _GeneralSection();

  @override
  Widget build(BuildContext context) {
    final product = context.watch<Product>();

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: paddingSize),
          for (int i = 0; i < product.aspects.length; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            _AspectWidget(
              aspect: product.aspects[i],
            ),
          ],
          const SizedBox(height: paddingSize),
        ]);
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: paddingSize),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _AspectWidget extends StatelessWidget {
  final Aspect aspect;

  const _AspectWidget({
    required this.aspect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      child: Column(children: [
        Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                aspect.name,
                style: TextStyle(
                  color: Colors.blueGrey[500]!,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                aspect.characteristic,
                style: TextStyle(
                  color: Colors.blueGrey[800]!,
                  fontWeight: FontWeight.w800,
                  fontSize: 19,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingSize),
          child: Text(
            context.watch<Product>().description,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              height: 1.3,
            ),
          ),
        )
      ],
    );
  }
}
