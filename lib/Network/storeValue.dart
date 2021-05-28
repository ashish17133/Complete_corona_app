class Coronadata {
  String totalActiveCase;
  String totalPositiveCase;
  String totalRecoveredCase;
  String totalDeaths;
  String newConfirmCase;
  String newRecoveredCase;
  String newDeaths;
  String dateeTime;
  Coronadata(
      {this.dateeTime,
      this.newConfirmCase,
      this.newDeaths,
      this.newRecoveredCase,
      this.totalActiveCase,
      this.totalDeaths,
      this.totalPositiveCase,
      this.totalRecoveredCase});
}

class Mythdata {
  String english;
  String nepali;
  String imageurl;
  String nepalians;
  String englishans;
  Mythdata(
      {this.english,
      this.imageurl,
      this.nepali,
      this.englishans,
      this.nepalians});
}

class Hospital {
  String name;
  String address;
  String phoneno;
  bool govermentAuth;
  String state;
  String capacity_bed;
  String capacity_ventilator;
  String capacity_isolation;
  String capacity_doctor;
  String capacity_nurse;
  Hospital(
      {this.name,
      this.address,
      this.phoneno,
      this.govermentAuth,
      this.state,
      this.capacity_bed,
      this.capacity_doctor,
      this.capacity_isolation,
      this.capacity_nurse,
      this.capacity_ventilator});
}
