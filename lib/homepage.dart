import 'dart:async';

import 'package:bombermans/scorescreen.dart';
import 'package:bombermans/coverscreen.dart';
import 'package:bombermans/myball.dart';
import 'package:bombermans/mybricks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

enum direction { up, down, left, right }

class _HomePageState extends State<HomePage> {
  //Player
  double playerX = 0;
  double brickwidth = 0.4;
  int playerScore = 0;

  double enemyX = -0.2;
  int enemyScore = 0;

//ball co-ordinates
  double ballX = 0.0;
  double ballY = 0.0;
  var ballXDirection = direction.down;
  var ballYDirection = direction.left;

  bool gamehasstarted = false;

  void startgame() {
    gamehasstarted = true;
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      // setState(() {
      //   ballY += 0.01;
      // });
      updateDirectiion();

      moveBall();

      if (isPlayerDead()) {
        enemyScore++;
        timer.cancel();
        _showDialog(false);
      }
      if (isEnemyDead()) {
        playerScore++;
        timer.cancel();
        _showDialog(true);
      }
    });
  }

  void updateDirectiion() {
    setState(() {
      if (ballY >= 0.9 && playerX + brickwidth >= ballX && playerX <= ballX) {
        ballYDirection = direction.up;
      } else if (ballY <= -0 / 9) {
        ballYDirection = direction.down;
      }
      if (ballX >= 1) {
        ballXDirection = direction.left;
      } else if (ballX <= -1) {
        ballYDirection = direction.right;
      }
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      gamehasstarted = false;
      ballX = 0;
      ballY = 0;
      playerX = -0.2;
      enemyX = -0.2;
    });
  }

  void _showDialog(bool enemyDied) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
                child: Text(enemyDied ? " Pink Win" : " Purple Win",
                    style: const TextStyle(color: Colors.white))),
            actions: [
              GestureDetector(
                onTap: () {
                  resetGame();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    color:
                        enemyDied ? Colors.pink[800] : Colors.deepPurple[100],
                    child: Text(
                      "Play again",
                      style: TextStyle(
                          color: enemyDied
                              ? Colors.pink[100]
                              : Colors.deepPurple[800]),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  bool isPlayerDead() {
    if (ballY >= 1) {
      return true;
    }
    return false;
  }

  bool isEnemyDead() {
    if (ballY >= 1) {
      return true;
    }
    return false;
  }

  void moveBall() {
    setState(() {
      if (ballYDirection == direction.down) {
        ballY += 0.01;
      } else if (ballYDirection == direction.up) {
        ballY -= 0.01;
      }
      if (ballXDirection == direction.left) {
        ballX -= 0.01;
      } else if (ballXDirection == direction.right) {
        ballX += 0.01;
      }
    });
  }

  void moveLeft() {
    setState(() {
      if (!(playerX - 0.1 <= -1)) {
        playerX -= 0.1;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (!(playerX + brickwidth >= 1)) {
        playerX += 0.1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        }
      },
      child: GestureDetector(
        onTap: () => startgame(),
        onDoubleTap: () {
          startgame();
        },
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
            child: Stack(
              children: [
                CoverScreen(
                  gamehasstarted: gamehasstarted,
                ),
                ScoreScreen(
                  gamehasStarted: gamehasstarted,
                  enemyScore: enemyScore,
                  playerScore: playerScore,
                ),
                //top
                MyBrick(
                  x: enemyX,
                  y: -0.9,
                  brickwidth: brickwidth,
                  thisisenemy: true,
                ),
                //bottom
                MyBrick(
                  x: playerX,
                  y: 0.9,
                  brickwidth: brickwidth,
                  thisisenemy: false,
                ),
                //ball
                MyBall(
                  x: ballX,
                  y: ballY,
                  gamehasStarted: gamehasstarted,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
