


class ProfileModel {
  int? regid;
  String? memdate;
  String? stsDate;
  String? sponsor;
  String? sponsorName;
  String? placement;
  String? idno;
  String? title;
  String? name;
  Null? firstName;
  Null? lastName;
  String? gender;
  String? address1;
  Null? address2;
  int? city;
  String? cityName;
  int? state;
  String? stateName;
  String? pinCodeName;
  int? pinCode;
  Null? memPinCode;
  int? district;
  String? districtName;
  String? mobile;
  String? eMail;
  String? panno;
  String? lPassword;
  String? payeeName;
  Null? bank;
  Null? accno;
  Null? branch;
  Null? ifscode;
  int? stsid;
  int? stateID;
  String? gstin;
  Null? status;
  Null? prsentStatus;
  Null? oldStatus;
  String? dob;
  String? nominee;
  String? relation;
  Null? nomineeDOB;
  int? nomineeAge;
  String? memPhoto;
  String? rankName;
  String? rankImage;

  ProfileModel(
      {this.regid,
        this.memdate,
        this.stsDate,
        this.sponsor,
        this.sponsorName,
        this.placement,
        this.idno,
        this.title,
        this.name,
        this.firstName,
        this.lastName,
        this.gender,
        this.address1,
        this.address2,
        this.city,
        this.cityName,
        this.state,
        this.stateName,
        this.pinCodeName,
        this.pinCode,
        this.memPinCode,
        this.district,
        this.districtName,
        this.mobile,
        this.eMail,
        this.panno,
        this.lPassword,
        this.payeeName,
        this.bank,
        this.accno,
        this.branch,
        this.ifscode,
        this.stsid,
        this.stateID,
        this.gstin,
        this.status,
        this.prsentStatus,
        this.oldStatus,
        this.dob,
        this.nominee,
        this.relation,
        this.nomineeDOB,
        this.nomineeAge,
        this.memPhoto,
        this.rankName,
        this.rankImage});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    regid = json['regid'];
    memdate = json['memdate'];
    stsDate = json['stsDate'];
    sponsor = json['sponsor'];
    sponsorName = json['sponsorName'];
    placement = json['placement'];
    idno = json['idno'];
    title = json['title'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    cityName = json['cityName'];
    state = json['state'];
    stateName = json['stateName'];
    pinCodeName = json['pinCodeName'];
    pinCode = json['pinCode'];
    memPinCode = json['memPinCode'];
    district = json['district'];
    districtName = json['districtName'];
    mobile = json['mobile'];
    eMail = json['eMail'];
    panno = json['panno'];
    lPassword = json['lPassword'];
    payeeName = json['payeeName'];
    bank = json['bank'];
    accno = json['accno'];
    branch = json['branch'];
    ifscode = json['ifscode'];
    stsid = json['stsid'];
    stateID = json['stateID'];
    gstin = json['gstin'];
    status = json['status'];
    prsentStatus = json['prsentStatus'];
    oldStatus = json['oldStatus'];
    dob = json['dob'];
    nominee = json['nominee'];
    relation = json['relation'];
    nomineeDOB = json['nomineeDOB'];
    nomineeAge = json['nomineeAge'];
    memPhoto = json['memPhoto'];
    rankName = json['rankName'];
    rankImage = json['rankImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regid'] = this.regid;
    data['memdate'] = this.memdate;
    data['stsDate'] = this.stsDate;
    data['sponsor'] = this.sponsor;
    data['sponsorName'] = this.sponsorName;
    data['placement'] = this.placement;
    data['idno'] = this.idno;
    data['title'] = this.title;
    data['name'] = this.name;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['cityName'] = this.cityName;
    data['state'] = this.state;
    data['stateName'] = this.stateName;
    data['pinCodeName'] = this.pinCodeName;
    data['pinCode'] = this.pinCode;
    data['memPinCode'] = this.memPinCode;
    data['district'] = this.district;
    data['districtName'] = this.districtName;
    data['mobile'] = this.mobile;
    data['eMail'] = this.eMail;
    data['panno'] = this.panno;
    data['lPassword'] = this.lPassword;
    data['payeeName'] = this.payeeName;
    data['bank'] = this.bank;
    data['accno'] = this.accno;
    data['branch'] = this.branch;
    data['ifscode'] = this.ifscode;
    data['stsid'] = this.stsid;
    data['stateID'] = this.stateID;
    data['gstin'] = this.gstin;
    data['status'] = this.status;
    data['prsentStatus'] = this.prsentStatus;
    data['oldStatus'] = this.oldStatus;
    data['dob'] = this.dob;
    data['nominee'] = this.nominee;
    data['relation'] = this.relation;
    data['nomineeDOB'] = this.nomineeDOB;
    data['nomineeAge'] = this.nomineeAge;
    data['memPhoto'] = this.memPhoto;
    data['rankName'] = this.rankName;
    data['rankImage'] = this.rankImage;
    return data;
  }
}
