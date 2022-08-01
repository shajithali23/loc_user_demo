import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_tracking/cloud/auth.dart';
import 'package:location_tracking/pages/bus_map_screen.dart';
import 'package:location_tracking/pages/map_screen.dart';
import 'package:location_tracking/pages/open_street_map.dart';
import 'package:location_tracking/pages/synfussion_map_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
FireBaseAuthService firebaseService=FireBaseAuthService();
 signOut(context)async{
await firebaseService.signOut(context);
 }
 navigateToMapScreen(context){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OpenStreetMapScreen()));
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Locus"),
        actions: [
          IconButton(onPressed: ()=>signOut(context)
            
          
          , icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: ()=>navigateToMapScreen(context),
                              child: const Text("View location of bus")),
                        ),
                      ),
      ),
    );
  }
}