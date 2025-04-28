// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Current {
int is_day;
double feelslike_c;
  Current({
    required this.is_day,
    required this.feelslike_c,
  });

  Current copyWith({
    int? is_day,
    double? feelslike_c,
  }) {
    return Current(
      is_day: is_day ?? this.is_day,
      feelslike_c: feelslike_c ?? this.feelslike_c,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'is_day': is_day,
      'feelslike_c': feelslike_c,
    };
  }

  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
      is_day: map['is_day'] as int,
      feelslike_c: map['feelslike_c'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) => Current.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Current(is_day: $is_day, feelslike_c: $feelslike_c)';

  @override
  bool operator ==(covariant Current other) {
    if (identical(this, other)) return true;
  
    return 
      other.is_day == is_day &&
      other.feelslike_c == feelslike_c;
  }

  @override
  int get hashCode => is_day.hashCode ^ feelslike_c.hashCode;
}
