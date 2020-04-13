import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: new Color(0xff622F74),
        accentColor: Colors.orange,
      ),
      home: new SplashScreen(title: "Calculator"),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key ,this.title}) : super(key: key);

  final String title;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String output="0";

  String _output="0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String text ="";

  buttonPressed(String buttonText){
    if(buttonText == "CLEAR"){
      _output="0";
       num1 = 0.0;
       num2 = 0.0;
       operand = "";
       text = "";
    }
    else if(buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "x"){
      text = text+output;
      text = text+buttonText;
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    }
    else if(buttonText == "."){
    if(_output.contains(".")){
      print("Already contains a decimal.");
      return;
    }
    else{
       text = text+buttonText;
      _output = _output + buttonText;
    }
    }
    else if (buttonText == "="){
      text = text+output;
      num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1+num2).toString();
      }
      if(operand == "x"){
        _output = (num1*num2).toString();
      }
      if(operand == "/"){
        _output = (num1/num2).toString();
      }
      if(operand == "-"){
        _output = (num1-num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else{
      _output = _output+buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
  Widget buildButton(String buttonText){
    return new Expanded(
        child: new FlatButton(
          padding: new  EdgeInsets.all(20),
          child: new Text(buttonText,style: GoogleFonts.economica(color: Colors.white ,fontSize: 24.0,fontWeight: FontWeight.normal),),
          onPressed: (){
            buttonPressed(buttonText);
          },
        ),
    );
  }
  Widget buildButtonEqual(String buttonText){
    return new Expanded(
      child: new FlatButton(
        padding: new  EdgeInsets.all(20),
        child: new Text(buttonText,style: GoogleFonts.economica(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.normal),),
        onPressed: (){
          buttonPressed(buttonText);
        },
      ),
    );
  }
  Widget buildButtonClear(String buttonText){
    return new Expanded(
      child: new FlatButton(
        padding: new  EdgeInsets.all(20),
        child: new Text(buttonText,style: GoogleFonts.economica(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.normal),),
        onPressed: (){
          buttonPressed(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(widget.title,style: GoogleFonts.amaticaSC(color: Colors.white),),),backgroundColor: Colors.purple,),
      body: Stack(
        fit: StackFit.expand,
      children:<Widget>[
       new Container(
         decoration: BoxDecoration(
           color: new Color(0xff622F24),
           gradient: LinearGradient(
             colors:[new  Color(0xff6094e8),new Color(0xffde5cbc)],
             begin: Alignment.centerRight,
             end: Alignment.centerLeft,
           ),
         ),
       ),
      new Container(
        child: new Column(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding: new EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0,
                ),
            child: Container(
              child: ListTile(
                title: new Text(text,textAlign: TextAlign.right,style: GoogleFonts.economica(fontSize: 48.0,color: Colors.white),),
                subtitle: new Text(output,textAlign: TextAlign.right,style: GoogleFonts.economica(fontSize: 48.0,color: Colors.white70,),),
              )
             ),
            ),
            new Expanded(child: new Divider(),),
            Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("x"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButton("."),
                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    buildButtonClear("CLEAR"),
                    buildButtonEqual("="),
                  ],
                ),
             ],
            ),
          ],
        ),
      ),],),
    );
  }
}

