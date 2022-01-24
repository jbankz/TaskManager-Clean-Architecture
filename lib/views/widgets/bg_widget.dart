import 'package:flutter/material.dart';

class BgWidget extends StatelessWidget {
  final String? appBarTitle;
  final Widget? bodyWidget;
  final Widget? floatingActionButton;
  const BgWidget(
      {this.appBarTitle,
      this.floatingActionButton,
      required this.bodyWidget,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: bodyWidget,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
