class Mail {
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? weightWatcherSmartPoints;
  String? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  String? creditsText;
  String? license;
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredients>? extendedIngredients;
  int? id;
  String? title;
  String? author;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  String? summary;
  // List<Null>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<String>? occasions;
  // WinePairing? winePairing;
  String? instructions;
  // List<AnalyzedInstructions>? analyzedInstructions;
  Null? originalId;
  String? spoonacularSourceUrl;

  Mail(
      {this.vegetarian,
      this.vegan,
      this.glutenFree,
      this.dairyFree,
      this.veryHealthy,
      this.cheap,
      this.veryPopular,
      this.sustainable,
      this.lowFodmap,
      this.weightWatcherSmartPoints,
      this.gaps,
      this.preparationMinutes,
      this.cookingMinutes,
      this.aggregateLikes,
      this.healthScore,
      this.creditsText,
      this.license,
      this.sourceName,
      this.pricePerServing,
      this.extendedIngredients,
      this.id,
      this.title,
      this.author,
      this.readyInMinutes,
      this.servings,
      this.sourceUrl,
      this.image,
      this.imageType,
      this.summary,
      // this.cuisines,
      this.dishTypes,
      this.diets,
      this.occasions,
      // this.winePairing,
      this.instructions,
      // this.analyzedInstructions,
      this.originalId,
      this.spoonacularSourceUrl});

