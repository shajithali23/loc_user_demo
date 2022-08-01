// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:location_tracking/cloud/auth.dart';
// import 'package:location_tracking/main.dart';
// import 'package:location_tracking/pages/map_screen.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.bottomRight,
//       children: [
//         MapScreen(),
//         ElevatedButton(onPressed: (){
//           FireBaseAuthService fireBaseAuthService=FireBaseAuthService();
//            fireBaseAuthService.signOut(context);
//         },child: Text("LOG OUT"),)
//       ],
//     );
//   }
// }