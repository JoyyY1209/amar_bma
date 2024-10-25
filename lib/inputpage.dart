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
  TextEditingController age = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  String? gender = "Male";

  var select = ['Male', 'Female'];
  var currentSelected = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              height: 80,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.indigo[400],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  "Amar BMI",
                  style: GoogleFonts.bowlbyOne(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Age Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                SizedBox(width: 35, child: SvgPicture.asset("assets/icons/date.svg", height: 30)),
                SizedBox(width: 50, child: Text("Age", style: GoogleFonts.teko(fontSize: 20))),
                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: age,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.withOpacity(.5), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.withOpacity(.5), width: 2)),
                      hintText: "Enter age",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Height Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                SizedBox(width: 35, child: SvgPicture.asset("assets/icons/height.svg", height: 30)),
                SizedBox(width: 50, child: Text("Height", style: GoogleFonts.teko(fontSize: 20))),
                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: height,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.withOpacity(.5), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.withOpacity(.5), width: 2)),
                      labelText: "Height in cm",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Weight Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                SizedBox(width: 35, child: SvgPicture.asset("assets/icons/weight.svg", height: 30)),
                SizedBox(width: 50, child: Text("Weight", style: GoogleFonts.teko(fontSize: 20))),
                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: weight,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.withOpacity(.5), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.withOpacity(.5), width: 2)),
                      hintText: "Enter weight in kg",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Gender Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                SizedBox(width: 35, child: SvgPicture.asset("assets/icons/gender.svg", height: 30)),
                SizedBox(width: 50, child: Text("Gender", style: GoogleFonts.teko(fontSize: 20))),
                Container(
                  width: 180,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.indigo.withOpacity(.5), width: 2),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.indigo.withOpacity(.8)),
                      items: select.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newSelected) {
                        setState(() {
                          currentSelected = newSelected!;
                          gender = newSelected;
                        });
                      },
                      value: currentSelected,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: 120,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  String a = age.text;
                  String b = height.text;
                  String c = weight.text;
                  String d = gender ?? "Male";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Resultpage(
                        age: a,
                        height: b,
                        weight: c,
                        gender: d,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Submit",
                  style: GoogleFonts.teko(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
