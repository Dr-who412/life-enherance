class DoctorModel {
  String? sId;
  String? name;
  String? address;
  int? fee;
  int? rate;
  String? phone;

  DoctorModel(
      {this.sId, this.name, this.address, this.fee, this.rate, this.phone});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    address = json['Address'];
    fee = json['Fee'];
    rate = json['rate'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['Address'] = this.address;
    data['Fee'] = this.fee;
    data['rate'] = this.rate;
    data['phone'] = this.phone;
    return data;
  }
}