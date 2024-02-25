import 'package:quran_app/model/doa_model.dart';
import 'package:quran_app/repository/quran_repo.dart';

class DoaViewModel {
  final _repository = QuranRepository();

  Future<List<DailyDoa>> getListDoa() async =>
    await _repository.getListDoa();
}
