import 'package:flutter/material.dart';
import 'package:flutter_meal_ui/data/data.dart';
import 'package:flutter_meal_ui/models/order.dart';

class RecentOrders extends StatelessWidget {
  Widget _buildRecentOrders(BuildContext context, Order order) {
    return MediaQuery.removePadding(
      context: context,
      child: Card(
        color: Colors.orange[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Container(
          width: 320,
          //margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.orange[200],
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 1.0, color: Colors.grey[200]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                        image: AssetImage(order.food.imageUrl),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                order.food.name,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Expanded(
                              child: Text(
                                order.restaurant.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Expanded(
                              child: Text(
                                order.date,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                width: 48.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0)),
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 30.0,
                  color: Colors.white,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 120.0,
            // color: Colors.blue,
            child: Container(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: currentUser.orders.length,
                itemBuilder: (context, index) {
                  Order order = currentUser.orders[index];
                  return _buildRecentOrders(context, order);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
