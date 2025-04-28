import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiService {
  String cityName="Liaquatpur";
  final String forcastWeather="http://api.weatherapi.com/v1/forecast.json?key=b1832f305a1a41b0aca71511252302&q=";
  // Future<void> _permission() async {
  //   LocationPermission permission=await Geolocator.checkPermission();
  //   if(permission==LocationPermission.denied){
  //     Geolocator.requestPermission();
  //   }
  // }
  Future<Map<String,dynamic>> fetch(String city)async {
    var response = await http.get(Uri.parse("$forcastWeather$city&days=7&aqi=no&alerts=no"));
    print(response.statusCode);
    if(response.statusCode==200){
      return jsonDecode(response.body) as Map<String,dynamic>;
    }
    else{
      throw Exception(response.statusCode);
    }
  }

}