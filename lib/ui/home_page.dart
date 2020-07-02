import 'dart:async';

import 'package:demo_features/ui/form_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage>{

  List<Map<String, String>> sampleStore = new List<Map<String, String>>();
  Position pos;  
  String _searchLabel = "Search..."; 

  // ====== 
  var geolocator = Geolocator(); 
  // Configure the desired accuracy and the minimum distance change
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10); 


  void initStores(){
    for(int i = 0; i < 10; i++){
      Map<String, String> store = new Map<String, String>(); 
      store["Name"] = "Store " + (i+1).toString(); 
      store["Description"] = "This is a description"; 
      sampleStore.add(store); 
    }
  }

  ListTile _buildIndividualItem(String title, String description){
    return ListTile(
      title: Text(title),
      subtitle: Text(description), 
      leading: Icon(Icons.store), 
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) => FormPage(
            name: title, 
            description: description,
          ), 
        ));
      },
    ); 
  }

  // Query current location 
  void _getCurrentLocation() async{
    // Get current location 
    pos = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    if(pos != null){
      setState((){
        _searchLabel = "${pos.longitude}, ${pos.latitude}";
        _listenPosChange(); 
      });
    }
  }

  // Listen to the Location changes 
  void _listenPosChange() async{
    // Listen to Pos change
    geolocator.getPositionStream(locationOptions).listen(
      (Position position){
        if(position != null){
          setState((){
            _searchLabel = "${position.longitude}, ${position.latitude}";
          }); 
        }
      }
    );
  //  geolocator.getPositionStream(locationOptions).listen(
  //     (Position position) {
  //       if(position != null){
  //         setState((){
  //           _searchLabel = "${position.longitude}, ${position.latitude}";
  //         });
  //       } else{
  //         _searchLabel = "${pos.longitude}, ${pos.latitude}";
  //       }
  //      }
  //   );
  }

  @override
  void initState(){
    initStores(); 
    
    //Get current Location
    _getCurrentLocation();
    super.initState(); 
    
  }

  @override 
  Widget build(BuildContext context){
    //initStores(); 
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1), 
          ),
          child: Column(
            children: <Widget>[
              // Search bar
             Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: _searchLabel,
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), 
                ),
              ), 
            ),
            
            // List View of Store around 
              Expanded(
                flex: 1, 
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: ListView.builder(
                    itemCount: sampleStore.length, 
                    itemBuilder: (BuildContext context, int index){
                      return _buildIndividualItem(sampleStore[index]["Name"], 
                                                  sampleStore[index]["Description"]);
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}