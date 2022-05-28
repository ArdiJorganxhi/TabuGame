import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabu',
      theme: ThemeData(

      ),
      home: const MyHomePage(title: 'TABU'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pointsTeam1 = 0;
  int pointsTeam2 = 0;
  late Timer timer;
  int numTimer = 30;
  String teamTurn = "TEAM-1";
  Color teamColor = Colors.green;
  int counterOfWords = 0;
  int counterOfClues = 0;
  String teamStart = "TEAM-1 START";
  bool buttonsState = false;
  bool startstate = true;

  List<String> wordsToBeGuessed = ["SOFTWARE", "OOP", "ENCRYPTION", "OS"];
  List<String> cluesOfWords = ["COMPUTER", "PROGRAMMING", "ANDROID", "APPLICATION", "CODING", "CODE", "INHERITANCE", "ENCAPSULATION", "POLYMORPHISM", "SUPER", "OS", "PRIORITY", "QUEUE", "SCHEDULING", "JOB", "RELATIONSHIP", "TABLE", "TUPLE", "FIELD", "PRIMARY"];



  void increment() {
    setState(() {

      if(teamTurn == "TEAM-1"){
        pointsTeam1++;
      }
      else{
        pointsTeam2++;
      }
    }
    );
  }

  void decrement() {
    setState(() {

      if(teamTurn == "TEAM-1"){
        pointsTeam1--;
      }
      else{
        pointsTeam2--;
      }
    });
  }

  void pass() {
    setState(() {

      if(teamTurn == "TEAM-1"){
        pointsTeam1;
      }
      else{
        pointsTeam2;
      }
    });
  }


  void changeColor(){
    setState(() {

      if(teamTurn == "TEAM-1"){
        teamColor = Colors.green;
      }
      else{
        teamColor = Colors.red;
      }

    });

  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (numTimer == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            numTimer--;
          });
        }
      },
    );
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }







  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor:  Color.fromRGBO(66,148,136,1),
        body: Center(
          child: ChangeNotifierProvider<TimeState>(
            create:(context) => TimeState(),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.only(top: 45),
                  child: Consumer<TimeState>(
                    builder: (context, timeState, _) => ProgressBar(
                      width: 340,
                      value: timeState.time,
                      totalValue: 30,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10,left: 10,top: 20,bottom: 0),
                    child: Container(
                      color:  Color.fromRGBO(51,118,106,1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(7.0), topRight: Radius.circular(7.0)),
                                  child: Container(
                                    color: Colors.green,
                                    height: 30,
                                    width: 73,
                                    child: Center(
                                      child: Text(
                                        '$pointsTeam1',
                                        style: TextStyle(fontSize: 27,color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 20.0,
                                width: 74.5,

                                child: Center(
                                  child: Text(
                                    'TEAM-1:',
                                    style: TextStyle(backgroundColor: Colors.white,fontSize: 20,color: Colors.black),
                                  ),
                                ),
                              ),

                            ],
                          ),

                          Column(
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.all(3.0),
                                child: Icon(
                                  Icons.timer_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Text(
                                      "$numTimer",
                                      style: const TextStyle(color: Colors.white,fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(7.0), topRight: Radius.circular(7.0)),
                                  child: Container(
                                    color: Colors.red,
                                    height: 30,
                                    width: 73,
                                    child: Center(
                                      child: Text(
                                        '$pointsTeam2',
                                        style: TextStyle(fontSize: 27,color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 20.0,
                                width: 74.5,

                                child: Center(
                                  child: Text(
                                    'TEAM-2',
                                    style: TextStyle(backgroundColor: Colors.white,fontSize: 19,color: Colors.black),
                                  ),
                                ),
                              ),

                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 2550,

                      child: Padding(
                        padding:  EdgeInsets.only(top: 45),
                        child: Center(

                          child: Padding(
                            padding: EdgeInsets.only(right: 80,left: 80,top: 30),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                              child: Card(
                                color: teamColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${wordsToBeGuessed[counterOfWords]}',
                                          style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 1250,
                      child: Padding(
                        padding: EdgeInsets.only(top: 120),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: 80,left: 80,bottom: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Card(
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${cluesOfWords[counterOfClues]}',
                                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 0.5,
                                      indent: 32,
                                      endIndent: 32,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${cluesOfWords[counterOfClues+1]}',
                                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 0.5,
                                      indent: 32,
                                      endIndent: 32,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${cluesOfWords[counterOfClues+2]}',
                                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 1,
                                      indent: 32,
                                      endIndent: 32,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${cluesOfWords[counterOfClues+3]}',
                                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 20,
                                      thickness: 0.5,
                                      indent: 32,
                                      endIndent: 32,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          '${cluesOfWords[counterOfClues+4]}',
                                          style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 65,
                        width: 350,
                        child: Consumer<TimeState>(
                          // ignore: deprecated_member_use
                          builder: (context, timeState, _) =>Padding(
                            padding:  EdgeInsets.all(10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), // Image border
                              child: FlatButton(
                                color:  Color.fromRGBO(245,195,68,1),
                                child:  Text(teamStart, style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),),

                                onPressed: ()  {
                                  changeColor();

                                  if(startstate == true) {
                                    startstate = false;
                                    buttonsState = true;
                                    startTimer();

                                    Timer.periodic(Duration(seconds: 1), (timer) async {
                                      if (timeState.time == 0) {
                                        if (teamTurn == "TEAM-1") {
                                          teamTurn = "TEAM-2";
                                          teamStart = "TEAM-2 START";
                                          buttonsState = false;
                                          teamColor = Colors.red;
                                        } else {
                                          teamTurn = "TEAM-1";
                                          teamStart = "TEAM-1 START";
                                          buttonsState = false;
                                          teamColor = Colors.green;
                                        }

                                      }
                                      if (timeState.time == 0) {
                                        timer.cancel();
                                        startstate = true;
                                        timeState.time = 31;
                                        numTimer = 30;
                                      }
                                      timeState.time -= 1;
                                    }
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:  <Widget>[
                      // ignore: deprecated_member_use
                      SizedBox(
                        height: 65,
                        width: 126,
                        // ignore: deprecated_member_use

                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                            child: FlatButton(
                                child:  Text("TABU",
                                  style: TextStyle(color: Colors.white,fontSize: 23),
                                ),
                                color:  Color.fromRGBO(225,81,65,1),
                                onPressed: () {
                                  if(buttonsState == true) {
                                    decrement();
                                    counterOfWords++;
                                    counterOfClues = counterOfClues+5;
                                    if(counterOfWords >= wordsToBeGuessed.length){
                                      counterOfWords = 0;
                                    }
                                    if(counterOfClues >=cluesOfWords.length){
                                      counterOfClues = 0;
                                    }

                                  }
                                }
                            ),
                          ),
                        ),
                      ),

                         SizedBox(
                          height: 65,
                          width: 126,
                          // ignore: deprecated_member_use
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:  ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                            child: FlatButton(
                              child:  const Text("PASS",
                                style: TextStyle(color: Colors.white,fontSize: 23),
                              ),
                              color:  Color.fromRGBO(67,80,175,1),
                              onPressed: () {
                                if(buttonsState == true) {
                                  pass();
                                  counterOfWords++;
                                  counterOfClues = counterOfClues+5;
                                  if(counterOfClues >=20){
                                    counterOfClues = 0;
                                  }
                                  if(counterOfWords >= 4){
                                    counterOfWords = 0;
                                  }


                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      // ignore: deprecated_member_use

                       SizedBox(
                          height: 65,
                          width: 126,
                          // ignore: deprecated_member_use
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                            child: FlatButton(
                              child:  const Text("TRUE",
                                style: TextStyle(color: Colors.white,fontSize: 23),
                              ),
                              color:  const Color.fromRGBO(103,174,91,1),
                              onPressed: () {
                                if(buttonsState == true) {
                                  increment();
                                  counterOfWords++;
                                  counterOfClues = counterOfClues+5;
                                  if(counterOfClues >=cluesOfWords.length){
                                    counterOfClues = 0;
                                  }
                                  if(counterOfWords >= wordsToBeGuessed.length){
                                    counterOfWords = 0;
                                  }

                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ProgressBar extends StatelessWidget{
  final double width;
  final int value;
  final int totalValue;

  // ignore: use_key_in_widget_constructors
  const ProgressBar({
    required this.width,
    required this.value,
    required this.totalValue
  }
      );

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: width,
                  height: 23,
                  decoration: BoxDecoration(color: Color.fromRGBO(51, 118, 106, 1), borderRadius: BorderRadius.circular(5),),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(5),
                child: AnimatedContainer(
                  height: 23,
                  width: width * ratio,
                  duration:  Duration(milliseconds: 1000),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular((5)),
                  ),
                ),

              ),
            ],
          ),
        ]
    );
  }
}

class TimeState with ChangeNotifier{
  int _time = 30;

  int get time => _time;
  set time(int newTime){_time =newTime; notifyListeners();
  }
}