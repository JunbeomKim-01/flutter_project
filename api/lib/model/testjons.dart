import 'dart:convert';

class TestJons {
  String name;

  TestJons({
  this.name = "",
  });

  TestJons.fromJson(Map<String, dynamic>  map) :
        name = map['name']  ?? "";

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  TestJons copyWith({
    String name,
  }) {
    return TestJons(
      name: name ?? this.name,
    );
  }
}

