import 'package:flutter/material.dart';
import 'package:pokemon/data/data.dart';
import 'package:pokemon/screens/restaurentScreen.dart';

class NearbyRestuarents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Nearby Restaurants',
            style: TextStyle(
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
            ),
          ),
        ),
        _buildRestaurants(context),
      ],
    );
  }

  _buildRestaurants(BuildContext context) {
    List<Widget> restaurantList = [];
    restaurants.forEach((rst) {
      restaurantList.add(
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>RestaurantScreen(rst: rst,)));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey[200]),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: rst.imageUrl,
                    child: Image(
                      image: AssetImage(
                        rst.imageUrl,
                      ),
                      height: 150.0,
                      width: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(
                      12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          rst.name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          rst.address,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                       overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '0.2 miles ',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });

    return Column(
      children: restaurantList,
    );
  }
}
