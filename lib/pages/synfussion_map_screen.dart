

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_maps/maps.dart';


// class SyncMapScreen extends StatefulWidget {
//   const SyncMapScreen({Key? key}) : super(key: key);

//   @override
//   State<SyncMapScreen> createState() => _SyncMapScreenState();
// }

// class _SyncMapScreenState extends State<SyncMapScreen> {
  
//   //Declare Variables
//   bool isLoading=true;
//   final databaseRef = FirebaseFirestore.instance;
//   List<LocationDetail> locationTracking=[];
//   late MapTileLayerController _controller;
//   late MapLatLng initialPosition;
//   late MapLatLng markerPosition;

//   // late _CustomZoomPanBehavior mapZoomPanBehavior;

//   @override
//   void initState() {
//   super.initState();
//   initialization();
  

  
//   FirebaseFirestore.instance.collection("loc").snapshots().listen((event) {
//    try{
//      var data= event.docs.first;
//     GeoPoint currentPosition = data.get('position');
//    var d=locationTracking.firstWhere((element) => element.label=="label 2");
//    d.position=MapLatLng(currentPosition.latitude, currentPosition.longitude);
//    print("Firebase Data Updated");
//    print(d.position.latitude);
//    print("Firebase Data Updated !!!");
//    _controller.insertMarker(0);
//   //  setState(() {
//   //    locationTracking;
//   //  });
//    }
//    catch(e){
// print("Error occured");
// print(e.toString());
//    }
//     // locationTracking.add(LocationDetail(MapLatLng(currentPosition.latitude,currentPosition.longitude), "label"));
    
//     // _controller.insertMarker(1);
//  });

//   }
  
//   loadDataFromFireBase()async{
//     var data=await FirebaseFirestore.instance
//           .collection("loc")
//          .get()
//          .then((value) {
//           var data= value.docs.first;
//    print(data.get("bus_id"));
//           GeoPoint currentPosition = data.get('position');
//           GeoPoint startPosition = data.get('start_position');
//           GeoPoint endPosition = data.get('end_position');
//           print(data.get("bus_id"));
//           initialPosition=MapLatLng(currentPosition.latitude,currentPosition.longitude);
//           locationTracking.add(LocationDetail(MapLatLng(startPosition.latitude,startPosition.longitude), "label 1"));
//           locationTracking.add(LocationDetail(MapLatLng(currentPosition.latitude,currentPosition.longitude), "label 2"));
//           locationTracking.add(LocationDetail(MapLatLng(endPosition.latitude,endPosition.longitude), "label 3"));
//           print(locationTracking[0].label);
//           isLoading=false;
        
//           setState(() {
//             // locationTracking;
//           });
       
//          });


//   }
  
//   initialization()async{

//     _controller = MapTileLayerController();
//     // mapZoomPanBehavior = _CustomZoomPanBehavior()..onTap = updateMarkerChange;
//     loadDataFromFireBase();




//   }
//   void updateMarkerChange(Offset position) {
//     markerPosition = _controller.pixelToLatLng(position);
//     if (_controller.markersCount > 0) {
//       _controller.clearMarkers();
//     }
//     _controller.insertMarker(0);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: isLoading?Center(child: CircularProgressIndicator(),): SfMaps(
//           layers: [
          
//              MapTileLayer(
//               initialFocalLatLng: initialPosition,
//              initialZoomLevel: 15,
//                         //  zoomPanBehavior: mapZoomPanBehavior,
    
//              zoomPanBehavior: MapZoomPanBehavior(enablePinching: true,maxZoomLevel: 25,enablePanning: true,minZoomLevel: 10),
//             //  https://tile.openstreetmap.org/{z}/{x}/{y}.png
//           // urlTemplate: 'https://api.maptiler.com/maps/openstreetmap/256/{z}/{x}/{y}.jpg?key=WS95BebI7KeYX4y6OjQV',
//           urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//           initialMarkersCount: locationTracking.length,
             
//                 markerBuilder: (BuildContext context, int index) {
//                   return MapMarker(
//                     latitude: locationTracking[index].position.latitude,
//                     longitude:locationTracking[index].position.longitude,
//                     child: const Icon(
//                       Icons.location_on,
//                       color: Colors.red,
//                       size: 20,
//                     ),
//                   );
                  
//                 },
//                 controller: _controller,
//         ),
//                       // MapShapeLayer(source: _dataSource),
    
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _CustomZoomPanBehavior extends MapZoomPanBehavior {
//   late MapTapCallback onTap;

//   @override
//   void handleEvent(PointerEvent event) {
//     if (event is PointerUpEvent) {
//       onTap(event.localPosition);
//     }
//     super.handleEvent(event);
//   }
// }


// typedef MapTapCallback = void Function(Offset position);
// class LocationDetail {
//   MapLatLng position;
//   final String label;

//   LocationDetail(this.position, this.label);

// }