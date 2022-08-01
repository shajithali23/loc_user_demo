import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location_tracking/pages/home_screen.dart';
import 'package:location_tracking/pages/login_screen.dart';


class FireBaseAuthService{
    final FirebaseAuth auth = FirebaseAuth.instance;

 handleSignIn(String email,String password,BuildContext context)async{
    try {
                              
                              var response=  await auth.signInWithEmailAndPassword(
                                  email: email, password:password);
                                 await checkUserRole(auth.currentUser!.uid.toString(),context);
                              
                              
                            } on FirebaseAuthException catch (e) {
                              debugPrint(e.toString());
                              
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Ops! Login Failed'),
                                  duration: Duration(seconds: 5),
                                ),
                              );
  }}

  checkUserRole(userId,context)async{
 try{

 await FirebaseFirestore.instance
          .collection("users")
         .doc(userId)
         .get()
         .then((value) {
         
          if(value.get("role")=="parents"){
             ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Sucessfully Login.'),
                                  duration: Duration(seconds: 5),
                                ),
                              );
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>  HomeScreen()),
                                  (Route<dynamic> route) => false);
          }
          else{
           
            throw Exception("Login Failed");
          }
         });
 }
 catch(e){
 signOut(context);
  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Ops! Login Failed'),
                                  duration: Duration(seconds: 5),
                                ),
                              );
 
 }
 
}

   Future  signOut(context)  async{
    await auth.signOut();
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
    
}
}