import 'package:flutter/material.dart';
 
// creating Stateless Widget for buttons
class MyButton extends StatelessWidget {
   
  // declaring variables
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;
 
  //Constructor
  MyButton({this.color, this.textColor, required this.buttonText, this.buttontapped});
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          
          child: Container(
          
                
               
                
                
                

              

             

              
            color: color,
            child: Center(
              // child: Card(
              //   color: Color.fromRGBO(30, 29, 51, 1.0),
              //   margin: EdgeInsets.all(5.0),
              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              //   elevation: 5,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}