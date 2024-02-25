import 'dart:convert';

List<Petang> petangFromJson(String str) =>
    List<Petang>.from(json.decode(str).map((x) => Petang.fromJson(x)));

class Petang {
  String? title;
  String? arabic;
  String? latin;
  String? translation;
  String? notes;
  String? fawaid;
  String? source;

  Petang(
      {this.title,
      this.arabic,
      this.latin,
      this.translation,
      this.notes,
      this.fawaid,
      this.source});

  Petang.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    arabic = json['arabic'];
    latin = json['latin'];
    translation = json['translation'];
    notes = json['notes'];
    fawaid = json['fawaid'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['arabic'] = this.arabic;
    data['latin'] = this.latin;
    data['translation'] = this.translation;
    data['notes'] = this.notes;
    data['fawaid'] = this.fawaid;
    data['source'] = this.source;
    return data;
  }
}

