part of 'database_bloc.dart';

@immutable
sealed class DatabaseState {}

final class DatabaseInitialState extends DatabaseState {}

class DatabaseInProgresState extends DatabaseState {}

class DatabaseSuccessState extends DatabaseState {
  final List<Category> categoriesList;

  DatabaseSuccessState({required this.categoriesList});
}

class DatabaseFailedState extends DatabaseState {
  final String error;
  DatabaseFailedState({required this.error});
}
