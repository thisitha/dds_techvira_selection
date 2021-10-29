import 'dart:convert';

import 'package:dds_techvira/carDetails.dart';
import 'package:dds_techvira/cars.dart';
import 'package:dds_techvira/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();


}


class _dashboardState extends State<dashboard> {
  Future <List<cars>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }


  Future <List<cars>> fetchData() async {
    final response =
    await http.get('https://private-anon-b242a842d4-carsapi1.apiary-mock.com/manufacturers');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new cars.fromJson(data)).toList();

    } else {
      throw Exception('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.login), onPressed: (){
          GoogleSignIn().signOut();
          Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()) );
        })],
        title: Text(
            "Welcome to Dashboard"
        ),
      ),
       body:Center(
         child: FutureBuilder <List<cars>>(
           future: futureData,
           builder: (context, snapshot) {
             if (snapshot.hasData) {
               List<cars> data = snapshot.data;
               String imageURL;
               return
                 ListView.builder(

                     itemCount: data.length,
                     itemBuilder: (BuildContext context, int index) {

                       return InkWell(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(
                               builder: (context) => carDetails(moreInfo: data[index],),
                             ),
                           );
                           print(data[index].name.toString());
                         },
                         child: Card(
                           margin: EdgeInsets.all(7),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10)
                           ),
                           elevation: 10,
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Column(
                                mainAxisSize: MainAxisSize.min,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [

                                 Image.network(data[index].img_url.toString(),
                                     //height: 100,
                                     //width: 100,
                                     errorBuilder:
                                         (context, error, stackTrace) {
                                       return Image.asset(
                                           'assets/error_image.jpg',
                                           width: double.infinity,
                                         height: 300,

                                            );
                                     }),
                                 Padding(
                                   padding: const EdgeInsets.all(15),
                                   child: Text(data[index].name.toString(),
                                   style: TextStyle(
                                     fontWeight: FontWeight.w800,
                                     fontSize: 20
                                   ),),
                                 ),
                               ],
                             ),
                           ),
                         ),
                       );
                       // return Container(
                       //   height: 75,
                       //   color: Colors.white,
                       //   child: Center(child: Text(data[index].name.toString()),
                       //   ),);
                     }
                 );
             } else if (snapshot.hasError) {
               return Text("${snapshot.error}"+"sdfghj");
             }
             // By default show a loading spinner.
             return CircularProgressIndicator();
           },
         ),
       )

    );
  }
}
