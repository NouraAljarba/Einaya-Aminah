import 'package:einayaaminah/app/Models/categories_model.dart';
import 'package:einayaaminah/app/Screens/Preference/Wedgits/category_wedgit.dart';
import 'package:einayaaminah/app/Screens/Preference/Wedgits/customize_body.dart';
import 'package:einayaaminah/app/Screens/Preference/Wedgits/preference_Container.dart';
import 'package:einayaaminah/app/core/Bloc/perferance_bloc/perferance_bloc.dart';
import 'package:einayaaminah/app/core/utilities/Constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [CategoryList] builds the list of categories.
class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrefContainer(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return BlocProvider(
                    create: (context) => PreferenceBloc(),
                    child: CategoryWidget(category: categories[index]),
                  );
                },
              ),
            ),
            ResponsiveSpacing.height(context, small),
            const CustomizeBody(),
            ResponsiveSpacing.height(context, xxxxxlarge)
          ],
        ),
      ),
    );
  }
}
