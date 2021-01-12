import 'package:flutter/material.dart';
import 'package:pokemon/data/data.dart';
import 'package:pokemon/screens/cart_screen.dart';
import 'package:pokemon/widgets/nearby_restuarents.dart';
import 'package:pokemon/widgets/recent_order.dart';

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
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
          onPressed: () {},
        ),

        //Title
        centerTitle: true,
        title: Text(
          'Food Delivery',
        ),

        actions: [
          FlatButton(
            onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CartScreen())),
            child: Text(
              'Cart(${currentUser.cart.length})',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
                hintText: 'Search Food or Restuarents',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ),
          RecentOrder(),
          NearbyRestuarents(),

        ],
      ),
    );
  }
}
