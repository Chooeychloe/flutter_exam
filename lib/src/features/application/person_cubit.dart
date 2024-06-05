import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam/src/features/data/model/person_model.dart';
import 'package:flutter_exam/src/features/data/repository/i_person_repository.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  final IPersonRepository repository;
  List<PersonModel> personList = [];

  PersonCubit(this.repository) : super(PersonInitial());

  Future<void> initialize() async {
    emit(PersonLoading());
    await fetchData();
    emit(PersonSuccess());
  }

  Future<void> fetchData() async {
    emit(PersonLoading());
    try {
      personList = await repository.getPersons();
    } catch (e) {
      emit(PersonFailed(Exception(e.toString())));
    }
  }
}
