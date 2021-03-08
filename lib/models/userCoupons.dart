class UserCoupon {
  String value;
  String description;
  int id;
  String useToken;
  String restaurantImage;
  UserCoupon({
    this.value,
    this.description,
  });
  UserCoupon.fromMap(Map map) {
    this.value = map['display_text'];
    this.description = map['description'];
    this.id = map['id'];
    this.useToken = map['use_token'];
    this.restaurantImage = map['restaurant_image'];
  }
}
