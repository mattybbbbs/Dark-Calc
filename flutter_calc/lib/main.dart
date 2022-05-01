import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

var userInput = '';
    var answer = '';


    //Button Array
    final List<String> buttons = [
      'C',
      '+/-',
      '%',
      '/',
      '7',
      '8',
      '9',
      'x',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '0',
      '.',
      '',
      
      '='
    ];  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(22, 24, 41, 1.0),
      body: Column(
        children: <Widget> [
          Expanded(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: Text(
                      answer,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                      ),
                    ),
              
                
              ],
            ),
          )),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4), 
                  itemBuilder: (BuildContext context, int index) {
                    //Clear
                    if (index == 0) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Color.fromRGBO(30, 29, 51, 1.0),
                        textColor: Color.fromRGBO(104, 89, 232, 1.0),

                      );
                    }
                    // +/- button
                    else if (index == 1) {
                      return MyButton(
                        buttonText: buttons[index],
                        color: Color.fromRGBO(30, 29, 51, 1.0),
                        textColor: Color.fromRGBO(104, 89, 232, 1.0),
                      );
                    }
                    // % Button
                    else if (index == 2) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: Color.fromRGBO(30, 29, 51, 1.0),
                        textColor: Color.fromRGBO(104, 89, 232, 1.0),
                      );
                    }
                    // Delete Button
                    // else if (index == 3) {
                    //   return MyButton(
                    //     buttontapped: () {
                    //       setState(() {
                    //         userInput =
                    //             userInput.substring(0, userInput.length - 1);
                    //       });
                    //     },
                    //     buttonText: buttons[index],
                    //     color: Color.fromRGBO(30, 29, 51, 1.0),
                    //     textColor: Color.fromRGBO(104, 89, 232, 1.0),
                    //   );
                    // }
                    // Equal_to Button
                    else if (index == 19) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Color.fromRGBO(228, 84, 184, 1.0),
                        textColor: Color.fromRGBO(30, 29, 51, 1.0),
                      );
                    }
 
                    //  other buttons
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Color.fromRGBO(104, 89, 232, 1.0)
                            : Color.fromRGBO(30, 29, 51, 1.0),
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.white,
                      );
                    }
                  }),
            ))
        ],
      ),
    );

  
  }

bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
 
// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');
 
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }

}


