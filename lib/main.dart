import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:my_app/helpers/custom_route.dart';
import 'package:my_app/screens/add_place_screen.dart';
import 'package:my_app/screens/place_detail_screen.dart';
import 'package:my_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CustomPageTransitionBuilder(),
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
          }),
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        // home: ,
        routes: {
          '/': (ctx) => PlaceListScreen(),
          '/add_place': (ctx) => AddPlacesList(),
          '/place_detail': (ctx) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
