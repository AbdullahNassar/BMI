import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _userData {
  String age = "";
  String height = "";
  String weight = "";
}

double calculate(String age, String height, String weight){
  if (double.parse(age).toString().isNotEmpty && double.parse(height).toString().isNotEmpty && double.parse(weight).toString().isNotEmpty) {
    return (double.parse(weight) / (((double.parse(height) * 12) * (double.parse(height))) * 12))*703;
  }
}

class _HomeState extends State<Home> {
  String _formattedText = "";
  String _statusText = "";
  double _result = 0.0;
  _userData _data = new _userData();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          new Image.asset('images/bmilogo.png', width: 110, height: 72),
          new Container(
            margin: const EdgeInsets.all(5.0),
            alignment: Alignment.center,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "Please Enter Age";
                    }else{
                      _data.age = value;
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "Age",
                      icon: new Icon(Icons.person_outline)
                  ),
                ),
                new TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "Please Enter Height";
                    }else{
                      _data.height = value;
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: "Height in feet",
                      hintText: "Height in feet",
                      icon: new Icon(Icons.show_chart)
                  ),
                ),
                new TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return "Please Enter Weight";
                    }else{
                      _data.weight = value;
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: "Weight in lb",
                      hintText: "Weight in lb",
                      icon: new Icon(Icons.line_style)
                  ),
                ),
                new Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: new RaisedButton(
                      child: Text("Calculate"),
                      textColor: Colors.white,
                      color: Colors.pinkAccent.shade700,
                      onPressed: () {
                        if(_formKey.currentState.validate()){
                          setState(() {
                            _data.age = _data.age; 
                            _data.height = _data.height; 
                            _data.weight = _data.weight; 
                            _result = calculate(_data.age, _data.height, _data.weight);
                            _formattedText = "Your BMI is ${_result.toStringAsFixed(1)}";
                            if(_result < 18.5){
                              _statusText = "Underweight";
                            }else if(25 > _result && _result >= 18.5 ){
                              _statusText = "Great Shape";
                            }else if(30 > _result && _result >= 25 ){
                              _statusText = "Overweight";
                            }else if(_result > 30 ){
                              _statusText = "Warning";
                            }else if(_result < 0 ){
                              _statusText = "";
                            }
                          });
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Center(
                    child: _data.age.isEmpty | _data.height.isEmpty | _data.weight.isEmpty ? Text("") : Text(
                      _formattedText,
                      style: TextStyle(
                        color: Colors.blueAccent.shade700,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Center(
                    child: Text(
                      _statusText,
                      style: TextStyle(
                        color: Colors.pinkAccent.shade700,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
