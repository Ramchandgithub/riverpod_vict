class CartModel {
  String? result;
  int? regid;
  String? idno;
  String? name;
  String? category;
  String? subCategory;
  int? pid;
  String? pcode;
  String? pName;
  int? qty;
  double? mrp;
  double? dp;
  double? totalMRP;
  double? totalDP;
  double? bv;
  double? totBV;
  double? discountPer;
  double? discountAmt;
  double? totalDiscountAmt;
  double? basicPrice;
  double? totalBasicPrice;
  double? gross;
  double? totalGross;
  double? gst;
  double? cgst;
  double? sgst;
  double? gstAmt;
  double? cgstAmt;
  double? sgstAmt;
  int? floodAmt;
  double? totGSTAmt;
  double? totCGSTAmt;
  double? totSGSTAmt;
  double? total;
  double? cCharges;
  int? stateType;
  String? taxType;
  double? shippingWeight;
  String? ifOfferProduct;
  String? offerName;
  String? buyProduct;
  String? prdImage;
  String? amountTypeName;
  String? pointsTypeName;
  String? packgeDetails;
  int? packageID;

  CartModel(
      {this.result,
        this.regid,
        this.idno,
        this.name,
        this.category,
        this.subCategory,
        this.pid,
        this.pcode,
        this.pName,
        this.qty,
        this.mrp,
        this.dp,
        this.totalMRP,
        this.totalDP,
        this.bv,
        this.totBV,
        this.discountPer,
        this.discountAmt,
        this.totalDiscountAmt,
        this.basicPrice,
        this.totalBasicPrice,
        this.gross,
        this.totalGross,
        this.gst,
        this.cgst,
        this.sgst,
        this.gstAmt,
        this.cgstAmt,
        this.sgstAmt,
        this.floodAmt,
        this.totGSTAmt,
        this.totCGSTAmt,
        this.totSGSTAmt,
        this.total,
        this.cCharges,
        this.stateType,
        this.taxType,
        this.shippingWeight,
        this.ifOfferProduct,
        this.offerName,
        this.buyProduct,
        this.prdImage,
        this.amountTypeName,
        this.pointsTypeName,
        this.packgeDetails,
        this.packageID});

  CartModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    regid = json['regid'];
    idno = json['idno'];
    name = json['name'];
    category = json['category'];
    subCategory = json['subCategory'];
    pid = json['pid'];
    pcode = json['pcode'];
    pName = json['pName'];
    qty = json['qty'];
    mrp = json['mrp'];
    dp = json['dp'];
    totalMRP = json['totalMRP'];
    totalDP = json['totalDP'];
    bv = json['bv'];
    totBV = json['totBV'];
    discountPer = json['discountPer'];
    discountAmt = json['discountAmt'];
    totalDiscountAmt = json['totalDiscountAmt'];
    basicPrice = json['basicPrice'];
    totalBasicPrice = json['totalBasicPrice'];
    gross = json['gross'];
    totalGross = json['totalGross'];
    gst = json['gst'];
    cgst = json['cgst'];
    sgst = json['sgst'];
    gstAmt = json['gstAmt'];
    cgstAmt = json['cgstAmt'];
    sgstAmt = json['sgstAmt'];
    floodAmt = json['floodAmt'];
    totGSTAmt = json['totGSTAmt'];
    totCGSTAmt = json['totCGSTAmt'];
    totSGSTAmt = json['totSGSTAmt'];
    total = json['total'];
    cCharges = json['cCharges'];
    stateType = json['stateType'];
    taxType = json['taxType'];
    shippingWeight = json['shippingWeight'];
    ifOfferProduct = json['ifOfferProduct'];
    offerName = json['offerName'];
    buyProduct = json['buyProduct'];
    prdImage = json['prdImage'];
    amountTypeName = json['amountTypeName'];
    pointsTypeName = json['pointsTypeName'];
    packgeDetails = json['packgeDetails'];
    packageID = json['packageID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['regid'] = this.regid;
    data['idno'] = this.idno;
    data['name'] = this.name;
    data['category'] = this.category;
    data['subCategory'] = this.subCategory;
    data['pid'] = this.pid;
    data['pcode'] = this.pcode;
    data['pName'] = this.pName;
    data['qty'] = this.qty;
    data['mrp'] = this.mrp;
    data['dp'] = this.dp;
    data['totalMRP'] = this.totalMRP;
    data['totalDP'] = this.totalDP;
    data['bv'] = this.bv;
    data['totBV'] = this.totBV;
    data['discountPer'] = this.discountPer;
    data['discountAmt'] = this.discountAmt;
    data['totalDiscountAmt'] = this.totalDiscountAmt;
    data['basicPrice'] = this.basicPrice;
    data['totalBasicPrice'] = this.totalBasicPrice;
    data['gross'] = this.gross;
    data['totalGross'] = this.totalGross;
    data['gst'] = this.gst;
    data['cgst'] = this.cgst;
    data['sgst'] = this.sgst;
    data['gstAmt'] = this.gstAmt;
    data['cgstAmt'] = this.cgstAmt;
    data['sgstAmt'] = this.sgstAmt;
    data['floodAmt'] = this.floodAmt;
    data['totGSTAmt'] = this.totGSTAmt;
    data['totCGSTAmt'] = this.totCGSTAmt;
    data['totSGSTAmt'] = this.totSGSTAmt;
    data['total'] = this.total;
    data['cCharges'] = this.cCharges;
    data['stateType'] = this.stateType;
    data['taxType'] = this.taxType;
    data['shippingWeight'] = this.shippingWeight;
    data['ifOfferProduct'] = this.ifOfferProduct;
    data['offerName'] = this.offerName;
    data['buyProduct'] = this.buyProduct;
    data['prdImage'] = this.prdImage;
    data['amountTypeName'] = this.amountTypeName;
    data['pointsTypeName'] = this.pointsTypeName;
    data['packgeDetails'] = this.packgeDetails;
    data['packageID'] = this.packageID;
    return data;
  }
}


class CartItemModel{
  final int?  pid;
  final int? qty;
  final  String? package;
  final String? prdImage;
  CartItemModel({required this.pid, required this.qty, required this.package, this.prdImage});


  CartItemModel copyWith({
    int? qty
}){
    return CartItemModel(pid: pid, qty: qty ?? this.qty, package: package, prdImage : this.prdImage );
  }
}
