import 'package:einayaaminah/app/Models/ingredients_model.dart';
import 'package:einayaaminah/app/Screens/Preference/Wedgits/ingredients_widget.dart';
import 'package:einayaaminah/app/core/Bloc/cubit/custom_ing_cubit.dart';
import 'package:einayaaminah/app/core/utilities/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Ingredient> ingList = [];

class IngredientList extends StatelessWidget {
  const IngredientList({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CustomIngCubit>().getIngList();

    return BlocBuilder<CustomIngCubit, CustomIngState>(
      builder: (context, state) {
        if (state is CustomProgresState) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.lightPrimeryColor,
          ));
        } else if (state is CustomFailedState) {
          return Center(child: Text('Error: ${state.error}'));
        } else if (state is CustomSuccessState) {
          ingList = state.ingList;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: ingList.length,
            itemBuilder: (context, index) {
              return IngredientsWidget(ingredientObj: ingList[index]);
            },
          );
        } else {
          return Text(
            "you don't have customized ingredients",
            style: Theme.of(context).textTheme.titleMedium,
          );
        }
      },
    );
  }
}
