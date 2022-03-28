import 'dart:convert';

class Quicks {
  String url;

  Quicks({required this.url});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory Quicks.fromMap(Map<String, dynamic> map) {
    return Quicks(
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Quicks.fromJson(String source) => Quicks.fromMap(json.decode(source));
}

Quicks quicksFromMap(Map<String, dynamic> quick) => new Quicks.fromMap(quick);
