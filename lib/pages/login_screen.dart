import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location_tracking/cloud/auth.dart';
import 'package:location_tracking/pages/home_screen.dart';

import '../home_screen.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _auth = FirebaseAuth.instance;
 
  FireBaseAuthService firebaseService=FireBaseAuthService();
   bool isLoading=false;
  @override
  void initState() {
    super.initState();
   
  }
  login()async{
    setState(() {
    isLoading=true;
               });
    await firebaseService.handleSignIn(_name.text,_password.text,context);
                              
                      
      setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _auth.currentUser != null
        ? HomeScreen()
        : SafeArea(
            child: Scaffold(
                body: Stack(
                  children: [
                    isLoading?
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: CircularProgressIndicator()),
                    )
                    :
                    SizedBox(
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldWidget(
                          name: "Email",
                          nameController: _name,
                          textInputType: TextInputType.emailAddress),
                      TextFieldWidget(
                          name: "Password",
                          nameController: _password,
                          textInputType: TextInputType.text),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: ()=>login(),
                              child: const Text("Login")),
                        ),
                      ),
                    
         
         
                    ],
              ),
            ),
                  ],
                )),
          );
  }
}
