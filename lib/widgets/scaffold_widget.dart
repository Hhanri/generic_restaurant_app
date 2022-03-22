import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const ScaffoldWidget({
    Key? key,
    required this.title,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight:Radius.circular(30)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: child,
          )
        )
      ),
    );
  }
}
