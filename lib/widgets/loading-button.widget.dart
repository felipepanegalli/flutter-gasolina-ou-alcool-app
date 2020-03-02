import 'package:flutter/material.dart';

import '../variables.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var colorInvert = false;
  Function func;
  var text = "";

  LoadingButton({
    @required this.busy,
    @required this.text,
    @required this.colorInvert,
    @required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            margin: EdgeInsets.all(30),
            alignment: Alignment.center,
            height: 60,
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColorLight,
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorInvert
                  ? Theme.of(context).primaryColorDark
                  : Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(
                60,
              ),
            ),
            child: FlatButton(
              child: Text(
                text,
                style: TextStyle(
                  color: !colorInvert
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryColorLight,
                  fontSize: 25,
                  fontFamily: fontBSD,
                ),
              ),
              onPressed: func,
            ),
          );
  }
}
