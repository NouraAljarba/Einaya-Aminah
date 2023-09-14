import 'package:einayaaminah/app/Screens/Results/Widgets/highlighter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/Bloc/results_bloc/results_bloc.dart';
import '../../core/Services/Database/database_service.dart';
import 'Widgets/error_display.dart';
import 'Widgets/loading_indicator.dart';

class ResultsScreen extends StatelessWidget {
  final String text;
  final ResultsBloc resultsBloc;

  ResultsScreen({Key? key, required this.text})
      : resultsBloc = ResultsBloc(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    resultsBloc.add(FetchIngredientsEvent(userId: currentUserId!));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Results'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: _buildResultsContent(),
              ),
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.green,
              highlightColor: Colors.lightGreen,
              child: const Text(
                'Scan completed successfully!',
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsContent() {
    return BlocBuilder<ResultsBloc, ResultsState>(
      bloc: resultsBloc,
      builder: (context, state) {
        if (state is ResultsLoading) {
          return const Center(child: LoadingIndicator());
        } else if (state is ResultsLoaded) {
          return HighlightedIngredientsText(
              text: text, ingredientNames: state.ingredientNames);
        } else if (state is ResultsError) {
          return ErrorDisplay(message: state.message);
        }
        return Container(); // Default empty state.
      },
    );
  }
}
