import 'package:amar_bma/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
class Inputpage extends StatefulWidget {
  const Inputpage({super.key});

  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {

  TextEditingController age=TextEditingController();
  TextEditingController height=TextEditingController();
  TextEditingController weight=TextEditingController();
  String? gender="Male";

  var select=['Male','Female'];
  var currentSelected='Male';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Container(
              height: 80,
              width: 300,
              decoration:BoxDecoration(
                color: Colors.green[400],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
              ),

              child: Center(
                child: Text("Amar BMA",
                  style: GoogleFonts.bowlbyOne(fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),
              ),
            ),
            SizedBox(height: 40,),

            //age
            Row(

              children: [

                SvgPicture.asset("assets/icons/date.svg",height: 30,width: 30,),
                SizedBox(width: 5,),
                Text("Age",style: GoogleFonts.teko(fontSize: 20),textAlign: TextAlign.left,),
              ],
            ),
            SizedBox(

              width: 200,
              child: TextField(
                controller: age,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 3)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2)),
                  //labelText: "Age",
                  hintText: "Enter your age : ",
                  //prefixIcon: Icon(Icons.calendar_month),
                ),

              ),
            ),
            SizedBox(height: 40),

            //height
            Row(

              children: [

                //Icon(Icons.,color: Colors.green,),

                SvgPicture.asset("assets/icons/height.svg",height: 30,width: 30,),
                SizedBox(width: 5,),
                Text("Height",style: GoogleFonts.teko(fontSize: 20),textAlign: TextAlign.left,),
              ],
            ),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(

                  width: 200,
                  child: TextField(
                    controller: height,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 3)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2)),
                      labelText: "Height in cm",
                      //hintText: "Enter your age : ",
                      //prefixIcon: Icon(Icons.le),
                    ),

                  ),
                ),
                SizedBox(width: 10),
                                          //inch
                // SizedBox(
                //
                //   width: 100,
                //   child: TextField(
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 3)),
                //       focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2)),
                //       labelText: "Inch",
                //       //hintText: "Enter your age : ",
                //       //prefixIcon: Icon(Icons.calendar_month),
                //     ),
                //
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 40,),

            //Weight
            Row(
              children: [
                SvgPicture.asset("assets/icons/weight.svg",height: 30,width: 30,),
                SizedBox(width: 5),
                Text("Weight",style: GoogleFonts.teko(fontSize: 20),)
              ],
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: weight,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 3)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 2)),
                  hintText: "Enter Weight in Kg",
                ),
              ),
            ),
            SizedBox(height: 40,),

            //Gender
            Row(
              children: [
                SvgPicture.asset("assets/icons/gender.svg",height: 30,width: 30,),
                SizedBox(width: 5,),
                Text("Gender",style: GoogleFonts.teko(fontSize: 20),)
              ],
            ),
            Container(
              width: 200,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.green,width: 3),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(

                  isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.green,),
                    iconSize: 24,
                    items: select.map((String Item){
                      return DropdownMenuItem<String>(
                          value:Item,
                          child:Text(Item));
                    }).toList(),
                
                    onChanged: (String? newSelected){
                      setState(() {
                        if(newSelected!=null)
                          {
                            this.currentSelected=newSelected;
                          }
                        gender=newSelected;
                      });
                    },
                  value: currentSelected,
                    ),
              ),
            ),
            SizedBox(height: 10,),



            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: (){
                  String a=age.text;
                  String b=height.text;
                  String c=weight.text;
                  String d=gender?.toString()??"Male";
                  print("Age : $a   Height : $b    weight : $c    gender : $d");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Resultpage(
                    age : a,
                    height : b,
                    weight : c,
                    gender : d,
                  )));
                },
                child: Text("Submit",style: GoogleFonts.teko(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),),
            ),





          ],
        ),
      ),
    );
  }
}
