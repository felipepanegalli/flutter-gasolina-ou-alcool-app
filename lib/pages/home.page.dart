import 'package:alcool_ou_gasolina/blocs/calculate.bloc.dart';
import 'package:alcool_ou_gasolina/widgets/info.widget.dart';
import 'package:alcool_ou_gasolina/widgets/logo.widget.dart';
import 'package:alcool_ou_gasolina/widgets/submit-form.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new CalculateBloc();

  @override
  Widget build(BuildContext context) {
    bloc.primaryColorLight = Theme.of(context).primaryColorLight;
    bloc.primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1200),
        color: bloc.color,
        child: ListView(
          children: <Widget>[
            Logo(),
            bloc.completed
                ? Info(
                    resultText: bloc.resultText,
                    reset: () {
                      setState(() {
                        bloc.reset();
                      });
                    })
                : SubmitForm(
                    gasCtrl: bloc.gasCtrl,
                    alcCtrl: bloc.alcCtrl,
                    busy: bloc.busy,
                    submitFunc: () {
                      setState(() {
                        bloc.calculate();
                      });
                    }),
          ],
        ),
      ),
    );
  }
}
