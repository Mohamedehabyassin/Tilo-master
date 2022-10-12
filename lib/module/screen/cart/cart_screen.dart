import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilo/module/screen/cart/cart_body.dart';
import 'package:tilo/shared/provider/cart_provider.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<CartProvider>(context);

    return Scaffold(
     body: CartBody(),
      bottomNavigationBar: Container(
        height: 140,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Colors.grey.withOpacity(0.15),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Total:\n',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '\$ ${itemProvider.totalAmount}',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 190,
                    height: 50,
                    child: ElevatedButton(
                      child: Text("Checkout".toUpperCase(),
                          style: TextStyle(fontSize: 14)),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            side: BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/CompleteScreen');

                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 38,),
                  Text('${itemProvider.items.length} items',style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'Nunito',
                  ),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
