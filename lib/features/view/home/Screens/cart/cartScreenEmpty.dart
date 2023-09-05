import 'package:big_cart/core/constant.dart';

import 'package:big_cart/features/view/home/layoutScreen.dart';
import 'package:flutter/material.dart';

class cartScreenEmpty extends StatelessWidget {
  const cartScreenEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Column(
          children: [
            Image.asset("assets/images/emptyCart.png"),
            DefultWidget.defultText(text: 'Your cart is empty !'),
            DefultWidget.defultdesrptionOnboarding(
                text: 'You will get a response within\na few minutes.')
          ],
        ),
        const Spacer()
      ],
    );
  }
}
