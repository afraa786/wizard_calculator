import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = "";
  String secretMessage = "";

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        displayText = "";
        secretMessage = "";
      } else if (value == "=") {
        try {
          double result = double.parse(displayText);
          displayText = result.toString();
          if (result == 12345) {
            secretMessage = "🧙 You've unlocked the magic!";
          } else {
            secretMessage = "";
          }
        } catch (e) {
          displayText = "Error";
        }
      } else {
        displayText += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enchanting Calculator ✨"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  displayText,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                if (secretMessage.isNotEmpty)
                  Text(
                    secretMessage,
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
              ],
            ),
          ),
          Expanded(child: Divider()),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ["7", "8", "9", "C"]
                    .map((value) => CalculatorButton(
                          text: value,
                          onTap: () => buttonPressed(value),
                        ))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ["4", "5", "6", "+"]
                    .map((value) => CalculatorButton(
                          text: value,
                          onTap: () => buttonPressed(value),
                        ))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ["1", "2", "3", "-"]
                    .map((value) => CalculatorButton(
                          text: value,
                          onTap: () => buttonPressed(value),
                        ))
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ["0", ".", "=", "*"]
                    .map((value) => CalculatorButton(
                          text: value,
                          onTap: () => buttonPressed(value),
                        ))
                    .toList(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CalculatorButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
