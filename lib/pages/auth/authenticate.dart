import 'package:BestEatsLocal/pages/auth/login.dart';
import 'package:BestEatsLocal/pages/auth/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  final bool showLogin;
  Authenticate({@required this.showLogin});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;

  @override
  void initState() {
    super.initState();
    if (!widget.showLogin) {
      setState(() {
        this.showLogin = false;
      });
    }
  }

  void toggleLogin() {
    setState(() {
      this.showLogin = !this.showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return Scaffold(
        body: LoginPage(
          togglePage: this.toggleLogin,
        ),
      );
    }
    return Scaffold(body: RegisterPage(togglePage: this.toggleLogin));
  }
}
