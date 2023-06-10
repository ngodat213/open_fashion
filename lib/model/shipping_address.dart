class ShippingAddress {
  String? firstName;
  String? lastName;
  String? address;
  String? city;
  String? state;
  String? zipcode;
  String? phoneNumber;

  ShippingAddress({
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.state,
    this.zipcode,
    this.phoneNumber,
  });

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
