import 'dart:convert';
import 'package:bubble_tea_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class StripePayment {
  final String amount;
  final Function(bool value) status;
  StripePayment(this.status, {required this.amount});
  Map<String,dynamic>? paymentIntent;
  void makePayment() async{
    try{
      paymentIntent = await createPaymentIntent();

      var gpay = PaymentSheetGooglePay(merchantCountryCode: "IN",
        currencyCode: "INR",
        testEnv: true,
      );
      Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent!["client_secret"],
        style: ThemeMode.light,
        merchantDisplayName: "Ayush",
        googlePay: gpay
      ));
      displayPaymentSheet();
    }catch (e){

    }
  }


  void displayPaymentSheet()async{
    try{
      await Stripe.instance.presentPaymentSheet();
      print("Done");
      status(true);
    }catch (e){
      print("Failed");
      status(false);
    }
  }


 createPaymentIntent() async{
    try{
      Map<String,dynamic> body ={
        "amount" : amount,
        "currency" : "INR",
      };
      http.Response response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
      body: body,
      headers: {
            "Authorization" : "Bearer sk_test_51Nsq4iSGBi78HbmYUtODK8bV67SDDWkWtjk47YkDxTGikQPQKM0y5tfF3yz0t9zmWMLigqUmMzSrZmJoEwLCenQU00zFucjDMh",
        "Content-Type" : "application/x-www-form-urlencoded"
      });
      return json.decode(response.body);

    } catch (e){
        throw Exception(e.toString());
    }
  }
}

