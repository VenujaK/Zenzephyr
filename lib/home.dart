import 'package:flutter/material.dart';
import 'package:zenzephyr/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Zenzephyr',
              style: TextStyle(color: AppColors.primaryColor)),
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black12,
          bottomOpacity: 0.0,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/transparentbg (2).png'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 5,
              crossAxisCount: 2,
              children: [
                Card(
                  elevation: 4,
                  shadowColor: const Color(0xFF00BF63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 65,
                        child: Image.asset('assets/Chat with me.png'),
                      ),
                      Container(
                        height: 30,
                        child: const Center(child: Text('Chat With Me')),
                      ),
                      Container(
                        height: 40,
                        child: const Center(
                          child: Text(
                            'Engage in Enlightened Conversations',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 4,
                  shadowColor: const Color(0xFF00BF63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 65,
                        child: Image.asset('assets/Talk with me.png'),
                      ),
                      Container(
                        height: 30,
                        child: const Center(child: Text('Talk To Me')),
                      ),
                      Container(
                        height: 20,
                        child: const Center(
                          child: Text(
                            'Expressions Unveiled',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 4,
                  shadowColor: const Color(0xFF00BF63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 65,
                        child: Image.asset('assets/Contact us.png'),
                      ),
                      Container(
                        height: 30,
                        child: const Center(child: Text('Contact Us')),
                      ),
                      Container(
                        height: 40,
                        child: const Center(
                          child: Text(
                            'Connect for our Assistance',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 4,
                  shadowColor: const Color(0xFF00BF63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 65,
                        child: Image.asset('assets/calm me2.png'),
                      ),
                      Container(
                        height: 30,
                        child: const Center(child: Text('Calm Me')),
                      ),
                      Container(
                        height: 40,
                        child: const Center(
                          child: Text(
                            'Calm yourself',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 4,
                  shadowColor: const Color(0xFF00BF63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 65,
                        child: Image.asset('assets/SympathyBot1.png'),
                      ),
                      Container(
                        height: 30,
                        child: const Center(child: Text('SympathyBot')),
                      ),
                      Container(
                        height: 40,
                        child: const Center(
                          child: Text(
                            'Calm yourself',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 4,
                  shadowColor: const Color(0xFF00BF63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 65,
                        child: Image.asset('assets/Servey.png'),
                      ),
                      Container(
                        height: 30,
                        child: const Center(child: Text('Servey')),
                      ),
                      Container(
                        height: 40,
                        child: const Center(
                          child: Text(
                            'In-depth Insights, Meticulous Analysis',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
