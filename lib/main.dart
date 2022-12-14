import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_final/SPGlobal/shared_preference.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';
import 'package:proyecto_final/ui/pages/packages_pages.dart';
import 'package:proyecto_final/ui/pages/session/sesion_page.dart';



void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal prefs = SPGlobal();
  prefs.initSharedPreferences();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme()
      ),
      title: "DeliveryAPP",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
