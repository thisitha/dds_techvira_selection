

import 'package:dds_techvira/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();



  getCurrentUser().then((value){
    print("Demo");
    if (value?.isNotEmpty??false){
     // runApp(MyApp());
      runApp(MaterialApp(
        title: "Dashboard",
        home: dashboard(),
      ));
      print("User Avilable ");
      runApp(MaterialApp(
        title: "Dashboard",
        home: dashboard(),
      ));

    }else{
      print("No user Avilable");
      runApp(MyApp());
      //

    }
  });

// runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 300),
              child: Text("Welcome To DDS Techvira Test",
                textAlign:TextAlign.center,
                style: TextStyle(

                  fontSize: 30,
                  fontWeight: FontWeight.w800
                ),),
            ),
            loginTest(),
          ],
        ),
      ),
    );
  }
}
Future<String> getCurrentUser() async{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 // final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseUser currentUser = await _firebaseAuth.currentUser();
  try{
    print(currentUser.uid.toString());
    return currentUser.uid.toString();
  }catch(Exception){
    //print(currentUser.uid.toString());
    return null;
  }

}

class loginTest extends StatefulWidget {
  @override
  _loginTestState createState() => _loginTestState();
}



class _loginTestState extends State<loginTest> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future loginLogic() async{}

  signOut() async{

    print("DESLOGOU!");
    await GoogleSignIn().signOut();

  }

  Future<FirebaseUser> _signIn(BuildContext context) async{
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
    );

    AuthResult userDetails = await _firebaseAuth.signInWithCredential(credential);
    //print(userDetails.user.uid.toString());
    FirebaseUser currentUser = await _firebaseAuth.currentUser();
    if(currentUser.uid?.isNotEmpty??false){
      Navigator.push(context, MaterialPageRoute(builder: (context) => dashboard() ));
    }else{

    }


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        GestureDetector(
          onTap: (){
            _signIn(context);
          },
          child: Card(
            elevation: 30,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29)
            ),
            //color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign In With Google",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Image.asset("assets/google_img.png",
                    height: 20,
                    width:20 ,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

//         IconButton(icon: Icon(Icons.add_circle_outline), onPressed: (){
//
//
// signOut();
//         }),
      //   IconButton(icon: Icon(Icons.add), onPressed: (){
      //     signOut();
      //     print("Signed Out");
      //   })
      ],
    );
  }
}

