
class ProductsModel {
  List<Products>? products;
  List<Categories>? categories;

  ProductsModel({this.products, this.categories});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['Products'] != null) {
      products = <Products>[];
      json['Products'].forEach((v) {
        products!.add(new Products.fromJson(v));
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
    if (this.products != null) {
      data['Products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['Categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? category;
  int? pCID;
  String? subCategory;
  int? pid;
  String? tag;
  String? pcode;
  String? name;
  double? mRP;
  double? dP;
  double? cP;
  double? rate;
  int? qty;
  int? avlQty;
  double? jBV;
  double? rBV;
  String? thumbImage;
  int? disBuyButton;

  Products(
      {this.category,
        this.pCID,
        this.subCategory,
        this.pid,
        this.tag,
        this.pcode,
        this.name,
        this.mRP,
        this.dP,
        this.cP,
        this.rate,
        this.qty,
        this.avlQty,
        this.jBV,
        this.rBV,
        this.thumbImage,
        this.disBuyButton});

  Products.fromJson(Map<String, dynamic> json) {
    category = json['Category'];
    pCID = json['PCID'];
    subCategory = json['SubCategory'];
    pid = json['pid'];
    tag = json['Tag'];
    pcode = json['Pcode'];
    name = json['Name'];
    mRP = json['MRP'];
    dP = json['DP'];
    cP = json['CP'];
    rate = json['Rate'];
    qty = json['Qty'];
    avlQty = json['AvlQty'];
    jBV = json['JBV'];
    rBV = json['RBV'];
    thumbImage = json['ThumbImage'];
    disBuyButton = json['DisBuyButton'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Category'] = this.category;
    data['PCID'] = this.pCID;
    data['SubCategory'] = this.subCategory;
    data['pid'] = this.pid;
    data['Tag'] = this.tag;
    data['Pcode'] = this.pcode;
    data['Name'] = this.name;
    data['MRP'] = this.mRP;
    data['DP'] = this.dP;
    data['CP'] = this.cP;
    data['Rate'] = this.rate;
    data['Qty'] = this.qty;
    data['AvlQty'] = this.avlQty;
    data['JBV'] = this.jBV;
    data['RBV'] = this.rBV;
    data['ThumbImage'] = this.thumbImage;
    data['DisBuyButton'] = this.disBuyButton;
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
