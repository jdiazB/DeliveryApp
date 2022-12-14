import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/pages/init_page.dart';
import 'package:proyecto_final/ui/pages/session/register_page.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_elevatebuttom.dart';
import 'package:proyecto_final/ui/widgets/item_textfield_custom.dart';
import 'package:proyecto_final/utils/assets_data.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _dniController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // ApiService apiService = ApiService();
      // String _dni = _dniController.text;
      // String _password = _passwordController.text;
      // isLoading = true;
      // setState(() {});
      // UserModel? userModel = await apiService.login(_dni, _password);
      // if (userModel != null) {
      //   Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (context) => InitPage()),
      //           (route) => false);
      // } else {
      //   isLoading = false;
      //   setState(() {});
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       behavior: SnackBarBehavior.floating,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(14.0),
      //       ),
      //       backgroundColor: Colors.redAccent,
      //       content: Row(
      //         children: [
      //           Icon(Icons.error_outline, color: Colors.white),
      //           spacingWidth10,
      //           Text("Hubo un error, inténtalo nuevamente."),
      //         ],
      //       ),
      //     ),
      //   );
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            color: kFontItem,
                            letterSpacing: 0.05),
                      ),
                    ],
                  ),
                  spacing30,
                  Text(
                    "Lorem ipsum dolor sit amet",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      color: kFontItem.withOpacity(0.75),
                    ),
                  ),
                  spacing40,
                  TextFieldCustomWidget(
                    // controller: _dniController,
                    // label: "Tu número de DNI",
                    // hintText: "Ingresa tu DNI",
                    // inputTypeEnum: InputTypeEnum.dni,
                  ),
                  spacing30,
                  TextFieldCustomPasswordWidget(
                    controller: _passwordController,
                  ),
                  spacing30,
                  ItemElevatedButtom(
                    height: 6,whidt: 80,
                    color: kFontButton,
                    text: "Iniciar Sesión",
                    onTap: (){
                      _login(context);
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
                          color: kFontItem.withOpacity(0.75),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                        },
                        child: Text(
                          "Regístrate",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: kFontItem.withOpacity(0.75),
                          ),
                        ),
                      ),
                    ],
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

