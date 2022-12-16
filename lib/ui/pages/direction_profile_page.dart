import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/general/text_general.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_elevatebuttom.dart';
import 'package:proyecto_final/utils/mediaquery.dart';

class DirectionProfilePage extends StatelessWidget {
  const DirectionProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: kBrandPrimaryColor,
        title: Text("Direccion de entrega"),
      ),
      body: SafeArea(

       child: Stack(
         children: [
           SingleChildScrollView(
             child: Column(
               children: [
                 Carddirection(),

               ],
             ),
           ),
           Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               ItemElevatedButtom(height: 6, whidt: 80, color: kFontButton, text: "Guardar direccion", onTap: (){

               }),
               spacing6,
             ],
           ),
         ],
       ),
      ),
    );
  }
}

class Carddirection extends StatelessWidget {
  const Carddirection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Icon(Icons.location_on_outlined),
            ),
            spacingWidth6,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  H4( text: "Jorge Diaz B, +51-966754254"),
                  H4(text: "Jr.El collar 421, urb canto grande, san juan de lurigancho, Lima,Peru",fontWeight: FontWeight.bold,),
                  spacing6,
                  InkWell(child: H4(text: "Editar",color: Colors.blue,)),

                ],
              ),
            ),
          ],
        ),
        color: Colors.white

    );
  }
}
