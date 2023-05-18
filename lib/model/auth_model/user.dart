class UserModel{
  String? name;
  String? email;
  String? image;
  UserModel({required this.name,required this.email,this.image});
  factory UserModel.fromJson(Map<String,dynamic>json)=>UserModel(name:json['name'] , email: json['email'],image: json['PhotoURL']??'');

}