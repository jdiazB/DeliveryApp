import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/SPGlobal/shared_preference.dart';
import 'package:proyecto_final/providers/order_provider.dart';
import 'package:proyecto_final/providers/register_provider.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';
import 'package:proyecto_final/ui/pages/session/sesion_page.dart';




void main()async{

  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal prefs = SPGlobal();
  prefs.initSharedPreferences();
  await Firebase.initializeApp();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => OrderProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => QuantityProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.ubuntuTextTheme()
        ),
        title: "DeliveryAPP",
        debugShowCheckedModeBanner: false,
        home: PreInit(),
      ),
    );
  }
}
class PreInit extends StatelessWidget {
 final SPGlobal _prefs = SPGlobal();

  @override
  Widget build(BuildContext context) {
    return !_prefs.token.isNotEmpty ?  LoginPage(): InitPage() ;
  }
}


