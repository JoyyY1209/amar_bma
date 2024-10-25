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
    Timer(Duration(seconds: 5),(){
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
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:Image.asset("assets/images/BMI.png",height: 70,width: 70,),
            ),

            // ClipOval(
            //   child:Image.asset("assets/images/BMI.png",height: 100,width: 100,),
            //
            // ),
            //Image.asset("assets/images/BMI.png",height: 100,width: 100,),
            SizedBox(height: 10,),
            Container(
              height: 60,
              width: 180,
              decoration: BoxDecoration(
                //color: Colors.indigo[400],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  "Amar BMI",
                  style: GoogleFonts.bowlbyOne(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            CircularProgressIndicator(
              color: Colors.indigo.withOpacity(.5),
            ),

            //Spacer(),
            SizedBox(height: 50,),
            Text("Shasthoi Shokol Shukher MUL",style: GoogleFonts.acme(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.indigo[400],
            )),

          ],
        ),
      ),
    );
  }
}
