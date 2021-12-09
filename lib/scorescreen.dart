//
import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final bool gamehasStarted;
  final enemyScore;
  final playerScore;

  ScoreScreen(
      {required this.gamehasStarted, this.enemyScore, this.playerScore});

  @override
  Widget build(BuildContext context) {
    return gamehasStarted
        ? Stack(
            children: [
              Container(
                  alignment: const Alignment(0, 0),
                  child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width / 3,
                    color: Colors.grey[700],
                  )),

              //scores
              Container(
                alignment: const Alignment(0, 0.2),
                child: Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width / 3,
                    color: Colors.grey[700],
                    child: Text(enemyScore.toString(),
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 100))),
              ),
              Container(
                  alignment: const Alignment(0, -0.2),
                  child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width / 3,
                      color: Colors.grey[700],
                      child: Text(playerScore.toString(),
                          style: TextStyle(
                              color: Colors.grey[800], fontSize: 100)))),
            ],
          )
        : Container();
  }
}
