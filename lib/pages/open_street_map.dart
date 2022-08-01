import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
class OpenStreetMapScreen extends StatefulWidget {
  const OpenStreetMapScreen({Key? key}) : super(key: key);

  @override
  State<OpenStreetMapScreen> createState() => _OpenStreetMapScreenState();
}

class _OpenStreetMapScreenState extends State<OpenStreetMapScreen> {
  final databaseRef = FirebaseFirestore.instance;
  late Marker _currentLocationMarker;
  late Marker _startLocationMarker;
  late Marker _endLocationMarker;
  List<Marker> _markers=[];
  late LatLng nannyLocation;
  MapController mapController=MapController();
  late LatLng initialPosition;
  List<CircleMarker> circleMarker=[];
  bool isLoading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   loadDataFromFireBase();
   FirebaseFirestore.instance.collection("loc").snapshots().listen((event) {
    var data= event.docs.first;
    GeoPoint current_position = data.get('position');
    nannyLocation=LatLng(current_position.latitude,current_position.longitude);
    print(nannyLocation.latitude);
   
    // _markers.add(Marker(
    //       // key: Key("current_marker"),
    //       point: LatLng(current_position.latitude,current_position.longitude), builder: (context)=>Icon(
    //            Icons.location_pin,
    //            size: 24,
    //            color: Colors.green,
    //          ),));
  //  try{
  //   var cm = _markers.firstWhere((element) => element.key==Key("current_marker"));
  //  print(cm.point.latitude);
  //  cm.point.latitude=current_position.latitude;
  //  cm.point.longitude=current_position.longitude;
  //  print(cm.point.latitude);
  //   mapController.mapEventSink;
  //   mapController.move(cm.point, mapController.zoom);
      
  //  }  
  //  catch(e){
  //   print(e.toString());
  //  }
 setState(() {
   nannyLocation;
   isLoading=false;
 });
 });
 
  }
  
  loadDataFromFireBase()async{
    var data=await FirebaseFirestore.instance
          .collection("loc")
         .get()
         .then((value) {
          var data= value.docs.first;
   print(data.get("bus_id"));
          GeoPoint current_position = data.get('position');
          GeoPoint start_position = data.get('start_position');
          nannyLocation=LatLng(current_position.latitude,current_position.longitude);
          GeoPoint end_position = data.get('end_position');
          print(data.get("bus_id"));
           mapController.move(LatLng(start_position.latitude,start_position.longitude), mapController.zoom);
          _markers.add(
            
            Marker(key: Key("start_position"),point: LatLng(start_position.latitude,start_position.longitude), builder: (context)=>Icon(
               Icons.location_pin,
               size: 24,
               color: Colors.green,
             ),));
        //  _markers.add();
              _markers.add(Marker(point: LatLng(end_position.latitude,end_position.longitude), builder: (context)=>Icon(
               Icons.location_pin,
               size: 24,
               color: Colors.black,
             ),));
         });


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:isLoading?Center(child: CircularProgressIndicator(),): Stack(
          alignment: Alignment.bottomCenter,
          children: [
            StreamBuilder(
              stream: mapController.mapEventStream,
              builder: (context, snapshot) {
                return FlutterMap(
                mapController: mapController,  
                options:  MapOptions(
                    onTap: (pos,LatLng location){
                      print(location.latitude);
                      circleMarker.clear();
                      circleMarker.add(CircleMarker(point: LatLng(location.latitude,location.longitude), radius: 12,color: Colors.blue.withOpacity(0.4)));
                      setState(() {
                        
                      });
                
                    },
                
                    center: LatLng(11.104797890829813, 77.35025144347985),
                     zoom: 17,
                    maxZoom: 19,
                  ),
                layers: [
                  MarkerLayerOptions(markers: [Marker(
          
          point: nannyLocation, builder: (context)=>Icon(
               Icons.location_pin,
               size: 24,
               color: Colors.red,
             ),)]),
                  CircleLayerOptions(
                  circles: 
                
                    circleMarker
                  ,
                      ),
                  //     PolylineLayerOptions(
                  // polylineCulling: true,
                  // polylines: [
                  //     Polyline(
                  //       strokeWidth: 4,
                  //       points: [  LatLng( 11.104797890829813, 77.35025144347985),
                  //    LatLng(11.105109090292355, 77.3503744151707),
                  //    LatLng(11.105223408378933, 77.35059446977539),
                  //    LatLng(11.106049037674964, 77.35039383175346),
                  //    LatLng(11.105915666946848, 77.34931944750704),
                  //    LatLng(11.10643009656238, 77.34928061434151),],
                  //       color: Colors.black38,
                  //     ),
                  // ],
                  //     ),
                ],
                  children: [
                      TileLayerWidget(
                  options: TileLayerOptions(
                    // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    urlTemplate:"https://api.maptiler.com/maps/openstreetmap/256/{z}/{x}/{y}.jpg?key=WS95BebI7KeYX4y6OjQV",
                    // urlTemplate: 'https://api.maptiler.com/maps/streets/256/{z}/{x}/{y}.png?key=XE2cU8izOVwESmKFM742',
                    subdomains: ['a', 'b', 'c'],
                    errorTileCallback:  (Tile tile, error){
                      print(error.toString());
                    }
                   ),
                ),
                  ],);
              }
            ),
       Text("data")
          ],
        ),
      ),
    );
  }
}