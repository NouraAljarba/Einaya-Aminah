import 'package:einayaaminah/app/Screens/Preference/Wedgits/dialog_function.dart';
import 'package:einayaaminah/app/Screens/Preference/Wedgits/ingredient_list.dart';
import 'package:einayaaminah/app/Screens/Preference/Wedgits/preference_Container.dart';
import 'package:einayaaminah/app/core/utilities/Shared/Text%20Components/text.dart';
import 'package:flutter/material.dart';

class CustomizeBody extends StatefulWidget {
  const CustomizeBody({super.key});

  @override
  State<CustomizeBody> createState() => _CustomizeBodyState();
}

class _CustomizeBodyState extends State<CustomizeBody> {
  late TextEditingController ingController;

  @override
  void initState() {
    super.initState();
    ingController = TextEditingController();
  }

  @override
  void dispose() {
    ingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrefContainer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Coustmized Ingredients:',
              style: TextStyle(fontSize: AppSizes.buttonTextSize(context)),
            ),
            const IngredientList(),
            TextButton(
                onPressed: () async {
                  await openDialog(context, ingController);
                },
                child: Text(
                  'Add Ingredient',
                  style: TextStyle(
                      fontSize: AppSizes.buttonTextSize(context),
                      color: Theme.of(context).primaryColor),
                )),
          ],
        ),
      ),
    );
  }
}
