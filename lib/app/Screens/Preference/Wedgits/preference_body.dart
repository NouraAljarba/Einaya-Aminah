import 'package:einayaaminah/app/Models/categories_model.dart';
import 'package:einayaaminah/app/Screens/Preference/Wedgits/category_list.dart';
import 'package:einayaaminah/app/core/Services/Database/database_service.dart';
import 'package:einayaaminah/app/core/utilities/Constants/colors.dart';
import 'package:flutter/material.dart';

/// [PreferenceBody] builds the main content of the [PreferenceScreen].
class PreferenceBody extends StatelessWidget {
  const PreferenceBody({super.key});

  Future<List<Category>> _loadCategories() async {
    final categoryData = await fetchCategories();
    return categoryData.map((data) => Category.fromJson(data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: _loadCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Center(child: CircularProgressIndicator(
            color: AppColors.lightPrimeryColor,
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No categories found.'));
        } else {
          return CategoryList(categories: snapshot.data!);
        }
      },
    );
  }
}