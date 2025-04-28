import 'dart:math';

import 'package:weather_app/controller/api_service.dart';
import 'package:weather_app/modal/api_states.dart';
import 'package:weather_app/modal/current.dart';
import 'package:weather_app/modal/location.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WeatherApiController extends GetxController with StateMixin<ApiDataStates>{
    ApiService api=ApiService();
    RxString city="Liaquatpur".obs;
    void changeCity(String s){
      city.value=s;
    }
    WeatherApiController(){
      change(ApiDataInitialStates(),status: RxStatus.empty());
    }
    void loadData()async{
      List<String> temp=[];
      List<int> is_Day=[];
      List<double> avgtemp=[];
      List<String> date=[];
      change(ApiDataLoadingStates(),status:RxStatus.loading());
      try {
        var data=await api.fetch(city.value);
        String currentTemp=data['current']['feelslike_c'].toString();
        String location=data['location']['name'];
        String condition=data['current']['condition']['text'].toString();
        int isDay=data['current']['is_day'];
        String humidity = data['current']['humidity'].toString();
        String wind = data['current']['wind_kph'].toString();
        String uv = data['current']['uv'].toString();
        print(uv);
        String sunset=data['forecast']['forecastday'][0]['astro']['sunset'];
        for (var i = DateTime.now().hour; i <= DateTime.now().hour+4; i++) {
          temp.add(data['forecast']['forecastday'][0]['hour'][i]['feelslike_c'].round().toString());
          is_Day.add(data['forecast']['forecastday'][0]['hour'][i]['is_day']);
          print(is_Day);
        }
        for (var i = 0; i <3; i++) {
          date.add(data['forecast']['forecastday'][i]['date']);
          avgtemp.add(data['forecast']['forecastday'][i]['day']['avgtemp_c']);
          print(date);
        }
        change(ApiDataLoadedStates(sunset: sunset,humidity: humidity,uv: uv,wind: wind,avg: avgtemp,dateOfDay: date,isDay: is_Day,current:currentTemp,condition: condition,location:location,is_day:isDay, feelLike: temp),status:RxStatus.success());
      } catch (e) {
        change(ApiDataErrorStates(),status:RxStatus.error());
      }
    }
}