import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SurveyPage extends StatefulWidget {
  static const routeName = "/survey";
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  TextEditingController sadController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController appetiteController = TextEditingController();
  TextEditingController sleepController = TextEditingController();
  TextEditingController energyController = TextEditingController();
  TextEditingController concentrationController = TextEditingController();
  TextEditingController worthlessnessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '1. Have you been feeling consistently sad or down for most of the day, nearly every day, for at least two weeks?',
            ),
            _buildYesNoField(sadController),
            SizedBox(height: 10),
            Text(
              '2. Have you lost interest or pleasure in activities that you used to enjoy?',
            ),
            _buildYesNoField(interestController),
            SizedBox(height: 10),
            Text(
              '3. Have you experienced significant changes in your appetite or weight recently (significant increase or decrease)?',
            ),
            _buildYesNoField(appetiteController),
            SizedBox(height: 10),
            Text(
              '4. Are you having trouble sleeping or sleeping excessively?',
            ),
            _buildYesNoField(sleepController),
            SizedBox(height: 10),
            Text(
              '5. Do you feel unusually fatigued or lacking in energy, even when you\'ve had enough sleep?',
            ),
            _buildYesNoField(energyController),
            SizedBox(height: 10),
            Text(
              '6. Do you find it difficult to concentrate, make decisions, or remember things?',
            ),
            _buildYesNoField(concentrationController),
            SizedBox(height: 10),
            Text(
              '7. Have you experienced feelings of worthlessness or excessive guilt?',
            ),
            _buildYesNoField(worthlessnessController),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYesNoField(TextEditingController controller) {
    return Row(
      children: <Widget>[
        Radio(
          value: 'yes',
          groupValue: controller.text,
          onChanged: (value) {
            setState(() {
              controller.text = value!;
            });
          },
        ),
        Text('Yes'),
        Radio(
          value: 'no',
          groupValue: controller.text,
          onChanged: (value) {
            setState(() {
              controller.text = value!;
            });
          },
        ),
        Text('No'),
      ],
    );
  }

  void _submitForm() async {
    Map<String, int> answers = {
      'sad': _parseAnswer(sadController.text),
      'interest': _parseAnswer(interestController.text),
      'appetite': _parseAnswer(appetiteController.text),
      'sleep': _parseAnswer(sleepController.text),
      'energy': _parseAnswer(energyController.text),
      'concentration': _parseAnswer(concentrationController.text),
      'worthlessness': _parseAnswer(worthlessnessController.text),
    };

    int prediction = await _sendToServer(answers);

    _showResultDialog(prediction);
  }

  int _parseAnswer(String answer) {
    return answer == 'yes' ? 1 : 0;
  }

  Future<int> _sendToServer(Map<String, int> answers) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/predict'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'inputs': answers}),
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['predicted_value'];
    } else {
      throw Exception('Failed to get prediction');
    }
  }

  void _showResultDialog(int prediction) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Prediction Result'),
          content: Text('The predicted value is: $prediction'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
