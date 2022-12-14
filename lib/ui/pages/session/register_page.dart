import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_elevatebuttom.dart';
import 'package:proyecto_final/ui/widgets/item_textfield_custom.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final keyForm = GlobalKey<FormState>();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _fullNameController = TextEditingController();

  // MyServiceFirestore userService = MyServiceFirestore(collection: "users");

  // _registerUser() async {
  //   try {
  //     if (keyForm.currentState!.validate()) {
  //       UserCredential userCredential =
  //           await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: _emailController.text,
  //         password: _passwordController.text,
  //       );
  //
  //       if (userCredential.user != null) {
  //         UserModel userModel = UserModel(
  //           fullName: _fullNameController.text,
  //           email: _emailController.text,
  //         );
  //         userService.addUser(userModel).then((value) {
  //           if (value.isNotEmpty) {
  //             Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => HomePage()),
  //                 (route) => false);
  //           }
  //         });
  //       }
  //     }
  //   } on FirebaseAuthException catch (error) {
  //     if (error.code == "weak-password") {
  //       //
  //       showSnackBarError(context, "La contraseña es muy débil");
  //     } else if (error.code == "email-already-in-use") {
  //       //
  //       showSnackBarError(
  //           context, "El correo electrónico ya está siendo usado");
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                spacing30,
                SvgPicture.asset(
                  'assets/images/register.svg',
                  height: 180.0,
                ),
                spacing30,
                Text(
                  "Regístrate",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: kFontItem,
                  ),
                ),
                spacing20,
                TextFieldCustomWidget(
                  // hintText: "Nombre completo",
                  // icon: Icons.email,
                  // controller: _fullNameController,
                ),
                spacing10,
                spacing6,
                TextFieldCustomWidget(
                  // hintText: "Correo electrónico",
                  // icon: Icons.email,
                  // controller: _emailController,
                ),
                spacing10,
                spacing6,
                TextFieldCustomWidget(
                  // controller: _passwordController,
                ),
                spacing20,
                ItemElevatedButtom(
                  whidt: 80,
                  height: 6,
                  text: "Regístrate ahora",
                  // icon: "check",
                  color: kFontButton,
                  onTap: (){

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
