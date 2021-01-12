import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokemon/models/food.dart';
import 'package:pokemon/models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant rst;

  RestaurantScreen({this.rst});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.rst.imageUrl,
                child: Image(
                  image: AssetImage(widget.rst.imageUrl),
                  width: MediaQuery.of(context).size.width,
                  height: 220.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 30.0,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      color: Colors.white,
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.orangeAccent,
                          size: 35.0,
                        ),
                        onPressed: () {})
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.rst.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.0),
                    ),
                    Text(
                      '0.2 miles away',
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.rst.address,
                  style: TextStyle(fontSize: 16.0),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                onPressed: () {},
                child: Text(
                  'Reviews',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                onPressed: () {},
                child: Text(
                  'Contacts',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              'Menu',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(widget.rst.menu.length, (index) {
                Food food = widget.rst.menu[index];
                return _buildMenu(food);
              }),
            ),
          )
        ],
      ),
    );
  }

  _buildMenu(Food food) {
    return Center(
      child: Stack(
        alignment: Alignment.center,

        children: [
          Container(
            height: 160.0,
            width: 160.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(food.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
          ),
          Container(
            height: 160.0,
            width: 160.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black38.withOpacity(0.3),
                    ],
                    stops: [
                      0.1,
                      0.4,
                      0.7,
                      0.9
                    ])),
          ),
          Positioned(
       bottom: 60.0,
            child: Column(
              children: [
                Text(
                  food.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0),
                ),
                Text(
                  '\$${food.price}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              width: 45.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0)
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.add,),
                iconSize: 30,
                color: Colors.white,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
