import 'package:bloc/bloc.dart';
import 'package:einayaaminah/app/Models/ingredients_model.dart';
import 'package:einayaaminah/app/core/Services/Database/database_service.dart';

part 'custom_ing_state.dart';

class CustomIngCubit extends Cubit<CustomIngState> {
  CustomIngCubit() : super(CustomIngInitial());

  getIngList() async {
    emit(CustomProgresState());
    try {
      final List<Ingredient> ingList = await getCustomizedIngredients();
      emit(CustomSuccessState(ingList: ingList));
    } catch (e) {
      emit(CustomFailedState(error: e.toString()));
    }
  }

  updateIngList() async {
    emit(CustomProgresState());
    try {
      final List<Ingredient> ingList = await getCustomizedIngredients();
      emit(CustomSuccessState(ingList: ingList));
    } catch (e) {
      emit(CustomFailedState(error: e.toString()));
    }
  }
}
