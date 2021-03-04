class UserCoupon {
  String value;
  String description;
  int id;
  String useToken;
  UserCoupon({
    this.value,
    this.description,
  });
  UserCoupon.fromMap(Map map) {
    this.value = map['display_text'];
    this.description = map['description'];
    this.id = map['id'];
    this.useToken = map['use_token'];
  }
}
