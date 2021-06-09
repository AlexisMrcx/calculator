import 'package:calculator/app/modules/history/model/history_model.dart';
import 'package:flutter/material.dart';

class HistoryDetailsScreen extends StatefulWidget {
  const HistoryDetailsScreen({this.data});
  final History data;

  @override
  _HistoryDetailsScreenState createState() => _HistoryDetailsScreenState();
}

backToHistory(context){
  Navigator.of(context).pop('test');
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title : Text(
            "Detail History",
            style : TextStyle(
              color : Colors.black,
              fontSize: 25,            
            )
          ),
          elevation: 0,
          backgroundColor: Colors.grey.withOpacity(0.5),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(widget.data.title.toString()),
                      Text(widget.data.dateTime.toString()),
                      Text(widget.data.result.toString())
                    ],
                  ),
                  IconButton(
                    onPressed: (){
                      backToHistory(context);
                    },
                    icon:  Icon(Icons.cancel, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}