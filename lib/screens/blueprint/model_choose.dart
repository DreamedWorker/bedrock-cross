import 'package:flutter/material.dart';

class ModelChoose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("项目模型选择"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
         centerTitle: false
        ),
      body: Container(),
    );
  }
}