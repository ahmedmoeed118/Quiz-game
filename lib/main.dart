import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
import 'result.dart';

QuizBrain quizBrain = QuizBrain();
int correct=0;
int wrong=0;
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
         Container(
          color: Colors.tealAccent,

            child: start(),

        ),

    );
  }
}
class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);


  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  // var to store
// onChanged callback
  final fieldText = TextEditingController();
  String   questionText="";
  bool  questionAnswer=true;
  int c=0;
  int a=1;
  String error="";
  int number=1;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar:  AppBar(

                title: Center(
                  child: const Text('Quiz Game',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,

                    ),),
                ), backgroundColor: Colors.teal),
            body:
               Container(
                  color: Colors.tealAccent,

                  child:Center(
                    child: Column(


                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Container(

                            height: 30,

                            child: Text("Enter your 5 Questions",textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,



                                fontSize: 20),),),

                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: 300,

                              child: Column(
                                children: [
                                  Text('$error',
                                  style:TextStyle(
                                    color: Colors.red,

                                    fontWeight: FontWeight.bold,

                                  )
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  TextField(



                                    controller:  fieldText,
                                    decoration: InputDecoration(
                                      hintText: "Question number #$number ",
                                      border: OutlineInputBorder(),



                                    ),


                                  ),
                                ],
                              ),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: SizedBox(
                              height:50, //height of button
                              width:200, //width of button
                              child: ElevatedButton(


                                  onPressed: (){

                                    if (fieldText.text.isNotEmpty) {
                                      setState(() {
                                        error='';
                                        number=number+1;
                                      });
                                      questionAnswer=true;
                                      questionText=fieldText.text;
                                      quizBrain.insertquestion(questionText,questionAnswer);
                                      fieldText.clear();
                                      c++;
                                      if(c==5){
                                        Alert(
                                          context: context,
                                          title: 'Success!',
                                          desc: 'You\'ve enterd five question?',
                                        ).show();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  QuizPage()),
                                        );

                                      }
                                    } else {
                                      setState(() {
                                        error='Please Enter a Question';
                                      });

                                    }





                                  },

                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(8),

                                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                                  child: const Text('True')),
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: SizedBox(
                              height:50, //height of button
                              width:200, //width of button
                              child: ElevatedButton(


                                  onPressed: () {
                                    if (fieldText.text.isNotEmpty) {
                                      setState(() {
                                        error='';
                                        number=number+1;
                                      });
    questionAnswer=false;
    questionText=fieldText.text;
    quizBrain.insertquestion(questionText,questionAnswer);
    fieldText.clear();
    c++;
    if(c==5){
    Alert(
    context: context,
    title: 'Success!',
    desc: 'You\'ve enterd five question?',
    ).show();
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  QuizPage()),
    );

    }



                                    } else {
                                      setState(() {
                                        error='Please Enter a Question';
                                      });
                                    }
                                  }
    ,

                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(8),

                                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                                  child: const Text('False')),
                            ),
                          ),






                        ]),
                  )
              ),

        )
    );


  }
}




class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
int count=0;

  void checkAnswer(bool userPickedAnswer) {
    bool? correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (count >= 5) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => result()));
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          count++;
          quizBrain.userselected(true);
          correct++;
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          count++;
          quizBrain.userselected(false);
          wrong++;
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [



                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Quiz Game',
                    style: TextStyle(color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
              backgroundColor: Colors.teal, //<-- SEE HERE

            ),
            body: Container(
              color: Colors.tealAccent,
              child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(

                      child:Column(


                          children: [
                            SizedBox(
                              height: 40,
                            ),

                            Container(


                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children:[

                                  Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Center(
                                      child: Text(
                                        //quizBrain.getQuestionText(),
                                        //getQuestion!,
                                        quizBrain.getQuestionText().toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height:50, //height of button
                                    width:200,
                                    child: TextButton(
                                      style: TextButton.styleFrom(

                                        backgroundColor: Colors.green, // Background Color
                                      ),
                                      child: Text(
                                        'True',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        quizBrain.getQuestionText().toString();
                                        //The user picked true.
                                        checkAnswer(true);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  SizedBox(
                                    height:50, //height of button
                                    width:200,
                                    child: TextButton(
                                      style: TextButton.styleFrom(

                                        backgroundColor: Colors.red, // Background Color
                                      ),
                                      child: Text(
                                        'False',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        quizBrain.getQuestionText().toString();
                                        //The user picked false.
                                        checkAnswer(false);
                                      },
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 245, 0, 0),
                                    child: SizedBox(
                                      height: 50,
                                      child: Container(
                                        color: Colors.teal,
                                        child: Row(
                                          children: scoreKeeper,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]
                      )
                  )
              ),
            )
        )
    );
  }
}

