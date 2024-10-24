import 'dart:async';

import 'package:amar_bma/inputpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTimer() async{       //ei funtion ta splash screen kotokkhn thakbe oitar jonno
    Timer(Duration(seconds: 1),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Inputpage()));

    });
  }

  @override
  void initState() {     //ininstate function hocche ,application open korle,shobar prothome eta call hobe,startimer er age eta call hove,etar vhitor starttimer call hobe
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:Image.asset("assets/images/BMI.png",height: 100,width: 100,),
            ),

            // ClipOval(
            //   child:Image.asset("assets/images/BMI.png",height: 100,width: 100,),
            //
            // ),
            //Image.asset("assets/images/BMI.png",height: 100,width: 100,),
            SizedBox(height: 10,),
            Text("Amar BMA",
            style: GoogleFonts.dancingScript(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.green[500],
            ),),
            SizedBox(height: 10,),
            CircularProgressIndicator(
              color: Colors.green,
            ),

            //Spacer(),
            Text("Shasthoi Shokol Shukher MUL",style: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.green[300],
            )),
          ],
        ),
      ),
    );
  }
}
