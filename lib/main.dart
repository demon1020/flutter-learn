import 'package:flutter/material.dart';
import 'package:flutter_learn/google_map_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, // Set the global navigatorKey
      home: GoogleMapView(),
    );
  }
}
