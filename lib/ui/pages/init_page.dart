import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyecto_final/ui/general/colors.dart';
import 'package:proyecto_final/ui/pages/home_page.dart';
import 'package:proyecto_final/ui/pages/packages_pages.dart';
import 'package:proyecto_final/ui/pages/permision_page.dart';
import 'package:proyecto_final/ui/pages/profile_page.dart';
import 'package:proyecto_final/ui/pages/track_page.dart';
import 'package:proyecto_final/utils/assets_data.dart';

class InitPage extends StatefulWidget {


  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int indexPage = 0 ;
  List<Widget> _page = [
    HomePage(),
    TrackPage(),
    PackagesPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _page[indexPage],
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.01),
            borderRadius: BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                  color: Colors.white12, blurRadius: 10, offset: Offset(4, 4)),
            ]),
        child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kBrandPrimaryColor,
            unselectedItemColor: Colors.black45,
            selectedLabelStyle:
                TextStyle(fontSize: 13, color: kBrandPrimaryColor),
            onTap: (int value) {
              indexPage = value;
              setState(() {});
            },
            currentIndex: indexPage,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AssetData.iconHome,
                    color: indexPage == 0 ? kBrandPrimaryColor : Colors.black45,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetData.iconMap,
                      color:
                          indexPage == 1 ? kBrandPrimaryColor : Colors.black45),
                  label: "Track"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetData.iconPackage,
                      color:
                          indexPage == 2 ? kBrandPrimaryColor : Colors.black45),
                  label: "Packages"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AssetData.iconProfile,
                      color:
                          indexPage == 3 ? kBrandPrimaryColor : Colors.black45),
                  label: "Profile"),
            ]),
      ),
    );
  }
}
