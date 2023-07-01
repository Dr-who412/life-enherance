class GuideModel {
  bool? status;
  int? isDisorder;
  List<Guide>? guide;

  GuideModel({this.status, this.isDisorder, this.guide});

  GuideModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    isDisorder = json['isDisorder'];
    if (json['guide'] != null) {
      guide = <Guide>[];
      json['guide'].forEach((v) {
        guide!.add(new Guide.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['isDisorder'] = this.isDisorder;
    if (this.guide != null) {
      data['guide'] = this.guide!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Guide {
  String? sId;
  String? guide;

  Guide({this.sId, this.guide});

  Guide.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    guide = json['guide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['guide'] = this.guide;
    return data;
  }
}