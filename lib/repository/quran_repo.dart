import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_app/model/ayah_model.dart';
import 'package:quran_app/model/doa_model.dart';
import 'package:quran_app/model/dzikir_model.dart';
import 'package:quran_app/model/pagi_model.dart';
import 'package:quran_app/model/sore_model.dart';
import 'package:quran_app/model/surah_model.dart';
import 'package:http/http.dart' as http;

class QuranRepository {
  Future<List<Surah>> getListSurah() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');
    return surahFromJson(data);
  }

  Future<AyahModel> getListAyah(String id_surah) async {
    String url = ("https://equran.id/api/surat/$id_surah");

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return AyahModel.fromJson(body);
    }
    throw Exception("error");
  }

  Future<List<DailyDoa>> getListDoa() async {
    String data = await rootBundle.loadString('assets/data/daily-doa.json');
    return doaFromJson(data);
  }

  Future<List<Pagi>> getListPagi() async {
    String data = await rootBundle.loadString('data/dzikir-pagi.json');
    return pagiFromJson(data);
  }

  Future<List<Petang>> getListPetang() async {
    String data = await rootBundle.loadString('data/dzikir-petang.json');
    return petangFromJson(data);
  }

  Future<List<Dzikir>> getListSholat() async {
    String data = await rootBundle.loadString('data/dzikir-sholat.json');
    return dzikirFromJson(data);
  }
}
