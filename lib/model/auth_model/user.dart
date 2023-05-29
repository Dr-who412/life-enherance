class UserModel {
  bool? status;
  User? user;

  UserModel({this.status, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? email;
  String? password;
  String? name;
  int? iV;
  String? bMI;
  String? photoURL;
  int? age;
  double? bmr;
  int? dietLevel;
  String? gender;
  int? height;
  int? weight;

  User(
      {this.sId,
      this.email,
      this.password,
      this.name,
      this.iV,
      this.bMI,
      this.photoURL,
      this.age,
      this.bmr,
      this.dietLevel,
      this.gender,
      this.height,
      this.weight});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    iV = json['__v'];
    bMI = json['BMI'];
    photoURL = json['PhotoURL'];
    age = json['age'];
    bmr = json['bmr'];
    dietLevel = json['dietLevel'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['__v'] = this.iV;
    data['BMI'] = this.bMI;
    data['PhotoURL'] = this.photoURL;
    data['age'] = this.age;
    data['bmr'] = this.bmr;
    data['dietLevel'] = this.dietLevel;
    data['gender'] = this.gender;
    data['height'] = this.height;
    data['weight'] = this.weight;
    return data;
  }
}
