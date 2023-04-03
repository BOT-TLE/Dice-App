// import 'package:flutter/material.dart';
// import 'dart:math';
//
// void main() {
//   return runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.red,
//         appBar: AppBar(
//           title: Text('Dicee'),
//           backgroundColor: Colors.red,
//         ),
//         body: DicePage(),
//       ),
//     ),
//   );
// }
//
// class DicePage extends StatefulWidget {
//   @override
//   State<DicePage> createState() => _DicePageState();
// }
//
// class _DicePageState extends State<DicePage> {
//   int leftside = 1;
//   int rightside = 1;
//   void ChangeFace() {
//     setState(() {
//       leftside = Random().nextInt(6) + 1;
//       rightside = Random().nextInt(6) + 1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         children: [
//           Expanded(
//             child: TextButton(
//               onPressed: () {
//                 ChangeFace();
//               },
//               child: Image.asset('images/dice$leftside.png'),
//             ),
//           ),
//           Expanded(
//             child: TextButton(
//               onPressed: () {
//                 ChangeFace();
//               },
//               child: Image.asset('images/dice$rightside.png'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(DiceApp());

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice App',
      home: Scaffold(
        backgroundColor: Color(0xFF1B262C),
        appBar: AppBar(
          title: Text('Dice App'),
          backgroundColor: Color(0xFF0F4C75),
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Dice(
              diceNumber: leftDiceNumber,
              onPressed: () {
                rollDice();
              },
            ),
            Dice(
              diceNumber: rightDiceNumber,
              onPressed: () {
                rollDice();
              },
            ),
          ],
        ),
        SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: () {
            rollDice();
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF3282B8),
          ),
          icon: Icon(Icons.casino, color: Colors.white),
          label: Text(
            'ROLL DICE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Dice extends StatelessWidget {
  final int diceNumber;
  final VoidCallback onPressed;

  const Dice({Key key, this.diceNumber, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        'images/dice$diceNumber.png',
        width: 120,
        height: 120,
      ),
    );
  }
}
