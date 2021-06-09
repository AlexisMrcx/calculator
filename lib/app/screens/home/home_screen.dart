import 'package:calculator/app/modules/history/data/repository/history_repository.dart';
import 'package:function_tree/function_tree.dart';
import 'package:calculator/app/screens/home/widgets/calcul_button.dart';
import 'package:calculator/app_routes.dart';
import 'package:flutter/material.dart';


class ButtonElement{
    ButtonElement({this.content, this.isBig = false, this.isDark = false});

  final String content;
  final bool isBig;
  final bool isDark;
}


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HistoryRepository historyRepository = HistoryRepository();

  final elements = [[
    ButtonElement(content: "C"),
    ButtonElement(content: "("),
    ButtonElement(content: ")"),
    ButtonElement(content: "/"),
  ],
    [
    ButtonElement(content: "7", isDark: true),
    ButtonElement(content: "8", isDark: true),
    ButtonElement(content: "9", isDark: true),
    ButtonElement(content: "*"),
  ],
  [
    ButtonElement(content: "4", isDark: true),
    ButtonElement(content: "5", isDark: true),
    ButtonElement(content: "6", isDark: true),
    ButtonElement(content: "-"),
  ],
  [
    ButtonElement(content: "1", isDark: true),
    ButtonElement(content: "2", isDark: true),
    ButtonElement(content: "3", isDark: true),
    ButtonElement(content: "+"),
  ],
  [
    ButtonElement(content: "0", isDark: true, isBig: true),
    ButtonElement(content: "."),
    ButtonElement(content: "=")
  ]];

  String equation = "";
  List<String> equationOperator = [];
  List<String> equationElements = [];
  double resultat = 0;
  String currentDouble = "";
  String lastResult;

  onButtonTap(String element){
    if(element == "C"){
      remove();
    } else if (element == "="){
      setState(() {
        interpretResult();
      });      
    } else {
      addToEquation(element);

      if(["*","-","+","/"].contains(element)){
        addOperatorToEquation(element);
      } else {
        addElementToEquation(element);
      }
    }
  }

  addToEquation(String element){
    setState(() {
      equation+=element;
    });   
  }

  addOperatorToEquation(String op){
    equationOperator.add(op);
  }

  addElementToEquation(String el){
    equationElements.add(el);
  }

  remove(){
    setState(() {
      equation="";
      equationOperator=[];
      equationElements=[];
      resultat=0;
    });
  }

  interpretResult(){
    setState(() {
      resultat = equation.interpret();
    });   

    saveToCache(); 
  }

  navigateToHistory(context) {
    Navigator.pushNamed(context, kHistoryRoute);
  }

  navigateToScan(context) {
    Navigator.pushNamed(context, kScanRoute);
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  saveToCache() async {
    historyRepository.saveResult(resultat);
    setState(() {
      lastResult = resultat.toString();
    });
  }

  retrieveFromCache() async {
    lastResult = (await historyRepository.retrieve()) ?? '0';
    setState(() {});
  }

  @override
  void initState() {
    retrieveFromCache();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business'
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.5),
        title: Text(
          "Calculatrice",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.black),
              onPressed: () => navigateToHistory(context),
          ),
          IconButton(
            icon: Icon(
              Icons.camera,
              color: Colors.black),
              onPressed: () => navigateToScan(context),
          ),            
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Column(
            children: [
              Text("Dernier resultat : $lastResult"),
              Text(equation.toString(), style: TextStyle(color: Colors.black.withOpacity(0.5))),
              Padding(padding: const EdgeInsets.all(15)),
              Text(resultat.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),), 
            ],
          ),
            Container(
              child: Column(
                children: elements
                .map((elementList) => Row(
                  children: elementList
                    .map((e) => CalculButton(
                      content: e.content,
                      isDark: e.isDark,
                      isBig: e.isBig,
                      onTapFunction: ()=> onButtonTap(e.content),
                    ))
                    .toList(),
                ))
                .toList()),
                
              ),
            ],
          ),
      ),
    );
  }
}

