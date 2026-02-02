class HomeModel {
  List<Banners>? banners;
  List<String>? popupImages;
  List<Products>? products;
  List<Ingredients>? ingredients;
  List<Categories>? categories;

  HomeModel(
      {this.banners,
        this.popupImages,
        this.products,
        this.ingredients,
        this.categories});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['Banners'] != null) {
      banners = <Banners>[];
      json['Banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    if (json['PopupImages'] != null) {
      popupImages = <String>[];
      json['PopupImages'].forEach((v) {
        // popupImages!.add(new Null.fromJson(v));
      });
    }
    if (json['Products'] != null) {
      products = <Products>[];
      json['Products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['Ingredients'] != null) {
      ingredients = <Ingredients>[];
      json['Ingredients'].forEach((v) {
        ingredients!.add(new Ingredients.fromJson(v));
      });
    }
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['Banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.popupImages != null) {
      // data['PopupImages'] = this.popupImages!.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['Products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.ingredients != null) {
      data['Ingredients'] = this.ingredients!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['Categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  int? iD;
  String? banarName;
  String? banarImage;

  Banners({this.iD, this.banarName, this.banarImage});

  Banners.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    banarName = json['BanarName'];
    banarImage = json['BanarImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['BanarName'] = this.banarName;
    data['BanarImage'] = this.banarImage;
    return data;
  }
}

class Products {
  int? pid;
  String? pcode;
  String? name;
  int? pCID;
  String? smallImagePath;
  String? largeImagePath;

  Products(
      {this.pid,
        this.pcode,
        this.name,
        this.pCID,
        this.smallImagePath,
        this.largeImagePath});

  Products.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    pcode = json['Pcode'];
    name = json['Name'];
    pCID = json['PCID'];
    smallImagePath = json['SmallImagePath'];
    largeImagePath = json['LargeImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['Pcode'] = this.pcode;
    data['Name'] = this.name;
    data['PCID'] = this.pCID;
    data['SmallImagePath'] = this.smallImagePath;
    data['LargeImagePath'] = this.largeImagePath;
    return data;
  }
}

class Ingredients {
  int? sno;
  String? ingredientname;
  String? ingredentiamge;
  String? description;

  Ingredients(
      {this.sno, this.ingredientname, this.ingredentiamge, this.description});

  Ingredients.fromJson(Map<String, dynamic> json) {
    sno = json['Sno'];
    ingredientname = json['Ingredientname'];
    ingredentiamge = json['Ingredentiamge'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sno'] = this.sno;
    data['Ingredientname'] = this.ingredientname;
    data['Ingredentiamge'] = this.ingredentiamge;
    data['Description'] = this.description;
    return data;
  }
}

class Categories {
  int? pCID;
  String? subCategory;
  String? mobBannerImage;

  Categories({this.pCID, this.subCategory, this.mobBannerImage});

  Categories.fromJson(Map<String, dynamic> json) {
    pCID = json['PCID'];
    subCategory = json['SubCategory'];
    mobBannerImage = json['MobBannerImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PCID'] = this.pCID;
    data['SubCategory'] = this.subCategory;
    data['MobBannerImage'] = this.mobBannerImage;
    return data;
  }
}
