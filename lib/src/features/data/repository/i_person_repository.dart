import 'package:flutter_exam/src/features/data/model/person_model.dart';

abstract class IPersonRepository {
  Future<List<PersonModel>> getPersons();
}
