part of 'person_cubit.dart';

abstract class PersonState extends Equatable {
  const PersonState();
}

class PersonInitial extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonLoading extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonSuccess extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonFailed extends PersonState {
  final Exception exception;

  const PersonFailed(this.exception);

  @override
  List<Object> get props => [exception];
}
