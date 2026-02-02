class DashboardModel {
  String? idno;
  String? name;
  int? sprCnt;
  int? downCnt;
  String? sponsor;
  String? sprName;
  String? joinDate;
  String? stsDate;
  String? memstatus;
  String? memPhoto;
  String? mobile;
  String? email;
  double? ebal;
  double? cWbal;
  String? pansts;
  String? banksts;
  String? addresssts;
  String? idproofsts;
  String? pANNo;
  String? panImage;
  String? accno;
  String? bankImage;
  String? addressImage;
  String? addressBackImage;
  double? selfJBV;
  double? selfRBV;
  double? totSelfPoints;
  double? teamJBV;
  double? teamRBV;
  double? totTeamPoints;
  double? totalJBVPoints;
  double? totalRBVPoints;
  int? selfTodayCnt;
  double? selfTodayPV;
  double? selfTodayBV;
  int? selfCurCnt;
  double? selfCurPV;
  double? selfCurBV;
  int? selfPreCnt;
  double? selfPrePV;
  double? selfPreBV;
  int? selfTotCnt;
  double? selfTotPV;
  double? selfTotBV;
  int? teamTodayCnt;
  double? teamTodayCntLeft;
  double? teamTodayCntRight;
  double? teamTodayPV;
  double? teamTodayBV;
  int? teamCurCnt;
  double? teamCurCntLeft;
  double? teamCurCntRight;
  double? teamCurPV;
  double? teamCurBV;
  int? teamPreCnt;
  double? teamPreCntLeft;
  double? teamPreCntRight;
  double? teamPrePV;
  double? teamPreBV;
  int? teamTotCnt;
  double? teamTotCntLeft;
  double? teamTotCntRight;
  double? teamTotPV;
  double? teamTotBV;
  double? teamCurPVLEFT;
  double? teamCurPVRIGHT;
  double? teamPrePVLeft;
  double? teamPrePVRight;
  double? teamTotPVLeft;
  double? teamTotPVRight;
  double? teamTodayPVLeft;
  double? teamTodayPVRight;
  int? selfTodayCntPen;
  int? selfCurCntPen;
  int? selfPreCntPen;
  int? selfTotCntPen;
  int? teamTodayCntPen;
  double? teamTodayCntPenLeft;
  double? teamTodayCntPenRight;
  int? teamCurCntPen;
  double? teamCurCntPenLeft;
  double? teamCurCntPenRight;
  int? teamPreCntPen;
  double? teamPreCntPenLeft;
  double? teamPreCntPenRight;
  int? teamTotCntPen;
  double? teamTotCntPenLeft;
  double? teamTotCntPenRight;
  int? selfTodayCntPaid;
  int? selfCurCntPaid;
  int? selfPreCntPaid;
  int? selfTotCntPaid;
  int? teamTodayCntPaid;
  double? teamTodayCntPaidLeft;
  double? teamTodayCntPaidRight;
  int? teamCurCntPaid;
  double? teamCurCntPaidLeft;
  double? teamCurCntPaidRight;
  int? teamPreCntPaid;
  double? teamPreCntPaidLeft;
  double? teamPreCntPaidRight;
  int? teamTotCntPaid;
  double? teamTotCntPaidLeft;
  double? teamTotCntPaidRight;
  int? selfTodayCntRej;
  int? selfCurCntRej;
  int? selfPreCntRej;
  int? selfTotCntRej;
  int? teamTodayCntRej;
  double? teamTodayCntRejLeft;
  double? teamTodayCntRejRight;
  int? teamCurCntRej;
  double? teamCurCntRejLeft;
  double? teamCurCntRejRight;
  int? teamPreCntRej;
  double? teamPreCntRejLeft;
  double? teamPreCntRejRight;
  int? teamTotCntRej;
  double? teamTotCntRejLeft;
  double? teamTotCntRejRight;
  String? rankName;
  String? rankImage;
  double? cFLeft;
  double? cFRight;
  double? pWComm1PV;
  double? pWComm2PV;
  String? fTBStatus;
  String? fastTBSts;
  String? payoutStatus;
  String? lastThreeWeeksData;
  double? pVRequired;
  String? eligibleTill;
  double? reffCustPV;
  String? currentPayCycle;
  String? lastorderdateandpv;
  double? lSbonus;
  String? nextPurchaseDate;
  String? iSAadharLinked;
  String? pAN;
  int? isAllowaadharCheckButton;

  DashboardModel(
      {this.idno,
        this.name,
        this.sprCnt,
        this.downCnt,
        this.sponsor,
        this.sprName,
        this.joinDate,
        this.stsDate,
        this.memstatus,
        this.memPhoto,
        this.mobile,
        this.email,
        this.ebal,
        this.cWbal,
        this.pansts,
        this.banksts,
        this.addresssts,
        this.idproofsts,
        this.pANNo,
        this.panImage,
        this.accno,
        this.bankImage,
        this.addressImage,
        this.addressBackImage,
        this.selfJBV,
        this.selfRBV,
        this.totSelfPoints,
        this.teamJBV,
        this.teamRBV,
        this.totTeamPoints,
        this.totalJBVPoints,
        this.totalRBVPoints,
        this.selfTodayCnt,
        this.selfTodayPV,
        this.selfTodayBV,
        this.selfCurCnt,
        this.selfCurPV,
        this.selfCurBV,
        this.selfPreCnt,
        this.selfPrePV,
        this.selfPreBV,
        this.selfTotCnt,
        this.selfTotPV,
        this.selfTotBV,
        this.teamTodayCnt,
        this.teamTodayCntLeft,
        this.teamTodayCntRight,
        this.teamTodayPV,
        this.teamTodayBV,
        this.teamCurCnt,
        this.teamCurCntLeft,
        this.teamCurCntRight,
        this.teamCurPV,
        this.teamCurBV,
        this.teamPreCnt,
        this.teamPreCntLeft,
        this.teamPreCntRight,
        this.teamPrePV,
        this.teamPreBV,
        this.teamTotCnt,
        this.teamTotCntLeft,
        this.teamTotCntRight,
        this.teamTotPV,
        this.teamTotBV,
        this.teamCurPVLEFT,
        this.teamCurPVRIGHT,
        this.teamPrePVLeft,
        this.teamPrePVRight,
        this.teamTotPVLeft,
        this.teamTotPVRight,
        this.teamTodayPVLeft,
        this.teamTodayPVRight,
        this.selfTodayCntPen,
        this.selfCurCntPen,
        this.selfPreCntPen,
        this.selfTotCntPen,
        this.teamTodayCntPen,
        this.teamTodayCntPenLeft,
        this.teamTodayCntPenRight,
        this.teamCurCntPen,
        this.teamCurCntPenLeft,
        this.teamCurCntPenRight,
        this.teamPreCntPen,
        this.teamPreCntPenLeft,
        this.teamPreCntPenRight,
        this.teamTotCntPen,
        this.teamTotCntPenLeft,
        this.teamTotCntPenRight,
        this.selfTodayCntPaid,
        this.selfCurCntPaid,
        this.selfPreCntPaid,
        this.selfTotCntPaid,
        this.teamTodayCntPaid,
        this.teamTodayCntPaidLeft,
        this.teamTodayCntPaidRight,
        this.teamCurCntPaid,
        this.teamCurCntPaidLeft,
        this.teamCurCntPaidRight,
        this.teamPreCntPaid,
        this.teamPreCntPaidLeft,
        this.teamPreCntPaidRight,
        this.teamTotCntPaid,
        this.teamTotCntPaidLeft,
        this.teamTotCntPaidRight,
        this.selfTodayCntRej,
        this.selfCurCntRej,
        this.selfPreCntRej,
        this.selfTotCntRej,
        this.teamTodayCntRej,
        this.teamTodayCntRejLeft,
        this.teamTodayCntRejRight,
        this.teamCurCntRej,
        this.teamCurCntRejLeft,
        this.teamCurCntRejRight,
        this.teamPreCntRej,
        this.teamPreCntRejLeft,
        this.teamPreCntRejRight,
        this.teamTotCntRej,
        this.teamTotCntRejLeft,
        this.teamTotCntRejRight,
        this.rankName,
        this.rankImage,
        this.cFLeft,
        this.cFRight,
        this.pWComm1PV,
        this.pWComm2PV,
        this.fTBStatus,
        this.fastTBSts,
        this.payoutStatus,
        this.lastThreeWeeksData,
        this.pVRequired,
        this.eligibleTill,
        this.reffCustPV,
        this.currentPayCycle,
        this.lastorderdateandpv,
        this.lSbonus,
        this.nextPurchaseDate,
        this.iSAadharLinked,
        this.pAN,
        this.isAllowaadharCheckButton});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    idno = json['Idno'];
    name = json['Name'];
    sprCnt = json['SprCnt'];
    downCnt = json['DownCnt'];
    sponsor = json['Sponsor'];
    sprName = json['SprName'];
    joinDate = json['JoinDate'];
    stsDate = json['StsDate'];
    memstatus = json['Memstatus'];
    memPhoto = json['MemPhoto'];
    mobile = json['mobile'];
    email = json['Email'];
    ebal = json['Ebal'];
    cWbal = json['CWbal'];
    pansts = json['pansts'];
    banksts = json['banksts'];
    addresssts = json['addresssts'];
    idproofsts = json['idproofsts'];
    pANNo = json['PANNo'];
    panImage = json['PanImage'];
    accno = json['Accno'];
    bankImage = json['BankImage'];
    addressImage = json['AddressImage'];
    addressBackImage = json['AddressBackImage'];
    selfJBV = json['SelfJBV'];
    selfRBV = json['SelfRBV'];
    totSelfPoints = json['TotSelfPoints'];
    teamJBV = json['TeamJBV'];
    teamRBV = json['TeamRBV'];
    totTeamPoints = json['TotTeamPoints'];
    totalJBVPoints = json['TotalJBVPoints'];
    totalRBVPoints = json['TotalRBVPoints'];
    selfTodayCnt = json['SelfTodayCnt'];
    selfTodayPV = json['SelfTodayPV'];
    selfTodayBV = json['SelfTodayBV'];
    selfCurCnt = json['SelfCurCnt'];
    selfCurPV = json['SelfCurPV'];
    selfCurBV = json['SelfCurBV'];
    selfPreCnt = json['SelfPreCnt'];
    selfPrePV = json['SelfPrePV'];
    selfPreBV = json['SelfPreBV'];
    selfTotCnt = json['SelfTotCnt'];
    selfTotPV = json['SelfTotPV'];
    selfTotBV = json['SelfTotBV'];
    teamTodayCnt = json['TeamTodayCnt'];
    teamTodayCntLeft = json['TeamTodayCnt_Left'];
    teamTodayCntRight = json['TeamTodayCnt_Right'];
    teamTodayPV = json['TeamTodayPV'];
    teamTodayBV = json['TeamTodayBV'];
    teamCurCnt = json['TeamCurCnt'];
    teamCurCntLeft = json['TeamCurCnt_Left'];
    teamCurCntRight = json['TeamCurCnt_Right'];
    teamCurPV = json['TeamCurPV'];
    teamCurBV = json['TeamCurBV'];
    teamPreCnt = json['TeamPreCnt'];
    teamPreCntLeft = json['TeamPreCnt_Left'];
    teamPreCntRight = json['TeamPreCnt_Right'];
    teamPrePV = json['TeamPrePV'];
    teamPreBV = json['TeamPreBV'];
    teamTotCnt = json['TeamTotCnt'];
    teamTotCntLeft = json['TeamTotCnt_Left'];
    teamTotCntRight = json['TeamTotCnt_Right'];
    teamTotPV = json['TeamTotPV'];
    teamTotBV = json['TeamTotBV'];
    teamCurPVLEFT = json['TeamCurPV_LEFT'];
    teamCurPVRIGHT = json['TeamCurPV_RIGHT'];
    teamPrePVLeft = json['TeamPrePV_Left'];
    teamPrePVRight = json['TeamPrePV_Right'];
    teamTotPVLeft = json['TeamTotPV_Left'];
    teamTotPVRight = json['TeamTotPV_Right'];
    teamTodayPVLeft = json['TeamTodayPV_Left'];
    teamTodayPVRight = json['TeamTodayPV_Right'];
    selfTodayCntPen = json['SelfTodayCntPen'];
    selfCurCntPen = json['SelfCurCntPen'];
    selfPreCntPen = json['SelfPreCntPen'];
    selfTotCntPen = json['SelfTotCntPen'];
    teamTodayCntPen = json['TeamTodayCntPen'];
    teamTodayCntPenLeft = json['TeamTodayCntPen_Left'];
    teamTodayCntPenRight = json['TeamTodayCntPen_Right'];
    teamCurCntPen = json['TeamCurCntPen'];
    teamCurCntPenLeft = json['TeamCurCntPen_Left'];
    teamCurCntPenRight = json['TeamCurCntPen_Right'];
    teamPreCntPen = json['TeamPreCntPen'];
    teamPreCntPenLeft = json['TeamPreCntPen_Left'];
    teamPreCntPenRight = json['TeamPreCntPen_Right'];
    teamTotCntPen = json['TeamTotCntPen'];
    teamTotCntPenLeft = json['TeamTotCntPen_Left'];
    teamTotCntPenRight = json['TeamTotCntPen_Right'];
    selfTodayCntPaid = json['SelfTodayCntPaid'];
    selfCurCntPaid = json['SelfCurCntPaid'];
    selfPreCntPaid = json['SelfPreCntPaid'];
    selfTotCntPaid = json['SelfTotCntPaid'];
    teamTodayCntPaid = json['TeamTodayCntPaid'];
    teamTodayCntPaidLeft = json['TeamTodayCntPaid_Left'];
    teamTodayCntPaidRight = json['TeamTodayCntPaid_Right'];
    teamCurCntPaid = json['TeamCurCntPaid'];
    teamCurCntPaidLeft = json['TeamCurCntPaid_Left'];
    teamCurCntPaidRight = json['TeamCurCntPaid_Right'];
    teamPreCntPaid = json['TeamPreCntPaid'];
    teamPreCntPaidLeft = json['TeamPreCntPaid_Left'];
    teamPreCntPaidRight = json['TeamPreCntPaid_Right'];
    teamTotCntPaid = json['TeamTotCntPaid'];
    teamTotCntPaidLeft = json['TeamTotCntPaid_Left'];
    teamTotCntPaidRight = json['TeamTotCntPaid_Right'];
    selfTodayCntRej = json['SelfTodayCntRej'];
    selfCurCntRej = json['SelfCurCntRej'];
    selfPreCntRej = json['SelfPreCntRej'];
    selfTotCntRej = json['SelfTotCntRej'];
    teamTodayCntRej = json['TeamTodayCntRej'];
    teamTodayCntRejLeft = json['TeamTodayCntRej_Left'];
    teamTodayCntRejRight = json['TeamTodayCntRej_Right'];
    teamCurCntRej = json['TeamCurCntRej'];
    teamCurCntRejLeft = json['TeamCurCntRej_Left'];
    teamCurCntRejRight = json['TeamCurCntRej_Right'];
    teamPreCntRej = json['TeamPreCntRej'];
    teamPreCntRejLeft = json['TeamPreCntRej_Left'];
    teamPreCntRejRight = json['TeamPreCntRej_Right'];
    teamTotCntRej = json['TeamTotCntRej'];
    teamTotCntRejLeft = json['TeamTotCntRej_Left'];
    teamTotCntRejRight = json['TeamTotCntRej_Right'];
    rankName = json['RankName'];
    rankImage = json['RankImage'];
    cFLeft = json['CF_Left'];
    cFRight = json['CF_Right'];
    pWComm1PV = json['PW_Comm1PV'];
    pWComm2PV = json['PW_Comm2PV'];
    fTBStatus = json['FTBStatus'];
    fastTBSts = json['FastTBSts'];
    payoutStatus = json['PayoutStatus'];
    lastThreeWeeksData = json['LastThreeWeeksData'];
    pVRequired = json['PV_Required'];
    eligibleTill = json['Eligible_Till'];
    reffCustPV = json['ReffCustPV'];
    currentPayCycle = json['CurrentPayCycle'];
    lastorderdateandpv = json['Lastorderdateandpv'];
    lSbonus = json['LSbonus'];
    nextPurchaseDate = json['NextPurchaseDate'];
    iSAadharLinked = json['ISAadharLinked'];
    pAN = json['PAN'];
    isAllowaadharCheckButton = json['IsAllowaadharCheckButton'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Idno'] = this.idno;
    data['Name'] = this.name;
    data['SprCnt'] = this.sprCnt;
    data['DownCnt'] = this.downCnt;
    data['Sponsor'] = this.sponsor;
    data['SprName'] = this.sprName;
    data['JoinDate'] = this.joinDate;
    data['StsDate'] = this.stsDate;
    data['Memstatus'] = this.memstatus;
    data['MemPhoto'] = this.memPhoto;
    data['mobile'] = this.mobile;
    data['Email'] = this.email;
    data['Ebal'] = this.ebal;
    data['CWbal'] = this.cWbal;
    data['pansts'] = this.pansts;
    data['banksts'] = this.banksts;
    data['addresssts'] = this.addresssts;
    data['idproofsts'] = this.idproofsts;
    data['PANNo'] = this.pANNo;
    data['PanImage'] = this.panImage;
    data['Accno'] = this.accno;
    data['BankImage'] = this.bankImage;
    data['AddressImage'] = this.addressImage;
    data['AddressBackImage'] = this.addressBackImage;
    data['SelfJBV'] = this.selfJBV;
    data['SelfRBV'] = this.selfRBV;
    data['TotSelfPoints'] = this.totSelfPoints;
    data['TeamJBV'] = this.teamJBV;
    data['TeamRBV'] = this.teamRBV;
    data['TotTeamPoints'] = this.totTeamPoints;
    data['TotalJBVPoints'] = this.totalJBVPoints;
    data['TotalRBVPoints'] = this.totalRBVPoints;
    data['SelfTodayCnt'] = this.selfTodayCnt;
    data['SelfTodayPV'] = this.selfTodayPV;
    data['SelfTodayBV'] = this.selfTodayBV;
    data['SelfCurCnt'] = this.selfCurCnt;
    data['SelfCurPV'] = this.selfCurPV;
    data['SelfCurBV'] = this.selfCurBV;
    data['SelfPreCnt'] = this.selfPreCnt;
    data['SelfPrePV'] = this.selfPrePV;
    data['SelfPreBV'] = this.selfPreBV;
    data['SelfTotCnt'] = this.selfTotCnt;
    data['SelfTotPV'] = this.selfTotPV;
    data['SelfTotBV'] = this.selfTotBV;
    data['TeamTodayCnt'] = this.teamTodayCnt;
    data['TeamTodayCnt_Left'] = this.teamTodayCntLeft;
    data['TeamTodayCnt_Right'] = this.teamTodayCntRight;
    data['TeamTodayPV'] = this.teamTodayPV;
    data['TeamTodayBV'] = this.teamTodayBV;
    data['TeamCurCnt'] = this.teamCurCnt;
    data['TeamCurCnt_Left'] = this.teamCurCntLeft;
    data['TeamCurCnt_Right'] = this.teamCurCntRight;
    data['TeamCurPV'] = this.teamCurPV;
    data['TeamCurBV'] = this.teamCurBV;
    data['TeamPreCnt'] = this.teamPreCnt;
    data['TeamPreCnt_Left'] = this.teamPreCntLeft;
    data['TeamPreCnt_Right'] = this.teamPreCntRight;
    data['TeamPrePV'] = this.teamPrePV;
    data['TeamPreBV'] = this.teamPreBV;
    data['TeamTotCnt'] = this.teamTotCnt;
    data['TeamTotCnt_Left'] = this.teamTotCntLeft;
    data['TeamTotCnt_Right'] = this.teamTotCntRight;
    data['TeamTotPV'] = this.teamTotPV;
    data['TeamTotBV'] = this.teamTotBV;
    data['TeamCurPV_LEFT'] = this.teamCurPVLEFT;
    data['TeamCurPV_RIGHT'] = this.teamCurPVRIGHT;
    data['TeamPrePV_Left'] = this.teamPrePVLeft;
    data['TeamPrePV_Right'] = this.teamPrePVRight;
    data['TeamTotPV_Left'] = this.teamTotPVLeft;
    data['TeamTotPV_Right'] = this.teamTotPVRight;
    data['TeamTodayPV_Left'] = this.teamTodayPVLeft;
    data['TeamTodayPV_Right'] = this.teamTodayPVRight;
    data['SelfTodayCntPen'] = this.selfTodayCntPen;
    data['SelfCurCntPen'] = this.selfCurCntPen;
    data['SelfPreCntPen'] = this.selfPreCntPen;
    data['SelfTotCntPen'] = this.selfTotCntPen;
    data['TeamTodayCntPen'] = this.teamTodayCntPen;
    data['TeamTodayCntPen_Left'] = this.teamTodayCntPenLeft;
    data['TeamTodayCntPen_Right'] = this.teamTodayCntPenRight;
    data['TeamCurCntPen'] = this.teamCurCntPen;
    data['TeamCurCntPen_Left'] = this.teamCurCntPenLeft;
    data['TeamCurCntPen_Right'] = this.teamCurCntPenRight;
    data['TeamPreCntPen'] = this.teamPreCntPen;
    data['TeamPreCntPen_Left'] = this.teamPreCntPenLeft;
    data['TeamPreCntPen_Right'] = this.teamPreCntPenRight;
    data['TeamTotCntPen'] = this.teamTotCntPen;
    data['TeamTotCntPen_Left'] = this.teamTotCntPenLeft;
    data['TeamTotCntPen_Right'] = this.teamTotCntPenRight;
    data['SelfTodayCntPaid'] = this.selfTodayCntPaid;
    data['SelfCurCntPaid'] = this.selfCurCntPaid;
    data['SelfPreCntPaid'] = this.selfPreCntPaid;
    data['SelfTotCntPaid'] = this.selfTotCntPaid;
    data['TeamTodayCntPaid'] = this.teamTodayCntPaid;
    data['TeamTodayCntPaid_Left'] = this.teamTodayCntPaidLeft;
    data['TeamTodayCntPaid_Right'] = this.teamTodayCntPaidRight;
    data['TeamCurCntPaid'] = this.teamCurCntPaid;
    data['TeamCurCntPaid_Left'] = this.teamCurCntPaidLeft;
    data['TeamCurCntPaid_Right'] = this.teamCurCntPaidRight;
    data['TeamPreCntPaid'] = this.teamPreCntPaid;
    data['TeamPreCntPaid_Left'] = this.teamPreCntPaidLeft;
    data['TeamPreCntPaid_Right'] = this.teamPreCntPaidRight;
    data['TeamTotCntPaid'] = this.teamTotCntPaid;
    data['TeamTotCntPaid_Left'] = this.teamTotCntPaidLeft;
    data['TeamTotCntPaid_Right'] = this.teamTotCntPaidRight;
    data['SelfTodayCntRej'] = this.selfTodayCntRej;
    data['SelfCurCntRej'] = this.selfCurCntRej;
    data['SelfPreCntRej'] = this.selfPreCntRej;
    data['SelfTotCntRej'] = this.selfTotCntRej;
    data['TeamTodayCntRej'] = this.teamTodayCntRej;
    data['TeamTodayCntRej_Left'] = this.teamTodayCntRejLeft;
    data['TeamTodayCntRej_Right'] = this.teamTodayCntRejRight;
    data['TeamCurCntRej'] = this.teamCurCntRej;
    data['TeamCurCntRej_Left'] = this.teamCurCntRejLeft;
    data['TeamCurCntRej_Right'] = this.teamCurCntRejRight;
    data['TeamPreCntRej'] = this.teamPreCntRej;
    data['TeamPreCntRej_Left'] = this.teamPreCntRejLeft;
    data['TeamPreCntRej_Right'] = this.teamPreCntRejRight;
    data['TeamTotCntRej'] = this.teamTotCntRej;
    data['TeamTotCntRej_Left'] = this.teamTotCntRejLeft;
    data['TeamTotCntRej_Right'] = this.teamTotCntRejRight;
    data['RankName'] = this.rankName;
    data['RankImage'] = this.rankImage;
    data['CF_Left'] = this.cFLeft;
    data['CF_Right'] = this.cFRight;
    data['PW_Comm1PV'] = this.pWComm1PV;
    data['PW_Comm2PV'] = this.pWComm2PV;
    data['FTBStatus'] = this.fTBStatus;
    data['FastTBSts'] = this.fastTBSts;
    data['PayoutStatus'] = this.payoutStatus;
    data['LastThreeWeeksData'] = this.lastThreeWeeksData;
    data['PV_Required'] = this.pVRequired;
    data['Eligible_Till'] = this.eligibleTill;
    data['ReffCustPV'] = this.reffCustPV;
    data['CurrentPayCycle'] = this.currentPayCycle;
    data['Lastorderdateandpv'] = this.lastorderdateandpv;
    data['LSbonus'] = this.lSbonus;
    data['NextPurchaseDate'] = this.nextPurchaseDate;
    data['ISAadharLinked'] = this.iSAadharLinked;
    data['PAN'] = this.pAN;
    data['IsAllowaadharCheckButton'] = this.isAllowaadharCheckButton;
    return data;
  }
}
