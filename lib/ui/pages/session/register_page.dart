import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyecto_final/model/user_model.dart';
import 'package:proyecto_final/service/my_service_firestore.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';
import 'package:proyecto_final/ui/pages/permision_page.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_elevatebuttom.dart';
import 'package:proyecto_final/ui/widgets/item_textfield_custom.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final keyForm = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _directionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  MyServiceFirestore userService = MyServiceFirestore(collection: "login");

  _registerUser() async {
    try {
      if (keyForm.currentState!.validate()) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        if (userCredential.user != null) {
          UserModel userModel = UserModel(
            fullName: _fullNameController.text,
            email: _emailController.text,
            direction: _directionController.text,
            phone: _phoneController.hashCode.toString(),
          );
          userService.addUser(userModel).then((value) {
            print(userModel);
            if (value.isNotEmpty) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PermisionPage()),
                  (route) => false);
            }
          });
        }
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == "weak-password") {
        //
        showSnackBarError(context, "La contraseña es muy débil");
      } else if (error.code == "email-already-in-use") {
        //
        showSnackBarError(
            context, "El correo electrónico ya está siendo usado");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff324a5f),
        title: Text("Registrate",style: TextStyle(
          color: klabel,fontWeight: FontWeight.bold
        ),),
      ),
      backgroundColor: Color(0xff4361ee),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                    child: Lottie.asset('assets/json/delivery.json',
                         fit: BoxFit.fill)),
                spacing20,
                TextFieldCustomWidget(
                  label: "Ingresa tu nombre",
                  hintText: "Nombre completo",
                  icon: Icons.person,
                  controller: _fullNameController,
                ),
                spacing10,
                spacing6,
                TextFieldCustomWidget(
                  label: "Ingresa tu correo electronico",
                  hintText: "Correo electrónico",
                  icon: Icons.email,
                  controller: _emailController,
                ),
                spacing10,
                spacing6,
                TextFieldCustomWidget(
                  label: "Ingresa tu celular",
                  hintText: "Celular",
                  icon: Icons.phone,
                  controller: _phoneController,
                ),
                spacing10,
                spacing6,
                TextFieldCustomWidget(
                  label: "Ingresa tu direccion",
                  hintText: "Direccion",
                  icon: Icons.house_outlined,
                  controller: _directionController,
                ),
                spacing10,
                spacing6,
                TextFieldCustomWidget(
                  icon: Icons.password,
                  label: "Ingresa tu constraseña",
                  hintText: 'contraseña',
                  controller: _passwordController,
                ),
                spacing20,
                ItemElevatedButtom(
                  whidt: 80,
                  height: 6,
                  text: "Regístrate ahora",
                  // icon: "check",
                  color: kFontButton,
                  onTap: () {
                    _registerUser();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
