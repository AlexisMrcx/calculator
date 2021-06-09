

import 'package:calculator/app/modules/history/model/history_model.dart';
import 'package:calculator/app/screens/history/widgets/list_element.dart';
import 'package:calculator/app_routes.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<History> historyList = [
    History(title: 'Total achats', dateTime: DateTime.now(), result: 300, id: 1),
    History(title: 'Total achats 2', dateTime: DateTime.now(), result: 310, id: 2),
    History(title: 'Total achats 3', dateTime: DateTime.now(), result: 320, id: 3),
    History(title: 'Total achats 4', dateTime: DateTime.now(), result: 330, id: 4),
  ];

  removeElementFromList(int position) {
    setState(() {
      historyList.removeAt(position);
    });
  }

  navigateToDetails({History arguments}) {
    Navigator.pushNamed(context, kHistoryDetailsRoute, arguments: arguments) as bool;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         elevation: 0,
         backgroundColor: Colors.grey.withOpacity(0.5),
         actions: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20),
             child: Image.asset("assets/images/logo.png"),
           )
         ],
         centerTitle: true,
         title: Text(
           "Calculs récents", 
           style: TextStyle(
             fontSize: 25,
             color: Colors.black),
             ),
       ),
       body: Container(
         child: ListView.builder(
           itemCount: historyList.length,
           itemBuilder: (context, position) {
             return InkWell(
               onTap: () => navigateToDetails(
                 arguments: historyList[position]),
                 child: Row(
                  children: [
                   Text((position +1).toString()),
                   ListElement(element : historyList[position])
                 ],
               ),
               );
           },                           
         ),
       ),
    );
  }
}