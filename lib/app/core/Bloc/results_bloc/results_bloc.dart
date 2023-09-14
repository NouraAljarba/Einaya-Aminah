import 'package:bloc/bloc.dart';
import '../../Services/Database/database_service.dart';

part 'results_event.dart';
part 'results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  ResultsBloc() : super(ResultsInitial()) {
    on<FetchIngredientsEvent>(_onFetchIngredientsEvent);
  }

  Future<void> _onFetchIngredientsEvent(
      FetchIngredientsEvent event, Emitter<ResultsState> emit) async {
    emit(ResultsLoading());
    try {
      final ingredients = await getIngredientsByUserPref(userId: event.userId);
      final ingredientNames =
          ingredients.map((ingredient) => ingredient.ingredientName).toList();
      emit(ResultsLoaded(ingredientNames: ingredientNames));
    } catch (e) {
      emit(ResultsError(message: e.toString()));
    }
  }
}
