

abstract class ApiDataStates{}
class ApiDataInitialStates extends ApiDataStates{

}
class ApiDataLoadingStates extends ApiDataStates{

}
class ApiDataLoadedStates extends ApiDataStates{
  final String current;
  final String condition;
  final String location;
  final int is_day;
  List<String> feelLike;
  List<int> isDay;
  List<String> dateOfDay=[];
  List<double> avg=[];
  String humidity;
  String uv;
  String wind;
  String sunset;
  ApiDataLoadedStates({required this.sunset,required this.wind,required this.uv,required this.humidity,required this.avg,required this.dateOfDay,required this.isDay,required this.feelLike,required this.current,required this.condition,required this.location, required this.is_day});
}
class ApiDataErrorStates extends ApiDataStates{

}