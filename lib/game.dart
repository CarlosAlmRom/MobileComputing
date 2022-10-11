import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'main.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.name,
    required this.result,
    required this.lives,
  });

  final String name;
  final bool result;
  final int lives;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            result
                ? Text(
                    '$name has won!\n',
                    style: const TextStyle(
                        fontFamily: 'Silkscreen',
                        fontSize: 65,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                : Text(
                    '$name has lost!\n',
                    style: const TextStyle(
                        fontFamily: 'Silkscreen',
                        fontSize: 65,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
            const Text(
              'your remaining lives:\n',
              style: TextStyle(
                  fontFamily: 'Silkscreen', fontSize: 40, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            heartIcons()
          ],
        ),
      ),
    );
  }

  Widget heartIcons() {
    if (lives == 3) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            SpinKitPumpingHeart(
              color: Colors.red,
              size: 70,
            ),
            SpinKitPumpingHeart(
              color: Colors.red,
              size: 70,
            ),
            SpinKitPumpingHeart(
              color: Colors.red,
              size: 70,
            )
          ]);
    } else if (lives == 2) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            SpinKitPumpingHeart(
              color: Colors.red,
              size: 70,
            ),
            SpinKitPumpingHeart(
              color: Colors.red,
              size: 70,
            )
          ]);
    } else {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            SpinKitPumpingHeart(
              color: Colors.red,
              size: 70,
            )
          ]);
    }
  }
}

class QuestionScreen extends StatelessWidget {
  const QuestionScreen(
      {super.key,
      required this.question,
      required this.answer,
      required this.player});

  final String question;
  final String answer;
  final bool player; //true player get question and answer

  @override
  Widget build(BuildContext context) {
    //int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
    CountdownController countdownController =
        CountdownController(duration: Duration(minutes: 1), onEnd: onEnd);
    countdownController.start();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            player
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$question ---------------',
                        style: const TextStyle(
                            fontFamily: 'Silkscreen',
                            fontSize: 40,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        answer,
                        style: const TextStyle(
                            fontFamily: 'Silkscreen',
                            fontSize: 40,
                            color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        'you are the choosen one!',
                        style: TextStyle(
                            fontFamily: 'Silkscreen',
                            fontSize: 50,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
            Container(
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(30.0),
              //color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 6.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Countdown(countdownController: countdownController),
            ),
            player
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Pass!',
                          style: TextStyle(
                              fontFamily: 'Silkscreen',
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Fail!',
                          style: TextStyle(
                              fontFamily: 'Silkscreen',
                              fontSize: 25,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                : Row(),
          ],
        ),
      ),
    );
  }

  void onEnd() {
    print('works');
  }
}

class EndOfGame extends StatelessWidget {
  const EndOfGame({super.key, required this.name, required this.result});

  final String name;
  final bool result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            result
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        const Text(
                          'congrats!\n',
                          style: TextStyle(
                              fontFamily: 'Silkscreen',
                              fontSize: 60,
                              color: Colors.yellowAccent),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '$name, you have won the game!!!!\n\n',
                          style: const TextStyle(
                              fontFamily: 'Silkscreen',
                              fontSize: 40,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ])
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        const Text(
                          'game over\n',
                          style: TextStyle(
                              fontFamily: 'Silkscreen',
                              fontSize: 65,
                              color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '$name you have lost all your lives!!\n\n',
                          style: const TextStyle(
                              fontFamily: 'Silkscreen',
                              fontSize: 40,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ]),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                side: const BorderSide(color: Colors.white, width: 2),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainMenu()));
              },
              child: const Text(
                'Quit game',
                style: TextStyle(
                    fontFamily: 'Silkscreen',
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
