import 'package:quran_app/model/sore_model.dart';
import 'package:quran_app/repository/quran_repo.dart';

class PetangViewModel {
  final  _repository = QuranRepository();

  Future<List<Petang>> getListPagi() async =>
      await _repository.getListPetang();
}
