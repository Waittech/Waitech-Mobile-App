
import 'package:flutter/material.dart';
import 'package:waitech/config/app_router.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PayScreen extends StatelessWidget {
  static const String routeName = '/pay_screen';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const PayScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const PayScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          /*Center(
            child: CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused, onCreditCardWidgetChange: (CreditCardBrand ) {  }, //true when you want to show cvv(back) view
            ),
          ),*/
        ),

      )
    );


  }


}
