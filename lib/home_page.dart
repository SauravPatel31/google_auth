import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text("Logout"),
                content: Text("Are you sure you want to logout?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(), // Close dialog
                    child: Text("Cancel",style: TextStyle(color: Colors.green)),
                  ),
                  TextButton(
                    onPressed: () async {
                     await GoogleSignIn().disconnect();
                     FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),)); // Close dialog
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("You have been logged out.")),
                      );
                    },
                    child: Text("Logout",style: TextStyle(color: Colors.red),),

                  )

                ],
              );
            },);
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("Welcome",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
      ),
    );
  }
}
