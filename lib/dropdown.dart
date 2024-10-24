import 'package:flutter/material.dart';
class Dropdownn extends StatefulWidget {
  const Dropdownn({super.key});

  @override
  State<Dropdownn> createState() => _DropdownnState();
}

class _DropdownnState extends State<Dropdownn> {
  var select=['Male','Female'];
  var currentSelected='Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("DropDown Test")),
      ),
      body: Column(
        children: [
          DropdownButton<String>(

              items: select.map((String DropDownItem){
                return DropdownMenuItem<String>(
                    value:DropDownItem,
                    child: Text(DropDownItem) );
              }).toList(),
              onChanged: (String? newSelected){
                setState(() {
                  if (newSelected != null) {
                    currentSelected = newSelected; // Only assign if not null
                  }
                });

              },
            value: currentSelected,

          ),

        ],
      ),
    );
  }
}
