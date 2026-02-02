class SupportRptModel {
  int? sno;
  String? griNo;
  String? idno;
  String? name;
  String? mobile;
  String? email;
  String? natureofTicket;
  Null? address;
  String? subject;
  String? message;
  String? dated;
  int? gStatus;
  String? grievanceStatus;
  String? remarks;
  String? photo;
  String? replyImage;

  SupportRptModel(
      {this.sno,
        this.griNo,
        this.idno,
        this.name,
        this.mobile,
        this.email,
        this.natureofTicket,
        this.address,
        this.subject,
        this.message,
        this.dated,
        this.gStatus,
        this.grievanceStatus,
        this.remarks,
        this.photo,
        this.replyImage});

  SupportRptModel.fromJson(Map<String, dynamic> json) {
    sno = json['sno'];
    griNo = json['griNo'];
    idno = json['idno'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    natureofTicket = json['natureofTicket'];
    address = json['address'];
    subject = json['subject'];
    message = json['message'];
    dated = json['dated'];
    gStatus = json['gStatus'];
    grievanceStatus = json['grievanceStatus'];
    remarks = json['remarks'];
    photo = json['photo'];
    replyImage = json['replyImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sno'] = this.sno;
    data['griNo'] = this.griNo;
    data['idno'] = this.idno;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['natureofTicket'] = this.natureofTicket;
    data['address'] = this.address;
    data['subject'] = this.subject;
    data['message'] = this.message;
    data['dated'] = this.dated;
    data['gStatus'] = this.gStatus;
    data['grievanceStatus'] = this.grievanceStatus;
    data['remarks'] = this.remarks;
    data['photo'] = this.photo;
    data['replyImage'] = this.replyImage;
    return data;
  }
}
