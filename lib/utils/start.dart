import 'package:flutter/material.dart';
import 'package:tictactoe_tutorial/main.dart';
import 'package:tictactoe_tutorial/ui/theme/color.dart';

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: TicTacToeStartScreen(),
    );
  }
}

class TicTacToeStartScreen extends StatefulWidget {
  @override
  _TicTacToeStartScreenState createState() => _TicTacToeStartScreenState();
}

class _TicTacToeStartScreenState extends State<TicTacToeStartScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fontSizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _fontSizeAnimation = Tween<double>(
      begin: 21.0,
      end: 39.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.07,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Text(
                  "Let's Play",
                  style: TextStyle(
                    fontSize: _fontSizeAnimation.value,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Image.asset(
              'assets/images/starter.png',
              width: screenWidth * 1,
              height: screenHeight * 0.6,
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30.0), // Adjust the radius as needed
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 66.0,
                    vertical: 21.0), // Adjust the padding as needed
              ),
              child: Text(
                'Start Game',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Text("© Asteek Goswami")
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class TicTacToeGameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe Game'),
      ),
      body: Center(
        child: Text('Tic Tac Toe Game Screen'),
      ),
    );
  }
}
