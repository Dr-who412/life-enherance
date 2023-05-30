class AllDoctors {
  String? sId;
  String? doctor;
  String? description;
  String? brief;
  String? area;
  String? address;
  String? rate;
  String? price;
  String? link;
  String? phoneNumber;

  AllDoctors(
      {this.sId,
      this.doctor,
      this.description,
      this.brief,
      this.area,
      this.address,
      this.rate,
      this.price,
      this.link,
      this.phoneNumber});

  AllDoctors.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    doctor = json['Doctor'];
    description = json['Description'];
    brief = json['Brief'];
    area = json['Area'];
    address = json['Address'];
    rate = json['Rate'];
    price = json['Price'];
    link = json['Link'];
    phoneNumber = json['Phone number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Doctor'] = this.doctor;
    data['Description'] = this.description;
    data['Brief'] = this.brief;
    data['Area'] = this.area;
    data['Address'] = this.address;
    data['Rate'] = this.rate;
    data['Price'] = this.price;
    data['Link'] = this.link;
    data['Phone number'] = this.phoneNumber;
    return data;
  }
}
