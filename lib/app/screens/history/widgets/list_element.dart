import 'package:calculator/app/modules/history/model/history_model.dart';
import 'package:flutter/material.dart';

class ListElement extends StatelessWidget {
  const ListElement({this.element});

  final History element;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  element.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                    '${element.dateTime.day}/${element.dateTime.month + 1}/${element.dateTime.year}',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text(
                  element.result.toString(),
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}