import 'package:BestEatsLocal/components/plain_button.dart';
import 'package:BestEatsLocal/providers/userProvider.dart';
import 'package:BestEatsLocal/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  final Function togglePage;
  LoginPage({@required this.togglePage});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  "Back".text.xl.bold.make()
                ],
              ),
            ),
            Expanded(
                child: Form(
              key: _formKey,
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Email Address".text.xl2.bold.make(),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? "Please Enter an Email" : null,
                          onChanged: (value) {
                            setState(() {
                              this.email = value;
                            });
                          },
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Color(0xfff3f3f3),
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Password".text.xl2.bold.make(),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? "Please Enter a Password" : null,
                          onChanged: (value) {
                            setState(() {
                              this.password = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            fillColor: Color(0xfff3f3f3),
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PlainButton(
                      icon: Icons.lock,
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          bool success =
                              await userProvider.loginUser(email, password);
                          if (success) {
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Invalid Credentials")));
                          }
                        }
                      },
                      value: "Login",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.togglePage();
                      },
                      child: Text(
                        "New to BestEatsLocal? Register Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
