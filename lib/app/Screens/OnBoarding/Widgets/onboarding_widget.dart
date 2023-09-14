import 'package:flutter/material.dart';

class OnbordingWidget extends StatelessWidget {
  const OnbordingWidget({
    super.key,
    required this.color,
    required this.title,
    required this.suptitle,
  });

  final Color color;
  final String title;
  final String suptitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
          ),
          Text(title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 20,
          ),
          Text(suptitle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
