import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlainButton extends StatelessWidget {
  final Function onTap;
  final String value;
  final IconData icon;
  const PlainButton({
    Key key,
    this.onTap,
    this.value,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onTap(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              this.value,
              style: TextStyle(
                  fontFamily: GoogleFonts.nunito().fontFamily,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
