import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFA6CFD5), // AppBar background color
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController = TextEditingController();
  String _savedText = '';

  @override
  void initState() {
    super.initState();
    _loadSavedText();
  }

  _loadSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedText = prefs.getString('saved_text') ?? '';
     
    });
  }

  _saveText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('saved_text', _textController.text);
    print('Saved text: ${_textController.text}');
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F084B), // Dark color
            Color(0xFF26408B), // Medium color
            Color(0xFFA6CFD5), // Light color
          ],
        ),
      ),
    );
  }

 Widget _buildNeumorphicButton(
  Color buttonColor, String label, Function onPressed) {
  return Container(
    margin: EdgeInsets.all(10),
    child: ElevatedButton(
      onPressed: () {
        onPressed();
        _saveText(); // Save text whenever a button is pressed
        setState(() {
          _textController.text = '';  // Clear the text in the TextField
        });
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        primary: Colors.transparent,
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // ... (restliche Formatierung bleibt unverändert)
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 1.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neumorphic Buttons'),
      ),
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Type something...',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                _buildNeumorphicButton(
  Color(0xFF0F084B),
  'FÜGE AUS',
  () {
    print('Saving text: ${_textController.text}');
    setState(() {
      _savedText = _textController.text;
    });
  },
),

                _buildNeumorphicButton(
  Color(0xFF26408B),
  'FÜGE EIN',
  () {
    print('Setting text: $_savedText');
    setState(() {
      _textController.text = _savedText;
    });
  },
),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


///FÜGE EIN FUNZT noch nicht 