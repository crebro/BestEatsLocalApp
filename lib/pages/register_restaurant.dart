import 'dart:io';
import 'package:BestEatsLocal/components/plain_button.dart';
import 'package:BestEatsLocal/providers/userProvider.dart';
import 'package:BestEatsLocal/services/apiService.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterRestaurantPage extends StatefulWidget {
  @override
  _RegisterRestaurantPageState createState() => _RegisterRestaurantPageState();
}

class _RegisterRestaurantPageState extends State<RegisterRestaurantPage> {
  String name;
  String phone;
  String email;
  String website;
  File _image;
  final picker = ImagePicker();
  ApiService apiService = ApiService();
  final _formKey = GlobalKey<FormState>();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: _image == null
                            ? GestureDetector(
                                onTap: () => getImage(),
                                child: Icon(Icons.add_a_photo))
                            : GestureDetector(
                                onTap: () => getImage(),
                                child: Container(
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            _image,
                                            height: 90,
                                            width: 180,
                                            fit: BoxFit.cover,
                                          )),
                                      "Tap to Change".text.bold.xl.make(),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Restaurant Name".text.xl2.bold.make(),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (value) => value.isEmpty
                                ? "Please Enter Your Restaurant's Name"
                                : null,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Restaurant Email".text.xl2.bold.make(),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (value) => value.isEmpty
                                ? "Please Enter Your Restaurant's Email"
                                : null,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Restaurant Phone Number".text.xl2.bold.make(),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value) => value.isEmpty
                                ? "Please Enter Your Restaurant's Phone Number"
                                : null,
                            onChanged: (value) {
                              setState(() {
                                this.phone = value;
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Restaurant Website".text.xl2.bold.make(),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (value) => value.isEmpty
                                ? "Please Enter Your Restaurant's Website Url"
                                : null,
                            onChanged: (value) {
                              setState(() {
                                this.website = value;
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
                      SizedBox(
                        height: 10,
                      ),
                      PlainButton(
                        icon: Icons.fastfood_outlined,
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            ApiService apiService = ApiService();
                            print("this got called");
                            var response = await apiService.registerRestaurant(
                              email: email,
                              name: name,
                              phone: phone,
                              website: website,
                              imagePath: _image.path,
                            );
                          }
                        },
                        value: "Register a Restaurant",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
