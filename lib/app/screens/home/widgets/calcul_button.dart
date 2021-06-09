import 'package:flutter/material.dart';

class CalculButton extends StatelessWidget {

  const CalculButton(
    {this.content, this.isDark=false, this.isBig=false, this.onTapFunction});

  final String content;
  final bool isDark;
  final bool isBig;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isBig ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: InkWell(
            splashColor: Colors.orange.withOpacity(0.5),
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
              ),
            onTap: () => { onTapFunction() },
              child: Ink(
              height: 50,
              child: Center(
                child: Container(
                  child: Text(
                    content,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, 
                    color: isDark == true ? Colors.white  :Colors.black),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: isDark == true ? Colors.black : Colors.white,
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(15)),
              ),
          ),
        ),
      ),
    );
  }
}