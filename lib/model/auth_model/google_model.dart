class UserGoogle {
  String? displayName;
  String? email;
  String? emailVerified;
  String? photoURL;

  UserGoogle(this.displayName, this.email, this.emailVerified, this.photoURL);
  UserGoogle.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    photoURL = json['photoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['emailVerified'] = this.emailVerified;
    data['photoURL'] = this.photoURL;
    return data;
  }
}
