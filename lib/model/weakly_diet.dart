class WeeklyDiet {
  bool? status;
  Diet? diet;

  WeeklyDiet({this.status, this.diet});

  WeeklyDiet.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    diet = json['diet'] != null ? new Diet.fromJson(json['diet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.diet != null) {
      data['diet'] = this.diet!.toJson();
    }
    return data;
  }
}

class Diet {
  Description? description;
  String? sId;
  int? iV;

  Diet({this.description, this.sId, this.iV});

  Diet.fromJson(Map<String, dynamic> json) {
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}

class Description {
  Week? week;

  Description({this.week});

  Description.fromJson(Map<String, dynamic> json) {
    week = json['week'] != null ? new Week.fromJson(json['week']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.week != null) {
      data['week'] = this.week!.toJson();
    }
    return data;
  }
}

class Week {
  Day? monday;
  Day? tuesday;
  Day? wednesday;
  Day? thursday;
  Day? friday;
  Day? saturday;
  Day? sunday;

  Week(
      {this.monday,
      this.tuesday,
      this.wednesday,
      this.thursday,
      this.friday,
      this.saturday,
      this.sunday});

  Week.fromJson(Map<String, dynamic> json) {
    monday = json['monday'] != null ? new Day.fromJson(json['monday']) : null;
    tuesday =
        json['tuesday'] != null ? new Day.fromJson(json['tuesday']) : null;
    wednesday =
        json['wednesday'] != null ? new Day.fromJson(json['wednesday']) : null;
    thursday =
        json['thursday'] != null ? new Day.fromJson(json['thursday']) : null;
    friday = json['friday'] != null ? new Day.fromJson(json['friday']) : null;
    saturday =
        json['saturday'] != null ? new Day.fromJson(json['saturday']) : null;
    sunday = json['sunday'] != null ? new Day.fromJson(json['sunday']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.monday != null) {
      data['monday'] = this.monday!.toJson();
    }
    if (this.tuesday != null) {
      data['tuesday'] = this.tuesday!.toJson();
    }
    if (this.wednesday != null) {
      data['wednesday'] = this.wednesday!.toJson();
    }
    if (this.thursday != null) {
      data['thursday'] = this.thursday!.toJson();
    }
    if (this.friday != null) {
      data['friday'] = this.friday!.toJson();
    }
    if (this.saturday != null) {
      data['saturday'] = this.saturday!.toJson();
    }
    if (this.sunday != null) {
      data['sunday'] = this.sunday!.toJson();
    }
    return data;
  }
}

class Day {
  List<Meals>? meals;
  Nutrients? nutrients;

  Day({this.meals, this.nutrients});

  Day.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(new Meals.fromJson(v));
      });
    }
    nutrients = json['nutrients'] != null
        ? new Nutrients.fromJson(json['nutrients'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    if (this.nutrients != null) {
      data['nutrients'] = this.nutrients!.toJson();
    }
    return data;
  }
}

class Meals {
  int? id;
  String? imageType;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;

  Meals(
      {this.id,
      this.imageType,
      this.title,
      this.readyInMinutes,
      this.servings,
      this.sourceUrl});

  Meals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageType = json['imageType'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageType'] = this.imageType;
    data['title'] = this.title;
    data['readyInMinutes'] = this.readyInMinutes;
    data['servings'] = this.servings;
    data['sourceUrl'] = this.sourceUrl;
    return data;
  }
}

class Nutrients {
  double? calories;
  double? protein;
  double? fat;
  double? carbohydrates;

  Nutrients({this.calories, this.protein, this.fat, this.carbohydrates});

  Nutrients.fromJson(Map<String, dynamic> json) {
    calories = double.parse('${json['calories']}');
    protein = double.parse('${json['protein']}');
    fat = double.parse('${json['fat']}');
    carbohydrates = double.parse('${json['carbohydrates']}');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calories'] = this.calories;
    data['protein'] = this.protein;
    data['fat'] = this.fat;
    data['carbohydrates'] = this.carbohydrates;
    return data;
  }
}

// class Nutrients {
//   double? calories;
//   double? protein;
//   int? fat;
//   double? carbohydrates;
//
//   Nutrients({this.calories, this.protein, this.fat, this.carbohydrates});
//
//   Nutrients.fromJson(Map<String, dynamic> json) {
//     calories = json['calories'];
//     protein = json['protein'];
//     fat = json['fat'];
//     carbohydrates = json['carbohydrates'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['calories'] = this.calories;
//     data['protein'] = this.protein;
//     data['fat'] = this.fat;
//     data['carbohydrates'] = this.carbohydrates;
//     return data;
//   }
// }
