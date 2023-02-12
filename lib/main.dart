import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ChessBoardController controller = ChessBoardController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Chess Game"),
      ),
      body: Center(
        child: ChessBoard(
          controller: controller,
          boardColor: BoardColor.orange,
          boardOrientation: PlayerColor.white,
            onMove: () {
              if (controller.isCheckMate()) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Checkmate"),
                      content: const Text("The game has ended in checkmate"),
                        actions: [
                          IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ]
                    );
                  },
                );
              } else if (controller.isDraw()) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Draw"),
                      content: const Text("The game has ended in a draw"),
                        actions: [
                          IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ]
                    );
                  },
                );
              }
            },
        ),
      ),
    );
  }
}