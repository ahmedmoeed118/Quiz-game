import 'package:flutter/material.dart';
import 'main.dart';
import 'quiz_brain.dart';
import 'question.dart';
QuizPage quizpage = QuizPage();


class result extends StatefulWidget {
  @override
  _resultState createState() => _resultState();
}

class _resultState extends State<result> {

  Widget iconshow(int a){
    if(quizBrain.checkuserselected(a)==true){
      return Icon(
        Icons.check,
        color: Colors.green,
      );

    }
    else{
      return Icon(
        Icons.close,
        color: Colors.red,
      );
    }

  }


  Widget correcticonshow(int a){
    if(quizBrain.correctAnswer(a)==true){
      return Icon(
        Icons.check,
        color: Colors.green,
      );

    }
    else{
      return Icon(
        Icons.close,
        color: Colors.red,
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(

          title: Center(
            child: const Text('Quiz Game',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,

              ),),
          ), backgroundColor: Colors.teal),

      body: Container(
        color: Colors.tealAccent,
       child: SizedBox(

         child: Padding(
           padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
           child: Row(
             children: [
               Column(
                 children: <Widget>[
                   Text("Questions",
                   style: TextStyle(
                     fontSize: 20,
                     color: Colors.black,
                     fontWeight: FontWeight.bold
                   ),),
                   SizedBox(
                     height: 30,
                   ),
                   Text(
                     //quizBrain.getQuestionText(),
                     //getQuestion!,
                     quizBrain.getResult(0).toString(),
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 15.0,
                       color: Colors.black,

                     ),
                   ),
                   SizedBox(
                     height: 30,
                   ),

                   Text(
                     //quizBrain.getQuestionText(),
                     //getQuestion!,
                     quizBrain.getResult(1).toString(),
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 15.0,
                       color: Colors.black,
                     ),
                   ),


                   SizedBox(
                     height: 30,
                   ),

                   Text(
                     //quizBrain.getQuestionText(),
                     //getQuestion!,
                     quizBrain.getResult(2).toString(),
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 15.0,
                       color: Colors.black,
                     ),
                   ),


                   SizedBox(
                     height: 30,
                   ),
                   Text(
                     //quizBrain.getQuestionText(),
                     //getQuestion!,
                     quizBrain.getResult(3).toString(),
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 15.0,
                       color: Colors.black,
                     ),
                   ),


                   SizedBox(
                     height: 30,
                   ),

                   Text(
                     //quizBrain.getQuestionText(),
                     //getQuestion!,
                     quizBrain.getResult(4).toString(),
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 15.0,
                       color: Colors.black,
                     ),
                   ),
                 ],
               ),

SizedBox(
  width: 150,
),

               Column(
                 children: <Widget>[
                   Text("Selected Answers",
                     style: TextStyle(
                         fontSize: 15,
                         color: Colors.black,
                         fontWeight: FontWeight.bold
                     ),),

                   SizedBox(
                     height: 30,
                   ),
                   iconshow(0),
                   SizedBox(
                     height: 30,
                   ),
                   iconshow(1),
                   SizedBox(
                     height: 30,
                   ),
                   iconshow(2),
                   SizedBox(
                     height: 30,
                   ),
                   iconshow(3),
                   SizedBox(
                     height: 30,
                   ),
                   iconshow(4),
                   SizedBox(
                     height: 30,
                   ),

                 ],
               ),


               SizedBox(
                 width: 20,
               ),

               Column(
                 children: <Widget>[
                   Text("Correct Answers",
                     style: TextStyle(
                         fontSize: 15,
                         color: Colors.black,
                         fontWeight: FontWeight.bold
                     ),),

                   SizedBox(
                     height: 30,
                   ),
                   correcticonshow(0),
                   SizedBox(
                     height: 30,
                   ),
                   correcticonshow(1),
                   SizedBox(
                     height: 30,
                   ),
                   correcticonshow(2),
                   SizedBox(
                     height: 30,
                   ),
                   correcticonshow(3),
                   SizedBox(
                     height: 30,
                   ),
                   correcticonshow(4),
                 ],
               ),
             ],
           ),
         ),
       ),
      ),
    );
  }
}
