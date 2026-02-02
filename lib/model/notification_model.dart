class NotificationModel {
  int? nid;
  int? mid;
  String? status;
  Null? enterIdno;
  String? title;
  String? message;
  String? notificationFile;
  String? createdDate;
  String? postedDate;
  String? idType;

  NotificationModel(
      {this.nid,
        this.mid,
        this.status,
        this.enterIdno,
        this.title,
        this.message,
        this.notificationFile,
        this.createdDate,
        this.postedDate,
        this.idType});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    nid = json['nid'];
    mid = json['mid'];
    status = json['status'];
    enterIdno = json['enterIdno'];
    title = json['title'];
    message = json['message'];
    notificationFile = json['notificationFile'];
    createdDate = json['createdDate'];
    postedDate = json['postedDate'];
    idType = json['idType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nid'] = this.nid;
    data['mid'] = this.mid;
    data['status'] = this.status;
    data['enterIdno'] = this.enterIdno;
    data['title'] = this.title;
    data['message'] = this.message;
    data['notificationFile'] = this.notificationFile;
    data['createdDate'] = this.createdDate;
    data['postedDate'] = this.postedDate;
    data['idType'] = this.idType;
    return data;
  }
}
