import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Speaking Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

final inputTextController = TextEditingController();
final resultTextController = TextEditingController();

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    inputTextController.addListener(() {});
    resultTextController.addListener(() {});
  }

  @override
  void dispose() {
    inputTextController.dispose();
    resultTextController.dispose();
    super.dispose();
  }

  void playSound(String noteNumber) {
    final player = AudioCache();
    player.play(noteNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5.0),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            enableInteractiveSelection: false,
                            //showCursor: false,
                            //readOnly: true,
                            decoration: InputDecoration.collapsed(
                                hintText: "0",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                )),
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'fonts/Roboto',
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.right,
                            controller: inputTextController,
                            onTap: () => FocusScope.of(context)
                                .requestFocus(new FocusNode()),
                          )),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            showCursor: false,
                            readOnly: true,
                            decoration: InputDecoration.collapsed(
                                hintText: "Result",
                                hintStyle: TextStyle(
                                  fontFamily: 'fonts/Roboto',
                                  color: Colors.black,
                                )),
                            textInputAction: TextInputAction.none,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'fonts/Roboto',
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                            controller: resultTextController,
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    btnAC(
                      'AC',
                      Color(0xffFC4646),
                    ),
                    btnClear(),
                    btn('%', Color(0xFF2196F3), Colors.white, Color(0xff82B1FF),
                        "audios/modulus.mp3"),
                    btn('/', const Color(0xFF2196F3), Colors.white,
                        Color(0xff82B1FF), "audios/divide.mp3"),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    btn('7', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/seven.mp3"),
                    btn('8', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/eight.mp3"),
                    btn('9', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/nine.mp3"),
                    //btnMultiply("X"),
                    btn('*', const Color(0xFF2196F3), Colors.white,
                        Color(0xff82B1FF), "audios/multiply.mp3"),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    btn('4', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/four.mp3"),
                    btn('5', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/five.mp3"),
                    btn('6', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/six.mp3"),
                    btnMinus("-")
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    btn('1', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/one.mp3"),
                    btn('2', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/two.mp3"),
                    btn('3', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/three.mp3"),
                    btn('+', const Color(0xFF2196F3), Colors.white,
                        Color(0xff82B1FF), "audios/plus.mp3"),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    btn('0', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/zero.mp3"),
                    btn('00', Color(0xffE9ECEE), Colors.black, Colors.grey,
                        "audios/double zero.mp3"),
                    btn(
                      '.',
                      Color(0xffE9ECEE),
                      Colors.black,
                      Colors.grey,
                      "audios/decimal.mp3",
                    ),
                    btnEqual("=", Color(0xff43A047)),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ),
    );
  }

//Function for Numbers and Operators
  Widget btn(btntext, Color btnColor, Color txtColor, Color splshColor,
      String noteNumber) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btntext,
          style: TextStyle(
            fontSize: 28.0,
            color: txtColor,
            fontFamily: 'fonts/Roboto',
          ),
        ),
        onPressed: () {
          setState(() {
            inputTextController.text = inputTextController.text + btntext;
            playSound(noteNumber);
          });
        },
        color: btnColor,
        padding: EdgeInsets.all(18.0),
        splashColor: splshColor,
        shape: CircleBorder(),
      ),
    );
  }

//Function for Clear Button
  Widget btnClear() {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Icon(Icons.backspace, size: 35, color: Colors.white),
        onPressed: () {
          inputTextController.text = (inputTextController.text.length > 0)
              ? (inputTextController.text
                  .substring(0, inputTextController.text.length - 1))
              : "";
          playSound("audios/clear.mp3");
        },
        color: const Color(0xFFFC4646),
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.orangeAccent,
        shape: CircleBorder(),
      ),
    );
  }

//Function for All Clear button
  Widget btnAC(btntext, Color btnColor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btntext,
          style: TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              fontFamily: 'fonts/Roboto',
              fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          setState(() {
            inputTextController.text = "";
            resultTextController.text = "";
            playSound("audios/All clear.mp3");
          });
        },
        color: btnColor,
        padding: EdgeInsets.all(18.0),
        splashColor: Colors.orangeAccent,
        shape: CircleBorder(),
      ),
    );
  }

//Function for Equal button
  Widget btnEqual(btntext, Color btnColor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
          onPressed: () {
            Parser p = new Parser();

            ContextModel cm = new ContextModel();
            Expression exp = p.parse(inputTextController.text);
            setState(() {
              inputTextController.text =
                  exp.evaluate(EvaluationType.REAL, cm).toString();
              playSound("audios/equals.mp3");
            });
          },
          color: btnColor,
          padding: EdgeInsets.all(18.0),
          splashColor: Color(0xff69F0AE),
          shape: CircleBorder(),
          child: Text(
            btntext,
            style: TextStyle(fontSize: 28.0, color: Colors.white),
          )),
    );
  }

//Function for Minus button
  Widget btnMinus(btntext) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btntext,
          style: TextStyle(
            fontSize: 38.0,
            color: Colors.white,
            fontFamily: 'fonts/Roboto',
          ),
        ),
        onPressed: () {
          setState(() {
            inputTextController.text = inputTextController.text + btntext;
            playSound("audios/minus.mp3");
          });
        },
        color: Color(0xff2196F3),
        padding: EdgeInsets.all(12.0),
        splashColor: Color(0xff82B1FF),
        shape: CircleBorder(),
      ),
    );
  }
}
