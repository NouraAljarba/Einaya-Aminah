import 'package:einayaaminah/app/Screens/Preference/Wedgits/customize_body.dart';
import 'package:einayaaminah/app/Screens/Preference/preference_screen.dart';
import 'package:einayaaminah/app/core/Bloc/cubit/custom_ing_cubit.dart';
import 'package:einayaaminah/app/core/Services/Database/database_service.dart';
import 'package:einayaaminah/app/core/utilities/Constants/colors.dart';
import 'package:einayaaminah/app/core/utilities/extention/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future openDialog(
    BuildContext context, TextEditingController ingController) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text('Add Ingredient that you want our scanner to detect:',
          style: Theme.of(context).textTheme.labelLarge),
      content: SizedBox(
        child: TextField(
          controller: ingController,
          cursorColor: AppColors.lightPrimeryColor,
          decoration: InputDecoration(
            hintText: 'e.g.Sulfates..',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      actions: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  if (ingController.text.isNotEmpty) {
                    insertToIngredients(name: ingController.text);
                    const PreferenceScreen().pop(context);
                    context.read<CustomIngCubit>().getIngList();

                    ingController.clear();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        icon:
                            const Icon(Icons.error_outline, color: Colors.red),
                        title: Center(
                          child: Text("Please Don't Leave Any Empty Field",
                              style: Theme.of(context).textTheme.labelLarge),
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () {
                  const CustomizeBody().pop(context);
                },
                child: const Text('Cancel'),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
