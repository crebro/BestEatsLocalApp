import 'package:BestEatsLocal/pages/home.dart';
import 'package:BestEatsLocal/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWrapper extends StatefulWidget {
  @override
  _AppWrapperState createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getWarmUser();
  }

  void getWarmUser() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.getWarmUser();
    setState(() {
      this.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !this.loading
        ? HomePage()
        : Scaffold(
            body: Container(
              child: Center(
                child: Text("Loading..."),
              ),
            ),
          );
  }
}
