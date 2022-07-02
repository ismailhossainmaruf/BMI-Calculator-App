import 'dart:ui';

import 'package:bmicalculator_day22/calculatio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenUi extends StatefulWidget {
  const ScreenUi({Key? key}) : super(key: key);

  @override
  State<ScreenUi> createState() => _ScreenUiState();
}

class _ScreenUiState extends State<ScreenUi> {
  bool isMale = true;
  int weight = 60;
  int age = 20;
  double height = 90;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff310952),
      appBar: AppBar(
        //backgroundColor: Color(0xffc67eb6),
        backgroundColor: Color(0xff5b0690),
        title: Text("BMI Calculator"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(onPressed: (){
            showDialog(
              barrierColor: Colors.black54,
              context: context,
              builder: (context) => new AlertDialog(
                title: new Text('BMI Chart by (WHO)',
                textAlign: TextAlign.center,),
                content: Text("Less than 15	Very severely underweight\n"
                    "Between 15 and 16	Severely underweight\n"
                    "Between 16 and 18.5	Underweight\n"
                    "Between 18.5 and 25	Normal (healthy weight)\n"
                    "Between 25 and 30	Overweight\n"
                    "Between 30 and 35	Moderately obese\n"
                    "Between 35 and 40	Severely obese",
                    style: TextStyle(color: Color(0xff090510),
                    fontSize: 18)),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pop(); // dismisses only the dialog and returns nothing
                    },
                    child: new Text('OK'),
                  ),
                ],
              ),
            );
          }, icon: Icon(Icons.details_outlined))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isMale == true
                                  ? Colors.teal
                                  : Color(0xff4C4E5F),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.male,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (() {
                            setState(() {
                              isMale = false;
                            });
                          }),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isMale == false
                                    ? Colors.teal
                                    : Color(0xff4C4E5F)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.female,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 8,),
            Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${height.toStringAsFixed(0)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "cm",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 17.0),
                            thumbColor: Color(0xffb90933),
                            activeTrackColor: Colors.white70,
                            inactiveTrackColor: Colors.blueGrey[800]),
                        child: Slider(
                          min: 50,
                          max: 250,
                          value: height,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(height: 8,),
            Expanded(
                flex: 3,
                child: Container(
                  height: double.infinity,
                  color: Colors.blueGrey[600],
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueGrey[600]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                "$weight",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white70),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      if (age > 0) {
                                        setState(() {
                                          weight--;
                                        });
                                      }
                                    },
                                    child: Icon(Icons.remove),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white70,
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    child: Icon(Icons.add),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white70,
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.teal),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                "$age",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white70),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      if (age > 0) {
                                        setState(() {
                                          age--;
                                        });
                                      }
                                    },
                                    child: Icon(Icons.remove),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white70,
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    child: Icon(Icons.add),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white70,
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: 8,),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  final cal =
                      Bmicalculation(age: age, height: height, weight: weight);
                  bmi = cal.getResult();

                  showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                      title: new Text('Your BMI is ${bmi.toStringAsFixed(0)}'
                          "\n and Gender :${isMale == true ? "Male" : "Female"}"),
                      content: Text(
                          bmi > 25
                              ? 'You are OverWeight'
                              : bmi > 18
                                  ? "You health condition is good"
                                  : "You are Underweight",
                          style: TextStyle(color: Colors.green)),
                      actions: <Widget>[
                        new FlatButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop(); // dismisses only the dialog and returns nothing
                          },
                          child: new Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  color: Color(0xff55031f),
                  alignment: Alignment.center,
                  child: Text("Calculate",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  var bmi;
}
