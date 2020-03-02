import 'package:alcool_ou_gasolina/variables.dart';
import 'package:flutter/material.dart';
import 'loading-button.widget.dart';

class Info extends StatelessWidget {
  var resultText = "";
  Function reset;

  Info({
    @required this.resultText,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            resultText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40,
              fontFamily: fontBSD,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          LoadingButton(
            busy: false,
            text: 'CALCULAR NOVAMENTE',
            colorInvert: true,
            func: reset,
          ),
        ],
      ),
    );
  }
}
