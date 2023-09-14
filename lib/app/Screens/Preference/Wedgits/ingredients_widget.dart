import 'package:einayaaminah/app/Models/ingredients_model.dart';
import 'package:einayaaminah/app/Screens/Preference/Wedgits/ingredient_list.dart';
import 'package:einayaaminah/app/core/Bloc/cubit/custom_ing_cubit.dart';
import 'package:einayaaminah/app/core/Services/Database/database_service.dart';
import 'package:einayaaminah/app/core/utilities/Constants/colors.dart';
import 'package:einayaaminah/app/core/utilities/Shared/Text%20Components/text.dart';
import 'package:flutter/material.dart';

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget({super.key, required this.ingredientObj});
  final Ingredient ingredientObj;

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          widget.ingredientObj.ingredientName,
          style: TextStyle(fontSize: AppSizes.buttonTextSize(context)),
        ),
        trailing: IconButton(
            icon: Icon(Icons.delete, color: AppColors.lightPrimeryColor),
            onPressed: () async {
              await deleteIngredients(ingredientId: widget.ingredientObj.id!);
              ingList.remove(widget.ingredientObj);
            }),
      ),
    );
  }
}
