import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/widgets/total_pay_botton.dart';

class TarjetaPage extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    final tarjeta = context.watch<PagarBloc>().state.tarjeta;
   return Scaffold(
      appBar: AppBar(
           title: Text('Pagar', textAlign: TextAlign.center),
           leading: IconButton(
             icon: Icon( Icons.arrow_back),
             onPressed: (){
               context.read<PagarBloc>().add(OnDesactivarTarjeta());
               Navigator.pop(context);
             },
           ),
      ),
      body: Stack(
        children: [
          Container(),
          Hero(
            tag: tarjeta.cardNumber,
            child: CreditCardWidget(
              cardNumber: tarjeta.cardNumberHidden, 
              expiryDate: tarjeta.expiracyDate, 
              cardHolderName: tarjeta.cardHolderName, 
              cvvCode: tarjeta.cvv, 
              showBackView: false
            ),
          ),
           Positioned(
            bottom: 0,
            child: TotalPayButton()
          )
        ],
      ),
    );
  }
}