import 'package:flutter/material.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/general/text_general.dart';
import 'package:proyecto_final/ui/pages/modals/track_modal_page.dart';
import 'package:proyecto_final/ui/widgets/general_widget.dart';
import 'package:proyecto_final/ui/widgets/item_historial.dart';
import 'package:proyecto_final/utils/mediaquery.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({Key? key}) : super(key: key);

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage>  {
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
                      ItemHistorial(),
                      ItemHistorial(),
                      ItemHistorial(),
                      ItemHistorial(),
                      ItemHistorial(),
                      ItemHistorial(),
                      ItemHistorial(),
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
