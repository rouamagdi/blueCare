import 'dart:convert';

class DoctorModel {
  int id;
  String name;
  String doctorDescription;
  String doctorNationality;
  String doctorSpecilization;
  String doctorPrice;
  String doctorExperience;
 
  String avatar;
  double lat, lng;
  DoctorModel({this.id, this.name, this.doctorDescription,
   this.doctorNationality, this.doctorSpecilization,
   this.doctorPrice,this.doctorExperience,
   this.lat,this.lng,this.avatar});

  factory DoctorModel.fromJson(Map<String, dynamic> map) {
    return DoctorModel(
        id: map['id'], name: map["name"],
         doctorDescription: map["doctorDescription"], 
         doctorNationality: map["doctorNationality"],
         doctorPrice: map["doctorPrice"],doctorExperience: map["doctorExperience"],
         lat: map["lat"],lng: map["lng"], avatar: map["avatar"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name,
     "doctorDescription": doctorDescription, "doctorNationality": doctorNationality,
      "doctorSpecilization":doctorSpecilization,"doctorPrice": doctorPrice,
       "doctorExperience": doctorExperience, 
       "lat": lat, "lng": lng, "avatar": avatar};
  }

  @override
  String toString() {
    return 'DoctorModel{id: $id, name: $name, doctorDescription: $doctorDescription, doctorNationality: $doctorNationality,,doctorSpecilization:$doctorSpecilization,doctorPrice:$doctorPrice,doctorExperience:$doctorExperience,lng:$lng,lat:$lat avatar: $avatar}';
  }

}

List<DoctorModel> listModelFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<DoctorModel>.from(data.map((item) => DoctorModel.fromJson(item)));
}

String listModelToJson(DoctorModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}