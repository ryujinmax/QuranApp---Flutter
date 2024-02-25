import 'package:quran_app/model/dzikir_model.dart';
import 'package:quran_app/repository/quran_repo.dart';

class SholatViewModel {
  final QuranRepository  _repository = QuranRepository();

  Future<List<Dzikir>> getListSholat() async =>
      await _repository.getListSholat();
}