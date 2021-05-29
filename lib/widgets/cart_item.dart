import 'package:flutter/material.dart';
import 'package:flutter_meal_ui/models/order.dart';

class CartItem extends StatefulWidget {
  final Order order;
  CartItem({this.order});
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  Order currentOrder;
  int currentQuantity;

  @override
  void initState() {
    currentOrder = widget.order;
    currentQuantity = currentOrder.quantity;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 130.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(currentOrder.food.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentOrder.food.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          currentOrder.restaurant.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 0.8,
                              color: Colors.black54,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                    child: CircleAvatar(
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 30.0,
                                          color: currentQuantity == 0
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.deepOrangeAccent,
                                    ),
                                    onTap: currentQuantity == 0
                                        ? null
                                        : () {
                                            setState(() {
                                              if (currentQuantity > 0) {
                                                currentQuantity--;
                                              }
                                            });
                                          }),
                              ),
                              // SizedBox(
                              //   width: 20.0,
                              // ),
                              Expanded(
                                child: Text(
                                  currentQuantity.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   width: 20.0,
                              // ),
                              Expanded(
                                child: GestureDetector(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.deepOrangeAccent,
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      currentQuantity++;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Text(
              '\$${(currentQuantity * currentOrder.food.price).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
