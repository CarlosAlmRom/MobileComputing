import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WaitingMenu extends StatelessWidget {
  const WaitingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'waiting for the rest of the players \n',
              style: TextStyle(
                  fontFamily: 'Silkscreen', fontSize: 65, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SpinKitSpinningLines(
              color: Colors.white,
              size: 140,
            )
          ],
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreen();
}

class _GameScreen extends State<GameScreen> {
  bool _touching = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GestureDetector(
          //onTap: () => print('Tapped!'), //Print when you tap up the finger
          //onTapDown: (TapDownDetails details) => _onTapDown(details),

          onPanStart: (DragStartDetails details) {
            setState(() {
              _touching = false;
              print('First tap');
              //print(details.localPosition);
              //_onTapDown(details);
            });
          },
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              _touching = false;
              print('Moving');
              //print(details.localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) {
            setState(() {
              print('Last tap');
              _touching = true;
            });
          },
          child: _touching
              ? const Center(
                  child: Text(
                    '\n\n\nTab the screen to play!\n\n\n\n',
                    style: TextStyle(
                      fontFamily: 'Silkscreen',
                      fontSize: 65,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : null,
        )
      ]),
    );
  }

  Widget _onTapDown(DragStartDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;

    print(details.localPosition);
    return Positioned(
      left: x,
      top: y,
      child: SpinKitRipple(
        color: Colors.white,
        size: 140,
      ),
    );
  }
}
