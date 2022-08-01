// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:math'as Math;


// class MapScreen extends StatefulWidget {
//   MapScreen({Key? key}) : super(key: key);

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
  
//   // late LatLng _initialPosition;
  
  
  
  
  
  
  
  
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(11.107950, 77.340683),
//     zoom: 14.4746,
//   );




//   final databaseRef = FirebaseFirestore.instance;
//   late CollectionReference _loc;
//   Set<Marker> markerData = Set();
//   Set<Circle> circleMap = Set();
//   Completer<GoogleMapController> _controller = Completer();

//  arePointsNear(checkPoint, centerPoint, km) {
//   var ky = 40000 / 360;
//   var kx = Math.cos(Math.pi * centerPoint.lat / 180.0) * ky;
//   var dx = (centerPoint.lng - checkPoint.lng).abs() * kx;
//   var dy = (centerPoint.lat - checkPoint.lat).abs() * ky;
//   return Math.sqrt(dx * dx + dy * dy) <= km;
// }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _loc = FirebaseFirestore.instance.collection("loc")
//         as CollectionReference<Object?>;

// getDataFromFirebase();
// FirebaseFirestore.instance.collection("loc").snapshots().listen((event) {
// markerData.clear();

// event.docs.forEach((element) {
//      GeoPoint pos = element.get('position');
      
//    markerData.add(Marker(
//       markerId: MarkerId(element.get("bus_id")),
//       position: LatLng(pos.latitude,pos.longitude),
//       infoWindow: InfoWindow(title: element.get("bus_id"),),
     
//     ));
//  });

//  setState(() {
//    markerData;
//  });
//  });
//     // markerData.add(Marker(
//     //   markerId: MarkerId("Bus Location"),
//     //   position: LatLng(11.107950, 77.340683),
//     //   infoWindow: InfoWindow(title: "Bus Location", snippet: '*'),
//     //   onTap: () {
//     //     // _onMarkerTapped(markerId);
//     //   },
//     // ));
//   }
//   _handleTap(LatLng point) {
//     print("DDDD");
// setState(() {
//   circleMap.add(Circle(
//     strokeWidth: 1,
//     strokeColor: Color.fromARGB(255, 132, 153, 189),
//     fillColor: Colors.blue.withOpacity(0.3),
//     circleId: CircleId("point.toString()"),
//    center: LatLng(point.latitude, point.longitude),
//     radius: 500,));
// });
// }
// getDataFromFirebase()async{
//   var data=await FirebaseFirestore.instance
//           .collection("loc")
//          .get()
//          .then((value) {
//           print(value.runtimeType);
//          value.docs.forEach((element) { 
//           GeoPoint pos = element.get('position');
//           print(element.get("bus_id"));
// markerData.add(Marker(
//       markerId: MarkerId(element.get("bus_id")),
//       position: LatLng(pos.latitude, pos.longitude),
//       infoWindow: InfoWindow(title: "Bus Location ${element.get("bus_id")}", snippet: '*'),
//       onTap: () {
//         // _onMarkerTapped(markerId);
//       },
//     ));
//          });
//          });
//          if(mounted){


// setState(() {
//   markerData;
// });
//          }
         
//       //     .then((value) {
//       // // here we set the data to the data
//       // // data = value.docs;
//       // print("V!");
//       // print(value);
//       // });
// }
//   getData(streamSnapshot) {
//     // for(int i=0;i<streamSnapshot.data.docs.length;i++){
//     //   print(i);
//     // }


//     for (int i = 0; i < streamSnapshot.data.docs.length; i++) {
//       print(i);
//       final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[0];
//       GeoPoint pos = documentSnapshot['position'];
//       markerData.add(Marker(
//         markerId: MarkerId(i.toString()),
//         position: LatLng(pos.latitude, pos.latitude),

//         infoWindow: InfoWindow(title: "Bus Location ${i.toString()}", snippet: '*'),
//         icon: BitmapDescriptor.defaultMarker,
//         onTap: () {
//           // _onMarkerTapped(markerId);
//         },
//       ));

//       print(markerData);
//     }


//      SchedulerBinding.instance.addPostFrameCallback((_) {
//     //yourcode
//     setState(() {
//       markerData;
//     });
//   });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: StreamBuilder(
//             stream: FirebaseFirestore.instance.collection("loc").snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//               if (streamSnapshot.hasData) {
              
//                 return GoogleMap(
//                   circles: circleMap,
//                   markers: markerData,
//                   onMapCreated: (GoogleMapController controller) {
//                     _controller.complete(controller);
//                   },
//                   onTap: _handleTap,
//                   initialCameraPosition: _kGooglePlex
//                 );
//               }
//               return CircularProgressIndicator();
//             }),
//       ),
//     );
//   }
// }


// // class MapScreen extends StatefulWidget {
// //   @override
// //   State<MapScreen> createState() => MapScreenState();
// // }

