class todoTaskModel {
  bool? status;
  List<Exercise> exercise = const [];
  List<Diet> diet = const [];

  todoTaskModel({this.status, this.exercise = const [], this.diet = const []});

  todoTaskModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['exercise'] != null) {
      exercise = <Exercise>[];
      json['exercise'].forEach((v) {
        exercise!.add(new Exercise.fromJson(v));
      });
    }
    if (json['diet'] != null) {
      diet = <Diet>[];
      json['diet'].forEach((v) {
        diet!.add(new Diet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.exercise != null) {
      data['exercise'] = this.exercise!.map((v) => v.toJson()).toList();
    }
    if (this.diet != null) {
      data['diet'] = this.diet!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercise {
  String? sId;
  String? title;
  String? uRL;
  String? thumbnail;
  int? level;

  Exercise({this.sId, this.title, this.uRL, this.thumbnail, this.level});

  Exercise.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['Title'];
    uRL = json['URL'];
    thumbnail = json['Thumbnail'];
    level = json['Level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Title'] = this.title;
    data['URL'] = this.uRL;
    data['Thumbnail'] = this.thumbnail;
    data['Level'] = this.level;
    return data;
  }
}

class Diet {
  int? calories;
  String? carbs;
  String? fat;
  int? id;
  String? image;
  String? protein;
  String? title;

  Diet(
      {this.calories,
      this.carbs,
      this.fat,
      this.id,
      this.image,
      this.protein,
      this.title});

  Diet.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    carbs = json['carbs'];
    fat = json['fat'];
    id = json['id'];
    image = json['image'];
    protein = json['protein'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calories'] = this.calories;
    data['carbs'] = this.carbs;
    data['fat'] = this.fat;
    data['id'] = this.id;
    data['image'] = this.image;
    data['protein'] = this.protein;
    data['title'] = this.title;
    return data;
  }
}
