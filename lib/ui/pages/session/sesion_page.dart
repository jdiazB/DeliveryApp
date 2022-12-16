import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyecto_final/model/user_model.dart';
import 'package:proyecto_final/service/my_service_firestore.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';
import 'package:proyecto_final/ui/pages/permision_page.dart';
import 'package:proyecto_final/ui/pages/session/register_page.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_buttomcustom.dart';
import 'package:proyecto_final/ui/widgets/item_elevatebuttom.dart';
import 'package:proyecto_final/ui/widgets/item_textfield_custom.dart';
import 'package:proyecto_final/utils/assets_data.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  MyServiceFirestore userService = MyServiceFirestore(collection: "login");

  bool isLoading = false;

  _login() async {
    try {
      if (_formKey.currentState!.validate()) {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);
        if (userCredential.user != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => PermisionPage(),
              ),
              (route) => false);
        }
      }
    } on FirebaseException catch (error) {
      if (error.code == "invalid-email") {
        showSnackBarError(context, "El correo electronico es invalido");
      } else if (error.code == "user-not-found") {
        showSnackBarError(context, "El usuario no esta registrado");
      } else if (error.code == "wrong-password") {
        showSnackBarError(context, "La contraseña es incorrecta");
      }
    }
  }

  _loginWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) {
      return;
    }
    GoogleSignInAuthentication _googleSignInAuth =
        await googleSignInAccount.authentication;
    OAuthCredential credential = GoogleAuthProvider.credential(
      idToken: _googleSignInAuth.idToken,
      accessToken: _googleSignInAuth.accessToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCredential.user != null) {
      UserModel userModel = UserModel(
          fullName: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          phone: 0,
          direction: "");
      userService.exitUser(userCredential.user!.email!).then((value) {
        if(!value){
          //aqui se agrega en la base de datos
          userService.addUser(userModel).then((value) {
            if(value.isNotEmpty){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PermisionPage(),), (route) => false);
            }
          });
        }else{
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => PermisionPage(),), (route) => false);
        }
      },);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4361ee),
      body: !isLoading
          ? SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        spacing30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetData.logo,
                              height: 40.0,
                            ),
                            spacingWidth6,
                            Text(
                              "Delivery APP",
                              style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 0.05),
                            ),
                          ],
                        ),
                        spacing30,
                        Text(
                          "Realiza tu envia lo mas rapido",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white10.withOpacity(0.75),
                          ),
                        ),
                        spacing40,
                        TextField2CustomWidget(
                          hintText: "ingresa tu email",
                          controller: _emailController,
                          label: "Tu Email",
                        ),
                        spacing30,
                        TextFieldCustomPasswordWidget(
                          controller: _passwordController,
                        ),
                        spacing30,
                        ItemElevatedButtom(
                          height: 6,
                          whidt: 80,
                          color: kFontButton,
                          text: "Iniciar Sesión",
                          onTap: () {
                            _login();
                          },
                        ),
                        spacing30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "¿Aún no estás registrado? ",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white.withOpacity(0.75),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ));
                              },
                              child: Text(
                                "Regístrate",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfff7fff7),
                                ),
                              ),
                            ),
                          ],
                        ),
                        spacing20,
                        Text(
                          "O inicia sesion con",
                          style: TextStyle(color: klabel),
                        ),
                        spacing20,
                        ButtonCustomWidget(
                          text: "Iniciar sesión con Google",
                          icon: "google",
                          color: Color(0xfff84b2a),
                          onPressed: () {
                            _loginWithGoogle();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.3,
                ),
              ),
            ),
    );
  }
}
