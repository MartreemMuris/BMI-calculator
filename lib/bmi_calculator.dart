import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/bmi_result.dart';

bool isMale = true;
double height = 120;
int weight = 45;
int age = 18;

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: const Icon(
          Icons.menu_rounded,
        ),
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMale ? Colors.blue : Colors.grey[800],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: NetworkImage(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/Male_symbol_%28fixed_width%29.svg/1200px-Male_symbol_%28fixed_width%29.svg.png'),
                              width: 100,
                              height: 90,
                              color: Colors.white,
                            ),
                            Text(
                              'male',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: !isMale ? Colors.blue : Colors.grey[800],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(
                              image: NetworkImage(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Venus_symbol_%28fixed_width%29.svg/220px-Venus_symbol_%28fixed_width%29.svg.png'),
                              width: 100,
                              height: 90,
                              color: Colors.white,
                            ),
                            Text(
                              'female',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "${height.round()}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 230,
                      min: 70,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: getPlusMinusContainer('AGE'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: getPlusMinusContainer('WEIGHT'),
                ),
              ],
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiResult(
                      isMale: isMale,
                      height: height,
                      weight: weight,
                      age: age,
                    ),
                  ),
                );
              },
              child: const Text(
                'CALCULATE YOUR BMI',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }

  getPlusMinusContainer(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[800], borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 25,
            ),
          ),
          Text(
            title == 'AGE' ? '$age' : '$weight',
            style: const TextStyle(
                color: Colors.green, fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    title == 'AGE' ? age++ : weight++;
                  });
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    title == 'AGE' ? age-- : weight--;
                  });
                },
                child: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
