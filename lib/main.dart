import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
 void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}




class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString("CurrentScreenName", "Home");
    setState(() {}); // Trigger a rebuild after prefs initialization
  }

  // late AppController appController;

  DateTime selectedDate = DateTime.now();
  TextEditingController _date = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
   HomeScreenView();
  }

  // void selectDepartment() async {
  //   await _asyncConfirmDialog(
  //     context,
  //   );
  // }

  void navigateToRoundSetup(BuildContext context) async {
    await Future.delayed(Duration(seconds: 5), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => RoundSetupScreen(),
      //   ),
      // );
    });
  }

  Widget _buildCardWithFeedback(
      {required Widget child, required Function onTap}) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: child,
      splashColor: Colors.blue[100], // Color of the splash when tapped
      borderRadius:
      BorderRadius.circular(15), // Same as the card's border radius
    );
  }

  Widget _buildFooterLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.settings,color: Colors.black,),
SizedBox(height: 5,),
              Text(
                "Settings",
                style: TextStyle(
                    color: Color.fromARGB(255, 35, 54, 91).withOpacity(
                        0.8)), // Complementary blue color with slight transparency
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.help,color: Colors.black,),
          SizedBox(height: 5,),Text(
            "Help",
            style: TextStyle(
                color: Color.fromARGB(255, 35, 54, 91).withOpacity(0.8)),
          ),
          ])

        ),
        TextButton(
          onPressed: () {},
          child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(Icons.feedback,color: Colors.black,),
    SizedBox(height: 5,),Text(
            "Feedback",
            style: TextStyle(
                color: Color.fromARGB(255, 35, 54, 91).withOpacity(0.8)),
          ),
    ]
        ),)

      ],
    );
  }

  Widget _buildMedicalQuote() {
    return Text(
      "“The good physician treats the disease; the great physician treats the patient who has the disease.” - Sir William Osler",
      style: TextStyle(
        fontStyle: FontStyle.italic,
        color: Color(0xFF2B416C).withOpacity(0.7),
      ),
    );
  }

  Widget HomeScreenView() {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(


        image: AssetImage("images/Curves.png"),fit: BoxFit.fill
      )),
      child: Scaffold(
        backgroundColor:Colors.transparent,
        // A subtle background color
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 24),
                _buildWelcomeCard(),
                SizedBox(height: 32),
                _buildOptionCards(),
                SizedBox(height: 32),
                _buildActionCards(),
                SizedBox(height: 32),
                _buildMedicalQuote(), // New addition
                Spacer(), // This will push the next widgets to the end of the screen
                Divider(thickness: 2,), // A line to separate content
                SizedBox(height: 16),
                _buildFooterLinks(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required AssetImage imageAsset,
    required Function onTap,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 0.05 * screenWidth), // 5% of screen width
      child: InkWell(

        onTap: onTap as void Function()?,
        child: Container(
          padding: EdgeInsets.all(0.01 * screenHeight), // 1% of screen height
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2B416C), Color(0xFF121B2D),Colors.black26],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 3,
                blurRadius: 15,
                blurStyle: BlurStyle.outer,
                // offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: imageAsset,
                height: 0.2 * screenHeight, // 20% of screen height
                width: 0.2 * screenWidth, // 20% of screen width
              ),
              Text(
                title,textAlign: TextAlign.center,

                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 0.03 * screenHeight, // 3% of screen height
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: _buildCardWithFeedback(
            child: _buildCard(
              title: 'Inpatient List',
              imageAsset: AssetImage('images/result (3).png'),
              onTap: () {

              },
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => InpatientListScreen(),
              //   ),
              // );
            },
          ),
        ),
        Expanded(
          child: _buildCardWithFeedback(
            child: _buildCard(

              title: 'Change Department',
              imageAsset: AssetImage('images/result (3).png'),
              onTap: () {
                prefs!.setBool('isRestart', false);
                // selectDepartment();
              },
            ),
            onTap: () {
              prefs!.setBool('isRestart', false);
              // selectDepartment();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildCardWithFeedback(
            child: _buildCard(
              title: 'Start Round',
              imageAsset: AssetImage('images/result (3).png'),
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    navigateToRoundSetup(context);
                    return AlertDialog(
elevation: 20,
                      shadowColor: Colors.white,

                      shape: OutlineInputBorder(
                        
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black,width:2)
                      ),
                      content: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(color: Colors.black,strokeWidth: 1),
                          SizedBox(width: 20),
                          Text("Loading..."),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            onTap: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  navigateToRoundSetup(context);
                  return AlertDialog(

                    shape: StadiumBorder(),
                    content: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 20),
                        Text("Loading..."),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
        Expanded(
          child: _buildCardWithFeedback(
            child: _buildCard(
              title: 'All Orders',


              imageAsset: AssetImage('images/result (3).png'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         InpatientListScreen22(PatientProfile()),
                //   ),
                // );
              },
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => InpatientListScreen22(PatientProfile()),
              //   ),
              // );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeCard() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2B416C), Color(0xFF121B2D),Colors.black54],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // transform: GradientRotation(9)
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.blue[100]!, // Light blue border
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurStyle: BlurStyle.inner,
            spreadRadius: 3,
            blurRadius: 28,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor:
            Color.fromRGBO(235, 238, 241, 1),
            radius: 25,// Light blue background
            child: Icon(
              Icons.person,
              color: Color(0xFF2B416C),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back ,',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                prefs?.getString('appControllerFullName') ?? '',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '- ${prefs?.getString('appControllerDepartment') ?? ''}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(
                      255, 255, 255, 255), // Slightly faded white for contrast
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Future _asyncConfirmDialog(
  //     BuildContext context,
  //     ) async {
  //   return await showDialog(
  //     context: context,
  //     builder: (ctx) {
  //       return ;
  //     },
  //   );
  // }
}



