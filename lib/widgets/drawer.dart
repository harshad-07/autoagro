import 'dart:io';

import 'package:autoagro_firebase/provider/auth_provider.dart';
// import 'package:autoagro_firebase/screen/diseaseDetection/disease_detection.dart';
import 'package:autoagro_firebase/screen/login/welcome_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/notificationTab/notification_tab.dart';
// import 'home_appbar_navbar.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  
  File? image;

  // FirebaseAuth _auth = FirebaseAuth.instance;

  var selectedItem = -1;
  int counter=0;
  // AuthService _auth = new AuthService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    final ap = Provider.of<AuthProvider>(context, listen: false);
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 25, right: 20),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
                color: Color.fromARGB(255, 9, 36, 18),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    // color: Color(0xff5F5FE4),
                    decoration: BoxDecoration(color: Colors.green.shade200, borderRadius: BorderRadius.circular(100), image: DecorationImage(image: AssetImage('assets/icons/user.png'))),
                    width: 70,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: 
                      Image.network(ap.userModel.profilePic, fit: BoxFit.cover,) 
                      // ?? Image.asset('assets/icons/user.png') 
                      // image!=null? Image.file(image!, fit: BoxFit.cover):Image.asset('assets/icons/user.png'),
                    ),
                  ),
                  // CircleAvatar(
                  //   radius: 36,
                  //   backgroundColor: Colors.white,
                  //   backgroundImage: AssetImage('assets/icons/user.png',),
                  //   // foregroundImage: AssetImage('assets/images/me.jpeg'),
                  // ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(ap.userModel.name, style: TextStyle(color: Colors.white, fontSize: 16)),
                      SizedBox(height: 7,),
                      Text(ap.userModel.email, style: TextStyle(color: Colors.white, fontSize: 11)),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          getDrawerItem( Icons.dashboard,"Home", 1,ind: "home"),
          Padding(
            padding: const EdgeInsets.only(left:15.0,right: 15.0),
            child: Divider(color: Color(0XFFDADADA), height: 1),
          ),
          SizedBox(height: 30),
          getDrawerItem( Icons.notifications_active,"Notifications", 2,ind: "notifications"),
          Padding(
            padding: const EdgeInsets.only(left:15.0,right: 15.0),
            child: Divider(color: Color(0XFFDADADA), height: 1),
          ),
          SizedBox(height: 30),
          getDrawerItem( Icons.logout, "Logout", 3,ind: "log"),
          Padding(
            padding: const EdgeInsets.only(left:15.0,right: 15.0),
            child: Divider(color: Color(0XFFDADADA), height: 1),
          ),
        ],
      ),
    );
  }


  Widget getDrawerItem(IconData icon, String name, int pos,{var tags,ind}) {

    final ap = Provider.of<AuthProvider>(context, listen: false);
    
    return GestureDetector(
      onTap: () async {
        setState(() {
          selectedItem = pos;
        });
        if(tags!=null){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tags));
        } else if(ind == "log"){
          showDialog(context: context,
            builder: (context)=>AlertDialog(
              backgroundColor: Colors.white,
              title: Text("Confirmation", style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)),
              content: Text(
                "Are you sure you want to logout?",
                style: TextStyle(color:Colors.black),
              ),
              actions: [
                TextButton(
                  child: Text(
                    "Yes",
                    style: TextStyle(color:Colors.black,),
                  ),
                  onPressed: () async{
                      await ap.userSignOut().then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      ),
                    );
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                  },
                  // onPressed: () async{
                  //   await _auth.signOutGoogle();
                  //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                  //    return WalkThrough();
                  //  }), (route) => false);
                  // },
                ),
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green.shade100)),
                  child: Text("No", style: TextStyle(color:Colors.green,)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        } else if(ind =="home"){
          Navigator.pop(context);
          // Navigator.pushAndRemoveUntil(context,
          //     MaterialPageRoute(
          //       builder: (context) {
          //         return HomePage();
          //       },
          //     ), (route) => false);
        }else if(ind =="notifications"){
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(
                builder: (context) {
                  return NotificationTab();
                },
              ), (route) => false);
        }
      },
      child: Container(
        color: selectedItem == pos ? Color(0XFFF2ECFD) : Colors.white,
        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Row(
          children: <Widget>[
            Icon(icon,size: 20,),
            //SvgPicture.asset(icon, width: 20, height: 20),
            SizedBox(width: 20),
            Text(name, style: TextStyle(color: selectedItem == pos ? Color.fromARGB(255, 9, 36, 18) : Color(0XFF130925), fontSize: 18, fontFamily: 'Medium'),)
          ],
        ),
      ),
    );
  }
  
  
}