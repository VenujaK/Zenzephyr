import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SurveyPage extends StatefulWidget {
  static const routeName = "/survey";
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  int userAnswer1 = -1;
  int userAnswer2 = -1;
  int userAnswer3 = -1;
  int userAnswer4 = -1;
  int userAnswer5 = -1;
  int userAnswer6 = -1;
  int userAnswer7 = -1;

 void sendAnswers() async {
  if (userAnswer1 != -1 &&
      userAnswer2 != -1 &&
      userAnswer3 != -1 &&
      userAnswer4 != -1 &&
      userAnswer5 != -1 &&
      userAnswer6 != -1 &&
      userAnswer7 != -1) {
    var url = Uri.parse('http://127.0.0.1:5001/predict');

    var headers = {'Content-Type': 'application/json'}; // Set content type to JSON

    Map<String, dynamic> answers = {
      'answer1': userAnswer1,
      'answer2': userAnswer2,
      'answer3': userAnswer3,
      'answer4': userAnswer4,
      'answer5': userAnswer5,
      'answer6': userAnswer6,
      'answer7': userAnswer7,
    };

    var response = await http.post(
      url,
      headers: headers,
      body: json.encode(answers), // Convert data to JSON
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String result = data['result'];

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Predicted Result'),
            content: Text('The predicted result is: $result'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Handle errors
      print('Error: ${response.reasonPhrase}');
    }
  } else {
    // Handle case where user hasn't answered all questions
    print('Please answer all questions');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: Column(
        children: <Widget>[
          Text('Question 1: Have you been feeling sad?'),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer1 = 1;
                  });
                },
                child: Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer1 = 0;
                  });
                },
                child: Text('No'),
              ),
            ],
          ),
          Text('Question 2: Have you lost interest or pleasure in activities?'),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer2 = 1;
                  });
                },
                child: Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer2 = 0;
                  });
                },
                child: Text('No'),
              ),
            ],
          ),
          Text('Question 3: Have you experienced changes in appetite or weight?'),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer3 = 1;
                  });
                },
                child: Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer3 = 0;
                  });
                },
                child: Text('No'),
              ),
            ],
          ),
          Text('Question 4: Are you having trouble sleeping?'),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer4 = 1;
                  });
                },
                child: Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer4 = 0;
                  });
                },
                child: Text('No'),
              ),
            ],
          ),
          Text('Question 5: Do you feel unusually fatigued or lacking in energy?'),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer5 = 1;
                  });
                },
                child: Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer5 = 0;
                  });
                },
                child: Text('No'),
              ),
            ],
          ),
          Text('Question 6: Do you find it difficult to concentrate or make decisions?'),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer6 = 1;
                  });
                },
                child: Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer6 = 0;
                  });
                },
                child: Text('No'),
              ),
            ],
          ),
          Text('Question 7: Have you experienced feelings of worthlessness or guilt?'),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer7 = 1;
                  });
                },
                child: Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    userAnswer7 = 0;
                  });
                },
                child: Text('No'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: sendAnswers,
            child: Text('Submit Answers'),
          ),
        ],
      ),
    );
  }
}
