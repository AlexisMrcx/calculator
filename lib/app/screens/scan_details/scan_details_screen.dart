import 'dart:io';

import 'package:flutter/material.dart';

class ScanDetailsScreen extends StatelessWidget {
  const ScanDetailsScreen({this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.5),
        title: Text(
          "Ma facture",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Image.file(File(data))
          ),
      ),
    );
  }
}