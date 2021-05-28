import 'package:flutter/material.dart';
import 'package:flutter_meal_ui/data/data.dart';
import 'package:flutter_meal_ui/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 30.0,
          icon: Icon(Icons.account_circle),
          onPressed: () {},
        ),
        title: Text('Food Delivery'),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              'Cart(${currentUser.cart.length})',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: MediaQuery.of(context).size.width < 770
            ? [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Icon(
                              Icons.clear,
                              size: 30.0,
                            ),
                          )),
                      focusColor: Colors.blue,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30.0,
                      ),
                      hintText: 'Search Food or Restaurants',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                        borderSide: BorderSide(width: 0.8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                        borderSide:
                            BorderSide(width: 0.8, color: Colors.blue[900]),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                        borderSide: BorderSide(
                            width: 0.8, color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ),
                ),
                RecentOrders(),
              ]
            : [
                Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.0),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.clear,
                                size: 30.0,
                              ),
                              onPressed: () {},
                            ),
                            focusColor: Colors.blue,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.search,
                                size: 30.0,
                              ),
                            ),
                            hintText: 'Search Food or Restaurants',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                30.0,
                              ),
                              borderSide: BorderSide(width: 0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 1, child: Container())
                  ],
                ),
                RecentOrders(),
              ],
      ),
    );
  }
}
//
// Row(
// children: [
// Expanded(
// flex: 1,
// child: Padding(
// padding: const EdgeInsets.all(10.0),
// child: TextField(
// decoration: InputDecoration(
// fillColor: Colors.white,
// filled: true,
// contentPadding:
// EdgeInsets.symmetric(vertical: 15.0),
// suffixIcon: IconButton(
// onPressed: () {},
// icon: Icon(
// Icons.clear,
// size: 30.0,
// )),
// focusColor: Colors.blue,
// prefixIcon: Icon(
// Icons.search,
// size: 30.0,
// ),
// hintText: 'Search Food or Restaurants',
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(
// 30.0,
// ),
// borderSide: BorderSide(width: 0.8),
// ),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(
// 30.0,
// ),
// borderSide: BorderSide(
// width: 0.8, color: Colors.blue[900]),
// ),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(
// 30.0,
// ),
// borderSide: BorderSide(
// width: 0.8, color: Colors.deepOrangeAccent),
// ),
// ),
// ),
// ),
// ),
// Expanded(
// flex: 1,
// child: Padding(
// padding: const EdgeInsets.all(10.0),
// child: TextField(
// decoration: InputDecoration(
// fillColor: Colors.white,
// filled: true,
// contentPadding:
// EdgeInsets.symmetric(vertical: 15.0),
// suffixIcon: IconButton(
// onPressed: () {},
// icon: Icon(
// Icons.clear,
// size: 30.0,
// )),
// focusColor: Colors.blue,
// prefixIcon: Icon(
// Icons.search,
// size: 30.0,
// ),
// hintText: 'Search Food or Restaurants',
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(
// 30.0,
// ),
// borderSide: BorderSide(width: 0.8),
// ),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(
// 30.0,
// ),
// borderSide: BorderSide(
// width: 0.8, color: Colors.blue[900]),
// ),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(
// 30.0,
// ),
// borderSide: BorderSide(
// width: 0.8, color: Colors.deepOrangeAccent),
// ),
// ),
// ),
// ),
// ),
// ],
// )
