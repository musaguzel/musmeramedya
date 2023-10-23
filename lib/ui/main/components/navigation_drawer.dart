import 'package:flutter/material.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';


class NavigationDrawerMain extends StatelessWidget {
  const NavigationDrawerMain({super.key});

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

        SizedBox(height: 20,),
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
          title: Text("home"),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("home"),
          onTap: (){},
        ),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("home"),
          onTap: (){},
        ),ListTile(
          leading: Icon(Icons.add),
          title: Text("home"),
          onTap: (){},
        ),
        const Divider(color: Colors.pink,),
        ListTile(
          leading: Icon(Icons.add),
          title: Text("home"),
          onTap: (){},
        ),



      ],
    ),
  );


}
