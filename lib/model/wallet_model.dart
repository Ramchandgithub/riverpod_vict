class WalletModel {
  String? whTypeText;
  String? userID;
  String? name;
  String? city;
  String? mobile;
  String? dated;
  double? inAmt;
  double? outAmt;
  double? balance;
  String? descr;
  String? remarks;
  String? adjustType;
  String? idno;
  String? date;
  String? bank;
  int? payNo;
  String? payOutMonth;
  int? regId;
  int? openBal;
  String? updatedBy;

  WalletModel(
      {this.whTypeText,
        this.userID,
        this.name,
        this.city,
        this.mobile,
        this.dated,
        this.inAmt,
        this.outAmt,
        this.balance,
        this.descr,
        this.remarks,
        this.adjustType,
        this.idno,
        this.date,
        this.bank,
        this.payNo,
        this.payOutMonth,
        this.regId,
        this.openBal,
        this.updatedBy});

  WalletModel.fromJson(Map<String, dynamic> json) {
    whTypeText = json['whTypeText'];
    userID = json['userID'];
    name = json['name'];
    city = json['city'];
    mobile = json['mobile'];
    dated = json['dated'];
    inAmt = json['inAmt'];
    outAmt = json['outAmt'];
    balance = json['balance'];
    descr = json['descr'];
    remarks = json['remarks'];
    adjustType = json['adjustType'];
    idno = json['idno'];
    date = json['date'];
    bank = json['bank'];
    payNo = json['payNo'];
    payOutMonth = json['payOutMonth'];
    regId = json['regId'];
    openBal = json['openBal'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['whTypeText'] = this.whTypeText;
    data['userID'] = this.userID;
    data['name'] = this.name;
    data['city'] = this.city;
    data['mobile'] = this.mobile;
    data['dated'] = this.dated;
    data['inAmt'] = this.inAmt;
    data['outAmt'] = this.outAmt;
    data['balance'] = this.balance;
    data['descr'] = this.descr;
    data['remarks'] = this.remarks;
    data['adjustType'] = this.adjustType;
    data['idno'] = this.idno;
    data['date'] = this.date;
    data['bank'] = this.bank;
    data['payNo'] = this.payNo;
    data['payOutMonth'] = this.payOutMonth;
    data['regId'] = this.regId;
    data['openBal'] = this.openBal;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}
