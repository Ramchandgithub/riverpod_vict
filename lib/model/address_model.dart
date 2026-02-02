class AddressModel {
  int? regID;
  String? name;
  String? residence;
  String? city;
  String? state;
  String? pincode;
  String? mobileNo;
  int? stateID;
  int? cityID;
  String? districtName;
  int? isProfileAddress;
  int? addressID;

  AddressModel(
      {this.regID,
        this.name,
        this.residence,
        this.city,
        this.state,
        this.pincode,
        this.mobileNo,
        this.stateID,
        this.cityID,
        this.districtName,
        this.isProfileAddress,
        this.addressID});

  AddressModel.fromJson(Map<String, dynamic> json) {
    regID = json['regID'];
    name = json['name'];
    residence = json['residence'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    mobileNo = json['mobileNo'];
    stateID = json['stateID'];
    cityID = json['cityID'];
    districtName = json['districtName'];
    isProfileAddress = json['isProfileAddress'];
    addressID = json['addressID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regID'] = this.regID;
    data['name'] = this.name;
    data['residence'] = this.residence;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['mobileNo'] = this.mobileNo;
    data['stateID'] = this.stateID;
    data['cityID'] = this.cityID;
    data['districtName'] = this.districtName;
    data['isProfileAddress'] = this.isProfileAddress;
    data['addressID'] = this.addressID;
    return data;
  }
}