  Mail.fromJson(Map<String, dynamic> json) {
    vegetarian = json['vegetarian'];
    vegan = json['vegan'];
    glutenFree = json['glutenFree'];
    dairyFree = json['dairyFree'];
    veryHealthy = json['veryHealthy'];
    cheap = json['cheap'];
    veryPopular = json['veryPopular'];
    sustainable = json['sustainable'];
    lowFodmap = json['lowFodmap'];
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    gaps = json['gaps'];
    preparationMinutes = json['preparationMinutes'];
    cookingMinutes = json['cookingMinutes'];
    aggregateLikes = json['aggregateLikes'];
    healthScore = json['healthScore'];
    creditsText = json['creditsText'];
    license = json['license'];
    sourceName = json['sourceName'];
    pricePerServing = json['pricePerServing'];
    if (json['extendedIngredients'] != null) {
      extendedIngredients = <ExtendedIngredients>[];
      json['extendedIngredients'].forEach((v) {
        extendedIngredients!.add(new ExtendedIngredients.fromJson(v));
      });
    }
    id = json['id'];
    title = json['title'];
    author = json['author'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    image = json['image'];
    imageType = json['imageType'];
    summary = json['summary'];
    // if (json['cuisines'] != null) {
    //   cuisines = <Null>[];
    //   json['cuisines'].forEach((v) {
    //     cuisines!.add(new Null.fromJson(v));
    //   });
    // }
    dishTypes = json['dishTypes'].cast<String>();
    diets = json['diets'].cast<String>();
    occasions = json['occasions'].cast<String>();
    // winePairing = json['winePairing'] != null
    //     ? new WinePairing.fromJson(json['winePairing'])
    //     : null;
    instructions = json['instructions'];
    // if (json['analyzedInstructions'] != null) {
    //   // analyzedInstructions = <AnalyzedInstructions>[];
    //   // json['analyzedInstructions'].forEach((v) {
    //   //   analyzedInstructions!.add(new AnalyzedInstructions.fromJson(v));
    //   // });
    // }
    originalId = json['originalId'];
    spoonacularSourceUrl = json['spoonacularSourceUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vegetarian'] = this.vegetarian;
    data['vegan'] = this.vegan;
    data['glutenFree'] = this.glutenFree;
    data['dairyFree'] = this.dairyFree;
    data['veryHealthy'] = this.veryHealthy;
    data['cheap'] = this.cheap;
    data['veryPopular'] = this.veryPopular;
    data['sustainable'] = this.sustainable;
    data['lowFodmap'] = this.lowFodmap;
    data['weightWatcherSmartPoints'] = this.weightWatcherSmartPoints;
    data['gaps'] = this.gaps;
    data['preparationMinutes'] = this.preparationMinutes;
    data['cookingMinutes'] = this.cookingMinutes;
    data['aggregateLikes'] = this.aggregateLikes;
    data['healthScore'] = this.healthScore;
    data['creditsText'] = this.creditsText;
    data['license'] = this.license;
    data['sourceName'] = this.sourceName;
    data['pricePerServing'] = this.pricePerServing;
    if (this.extendedIngredients != null) {
      data['extendedIngredients'] =
          this.extendedIngredients!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['readyInMinutes'] = this.readyInMinutes;
    data['servings'] = this.servings;
    data['sourceUrl'] = this.sourceUrl;
    data['image'] = this.image;
    data['imageType'] = this.imageType;
    data['summary'] = this.summary;
    // if (this.cuisines != null) {
    //   data['cuisines'] = this.cuisines!.map((v) => v.toJson()).toList();
    // }
    data['dishTypes'] = this.dishTypes;
    data['diets'] = this.diets;
    data['occasions'] = this.occasions;
    // if (this.winePairing != null) {
    //   data['winePairing'] = this.winePairing!.toJson();
    // }
    data['instructions'] = this.instructions;
    // if (this.analyzedInstructions != null) {
    //   data['analyzedInstructions'] =
    //       this.analyzedInstructions!.map((v) => v.toJson()).toList();
    // }
    data['originalId'] = this.originalId;
    data['spoonacularSourceUrl'] = this.spoonacularSourceUrl;
    return data;
  }
}

class ExtendedIngredients {
  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  var amount;
  String? unit;
  List<String>? meta;
  // Measures? measures;

  ExtendedIngredients({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    // this.measures
  });

  ExtendedIngredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    aisle = json['aisle'];
    image = json['image'];
    consistency = json['consistency'];
    name = json['name'];
    nameClean = json['nameClean'];
    original = json['original'];
    originalName = json['originalName'];
    amount = json['amount'];
    unit = json['unit'];
    meta = json['meta'].cast<String>();
    // measures = json['measures'] != null
    //     ? new Measures.fromJson(json['measures'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['aisle'] = this.aisle;
    data['image'] = this.image;
    data['consistency'] = this.consistency;
    data['name'] = this.name;
    data['nameClean'] = this.nameClean;
    data['original'] = this.original;
    data['originalName'] = this.originalName;
    data['amount'] = this.amount;
    data['unit'] = this.unit;
    data['meta'] = this.meta;
    // if (this.measures != null) {
    //   data['measures'] = this.measures!.toJson();
    // }
    return data;
  }
}
//
// class Measures {
//   Us? us;
//   Metric? metric;
//
//   Measures({this.us, this.metric});
//
//   Measures.fromJson(Map<String, dynamic> json) {
//     us = json['us'] != null ? new Us.fromJson(json['us']) : null;
//     metric =
//         json['metric'] != null ? new Metric.fromJson(json['metric']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.us != null) {
//       data['us'] = this.us!.toJson();
//     }
//     if (this.metric != null) {
//       data['metric'] = this.metric!.toJson();
//     }
//     return data;
//   }
// }

// class Us {
//   var amount;
//   String? unitShort;
//   String? unitLong;
//
//   Us({this.amount, this.unitShort, this.unitLong});
//
//   Us.fromJson(Map<String, dynamic> json) {
//     amount = json['amount'];
//     unitShort = json['unitShort'];
//     unitLong = json['unitLong'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['amount'] = this.amount;
//     data['unitShort'] = this.unitShort;
//     data['unitLong'] = this.unitLong;
//     return data;
//   }
// }
//
// class Metric {
//   double? amount;
//   String? unitShort;
//   String? unitLong;
//
//   Metric({this.amount, this.unitShort, this.unitLong});
//
//   Metric.fromJson(Map<String, dynamic> json) {
//     amount = json['amount'];
//     unitShort = json['unitShort'];
//     unitLong = json['unitLong'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['amount'] = this.amount;
//     data['unitShort'] = this.unitShort;
//     data['unitLong'] = this.unitLong;
//     return data;
//   }
// }
//
// class WinePairing {
//   List<Null>? pairedWines;
//   String? pairingText;
//   List<Null>? productMatches;
//
//   WinePairing({this.pairedWines, this.pairingText, this.productMatches});
//
//   WinePairing.fromJson(Map<String, dynamic> json) {
//     if (json['pairedWines'] != null) {
//       pairedWines = <Null>[];
//       json['pairedWines'].forEach((v) {
//         pairedWines!.add(new Null.fromJson(v));
//       });
//     }
//     pairingText = json['pairingText'];
//     if (json['productMatches'] != null) {
//       productMatches = <Null>[];
//       json['productMatches'].forEach((v) {
//         productMatches!.add(new Null.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.pairedWines != null) {
//       data['pairedWines'] = this.pairedWines!.map((v) => v?.toJson()).toList();
//     }
//     data['pairingText'] = this.pairingText;
//     if (this.productMatches != null) {
//       data['productMatches'] =
//           this.productMatches!.map((v) => v?.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class AnalyzedInstructions {
//   String? name;
//   List<Steps>? steps;
//
//   AnalyzedInstructions({this.name, this.steps});
//
//   AnalyzedInstructions.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     if (json['steps'] != null) {
//       steps = <Steps>[];
//       json['steps'].forEach((v) {
//         steps!.add(new Steps.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     if (this.steps != null) {
//       data['steps'] = this.steps!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Steps {
  int? number;
  String? step;
  List<Ingredients>? ingredients;
  // List<Equipment>? equipment;
  Length? length;

  Steps({this.number, this.step, this.ingredients, this.length});

  Steps.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    step = json['step'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    // if (json['equipment'] != null) {
    //   equipment = <Equipment>[];
    //   json['equipment'].forEach((v) {
    //     equipment!.add(new Equipment.fromJson(v));
    //   });
    // }
    length =
        json['length'] != null ? new Length.fromJson(json['length']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['step'] = this.step;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    // if (this.equipment != null) {
    //   data['equipment'] = this.equipment!.map((v) => v.toJson()).toList();
    // }
    if (this.length != null) {
      data['length'] = this.length!.toJson();
    }
    return data;
  }
}

class Ingredients {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Ingredients({this.id, this.name, this.localizedName, this.image});

  Ingredients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['localizedName'] = this.localizedName;
    data['image'] = this.image;
    return data;
  }
}

class Length {
  int? number;
  String? unit;

  Length({this.number, this.unit});

  Length.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['unit'] = this.unit;
    return data;
  }
}
