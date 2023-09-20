import 'package:flutter/material.dart';
import 'package:zenzephyr/colors.dart';

class Home extends StatelessWidget {
  static const routeName = "/home";
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
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
                              color: AppColors.textColor, fontSize: 12),
                        )),
                      )
                    ],
                  )),
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
                              color: AppColors.textColor, fontSize: 12),
                        )),
                      )
                    ],
                  )),
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
                              color: AppColors.textColor, fontSize: 12),
                        )),
                      )
                    ],
                  )),
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
                        child: Image.asset('assets/Calm me1.png'),
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
                              color: AppColors.textColor, fontSize: 12),
                        )),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
