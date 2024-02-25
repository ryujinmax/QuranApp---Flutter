import 'dart:convert';

List<Pagi> pagiFromJson(String str) =>
    List<Pagi>.from(json.decode(str).map((x) => Pagi.fromJson(x)));

class Pagi {
  String? title;
  String? arabic;
  String? latin;
  String? translation;
  String? notes;
  String? fawaid;
  String? source;

  Pagi(
      {this.title,
      this.arabic,
      this.latin,
      this.translation,
      this.notes,
      this.fawaid,
      this.source});

  Pagi.fromJson(Map<String, dynamic> json) {
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

