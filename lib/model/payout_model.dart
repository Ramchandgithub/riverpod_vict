class PayoutModel {
  int? sno;
  int? payNo;
  String? period;
  String? memberId;
  String? name;
  double? amount;
  String? reason;
  int? isPanApproved;
  int? isNeftApproved;

  PayoutModel(
      {this.sno,
        this.payNo,
        this.period,
        this.memberId,
        this.name,
        this.amount,
        this.reason,
        this.isPanApproved,
        this.isNeftApproved});

  PayoutModel.fromJson(Map<String, dynamic> json) {
    sno = json['sno'];
    payNo = json['PayNo'];
    period = json['Period'];
    memberId = json['MemberId'];
    name = json['Name'];
    amount = json['Amount'];
    reason = json['Reason'];
    isPanApproved = json['IsPanApproved'];
    isNeftApproved = json['IsNeftApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sno'] = this.sno;
    data['PayNo'] = this.payNo;
    data['Period'] = this.period;
    data['MemberId'] = this.memberId;
    data['Name'] = this.name;
    data['Amount'] = this.amount;
    data['Reason'] = this.reason;
    data['IsPanApproved'] = this.isPanApproved;
    data['IsNeftApproved'] = this.isNeftApproved;
    return data;
  }
}
