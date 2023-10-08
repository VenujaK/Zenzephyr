import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatOptionPage extends StatefulWidget {
  static const routeName = "/chatoption";
  @override
  _ChatOptionPageState createState() => _ChatOptionPageState();
}

class _ChatOptionPageState extends State<ChatOptionPage> {
  TextEditingController _userInputController = TextEditingController();
  String _response = '';

  void _getResponseFromChatGPT(String userInput) async {
    final apiKey = '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';
    final apiUrl = 'https://api.openai.com/v1/engines/davinci/completions';
    
    final response = await http.post(
      
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'prompt': userInput,
        'max_tokens': 50,
      }),
      
    );
print('API Response: ${response.body}');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        _response = data['choices'][0]['text'];
      });
    } else {
      setState(() {
        _response = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Option'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _userInputController,
              decoration: InputDecoration(
                hintText: 'Type something...',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String userInput = _userInputController.text;
              _getResponseFromChatGPT(userInput);
            },
            child: Text('Submit'),
          ),
          SizedBox(height: 20),
          Text('Response: $_response'),
        ],
      ),
    );
  }
}
