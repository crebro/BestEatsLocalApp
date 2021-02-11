import 'package:BestEatsLocal/components/plain_button.dart';
import 'package:BestEatsLocal/providers/userProvider.dart';
import 'package:BestEatsLocal/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterPage extends StatefulWidget {
  final Function togglePage;
  RegisterPage({@required this.togglePage});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name;
  String email;
  String password;
  ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Name".text.xl2.bold.make(),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? "Please Enter a Username" : null,
                          onChanged: (value) {
                            setState(() {
                              this.name = value;
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
                          }
                        }
                      },
                      value: "Register",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.togglePage();
                      },
                      child: Text(
                        "Already Have an Account? Sign in Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
