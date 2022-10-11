//imports: numberpicker, flutter_spinkit

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'selection.dart';
import 'game.dart';
//import 'pruebas.dart';
//Remember countdown.dart from numberpicker is modify

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hold Onjoy',
        theme: ThemeData(
            fontFamily: 'Silkscreen', scaffoldBackgroundColor: Colors.black),
        //home: const MainMenu(),
        //home: const WaitingMenu(),
        //home: const GameScreen
        //home: const ResultScreen(name: 'Carlos', result: false, lives: 2),
        //home: const EndOfGame(name: 'Carlos', result: true),
        home: const QuestionScreen(
          question: 'Are you coding in flutter?',
          answer: 'Yes',
          player: true,
        ));
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});
  @override
  State<MainMenu> createState() => _MainMenu();
}

class _MainMenu extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text(
              'HOLD\nONJOY',
              style: TextStyle(
                  fontFamily: 'Silkscreen', fontSize: 85, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: const BorderSide(color: Colors.white, width: 2),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateParty()));
                  },
                  child: const Text(
                    'CREATE PARTY',
                    style: TextStyle(
                        fontFamily: 'Silkscreen',
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
                const Text(
                  '\n\n',
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    side: const BorderSide(color: Colors.white, width: 2),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JoinParty()));
                  },
                  child: const Text(
                    'JOIN PARTY',
                    style: TextStyle(
                        fontFamily: 'Silkscreen',
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JoinParty extends StatelessWidget {
  const JoinParty({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // 1
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (!isKeyboard)
              const Text(
                'JOIN\nPARTY',
                style: TextStyle(
                    fontFamily: 'Silkscreen',
                    fontSize: 85,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _textField('User Name'),
                _textField('Party Name'),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                side: const BorderSide(color: Colors.white, width: 2),
              ),
              onPressed: () {},
              child: const Text(
                'Join!',
                style: TextStyle(
                    fontFamily: 'Silkscreen',
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            const Text('\n\n'),
          ],
        ),
      ),
    );
  }
}

class CreateParty extends StatelessWidget {
  const CreateParty({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    int currentValue = 4;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // 1
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (!isKeyboard)
              const Text(
                'CREATE\nPARTY',
                style: TextStyle(
                    fontFamily: 'Silkscreen',
                    fontSize: 85,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _textField('User Name'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text('Number of Players',
                        style: TextStyle(
                            fontFamily: 'Silkscreen', color: Colors.white)),
                    NumberPicker(
                        axis: Axis.horizontal,
                        textStyle: const TextStyle(
                            fontFamily: 'Silkscreen', color: Colors.grey),
                        selectedTextStyle: const TextStyle(
                            fontFamily: 'Silkscreen',
                            color: Colors.white,
                            fontSize: 25),
                        itemCount: 3,
                        minValue: 3,
                        maxValue: 12,
                        itemWidth: 60,
                        value: currentValue,
                        onChanged: ((value) {
                          currentValue = value;
                        })),
                  ],
                ),
                _textField('Party Name'),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                side: const BorderSide(color: Colors.white, width: 2),
              ),
              onPressed: () {},
              child: const Text(
                'Create!',
                style: TextStyle(
                    fontFamily: 'Silkscreen',
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            const Text('\n\n'),
          ],
        ),
      ),
    );
  }
}

Widget _textField(tag) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: TextField(
      maxLength: 20,
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: tag,
        labelStyle: const TextStyle(
            fontFamily: 'Silkscreen', color: Color.fromARGB(255, 37, 30, 30)),
      ),
      style: const TextStyle(fontFamily: 'Silkscreen', color: Colors.black),
    ),
  );
}
