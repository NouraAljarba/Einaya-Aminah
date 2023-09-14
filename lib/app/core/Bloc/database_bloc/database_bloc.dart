import 'package:bloc/bloc.dart';
import 'package:einayaaminah/app/Models/categories_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../../Services/Database/database_service.dart';
part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc() : super(DatabaseInitialState()) {
    on<DatabaseEvent>((event, emit) async {
      emit(DatabaseInProgresState());
      try {
        final List<dynamic> categoryData = await fetchCategories();
        final List<Category> categoriesList = categoryData.map((data) => Category.fromJson(data)).toList();
        emit(DatabaseSuccessState(categoriesList: categoriesList));
      } catch (e) {
        emit(DatabaseFailedState(error: 'Error'));
      }
    });
  }
}