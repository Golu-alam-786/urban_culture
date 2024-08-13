import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> toast({required String msg}){
  return Fluttertoast.showToast(msg: msg,toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.green,textColor: Colors.white,gravity: ToastGravity.BOTTOM);
}