import 'dart:convert';
import 'package:provider_api/with_model.dart';
import 'package:http/http.dart' as http;

class ApiServices{

  Future<WithModel?> getData() async{
    try{
      // late WithModel data;
      final response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
      if(response.statusCode == 200 || response.statusCode == 201){
        // WithModel data = WithModel.fromJson(jsonDecode(response.body));
         // data = WithModel.fromJson(jsonDecode(response.body));
         // return data;
        return WithModel.fromJson(json.decode(response.body));
      }
    }catch(e){
      print(e);
    }
    return null;
  }
}