import 'package:quran_app/model/pagi_model.dart';
import 'package:quran_app/repository/quran_repo.dart';

class PagiViewModel {
  final  _repository = QuranRepository();

  Future<List<Pagi>> getListPagi() async =>
      await _repository.getListPagi();
}
