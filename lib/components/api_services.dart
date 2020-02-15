import 'package:loginn/models/articls_model.dart';
import 'package:http/http.dart' show Client;


class ApiService {
 
  Client client = Client();

 final String articlsUrl = 'http://192.168.56.1:5000/api/articles';
Future<List<Articls>> getArticlss() async {
    final response = await client.get("$articlsUrl");
    if (response.statusCode == 200) {
      return articlsFromJson(response.body);
    } else {
      return null;
    }
  }
   Future<List<Articls>>getArticl(Articls data) async {
    final response = await client.get(
      "$articlsUrl/${data.id}",);
    if (response.statusCode == 200) {
    
      return articlsFromJson(response.body);
    } else {
      return null;
    }
  }

  }