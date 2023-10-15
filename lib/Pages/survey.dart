import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zenzephyr/Utils/colors.dart';
import 'package:zenzephyr/widgets/appbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenzephyr/SignIn/signin_screen.dart';
import 'package:zenzephyr/widgets/second_app_bar.dart';

class SurveyPage extends StatefulWidget {
  static const routeName = "/survey";

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<int> responses = [
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ]; // Initialize with 0 as default response
void reloadPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => SurveyPage(), // Replace with your current page
    ),
  );
}


  void submitSurvey() async {
    String apiUrl = 'http://10.0.2.2:5000/predict';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'responses': responses.join(',')},
      );

      if (response.statusCode == 200) {
        // Handle the prediction result here (response.body)
        Map<String, dynamic> predictionJson = json.decode(response.body);
        int predictionResult = predictionJson['prediction'];
        print('Prediction result: $predictionResult');

        // Show a popup with the prediction result
        Fluttertoast.showToast(
          msg: predictionResult == 1
              ? 'You have depression symptoms'
              : 'You do not have depression symptoms',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        reloadPage(context);
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
      appBar: CustomAppBar(title: "Survey", showLogoutButton: false),
      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/transparentbg (2).png"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            for (int i = 0; i < 7; i++)
              ListTile(
                title: Text(
                  'Question ${i + 1}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: AppColors.primaryColor),
                ),
                subtitle: Text(
                  getQuestion(i),
                  style: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 0, 0, 0)),
                ),
                trailing: Switch(
                  value: responses[i] == 1,
                  onChanged: (value) {
                    setState(() {
                      responses[i] = value ? 1 : 0;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                ),
              ),
            ElevatedButton(
              onPressed: submitSurvey,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
              child: Text('Therapyst'),
              style: ElevatedButton.styleFrom(
                primary: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
             Container(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: BottomAppBar(
                    child: SecondAppBar(),
                  ),
                ),
              ),
            ),
          ),
        ],
          ),
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
