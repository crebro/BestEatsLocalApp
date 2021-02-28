class ApiCoupon {
  String value;
  String description;
  int id;
  ApiCoupon({
    this.value,
    this.description,
  });
  ApiCoupon.fromMap(Map map) {
    this.value = map['display_text'];
    this.description = map['description'];
    this.id = map['id'];
  }
}
