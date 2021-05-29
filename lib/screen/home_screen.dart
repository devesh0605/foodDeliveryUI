import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meal_ui/data/data.dart';
import 'package:flutter_meal_ui/models/restaurant.dart';
import 'package:flutter_meal_ui/screen/cart_screen.dart';
import 'package:flutter_meal_ui/screen/restaurant_details.dart';
import 'package:flutter_meal_ui/widgets/rating_stars.dart';
import 'package:flutter_meal_ui/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantsList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantsList.add(InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RestaurantDetails(
              restaurant: restaurant,
            );
          }));
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1,
              color: Colors.grey[200],
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Hero(
                  tag: restaurant.name,
                  child: Image(
                    height: 150,
                    width: 150,
                    image: AssetImage(
                      restaurant.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      RatingStars(restaurant.rating),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        restaurant.address,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        '0.2 km away',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    });
    return ListView(
      children: restaurantsList,
    );
  }

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
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return CartScreen();
              }));
            },
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                              Icons.arrow_forward,
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text(
                    'Nearby Restaurants',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _buildRestaurants(),
                  ),
                ),
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
