


class StateModel {
  late String Value;
  late String Text;
  late String link;



  StateModel({required this.Value,required this.Text});

  factory StateModel.fromJson(Map<String, dynamic> item) {
    return StateModel(Value:item['Value'], Text: item['Text']);
  }
  factory StateModel.pakageJson(Map<String, dynamic> item) {
    return StateModel(Value:item['pid'], Text: item['pName']);
  }

  factory StateModel.cityJson(Map<String, dynamic> item) {
    return StateModel(Value:item['value'].toString(), Text: item['text']);
  }
  factory StateModel.categoryJson(Map<String, dynamic> item) {
    return StateModel(Value:item['value'].toString(), Text: item['utilityCatName']);
  }

  factory StateModel.stateJson(Map<String, dynamic> item) {
    return StateModel(Value:item['StateId'], Text: item['StateName']);
  }

  factory StateModel.statesJson(Map<String, dynamic> item) {
    return StateModel(Value:item['StateId']!.toString(), Text: item['StateName']!);
  }

  factory StateModel.disctrctJson(Map<String, dynamic> item) {
    return StateModel(Value:item['DistrictID'], Text: item['DistrictName']);
  }


  factory StateModel.districtJson(Map<String, dynamic> item) {
    return StateModel(Value:item['DistrictID']!.toString(), Text: item['DistrictName']!);
  }

}
class SproductModel {
  late int pid;
  late String pName;
  late String pcode;
  SproductModel({required this.pid,required this.pName,required this.pcode});

  factory SproductModel.fromJson(Map<String, dynamic> item) {
    return SproductModel(pid:item['pid'], pName: item['pName'].toString(),pcode: item['pCode']);
  }

}

class StateModel2 {

  late String Text;
  late int ValueId;



  StateModel2({required this.ValueId,required this.Text});

  factory StateModel2.fromJson(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['value'], Text: item['text']);
  }


  factory StateModel2.from16Json(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['fiscalID'], Text: item['fiscalYear']);
  }

  factory StateModel2.eventJson(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['id'], Text: item['name']);
  }

  factory StateModel2.packageJson(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['pid'], Text: item['pName']);
  }

  factory StateModel2.stateJson(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['StateID'], Text: item['StateName']);
  }

  factory StateModel2.stateJsonstate(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['stateID'], Text: item['statename']);
  }


  factory StateModel2.associateJsonstate(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['rankID'], Text: item['rankName']);
  }
  factory StateModel2.stateJsoncity(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['cityID'], Text: item['cityName']);
  }

  factory StateModel2.suppfromJson(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['sTid'], Text: item['issueName']);
  }


  factory StateModel2.cityJson(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['CityID'], Text: item['CityName']);
  }
  factory StateModel2.concernIdJson(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['concernID'], Text: item['concern']);
  }
  factory StateModel2.cartofferJson(Map<String, dynamic> item) {
    return StateModel2(ValueId:item['OfferID'], Text: item['Text']);
  }





}
class StateModel3 {
   dynamic Text;
   dynamic ValueId;

  StateModel3({required this.Text,required this.ValueId});

  factory StateModel3.frommJson(Map<String, dynamic> item) {
    return StateModel3(ValueId:item['fcode'], Text: item['fname']);
  }
   factory StateModel3.cityJson(Map<String, dynamic> item) {
     return StateModel3(ValueId:item['CityID'], Text: item['CityName']);
   }


}


class StateModel4 {
  late String finQrtr;
  late String filepath;
  late int doctype;

  StateModel4(
      {required this.finQrtr, required this.filepath, required this.doctype});

  factory StateModel4.documentJson(Map<String, dynamic> item){
    return StateModel4(finQrtr: item['finQuarter'],filepath: item['filePath'], doctype: item['docType']);
  }
}



class EventModel {
  late int id;
  late String name;
  late int isAdmin;
  late int rankNo;
  late String? roleStatus;

  EventModel(
      {required this.id, required this.name, required this.isAdmin, required this.rankNo, required this.roleStatus});

  factory EventModel.fromJson(Map<String, dynamic> item){
    return EventModel(id: item['id'],name: item['name'], isAdmin: item['isAdmin'], rankNo: item['rankNo'], roleStatus: item['roleStatus']);
  }

}