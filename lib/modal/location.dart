// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tz_id;
  int localtime_epoch;
  String localtime;
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tz_id,
    required this.localtime_epoch,
    required this.localtime,
  });

  Location copyWith({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tz_id,
    int? localtime_epoch,
    String? localtime,
  }) {
    return Location(
      name: name ?? this.name,
      region: region ?? this.region,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      tz_id: tz_id ?? this.tz_id,
      localtime_epoch: localtime_epoch ?? this.localtime_epoch,
      localtime: localtime ?? this.localtime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'region': region,
      'country': country,
      'lat': lat,
      'lon': lon,
      'tz_id': tz_id,
      'localtime_epoch': localtime_epoch,
      'localtime': localtime,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] as String,
      region: map['region'] as String,
      country: map['country'] as String,
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      tz_id: map['tz_id'] as String,
      localtime_epoch: map['localtime_epoch'] as int,
      localtime: map['localtime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Location(name: $name, region: $region, country: $country, lat: $lat, lon: $lon, tz_id: $tz_id, localtime_epoch: $localtime_epoch, localtime: $localtime)';
  }

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.region == region &&
      other.country == country &&
      other.lat == lat &&
      other.lon == lon &&
      other.tz_id == tz_id &&
      other.localtime_epoch == localtime_epoch &&
      other.localtime == localtime;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      region.hashCode ^
      country.hashCode ^
      lat.hashCode ^
      lon.hashCode ^
      tz_id.hashCode ^
      localtime_epoch.hashCode ^
      localtime.hashCode;
  }
}
