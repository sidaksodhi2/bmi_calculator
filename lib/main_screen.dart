import 'package:bmi/data_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'container_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activecolor = Color(0xff483C32);
const inactivecolor = Color(0xffFFECD1);

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  Color maleboxcolor = activecolor;
  Color femaleboxcolor = inactivecolor;
  int height = 180;
  int weight = 20;
  int age = 25;
  String res = "";
  String resdetail = "Result here";
  double bmi = 0;
  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleboxcolor == inactivecolor) {
        maleboxcolor = activecolor;
        femaleboxcolor = inactivecolor;
      } else {
        maleboxcolor = inactivecolor;
        femaleboxcolor = activecolor;
      }
    } else {
      if (femaleboxcolor == inactivecolor) {
        femaleboxcolor = activecolor;
        maleboxcolor = inactivecolor;
      } else {
        femaleboxcolor = inactivecolor;
        maleboxcolor = activecolor;
      }
    }
  }

  double calcbnmi(int height, int weight) {
    double bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  String getadvice(double bmi) {
    if (bmi >= 25.0) {
      return 'You have a more than normal body weight..\nTry to do more Exercises!!';
    } else if (bmi > 18.5) {
      return 'You have a normal weight.. \nTry to maintain it';
    } else {
      return 'You have a lower than normal body weight..\nTry to eat more';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff141413),
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(1);
                      });
                    },
                    child: ContainerBox(
                      boxColor: maleboxcolor,
                      childwidget: DataContainer(
                        icon: FontAwesomeIcons.male,
                        title: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(2);
                      });
                    },
                    child: ContainerBox(
                      boxColor: femaleboxcolor,
                      childwidget: DataContainer(
                        icon: FontAwesomeIcons.female,
                        title: 'FEMALE',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ContainerBox(
              boxColor: inactivecolor,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: text1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: text2,
                      ),
                      Text(
                        'cm',
                        style: text1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activecolor,
                    inactiveColor: inactivecolor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ContainerBox(
                  boxColor: inactivecolor,
                  childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: text1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            weight.toString(),
                            style: text2,
                          ),
                          Text(
                            'kg',
                            style: text1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: activecolor,
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                            backgroundColor: activecolor,
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ContainerBox(
                  boxColor: inactivecolor,
                  childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: text1,
                      ),
                      Text(
                        age.toString(),
                        style: text2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (age < 100) {
                                  age++;
                                }
                              });
                            },
                            backgroundColor: activecolor,
                            child: Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                            backgroundColor: activecolor,
                            child: Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          GestureDetector(
            onTap: () {
              setState(() {
                bmi = calcbnmi(height, weight);
                res = bmi.toStringAsFixed(1);
                resdetail = getadvice(bmi);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: inactivecolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          color: inactivecolor,
                          height: 300.0,
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Your BMI',
                                style: text1,
                              ),
                              Text(
                                res,
                                style: text2,
                              ),
                              Text(
                                resdetail,
                                style: text3,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              });
            },
            child: Container(
              child: Center(
                child: Text(
                  'Calculate',
                  style: text3,
                ),
              ),
              width: double.infinity,
              height: 80.0,
              color: activecolor,
              margin: EdgeInsets.only(top: 10.0),
            ),
          )
        ],
      ),
    );
  }
}
