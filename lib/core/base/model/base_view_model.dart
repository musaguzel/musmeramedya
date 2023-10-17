import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../init/navigation/navigation_service.dart';

abstract class BaseViewModel {
  late BuildContext viewModelContext;



  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  NavigationService navigation = NavigationService.instance;


 /* void launchURL(String navigateUrl) async {
    final Uri url = Uri.parse(navigateUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url,mode: LaunchMode.externalApplication);
    } else {
      throw 'Web sitesi açılamıyor: $navigateUrl';
    }
  }*/


  void setContext(BuildContext context);
  void init();

 /* void playSound(String audioAsset) {
    AssetsAudioPlayer.newPlayer().open(
      Audio(audioAsset),
      autoStart: true,
      showNotification: true,
    );
  }*/
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showsnackbar({required String message,Color? backgroundColor,SnackBarAction? snackBarAction}){
    var snackBar = SnackBar(content: Text(message.toString()),backgroundColor: backgroundColor ?? Colors.white,action: snackBarAction,);
    return ScaffoldMessenger.of(viewModelContext).showSnackBar(snackBar);
  }
}