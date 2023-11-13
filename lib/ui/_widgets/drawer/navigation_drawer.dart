import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/init/navigation/navigation_service.dart';
import '../../../core/init/constants/navigation/navigation_constants.dart';
import '../../main/view/main_page.dart';


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
              color: Colors.blue, // Çizgi rengi
              width: 3.0, // Çizgi kalınlığı
            ),),
          padding: const EdgeInsets.only(top: 20.0,bottom: 20.0,left: 50.0,right: 50.0),
          child: Column(
            children: [
              Text(userModelGlobal.fullName,style: const TextStyle(fontSize: 25),),
              Text("Bakiye: ${userModelGlobal.balance.toString()} M"),
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
          leading: const Icon(Icons.add,color: Colors.blue,),
          title: const Text("Yeni Sipariş"),
          onTap: (){
            navigation.navigateToPageClear(path: NavigationConstants.MAIN);
          },
        ),
        ListTile(
          leading: const Icon(Icons.reorder_sharp,color: Colors.blue,),
          title: const Text("Siparişler"),
          onTap: (){
            navigation.navigateToPage(path: NavigationConstants.ORDERS);
          },
        ),
        ListTile(
          leading: const Icon(Icons.currency_lira,color: Colors.blue,),
          title: const Text("Bakiye Ekle"),
          onTap: (){
            navigation.navigateToPage(path: NavigationConstants.ADD_BALANCE,);
          },
        ),ListTile(
          leading: const Icon(Icons.support_agent,color: Colors.blue,),
          title: const Text("Destek"),
          onTap: (){
            navigation.navigateToPage(path: NavigationConstants.CONTACT_US,);
          },
        ),
        const Divider(color: Colors.pink,),
        ListTile(
          leading: const Icon(Icons.person,color: Colors.blue,),
          title: const Text("Hesap"),
          onTap: (){
            navigation.navigateToPage(path: NavigationConstants.PROFILE,);
          },
        ),
      ],
    ),
  );


}
