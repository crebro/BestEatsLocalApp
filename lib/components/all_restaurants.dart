import 'package:BestEatsLocal/components/restaurant.dart';
import 'package:BestEatsLocal/models/restaurant.dart';
import 'package:BestEatsLocal/services/apiService.dart';
import 'package:flutter/material.dart';

class AllRestaurants extends StatefulWidget {
  const AllRestaurants({
    Key key,
  }) : super(key: key);

  @override
  _AllRestaurantsState createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
  ApiService apiService = ApiService();
  List<Restaurant> restaurants = [];

  @override
  void initState() {
    super.initState();
    getCoupons();
  }

  void getCoupons() async {
    List<Restaurant> responseRestaurants = await apiService.getRestaurants();
    setState(() {
      this.restaurants = responseRestaurants;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
            childAspectRatio: 1 / 1.05,
            crossAxisCount: 2,
            children: restaurants
                .map((restaurant) => UiRestaurant(
                      restaurant: restaurant,
                    ))
                .toList()));
  }
}
