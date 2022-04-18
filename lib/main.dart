import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int counter = 0;
  int plusCounter = 0;
  int minusCounter = 0;


  void increment() {
    setState(() {
      counter++;
      plusCounter++;
    });
  }

  void increment2() {
    setState(() {
      counter--;
      minusCounter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Plus(plusCounter: plusCounter, counter: counter),
                SizedBox(
                  width: 20,
                ),
                Minus(minusCounter: minusCounter, counter: counter)
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    increment();
                  },
                  child: Text('Plus'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    increment2();
                  },
                  child: Text('Minus'),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Total score: $counter',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}

class Plus extends StatelessWidget {
  const Plus(
      {Key? key, required this.plusCounter, required this.counter})
      : super(key: key);

  final int plusCounter;
  final int counter;


  @override
  Widget build(BuildContext context) {
    return PlusButton(plusCounter: plusCounter, counter: counter);
  }
}


class Minus extends StatelessWidget {
  const Minus(
      {Key? key, required this.minusCounter, required this.counter})
      : super(key: key);

  final int minusCounter;
  final int counter;


  @override
  Widget build(BuildContext context) {
    return MinusButton(minusCounter: minusCounter, counter: counter);
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({Key? key, required this.plusCounter, required this.counter}) : super(key: key);
  final int plusCounter;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Plus point',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '$plusCounter',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        if(counter > 0)
        Text('Your point is $counter. Good job!')
      ],
    );
  }
}

class MinusButton extends StatelessWidget {
  const MinusButton({Key? key, required this.minusCounter, required this.counter}) : super(key: key);

  final int minusCounter;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  'Minus point',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '$minusCounter',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            if(counter<0)
            Text('Your point is $counter. Try harder!!')
          ],
        ),
      ],
    );
  }
}
