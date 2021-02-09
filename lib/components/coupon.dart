import 'package:BestEatsLocal/models/coupon.dart';
import 'package:BestEatsLocal/pages/coupon_details.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Coupon extends StatelessWidget {
  final ApiCoupon coupon;
  Coupon({@required this.coupon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CouponDetails(
                      apiCoupon: coupon,
                    )));
      },
      child: VxBox(
          child: Column(
        children: [
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  coupon.restaurant.imageLocation,
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
                child: getTruncatedTitle(coupon.value)
                    .text
                    .xl
                    .maxLines(3)
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

// class Coupon extends StatelessWidget {
//   const Coupon({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Material(
//           color: Color(0xff8f3674),
//           elevation: 5,
//           shape: CouponShapeBorder(),
//           child: Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(10),
//             height: 150,
//             width: 400,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '10% Off of Food',
//                   style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'Tararine Thai Cuisine',
//                   style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }
