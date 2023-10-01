import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

class CommonUtil {
  static const String apiUrl = "http://192.160.1.100:4242";
  static const String stripeUserCreate = "/add/user";
  static const String checkOut = "/checkOut";

  static backendCall(User user, String endPoint) async {
    String token = await user.getIdToken();
    return http.post(Uri.parse(apiUrl + endPoint), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
  }

  static Future<String> checkoutFlow(user) async {
    String error = "";
    try {
      Response response = await backendCall(user, checkOut);
      var json = jsonDecode(response.body);
      SetupPaymentSheetParameters parameters = SetupPaymentSheetParameters(
        customerId: json["customer"],
        paymentIntentClientSecret: json["paymentIntent"],
        merchantDisplayName: "ubuntu villages",
      );
      Stripe.instance.initPaymentSheet(paymentSheetParameters: parameters);
      await Future.delayed(const Duration(seconds: 1));
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      log(101);
      error = e.error.message.toString();
    } catch (e) {
      log(101);
      error = "Network error,try after some time";
    }
    return error;
  }

  static showAlert(context, String heading, String body) {
    showDialog<String>(
        context: context, builder: (BuildContext context) => AlertDialog(
      title: Text(heading),
      content: Text(body),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context,"ok");
        }, child: const Text("Ok"))
      ],
    ));
  }
}
