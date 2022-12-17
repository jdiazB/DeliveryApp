import 'package:flutter/material.dart';
import 'package:proyecto_final/SPGlobal/shared_preference.dart';
import 'package:proyecto_final/model/user_register_map.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/general/text_general.dart';
import 'package:proyecto_final/ui/pages/modals/track_modal_page.dart';
import 'package:proyecto_final/utils/mediaquery.dart';

class ItemHistorial extends StatefulWidget {
  UserRegisterMap userRegisterMap;

  ItemHistorial({required this.userRegisterMap});

  @override
  State<ItemHistorial> createState() => _ItemHistorialState();
}

SPGlobal _spGlobal = SPGlobal();

class _ItemHistorialState extends State<ItemHistorial>
    with TickerProviderStateMixin {
  showAddTrackModel(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: kFontItem,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      transitionAnimationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 200)),
      isDismissible: false,
      builder: (BuildContext context) {
        return SizedBox(
            height: ResponsiveUI(context).hp(90),
            child: TrackModalPages(
              userRegisterMap: widget.userRegisterMap,
            ));
      },
    );
  }

  @override
  Widget build (BuildContext context) {
    if (  widget.userRegisterMap.email ==_spGlobal.email) {
      return InkWell(
        onTap: () {
          showAddTrackModel(context);
        },
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xfff95738).withOpacity(0.3)),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xfffffcff),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  H4(text: " Pedido N° : "),
                  H4(text: " Fecha : "),
                  H4(text: " N° de Orden : "),
                  H4(text: " Tipo de paquete: "),
                  H4(text: " Costo de envio : ")
                ]),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      H4(text: widget.userRegisterMap.id!),
                      H4(
                        text: widget.userRegisterMap.data,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      H4(
                        text: "11089524566555555",
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      H4(
                        text: widget.userRegisterMap.category,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      H4(
                        text: " S/ ${widget.userRegisterMap.price}",
                        textOverflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return SizedBox() ;
    }
    // else return Text("hola") ;
  }
}
