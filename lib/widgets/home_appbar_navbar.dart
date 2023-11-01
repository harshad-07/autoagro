// import 'package:autoagro_draft/screens/diseaseDetection/disease_detection.dart';
// import 'package:autoagro_draft/screens/iotPage/iot_page.dart';
// import 'package:autoagro_draft/screens/toolRenting/tool_renting.dart';
// import 'package:autoagro_draft/screens/weather/weather_page.dart';
// import 'package:autoagro_draft/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../screen/diseaseDetection/disease_detection.dart';
import '../screen/iotPage/iot_page.dart';
import '../screen/login/welcome_screen.dart';
import '../screen/toolRenting/tool_renting.dart';
import '../screen/weather/weather_page.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final controller = PersistentTabController(initialIndex: 0);

List<Widget> _buildScreen() {
  return [
    DiseaseDetection(),
    IoTPage(),
    ToolRentingPage(),
    WeatherPage(),
  ];
}

List<PersistentBottomNavBarItem> _navBarItems() {
  return [
    PersistentBottomNavBarItem(
        icon: Icon(Icons.camera_alt),
        inactiveIcon: Icon(Icons.camera_alt_outlined),
        activeColorPrimary: Colors.green.shade800,
        title: ("Detect"),
        textStyle: TextStyle(fontWeight: FontWeight.bold)),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.offline_bolt),
        inactiveIcon: Icon(Icons.offline_bolt_outlined),
        activeColorPrimary: Colors.blue.shade800,
        title: ("IoT"),
        textStyle: TextStyle(fontWeight: FontWeight.bold)),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.build_circle),
        inactiveIcon: Icon(Icons.build_circle_outlined),
        activeColorPrimary: Colors.grey.shade800,
        title: ("Services"),
        textStyle: TextStyle(fontWeight: FontWeight.bold)),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.wb_sunny),
        inactiveIcon: Icon(Icons.wb_sunny_outlined),
        activeColorPrimary: Colors.yellow.shade900,
        title: ("Weather"),
        textStyle: TextStyle(fontWeight: FontWeight.bold)),
  ];
}

class _HomePageState extends State<HomePage> {
  // final ScrollController _controller = ScrollController();
  // late final ScrollListener _model;

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.border_all_rounded,
                size: 30,
              ));
        }),
        title: Text("AutoAgro"),
        backgroundColor: Color.fromARGB(255, 9, 36, 18),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  actionsAlignment: MainAxisAlignment.center,
                  title: Text("Change the Language?"),
                  actions: [
                    Column(
                      children: [
                        TextButton(onPressed: () {}, child: Text("Hindi")),
                        TextButton(onPressed: () {}, child: Text("Marathi")),
                        TextButton(onPressed: () {}, child: Text("English")),
                      ],
                    ),
                    // TextButton(onPressed: (){}, child: Text("Yes")),
                    // TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No")),
                  ],
                ),
              );
            },
            icon: Icon(Icons.translate_rounded),
            tooltip: "Translate",
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 20, bottom: 20, top: 20, left: 7),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text("Confirmation",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    content: Text(
                      "Are you sure you want to logout?",
                      style: TextStyle(color: Colors.black),
                    ),
                    actions: [
                      TextButton(
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () async {
                          await ap.userSignOut().then(
                                (value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WelcomeScreen(),
                                  ),
                                ),
                              );
                        },
                        // onPressed: () async{
                        //   await _auth.signOutGoogle();
                        //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                        //    return WalkThrough();
                        //  }), (route) => false);
                        // },
                      ),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.green.shade100)),
                        child: Text("No",
                            style: TextStyle(
                              color: Colors.green,
                            )),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                // padding: EdgeInsets.only(right: 18),
                // color: Color(0xff5F5FE4),
                decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage('assets/icons/user.png'))),
                width: 50,
                height: 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.network(
                      ap.userModel.profilePic,
                      fit: BoxFit.cover,
                    )
                    // ?? Image.asset('assets/icons/user.png')
                    // image!=null? Image.file(image!, fit: BoxFit.cover):Image.asset('assets/icons/user.png'),
                    ),
              ),
            ),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: navBar(context),
    );
  }
}

navBar(BuildContext context) {
  return PersistentTabView(
    context,
    screens: _buildScreen(),
    items: _navBarItems(),
    controller: controller,
    navBarStyle: NavBarStyle.style9,
    backgroundColor: Colors.green.shade50,
    resizeToAvoidBottomInset: true,
    stateManagement: true,
    screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.fastEaseInToSlowEaseOut,
        duration: Duration(milliseconds: 500)),
  );
}

class ScrollListener extends ChangeNotifier {
  double bottom = 0;
  double _last = 0;

  ScrollListener.initialise(ScrollController controller, [double height = 56]) {
    controller.addListener(() {
      final current = controller.offset;
      bottom += _last - current;
      if (bottom <= -height) bottom = -height;
      if (bottom >= 0) bottom = 0;
      _last = current;
      if (bottom <= 0 && bottom >= -height) notifyListeners();
    });
  }
}
