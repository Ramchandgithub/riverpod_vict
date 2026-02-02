
class ReferralModel {
  String? action;
  String? idno;
  String? name;
  String? stateName;
  String? mobile;
  String? placement;
  String? cityName;
  String? mstatus;
  String? joinDate;
  String? activatedDate;
  double? pv;

  ReferralModel(
      {this.action,
        this.idno,
        this.name,
        this.stateName,
        this.mobile,
        this.placement,
        this.cityName,
        this.mstatus,
        this.joinDate,
        this.activatedDate,
        this.pv});

  ReferralModel.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    idno = json['idno'];
    name = json['name'];
    stateName = json['stateName'];
    mobile = json['mobile'];
    placement = json['placement'];
    cityName = json['cityName'];
    mstatus = json['mstatus'];
    joinDate = json['joinDate'];
    activatedDate = json['activatedDate'];
    pv = json['pv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['idno'] = this.idno;
    data['name'] = this.name;
    data['stateName'] = this.stateName;
    data['mobile'] = this.mobile;
    data['placement'] = this.placement;
    data['cityName'] = this.cityName;
    data['mstatus'] = this.mstatus;
    data['joinDate'] = this.joinDate;
    data['activatedDate'] = this.activatedDate;
    data['pv'] = this.pv;
    return data;
  }
}
