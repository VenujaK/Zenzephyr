import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zenzephyr/Utils/colors.dart';
import 'package:zenzephyr/widgets/appbar.dart';

const kChatGPTApiKey = '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'; 
const kChatGPTApiEndpoint = 'https://api.openai.com/v1/chat/completions';

class ChatOption extends StatefulWidget {
  static const routeName = "/chatoption";
  @override
  _ChatOptionState createState() => _ChatOptionState();
}

class _ChatOptionState extends State<ChatOption> {
  TextEditingController _inputController = TextEditingController();
  String _output = '';

  void _sendMessageToChatGPT(String message) async {
    try {
      final response = await http.post(
        Uri.parse(kChatGPTApiEndpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $kChatGPTApiKey',
        },
        body: jsonEncode(<String, dynamic>{
          'model': 'gpt-3.5-turbo',
          'messages': [
            {'role': 'system', 'content': 'You are a helpful assistant.'},
            {'role': 'user', 'content': message},
          ],
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final content = jsonResponse['choices'][0]['message']['content'];
        setState(() {
          _output = content;
        });
      } else {
        print('Error: HTTP ${response.statusCode}');
        print('Response: ${response.body}');
        throw Exception('Failed to send message ');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to send message ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Chat With Me', showLogoutButton: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _inputController,
                decoration: InputDecoration(labelText: 'Enter your message'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String message = _inputController.text;
                _sendMessageToChatGPT(message);
              },
              child: Text('Share Your Thoughts'),
              style: ElevatedButton.styleFrom(primary: AppColors.primaryColor,),
            ),
            SizedBox(height: 20),
            Text(
              'SympathyBot Response:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_output),
            ),
          ],
        ),
      ),
    );
  }
}
