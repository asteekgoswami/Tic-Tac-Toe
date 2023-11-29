// // Import necessary packages
// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import 'package:tictactoe_tutorial/ui/theme/color.dart';
// import 'package:tictactoe_tutorial/utils/game_logic.dart';
// import 'package:tictactoe_tutorial/utils/start.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TicTacToeApp(),
//     );
//   }
// }

// class GameScreen extends StatefulWidget {
//   const GameScreen({Key? key}) : super(key: key);

//   @override
//   _GameScreenState createState() => _GameScreenState();
// }

// class _GameScreenState extends State<GameScreen> {
//   String lastValue = "X";
//   bool gameOver = false;
//   int turn = 0;
//   String result = "";
//   List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
//   Game game = Game();
//   late ConfettiController _confettiController;

//   @override
//   void initState() {
//     super.initState();
//     game.board = Game.initGameBoard();
//     print(game.board);
//     _confettiController = ConfettiController();
//   }

//   // Function to show a dialog when a winner is found
//   void _showWinnerDialog(String winner) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: MainColor.primaryColor,
//           title: Text('$winner Wins!'),
//           content: Text('Congratulations, $winner is the winner!'),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//                 dispose();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double boardWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: MainColor.primaryColor,
//       body: Stack(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               AnimatedSwitcher(
//                 duration: Duration(milliseconds: 500),
//                 child: Text(
//                   "It's ${lastValue} turn".toUpperCase(),
//                   key: Key(lastValue), // Key to identify the Text widget
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 58,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Container(
//                 width: boardWidth,
//                 height: boardWidth,
//                 child: GridView.count(
//                   crossAxisCount: Game.boardlenth ~/ 3,
//                   padding: EdgeInsets.all(16.0),
//                   mainAxisSpacing: 8.0,
//                   crossAxisSpacing: 8.0,
//                   children: List.generate(Game.boardlenth, (index) {
//                     return InkWell(
//                       onTap: gameOver
//                           ? null
//                           : () {
//                               if (game.board![index] == "") {
//                                 setState(() {
//                                   game.board![index] = lastValue;
//                                   turn++;
//                                   gameOver = game.winnerCheck(
//                                       lastValue, index, scoreboard, 3);

//                                   if (gameOver) {
//                                     result = "$lastValue is the Winner";
//                                     _showWinnerDialog(lastValue);
//                                   } else if (!gameOver && turn == 9) {
//                                     result = "It's a Draw!";
//                                     gameOver = true;
//                                     _confettiController.play();
//                                     _showWinnerDialog('Draw');
//                                   }

//                                   if (lastValue == "X")
//                                     lastValue = "O";
//                                   else
//                                     lastValue = "X";
//                                 });
//                               }
//                             },
//                       child: Container(
//                         width: Game.blocSize,
//                         height: Game.blocSize,
//                         decoration: BoxDecoration(
//                           color: MainColor.secondaryColor,
//                           borderRadius: BorderRadius.circular(16.0),
//                         ),
//                         child: Center(
//                           child: Text(
//                             game.board![index],
//                             style: TextStyle(
//                               color: game.board![index] == "X"
//                                   ? Colors.blue
//                                   : Colors.pink,
//                               fontSize: 64.0,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//               SizedBox(
//                 height: 25.0,
//               ),
//               Text(
//                 result,
//                 style: TextStyle(color: Colors.white, fontSize: 21.0),
//               ),
//               SizedBox(
//                 height: 25.0,
//               ),
//               ElevatedButton.icon(
//                 onPressed: () {
//                   setState(() {
//                     game.board = Game.initGameBoard();
//                     lastValue = "X";
//                     gameOver = false;
//                     turn = 0;
//                     result = "";
//                     scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
//                   });
//                 },
//                 icon: Icon(Icons.replay),
//                 label: Text("Repeat the Game", style: TextStyle(fontSize: 20)),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 60.0, vertical: 21.0),
//                 ),
//               ),
//             ],
//           ),
//           ConfettiWidget(
//             confettiController: _confettiController,
//             blastDirection: 1.14,
//             particleDrag: 0.05,
//             emissionFrequency: 0.05,
//             numberOfParticles: 20,
//             gravity: 0.2,
//             shouldLoop: false,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _confettiController.dispose(); // Don't forget to dispose the controller
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:tictactoe_tutorial/ui/theme/color.dart';
import 'package:tictactoe_tutorial/utils/game_logic.dart';
import 'package:tictactoe_tutorial/utils/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicTacToeApp(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0;
  String result = "";
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
  Game game = Game();
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
    _confettiController = ConfettiController();
  }

  // Function to show a dialog when a winner is found
  void _showWinnerDialog(String winner) {
    _confettiController.play();
    Future.delayed(Duration(seconds: 3), () {
      _confettiController.stop(); // Stop confetti after the delay
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MainColor.primaryColor,
          title: Text('$winner Wins!'),
          content: Text('Congratulations, $winner is the winner!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // _confettiController.dispose();
                // dispose();
                // _confettiController.play(); // Start confetti
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Text(
                  "It's ${lastValue} turn".toUpperCase(),
                  key: Key(lastValue), // Key to identify the Text widget
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 58,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: boardWidth,
                height: boardWidth,
                child: GridView.count(
                  crossAxisCount: Game.boardlenth ~/ 3,
                  padding: EdgeInsets.all(16.0),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: List.generate(Game.boardlenth, (index) {
                    return InkWell(
                      onTap: gameOver
                          ? null
                          : () {
                              if (game.board![index] == "") {
                                setState(() {
                                  game.board![index] = lastValue;
                                  turn++;
                                  gameOver = game.winnerCheck(
                                      lastValue, index, scoreboard, 3);

                                  if (gameOver) {
                                    result = "$lastValue is the Winner";
                                    _showWinnerDialog(lastValue);
                                  } else if (!gameOver && turn == 9) {
                                    result = "It's a Draw!";
                                    gameOver = true;
                                    _confettiController.play();
                                    _showWinnerDialog('Draw');
                                  }

                                  if (lastValue == "X")
                                    lastValue = "O";
                                  else
                                    lastValue = "X";
                                });
                              }
                            },
                      child: Container(
                        width: Game.blocSize,
                        height: Game.blocSize,
                        decoration: BoxDecoration(
                          color: MainColor.secondaryColor,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: Text(
                            game.board![index],
                            style: TextStyle(
                              color: game.board![index] == "X"
                                  ? Colors.blue
                                  : Colors.pink,
                              fontSize: 64.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                result,
                style: TextStyle(color: Colors.white, fontSize: 21.0),
              ),
              SizedBox(
                height: 25.0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    game.board = Game.initGameBoard();
                    lastValue = "X";
                    gameOver = false;
                    turn = 0;
                    result = "";
                    scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
                  });
                },
                icon: Icon(Icons.replay),
                label: Text("Repeat the Game", style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 60.0, vertical: 21.0),
                ),
              ),
            ],
          ),
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: 0.14,
            particleDrag: 0.05,
            emissionFrequency: 0.05,
            numberOfParticles: 20,
            gravity: 0.2,
            shouldLoop: false,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose(); // Don't forget to dispose the controller
    super.dispose();
  }
}
