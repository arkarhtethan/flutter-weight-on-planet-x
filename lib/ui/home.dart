import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*
  Mercury: 0.38
Venus: 0.91
Earth: 1.00
Mars: 0.38
Jupiter: 2.34
Saturn: 1.06
Uranus: 0.92
Neptune: 1.19
Pluto: 0.06

  */
  int radioValue = 0;
  final TextEditingController _weight_controller = new TextEditingController();
  double _finalResult = 0.0;
  String _formattedText = "";

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weight_controller.text, 0.06);
          _formattedText =
              "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weight_controller.text, 0.38);
          _formattedText =
              "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weight_controller.text, 0.91);
          _formattedText =
              "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X."),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: new EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png', height: 133, width: 200),
            new Container(
              margin: new EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weight_controller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Your Weight on Earth',
                        hintText: 'In Pounds',
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          value: 0,
                          activeColor: Colors.brown,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text("Pluto",
                          style: new TextStyle(color: Colors.white30)),
                      new Radio<int>(
                          value: 1,
                          activeColor: Colors.red,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text("Mars",
                          style: new TextStyle(color: Colors.white30)),
                      new Radio<int>(
                          value: 2,
                          groupValue: radioValue,
                          activeColor: Colors.orange,
                          onChanged: handleRadioValueChanged),
                      new Text("Venus",
                          style: new TextStyle(color: Colors.white30)),
                    ],
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(15.0),
                  ),
                  new Text(
                    _weight_controller.text.isEmpty?"Please Weight.":"$_formattedText lbs",
                      style: new TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    }
    return int.parse("180") * 0.38;
  }
}