// // class MapScreenState extends State<MapScreen> {
// //   Completer<GoogleMapController> _controller = Completer();

// //   static final CameraPosition _kGooglePlex = CameraPosition(
// //     target: LatLng(11.107950, 77.340683),
// //     zoom: 14.4746,
// //   );

// //   static final CameraPosition _kLake = CameraPosition(
// //       bearing: 192.8334901395799,
// //       target: LatLng(11.107950, 77.340683),
// //       tilt: 59.440717697143555,
// //       zoom: 19.151926040649414);
// //   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// //   Geoflutterfire geo = Geoflutterfire();

// //   final databaseRef = FirebaseFirestore.instance;
// //   late CollectionReference _pro;
// //   Set<Marker> markerData =  Set();
// // marker
// // // markers.add(Marker( //add first marker
// // //   markerId: MarkerId(showLocation.toString()),
// // //   position: showLocation, //position of marker
// // //   infoWindow: InfoWindow( //popup info
// // //     title: 'My Custom Title ',
// // //     snippet: 'My Custom Subtitle',
// // //   ),
// // //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
// // // ));

// // // markers.add(Marker( //add second marker
// // //   markerId: MarkerId(showLocation.toString()),
// // //   position: LatLng(27.7099116, 85.3132343), //position of marker
// // //   infoWindow: InfoWindow( //popup info
// // //     title: 'My Custom Title ',
// // //     snippet: 'My Custom Subtitle',
// // //   ),
// // //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
// // // ));

//   // Marker marker = Marker(
//   //   markerId: MarkerId("Bus Location"),
//   //   position: LatLng(11.107950, 77.340683),
//   //   infoWindow: InfoWindow(title: "markerIdVal", snippet: '*'),
//   //   onTap: () {
//   //     // _onMarkerTapped(markerId);
//   //   },
//   // );
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     // unique_id = _firebaseAuth.currentUser!.uid.toString();
// //     // ignore: unnecessary_cast
// //     _pro = FirebaseFirestore.instance.collection("loc")
// //         as CollectionReference<Object?>;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         body: Stack(
// //           children: [
// //             StreamBuilder<Object>(
// //                 stream:
// //                     FirebaseFirestore.instance.collection("loc").snapshots(),
// //                 builder: (context, snapshot) {
// //                   return GoogleMap(
// //                     mapType: MapType.terrain,
// //                     initialCameraPosition: _kGooglePlex,
// //                     onMapCreated: (GoogleMapController controller) {
// //                       _controller.complete(controller);
// //                     },
// //                   );
// //                 }),
// //             StreamBuilder(
// //               stream: FirebaseFirestore.instance.collection("loc").snapshots(),
// //               builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
// //                 if (streamSnapshot.hasData) {
// //                   return ListView.builder(
// //                     itemCount: streamSnapshot.data!.docs.length,
// //                     itemBuilder: (context, index) {
// //                       final DocumentSnapshot documentSnapshot =
// //                           streamSnapshot.data!.docs[index];
// //                       GeoPoint pos = documentSnapshot['position'];

// //                       return Card(
// //                         elevation: 2,
// //                         margin: const EdgeInsets.symmetric(
// //                             horizontal: 12, vertical: 6),
// //                         child: ListTile(
// //                           title: Text(streamSnapshot.data!.docs[index]
// //                               .get("bus_id")
// //                               .toString()),
// //                           subtitle: Text(pos.latitude.toString() +
// //                               " - " +
// //                               pos.longitude.toString()),
// //                           // trailing: SizedBox(
// //                           //   width: 100,
// //                           //   child: Row(children: [
// //                           //     IconButton(
// //                           //         onPressed: () {
// //                           //           // _createOrUpdate(documentSnapshot);
// //                           //         },
// //                           //         icon: const Icon(Icons.edit)),
// //                           //     IconButton(
// //                           //         onPressed: () {
// //                           //           // _delete(documentSnapshot.id);
// //                           //         },
// //                           //         icon: const Icon(Icons.delete)),
// //                           //   ]),
// //                           // ),
// //                         ),
// //                       );
// //                     },
// //                   );
// //                 } else {
// //                   return const Center(
// //                     child: CircularProgressIndicator(),
// //                   );
// //                 }
// //               },
// //             ),
// //           ],
// //         ),
// //         floatingActionButton: FloatingActionButton.extended(
// //           onPressed: _goToTheLake,
// //           label: Text('To the lake!'),
// //           icon: Icon(Icons.directions_boat),
// //         ),
// //       ),
// //     );
// //   }

// //   // _addMarker() {
// //   //   var marker = Marker(
// //   //       position: _kGooglePlex.target,
// //   //       icon: BitmapDescriptor.defaultMarker,
// //   //       markerId: MarkerId("value"));

// //   //   // markers.addMarker(marker);
// //   // }

// //   Future<void> _goToTheLake() async {
// //     final GoogleMapController controller = await _controller.future;
// //     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// //   }
// // }
