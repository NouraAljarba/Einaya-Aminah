import 'package:flutter/material.dart';

class HighlightedIngredientsText extends StatelessWidget {
  final String text;
  final List<String> ingredientNames;

  const HighlightedIngredientsText({
    Key? key,
    required this.text,
    required this.ingredientNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _highlightIngredients(),
    );
  }

  Widget _highlightIngredients() {
    String remainingText = text;
    final List<InlineSpan> children = [];

    final regex = RegExp(ingredientNames.map(RegExp.escape).join('|'));

    while (remainingText.isNotEmpty) {
      final match = regex.firstMatch(remainingText);

      if (match != null) {
        final startIndex = match.start;
        final endIndex = match.end;

        if (startIndex > 0) {
          children.add(
            TextSpan(text: remainingText.substring(0, startIndex)),
          );
        }

        final ingredient = remainingText.substring(startIndex, endIndex);
        children.add(
          WidgetSpan(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(
                    8.0), // Adjust the corner radius as needed.
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(4.0), // Adjust the padding as needed.
                child: Text(
                  ingredient,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
        );

        remainingText = remainingText.substring(endIndex);
      } else {
        children.add(
          TextSpan(text: remainingText),
        );
        remainingText = '';
      }
    }

    return RichText(
      text: TextSpan(
        children: children,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
