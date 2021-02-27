import 'package:BestEatsLocal/models/restaurant.dart';
import 'package:BestEatsLocal/pages/restaurant_details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UiRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  UiRestaurant({@required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantDetails(
                      restaurant: restaurant,
                    )));
      },
      child: VxBox(
          child: Column(
        children: [
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  restaurant.imageLocation,
                  height: 90,
                  width: 180,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 180,
                child: getTruncatedTitle(restaurant.coupon.value)
                    .text
                    .xl
                    .maxLines(2)
                    .overflow(TextOverflow.ellipsis)
                    // .textStyle(GoogleFonts.robotoSlab())
                    .bold
                    .black
                    .make(),
              ),
            ],
          ))
        ],
      )).padding(EdgeInsets.all(15)).neumorphic().make(),
    );
  }

  String getTruncatedTitle(String normal) {
    int limit = 47;
    if (normal.length > limit) {
      return normal + " .. ";
    }
    return normal;
  }
}
