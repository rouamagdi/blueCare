import 'dart:convert';
import 'package:http/http.dart' show Client;
 final String articlsUrl = 'http://192.168.56.1:5000/api/articles';

class Articls {
  int id;
  String title;
  String body;
  
 Client client = Client();
  Articls({this.id = 0, this.title, this.body });

  Future<List<Articls>> getArticlss() async {
    final response = await client.get("$articlsUrl");
    if (response.statusCode == 200) {
      return articlsFromJson(response.body);
    } else {
      return null;
    }
  }

  factory Articls.fromJson(Map<String, dynamic> map) {
    return Articls(
        id: map["id"], title: map["title"], body: map["body"] );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "body": body,};
  }

  @override
  String toString() {
    return 'id: $id, name: $title, email: $body,';
  }

}

List<Articls> articlsFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Articls>.from(data.map((item) => Articls.fromJson(item)));
}

String articlsToJson(Articls data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}


