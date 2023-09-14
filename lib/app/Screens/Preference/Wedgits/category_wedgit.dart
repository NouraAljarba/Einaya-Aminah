import 'package:einayaaminah/app/Models/categories_model.dart';
import 'package:einayaaminah/app/core/Services/Database/database_service.dart';
import 'package:einayaaminah/app/core/utilities/Constants/colors.dart';
import 'package:einayaaminah/app/core/utilities/Shared/Text%20Components/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/Bloc/perferance_bloc/perferance_bloc.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<PreferenceBloc>()
          .add(GetPrefEvent(categoryId: category.categoryId));
    });
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          category.categoryName,
          style: TextStyle(fontSize: AppSizes.buttonTextSize(context)),
        ),
        trailing: BlocBuilder<PreferenceBloc, PreferenceState>(
          builder: (context, state) {
            if (state is PreferenceLoading) {
              return CircularProgressIndicator(
                color: AppColors.lightPrimeryColor,
              );
            } else if (state is GetPrefSucceededState) {
              return Switch(
                activeColor: Theme.of(context).primaryColor, // Added this line
                value: state.prefObj.isIncluded,
                onChanged: (value) {
                  context.read<PreferenceBloc>().add(ChangePrefEvent(
                      userId: currentUserId!,
                      isIncluded: value,
                      categoryId: category.categoryId));
                },
              );
            } else if (state is GetPrefFailedState) {
              return Icon(Icons.error, color: AppColors.lightRed);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
