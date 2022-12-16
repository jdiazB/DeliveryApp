import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/SPGlobal/shared_preference.dart';
import 'package:proyecto_final/providers/order_provider.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';




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
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.ubuntuTextTheme()
        ),
        title: "DeliveryAPP",
        debugShowCheckedModeBanner: false,
        home: InitPage(),
      ),
    );
  }
}
