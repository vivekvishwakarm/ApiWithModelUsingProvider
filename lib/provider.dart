import 'package:flutter/cupertino.dart';
import 'package:provider_api/api_services.dart';
import 'package:provider_api/with_model.dart';

class ApiProvider with ChangeNotifier{

  late WithModel mode;

  bool loading = true;

  getDataWithModel() async{
    // mode = (await ApiServices().getData())!;
    
    ApiServices().getData().then((value){
      mode = value!;
    }).onError((error, stackTrack){
      print("Error");
    });
    
    loading = false;
    notifyListeners();
  }

}