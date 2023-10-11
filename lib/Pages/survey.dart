import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


class SurveyPage extends StatefulWidget {
   static const routeName = "/survey";
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<int> responses = [0, 0, 0, 0, 0, 0, 0]; // Initialize with 0 as default response

  void submitSurvey() async {
  String apiUrl = 'http://10.0.2.2:5000/predict'; // Replace with your Flask server URL

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {'responses': responses.join(',')},
    );

    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> result = jsonDecode(response.body);

      // Extract the prediction value
      int prediction = result['prediction'];

      // Show toast message based on prediction
      String message = prediction == 1
          ? 'You have depression symptoms'
          : 'You do not have depression symptoms';

      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      throw Exception('Failed to connect to the server');
    }
  } catch (error) {
    print('Error: $error');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: ListView(
        children: <Widget>[
          for (int i = 0; i < 7; i++)
            ListTile(
              title: Text(
                'Question ${i + 1}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                getQuestion(i),
                style: TextStyle(fontSize: 16.0),
              ),
              trailing: Switch(
                value: responses[i] == 1,
                onChanged: (value) {
                  setState(() {
                    responses[i] = value ? 1 : 0;
                  });
                },
              ),
            ),
          ElevatedButton(
            onPressed: submitSurvey,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  String getQuestion(int index) {
    switch (index) {
      case 0:
        return "Have you been feeling consistently sad or down for most of the day, nearly every day, for at least two weeks?";
      case 1:
        return "Have you lost interest or pleasure in activities that you used to enjoy?";
      case 2:
        return "Have you experienced significant changes in your appetite or weight recently (significant increase or decrease)?";
      case 3:
        return "Are you having trouble sleeping or sleeping excessively?";
      case 4:
        return "Do you feel unusually fatigued or lacking in energy, even when you've had enough sleep?";
      case 5:
        return "Do you find it difficult to concentrate, make decisions, or remember things?";
      case 6:
        return "Have you experienced feelings of worthlessness or excessive guilt?";
      default:
        return "";
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: SurveyPage(),
  ));
}
