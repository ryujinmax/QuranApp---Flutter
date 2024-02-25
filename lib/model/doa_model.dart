import 'dart:convert';

List<DailyDoa> doaFromJson(String str) =>
    List<DailyDoa>.from(json.decode(str).map((x) => DailyDoa.fromJson(x)));

class DailyDoa {
  String? title;
  String? arabic;
  String? latin;
  String? translation;
  String? fawaid;
  String? source;

  DailyDoa(
      {this.title,
      this.arabic,
      this.latin,
      this.translation,
      this.fawaid,
      this.source});

  DailyDoa.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    arabic = json['arabic'];
    latin = json['latin'];
    translation = json['translation'];
    fawaid = json['fawaid'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['arabic'] = this.arabic;
    data['latin'] = this.latin;
    data['translation'] = this.translation;
    data['fawaid'] = this.fawaid;
    data['source'] = this.source;
    return data;
  }
}
