import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musmeramedya/core/init/navigation/navigation_service.dart';
import 'package:musmeramedya/ui/main/viewModel/main_page_view_model.dart';
import 'package:musmeramedya/ui/register/model/user_model.dart';

import '../../../core/init/constants/navigation/navigation_constants.dart';
import '../view/main_page.dart';


class NavigationDrawerMain extends StatelessWidget {
   NavigationDrawerMain({super.key, this.viewModel});

   final MainPageViewModel? viewModel;
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
          child: Observer(
            builder: (_){
              return Column(
                children: [
                  Text(viewModel != null ? viewModel?.currentUser?.fullName.toString() as String : "0",style: TextStyle(fontSize: 25),),
                  Text("Bakiye: ${viewModel != null ? viewModel?.currentUser?.balance.toString() : "0"}"),
                ],
              );
            },
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
          onTap: (){
            navigation.navigateToPage(path: NavigationConstants.ADD_BALANCE,data: viewModel?.currentUser ?? userModelGlobal);
          },
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
