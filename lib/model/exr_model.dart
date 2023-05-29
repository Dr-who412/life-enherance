class EXRModel {
  bool? status;
  List<Exercise> exercise = const [];

  EXRModel({this.status, this.exercise = const []});

  EXRModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['exercises'] != null) {
      exercise = <Exercise>[];
      json['exercises'].forEach((v) {
        exercise!.add(new Exercise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.exercise != null) {
      data['exercise'] = this.exercise!.map((v) => v.toJson()).toList();
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
