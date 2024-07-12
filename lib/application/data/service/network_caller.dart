import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:soft_bd/application/data/model/network_response.dart';

class NetworkCaller{

//get request
static Future<NetworkResponse> getRequest(String url) async{
  try{
  Response response = await get(Uri.parse(url),
   );

  log(response.statusCode.toString());
  log(response.body);
  if(response.statusCode==200){
    return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  }else if(response.statusCode==401){
  

  }else{
    return NetworkResponse(false, response.statusCode, null);
}
  }catch(e){
    log(e.toString());
  }
return NetworkResponse(false, -1, null);
}


}