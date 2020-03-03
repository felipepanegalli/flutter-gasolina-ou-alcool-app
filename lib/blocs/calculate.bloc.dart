import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CalculateBloc {
  Color primaryColorLight;
  Color primaryColor;

  Color color;
  var gasCtrl = new MoneyMaskedTextController();
  var alcCtrl = new MoneyMaskedTextController();

  var busy = false;
  var completed = false;
  var resultText = '';

  Future calculate() async {
    double alc =
        double.parse(alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;

    color = primaryColorLight;
    completed = false;
    busy = true;

    print(completed);
    print(busy);

    return await Future.delayed(const Duration(seconds: 1), () {
      if (res >= 0.7) {
        resultText = 'Compensa utilizar Gasolina!';
      } else {
        resultText = 'Compensa utilizar Álcool!';
      }

      busy = false;
      completed = true;
    });
  }

  reset() {
    gasCtrl = new MoneyMaskedTextController();
    alcCtrl = new MoneyMaskedTextController();
    busy = false;
    completed = false;
    color = primaryColor;
  }
}
