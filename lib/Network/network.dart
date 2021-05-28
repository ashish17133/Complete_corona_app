import 'dart:convert';

import 'package:corona_app/Network/storeValue.dart';
import 'package:http/http.dart' as http;

Mythdata mythdata;

String baseurlworld =
    "https://worldometers.p.rapidapi.com/api/coronavirus/country/";
String nepaliHospital = "https://corona.askbhunte.com/api/v1/hospitals";
String version = "v1/data/";
String country = "nepal";
Coronadata _coronadata;
String mythurl = "https://corona.askbhunte.com/api/v1/myths";

String requestUrl(String countryName) {
  return "${baseurlworld}${countryName}";
}

Future<Coronadata> requestCoronaData() async {
  String url = requestUrl("nepal");

  Uri uriUrl = Uri.parse(url);

  http.Response coronadat = await http.get(uriUrl, headers: {
    "x-rapidapi-key": "0ed9b00cb0msh68f82cc04fbbaf3p175ee4jsn31afefca7e93",
  });

  var decodeCoronadata = json.decode(coronadat.body);
  String totalactive = decodeCoronadata['data']['Active Cases'];
  String totalpositive = decodeCoronadata['data']['Total Cases'];
  String totalRecovered = decodeCoronadata['data']['Total Recovered'];
  String totaldeath = decodeCoronadata['data']['Total Deaths'];
  String newcases = decodeCoronadata['data']['New Cases'];
  String newdeath = decodeCoronadata['data']['New Deaths'];
  String newrecovered = decodeCoronadata['data']['New Recovered'];
  String dateTime = decodeCoronadata['last_update'];
  _coronadata = Coronadata(
      totalActiveCase: totalactive,
      totalPositiveCase: totalpositive,
      totalRecoveredCase: totalRecovered,
      newConfirmCase: newcases,
      newDeaths: newdeath,
      newRecoveredCase: newrecovered,
      totalDeaths: totaldeath,
      dateeTime: dateTime);
  // print(totaldeath);
  // print(totalpositive);
  // print(totalactive);
  // print(totalRecovered);
  // print(newcases);
  // print(newdeath);
  // print(newrecovered);
  return _coronadata;
}

Future<List<Mythdata>> getMyth() async {
  Uri urimythurl = Uri.parse(mythurl);
  http.Response mythdata = await http.get(urimythurl);
  var decodedmyth = json.decode(mythdata.body);
  var listdecodemyth = decodedmyth["data"];
  //print(decodedmyth['data'].length());
  print(decodedmyth['data'][0]['myth']);
  print(decodedmyth['data'][0]['myth_np']);
  List<Mythdata> mythdatavalue = [];
  for (int i = 0; i <= (listdecodemyth.length - 1); i++) {
    mythdatavalue.add(Mythdata(
        english: listdecodemyth[i]['myth'],
        nepali: listdecodemyth[i]['myth_np'],
        imageurl: listdecodemyth[i]['image_url'],
        nepalians: listdecodemyth[i]['reality_np'],
        englishans: listdecodemyth[i]['reality']));
  }

  return mythdatavalue;
}

Future<List<Hospital>> getHospital() async {
  Uri hospitalurl = Uri.parse(nepaliHospital);
  http.Response hospitalresponse = await http.get(hospitalurl);
  var decodedlist = json.decode(hospitalresponse.body);
  var decodedlistHosp = decodedlist["data"];
  List<Hospital> myhospital = [];
  for (int i = 0; i <= (decodedlistHosp.length - 1); i++) {
    myhospital.add(Hospital(
      name: decodedlistHosp[i]['name'],
      address: nonNullreturn(decodedlistHosp[i]['address']),
      govermentAuth: decodedlistHosp[i]['government_approved'],
      phoneno: nonNullreturn(decodedlistHosp[i]['phone']),
      state: decodedlistHosp[i]['state'],
      capacity_bed: nonNullreturn(decodedlistHosp[i]['capacity']['beds']),
      capacity_doctor: nonNullreturn(decodedlistHosp[i]['capacity']['doctors']),
      capacity_nurse: nonNullreturn(decodedlistHosp[i]['capacity']['nurses']),
      capacity_isolation:
          nonNullreturn(decodedlistHosp[i]['capacity']['isolation_beds']),
      capacity_ventilator:
          nonNullreturn(decodedlistHosp[i]['capacity']['ventilators']),
    ));
  }
  print(myhospital[2].name);
  return myhospital;
}

String nonNullreturn(String value) {
  return value == "" ? "Not_Available" : value;
}
