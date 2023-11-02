import 'package:flutter/material.dart';
import 'package:musmeramedya/core/init/navigation/navigation_service.dart';

import '../../../core/init/constants/navigation/navigation_constants.dart';


class NavigationDrawerMain extends StatelessWidget {
   NavigationDrawerMain({super.key});

  final NavigationService navigation = NavigationService.instance;

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          buildHeader(context),
          buildMenuItems(context)
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) =>Container(
    color: Colors.transparent,
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Column(
      children: [
        const SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.brown, // Çizgi rengi
              width: 2.0, // Çizgi kalınlığı
            ),),
          padding: const EdgeInsets.only(top: 20.0,bottom: 20.0,left: 50.0,right: 50.0),
          child: const Column(
            children: [
              Text("Musa Güzel",style: TextStyle(fontSize: 25),),
              Text("Bakiye: 50000"),
            ],
          ),
        ),

        const SizedBox(height: 20,),
      ],
    ),
  );
  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Yeni Sipariş"),
          onTap: (){
            navigation.navigateToPageClear(path: NavigationConstants.MAIN);
          },
        ),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Siparişler"),
          onTap: (){
            navigation.navigateToPage(path: NavigationConstants.ORDERS);
          },
        ),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Bakiye Ekle"),
          onTap: (){},
        ),ListTile(
          leading: Icon(Icons.add),
          title: Text("Destek"),
          onTap: (){},
        ),
        const Divider(color: Colors.pink,),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Hesap"),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("Çıkış Yap"),
          onTap: (){},
        ),


      ],
    ),
  );


}
