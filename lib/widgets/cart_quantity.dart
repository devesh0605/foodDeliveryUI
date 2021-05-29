import 'package:flutter/material.dart';

class CartQuantity extends StatefulWidget {
  final int q;
  CartQuantity({this.q});
  @override
  _CartQuantityState createState() => _CartQuantityState();
}

class _CartQuantityState extends State<CartQuantity> {
  int cartQuantity;
  @override
  void initState() {
    cartQuantity = widget.q;
    print('this cahnged');

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuilt');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            child: Text(
              '-',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30.0,
                color: cartQuantity == 0
                    ? Colors.black
                    : Theme.of(context).primaryColor,
              ),
            ),
            onTap: cartQuantity == 0
                ? null
                : () {
                    setState(() {
                      if (cartQuantity > 0) {
                        cartQuantity--;
                      }
                    });
                  }),
        SizedBox(
          width: 20.0,
        ),
        Text(
          cartQuantity.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        GestureDetector(
          child: Text(
            '+',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
          onTap: () {
            setState(() {
              cartQuantity++;
            });
          },
        )
      ],
    );
  }
}

// GestureDetector(
// child: Text(
// '-',
// style: TextStyle(
// fontWeight: FontWeight.w600,
// fontSize: 30.0,
// color: currentQuantity == 0
// ? Colors.black
//     : Theme.of(context).primaryColor,
// ),
// ),
// onTap: currentQuantity == 0
// ? null
//     : () {
// setState(() {
// if (currentQuantity > 0) {
// currentQuantity--;
// }
// });
// }),
