import 'package:dds_techvira/cars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class carDetails extends StatefulWidget {
 // final String name;
  final cars moreInfo;
  const carDetails({Key key, @required this.moreInfo}): super(key: key);
  @override
  _carDetailsState createState() => _carDetailsState();
}

class _carDetailsState extends State<carDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       //   Text(widget.moreInfo.name),
          Image.network(widget.moreInfo.img_url,
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
          Card(
            margin: EdgeInsets.all(2),
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7)
            ),
            child: Center(
              child: Text(
                "Name: "+widget.moreInfo.name
              ),
            ),
          ),
          Card(
            elevation: 20,
            margin: EdgeInsets.all(2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                    "ID : "+widget.moreInfo.id
                ),
              ),
            ),
          ),
          Card(
            elevation: 20,
            margin: EdgeInsets.all(2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                    "Avg Horse Power: "+widget.moreInfo.avg_horsepower
                ),
              ),
            ),
          ),
          Card(
            elevation: 20,
            margin: EdgeInsets.all(2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                    "Avg Price: "+widget.moreInfo.avg_price
                ),
              ),
            ),
          ),
          Card(
            elevation: 20,
            margin: EdgeInsets.all(2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                    "Max Car ID : "+widget.moreInfo.max_car_id
                ),
              ),
            ),
          ),
          Card(
            elevation: 20,
            margin: EdgeInsets.all(2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                    "No. of Models: "+widget.moreInfo.num_models
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: IconButton(icon: Icon(Icons.arrow_back,size: 50,), onPressed: (){
                Navigator.pop(context);
            }),
          )
        ],
      ),
    );
  }
}
