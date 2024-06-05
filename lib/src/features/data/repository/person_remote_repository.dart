import 'package:dio/dio.dart';
import 'package:flutter_exam/src/features/data/model/person_model.dart';
import 'package:flutter_exam/src/features/data/repository/i_person_repository.dart';

class PersonRemoteRepository extends IPersonRepository {
  final dio = Dio();
  @override
  Future<List<PersonModel>> getPersons() async {
    final response = await dio.get(
        "https://fakerapi.it/api/v1/persons?_quantity=100&_locale=en_US&_gender=female");
    if (response.statusCode == 200) {
      final person = (response.data["data"] as List)
          .map((data) => PersonModel.fromJson(data as Map<String, dynamic>))
          .toList();
      return person;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
