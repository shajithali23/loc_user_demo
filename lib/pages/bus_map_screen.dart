// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class BusMapScreen extends StatefulWidget {
//   const BusMapScreen({Key? key}) : super(key: key);

//   @override
//   State<BusMapScreen> createState() => _BusMapScreenState();
// }

// class _BusMapScreenState extends State<BusMapScreen> {
//   bool isLoading=false;
//   LatLng initialPosition=LatLng(0.0, 0.0);
//   final databaseRef = FirebaseFirestore.instance;
//   Set<Marker> markerData = Set();
//   Completer<GoogleMapController> _controller = Completer();
// GoogleMapController? mapController;
 
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadMapData();
//     FirebaseFirestore.instance.collection("loc").snapshots().listen((event) {
// markerData.clear();

// updateMapData(event);
//  });
//   }
//   updateMapData(QuerySnapshot event){

//    var data= event.docs.first;
//         GeoPoint pos = data.get('position');
//          var  updatePosition=LatLng(pos.latitude, pos.longitude);
//          mapController?.animateCamera( 
//         CameraUpdate.newCameraPosition(
//               CameraPosition(target: updatePosition, zoom: 14.4746) 
//               //17 is new zoom level
//         )
//       );
// markerData.add(Marker(
//       markerId: MarkerId(data.get("bus_id")),
//       position: LatLng(pos.latitude, pos.longitude),
//       infoWindow: InfoWindow(title: "Bus Location ${data.get("bus_id")}", snippet: '*'),
//       onTap: () {
//         // _onMarkerTapped(markerId);
//       },
//     ));

// //     event.docs.forEach((element) {
// //      GeoPoint pos = element.get('position');
      
// //    markerData.add(Marker(
// //       markerId: MarkerId(element.get("bus_id")),
// //       position: LatLng(pos.latitude,pos.longitude),
// //       infoWindow: InfoWindow(title: element.get("bus_id"),),
// //       onTap: () {
// //         // _onMarkerTapped(markerId);
// //       },
// //     ));
// //  });

//  setState(() {
//    markerData;
//  });
//   }
//   loadMapData()async{
//     var data=await FirebaseFirestore.instance
//           .collection("loc")
//          .get()
//          .then((value) {
//           var data= value.docs.first;
//    print(data.get("bus_id"));
// //           print(value.runtimeType);
// //          value.docs.forEach((element) { 
//           GeoPoint pos = data.get('position');
//           print(data.get("bus_id"));
//           initialPosition=LatLng(pos.latitude, pos.longitude);
// markerData.add(Marker(
//       markerId: MarkerId(data.get("bus_id")),
//       position: LatLng(pos.latitude, pos.longitude),
//       infoWindow: InfoWindow(title: "Bus Location ${data.get("bus_id")}", snippet: '*'),
//       onTap: () {
//         // _onMarkerTapped(markerId);
//       },
//     ));
// //          });
         
//          });
//          if(mounted){


// setState(() {
//   markerData;
//   initialPosition;
//   isLoading=true;
// });
//          }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: isLoading?GoogleMap(zoomGesturesEnabled: true,initialCameraPosition: CameraPosition(target: initialPosition,zoom: 14.4746, ),
       
//         onMapCreated: (controller) { //method called when map is created
//       setState(() {
//         mapController = controller; 
//       });
//     },
        
//         markers: markerData,):Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }