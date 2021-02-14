class Restaurant {
  String name;
  String imageLocation;
  String phone;
  String email;
  String website;
  Restaurant.fromMap(Map map) {
    this.name = map['name'];
    this.imageLocation = map['image'];
    this.phone = map['phone'];
    this.email = map['email'];
    this.website = map['website'];
  }
}
