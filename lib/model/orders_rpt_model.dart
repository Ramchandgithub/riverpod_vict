
class OrdersRptModel {
  String? fcode;
  String? idno;
  String? billNo;
  String? invNo;
  String? orddate;
  String? billDate;
  String? dispDate;
  double? unitAmt;
  double? totAmt;
  int? totQty;
  double? totBV;
  String? repType;
  String? ordStatus;
  String? name;
  String? taxType;
  String? dispDetails;
  String? orderType;
  String? orderBy;
  String? mopDetails;
  String? mop;
  String? utrNo;
  double? cashAmt;
  double? cardAmt;
  double? ewalletAmt;
  double? onlineAmt;
  double? shippingWeight;
  double? voucherAmt;
  int? rmid;

  OrdersRptModel(
      {this.fcode,
        this.idno,
        this.billNo,
        this.invNo,
        this.orddate,
        this.billDate,
        this.dispDate,
        this.unitAmt,
        this.totAmt,
        this.totQty,
        this.totBV,
        this.repType,
        this.ordStatus,
        this.name,
        this.taxType,
        this.dispDetails,
        this.orderType,
        this.orderBy,
        this.mopDetails,
        this.mop,
        this.utrNo,
        this.cashAmt,
        this.cardAmt,
        this.ewalletAmt,
        this.onlineAmt,
        this.shippingWeight,
        this.voucherAmt,
        this.rmid});

  OrdersRptModel.fromJson(Map<String, dynamic> json) {
    fcode = json['fcode'];
    idno = json['idno'];
    billNo = json['billNo'];
    invNo = json['invNo'];
    orddate = json['orddate'];
    billDate = json['billDate'];
    dispDate = json['dispDate'];
    unitAmt = json['unitAmt'];
    totAmt = json['totAmt'];
    totQty = json['totQty'];
    totBV = json['totBV'];
    repType = json['repType'];
    ordStatus = json['ordStatus'];
    name = json['name'];
    taxType = json['taxType'];
    dispDetails = json['dispDetails'];
    orderType = json['orderType'];
    orderBy = json['orderBy'];
    mopDetails = json['mopDetails'];
    mop = json['mop'];
    utrNo = json['utrNo'];
    cashAmt = json['cashAmt'];
    cardAmt = json['cardAmt'];
    ewalletAmt = json['ewalletAmt'];
    onlineAmt = json['onlineAmt'];
    shippingWeight = json['shippingWeight'];
    voucherAmt = json['voucherAmt'];
    rmid = json['rmid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fcode'] = this.fcode;
    data['idno'] = this.idno;
    data['billNo'] = this.billNo;
    data['invNo'] = this.invNo;
    data['orddate'] = this.orddate;
    data['billDate'] = this.billDate;
    data['dispDate'] = this.dispDate;
    data['unitAmt'] = this.unitAmt;
    data['totAmt'] = this.totAmt;
    data['totQty'] = this.totQty;
    data['totBV'] = this.totBV;
    data['repType'] = this.repType;
    data['ordStatus'] = this.ordStatus;
    data['name'] = this.name;
    data['taxType'] = this.taxType;
    data['dispDetails'] = this.dispDetails;
    data['orderType'] = this.orderType;
    data['orderBy'] = this.orderBy;
    data['mopDetails'] = this.mopDetails;
    data['mop'] = this.mop;
    data['utrNo'] = this.utrNo;
    data['cashAmt'] = this.cashAmt;
    data['cardAmt'] = this.cardAmt;
    data['ewalletAmt'] = this.ewalletAmt;
    data['onlineAmt'] = this.onlineAmt;
    data['shippingWeight'] = this.shippingWeight;
    data['voucherAmt'] = this.voucherAmt;
    data['rmid'] = this.rmid;
    return data;
  }
}
