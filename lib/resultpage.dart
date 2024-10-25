import 'package:amar_bma/inputpage.dart';
import 'package:flutter/material.dart';
import 'package:amar_bma/resultpage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
class Resultpage extends StatelessWidget {

  final String age;
  final String height;
  final String weight;
  final String gender;

  //double bmi=AmarBMI(weight as double,height as double);

  Resultpage({
  required this.age,
  required this.height,
  required this.weight,
  required this.gender,
  });




  @override
  Widget build(BuildContext context) {

    double heightinMeter=double.parse(height);
    double weightinKg=double.parse(weight);
    double bmi=AmarBMI(weightinKg, heightinMeter);
    String? result=OutputStatus(bmi);
    
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Inputpage()));
              },
              child: Container(
                height: 80,
                width: 250,
                decoration:BoxDecoration(
                  color: Colors.indigo[600],   ///
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                ),

                child: Center(
                  child: Text("Amar BMA",
                    style: GoogleFonts.bowlbyOne(fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),),
                ),
              ),
            ),
            SizedBox(height: 20,),


            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                SvgPicture.asset("assets/icons/date.svg",height: 30,width: 30,),
                SizedBox(width: 5,),
                Text("Age : $age",style: GoogleFonts.teko(fontSize: 20),textAlign: TextAlign.left,),
              ],
            ),
            SizedBox(height: 10,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                //Icon(Icons.,color: Colors.green,),

                SvgPicture.asset("assets/icons/height.svg",height: 30,width: 30,),
                SizedBox(width: 5,),
                Text("Height : $height",style: GoogleFonts.teko(fontSize: 20),textAlign: TextAlign.left,),
              ],
            ),
            SizedBox(height: 10,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SvgPicture.asset("assets/icons/weight.svg",height: 30,width: 30,),
                SizedBox(width: 5),
                Text("Weight : $weight",style: GoogleFonts.teko(fontSize: 20),)
              ],
            ),
            SizedBox(height: 10,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/gender.svg",height: 30,width: 30,),
                SizedBox(width: 5,),
                Text("Gender : $gender",style: GoogleFonts.teko(fontSize: 20),)
              ],
            ),
            SizedBox(height: 10,),

            SizedBox(height: 10,),
            Container(
              height: 40,
              width: 350,
              decoration:BoxDecoration(
                color: Colors.indigo[400],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),

              child: Center(
                child: Text("You Are $result",
                  style: GoogleFonts.changa(fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),),
              ),
            ),
            SizedBox(height: 20,),
            
            Container(
              child: Text("Your BMI is ${bmi.toStringAsFixed(2)}",
              style: GoogleFonts.silkscreen(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
            ),

            SizedBox(height: 60,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Inputpage()));
              },
              child:Container(
                height: 50,
                width: 50,
                decoration:BoxDecoration(
                  color: Colors.indigo[700],
                  shape: BoxShape.circle,

                ),

                child: Icon(Icons.home_rounded,weight: 50,color: Colors.white70,),
              ),
              //
            ),







          ],
        ),
      ),
    );
  }
  double AmarBMI(double weight,double height)
  {
    height=height*0.01;
    double nw=weight/(height*height);
    print("$height");
    return weight/(height*height);
  }

  String? OutputStatus(double bmi)
  {
    String output="";
    if(bmi<=18.4)
      {
        output="Underweight";
      }
    else if(bmi>=18.5 && bmi<=24.9)
      {
        output="Normal Weight";
      }
    else if(bmi>=25 && bmi<=39.9)
      {
        output="Overweight";
      }
    else
      {
        output="Obese";
      }
    return output;
  }

}
