import 'dart:io';

import 'package:autoagro_firebase/model/user_model.dart';
import 'package:autoagro_firebase/provider/auth_provider.dart';
// import 'package:autoagro_firebase/screen/diseaseDetection/disease_detection.dart';
import 'package:autoagro_firebase/utils/toast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// import '../../controller/signup_controller.dart';
import '../../utils/my_theme.dart';
import '../../widgets/form_text_field.dart';
import '../../widgets/home_appbar_navbar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool loading = false;

  // FirebaseAuth _auth = FirebaseAuth.instance;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUp(){
    setState(() {
      loading = true;
    });
      storeData();
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DiseaseDetection()));
    // SignUpController.instance.registerUser(controller.emailController.text.trim(), controller.passwordController.text.trim());
    // _auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString()).then((value) {
    //   setState(() {
    //     loading = false;
    //   });
    // }).onError((error, stackTrace) {
    //   toastMessage(error.toString());
    //   setState(() {
    //     loading = false;
    //   });
    // });
  }
  
  String name = "";
  final _formKey = GlobalKey<FormState>();

  File? image;

  final imagePicker = ImagePicker();

  Future getVideo(ImageSource source) async{
    try {
      final image = await imagePicker.pickImage(source: source);
      if(image == null) return;
      
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to pick image $e"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {

    final isLoading = Provider.of<AuthProvider>(context, listen: true).isLoading;

    // final controller = Get.put(SignUpController());

    return Scaffold(
      body: SafeArea(
        child: isLoading == true ? Center(child: CircularProgressIndicator(color: Colors.green),) :
        Form(
          key: _formKey,
          child: Container(
            // height: MediaQuery.sizeOf(context).height,
            margin: EdgeInsets.fromLTRB(25, 70, 25, 30),
            // alignment: Alignment.topCenter,
            child: ListView(
              children: [
                Text("Heyya! Let\'s Complete Few Things!!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                SizedBox(height: 30,),
                Container(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        // color: Color(0xff5F5FE4),
                        decoration: BoxDecoration(color: Colors.green.shade200, borderRadius: BorderRadius.circular(100)),
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: image!=null? Image.file(image!, fit: BoxFit.cover):Image.asset('assets/images/profile.png'),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: FloatingActionButton(
                            onPressed: (){showDialog(context: context, builder: (context) {
                              return SimpleDialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                title: Text("Set Profile Picture"),
                                contentPadding: EdgeInsets.all(15),
                                children: [
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration( color: primary.withOpacity(0.2), shape: BoxShape.circle),
                                        child: IconButton(
                                          tooltip: "Capture a photo",
                                          onPressed: () {
                                            getVideo(ImageSource.camera);
                                            Navigator.pop(context);
                                          }, 
                                          icon: Image.asset('assets/icons/camera.png')
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration( color: primary.withOpacity(0.2), shape: BoxShape.circle),
                                        child: IconButton(
                                          tooltip: "Upload from Gallery",
                                          onPressed: () {
                                            getVideo(ImageSource.gallery);
                                            Navigator.pop(context);
                                          },  
                                          icon: Image.asset('assets/icons/gallery.png')
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                    child: TextButton(
                                      style: TextButton.styleFrom(alignment: Alignment.bottomRight, textStyle: TextStyle(color: primary, fontSize: 18), ),
                                      child: Text("Cancle"), 
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ),
                                ],
                              );
                            },);},
                            backgroundColor: Colors.teal,
                            tooltip: 'Set Profile Picture',
                            child: Icon(Icons.add_a_photo),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text("Welcome $name!", 
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center
                ),
                SizedBox(height: 20),
                formTextField(
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                  hintText: 'Enter Your Name', 
                  labelText: 'Name',
                  obsecureText: false, 
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Username cannot be empty";
                    }
                    return null;
                  }, 
                  controller: nameController
                ),
                SizedBox(height: 22),
                formTextField(
                  type: TextInputType.emailAddress,
                  hintText: 'Enter Your Email', 
                  labelText: 'Email',
                  obsecureText: false, 
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Email cannot be empty";
                    }
                    else if(value.contains('@') == false){
                      return "Enter valid email address";
                    }
                    return null;
                  },
                  controller: emailController
                ),
                SizedBox(height: 22),
                formTextField(
                  // type: TextInputType.visiblePassword,
                  obsecureText: true,
                  hintText: 'Create Password', 
                  labelText: 'Password', 
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Password cannot be empty";
                    }
                    else if(value.length < 6){
                      return "Password must be greater han 6 characters";
                    }
                    return null;
                  },
                  controller: passwordController
                ),
                SizedBox(height: 50),
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width*0.75,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        signUp();
                      }
                    }, 
                    child: loading ? CircularProgressIndicator(color: Colors.white,) : Text("Sign Up", style: TextStyle(fontSize: 18)),
                    // style: TextButton.styleFrom(minimumSize: Size(125, 40)),
                    style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: Colors.green),
                  ),
                ),
                // Container(height: 300, color: Colors.amber, width: 20,)  
              ],
            ),
          )
        )
      ),
    );
  }

  

  void storeData()async{
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(name: nameController.text.trim(), email: emailController.text.trim(), uid: '', profilePic: '', phoneNo: '', createdAt: '', password: passwordController.text);
    if(image!=null){
      ap.saveUserDataToFirebase(
        context: context, 
        userModel: userModel, 
        profilePic: image!, 
        onSuccess: (){
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                          (route) => false),
                    ),
              );
        }
      );
    }else{
      toastMessage("Please upload your image");
    }
  }

}








  // TextFormField(
  //                   validator: (value) {
  //                     if(value!.isEmpty){
  //                       return "Password cannot be empty";
  //                     }
  //                     else if(value.length < 6){
  //                       return "Password must be greater han 6 characters";
  //                     }
  //                     return null;
  //                   },
  //                   onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
  //                   cursorColor: Colors.green.shade700,
  //                   style: TextStyle( fontSize: 18),
  //                   cursorHeight: 24,
  //                   obscureText: true,
  //                   maxLengthEnforcement: MaxLengthEnforcement.enforced,
  //                   decoration: InputDecoration(
  //                     focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
  //                     errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  //                     enabled: true,
  //                     filled: true,
  //                     fillColor: Colors.green.withOpacity(0.2),
  //                     hintText: 'Enter Password',
  //                     labelText: 'Password',
  //                     labelStyle: TextStyle(color: Colors.green.shade700),
  //                     contentPadding: EdgeInsets.all(22),
  //                     // hintStyle: TextStyle(color: Colors.white70),
  //                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), ),
  //                     focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), ),
  //                   ),
  //                 ),
                  