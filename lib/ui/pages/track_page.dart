import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_final/model/user_register_map.dart';
import 'package:proyecto_final/providers/order_provider.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/general/text_general.dart';
import 'package:proyecto_final/ui/pages/modals/track_modal_page.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_historial.dart';
import 'package:proyecto_final/utils/mediaquery.dart';

class TrackPage extends StatefulWidget {


  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage>  {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      OrderProvider orderProvider = Provider.of<OrderProvider>(context, listen: false);
      orderProvider.getOrderData();
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            spacing14,
           H3(text: "Historial de envios",fontWeight: FontWeight.bold,),
            spacing14,
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                children: [
                  Column(
                    children: [

                      Consumer<OrderProvider>(
                        builder: (context, provider, _){
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: provider.orders.length,
                            itemBuilder: (context, index){
                              return Text(provider.orders[index].toJson().toString());
                            },
                          );
                        },
                      ),






                      // ItemHistorial(),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
