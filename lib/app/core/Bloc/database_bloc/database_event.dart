part of 'database_bloc.dart';

@immutable
sealed class DatabaseEvent {}

class GetDataEvent extends DatabaseEvent {}
