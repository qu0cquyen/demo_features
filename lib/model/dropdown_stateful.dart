import 'package:demo_features/model/components.dart';
import 'package:flutter/material.dart'; 

class DropDownComponent extends StatefulWidget{

  final GeneralWidget generalData; 
  final Map<String, String> dropDownData; 

  // Callback function 
  final Function(Map<String, String>) getDropDownData; 

  DropDownComponent({Key key, @required this.generalData, @required this.dropDownData, this.getDropDownData}): super(key: key); 

  @override
  _DropDownComponentState createState() => _DropDownComponentState(); 
}

class _DropDownComponentState extends State<DropDownComponent>{

  String selectedValue; 

  @override
  Widget build(BuildContext contxext){
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 0, 
            child: Container(
              width: 100,
              child: Text(widget.generalData.label), 
            ),
            
          ),

          Expanded(
            flex: 1, 
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                hint: widget.generalData.label == "Country"? Text("Select a country") : Text("Gender"),
                value: selectedValue,
                items: widget.dropDownData.keys.map<DropdownMenuItem<String>>((key){
                  return new DropdownMenuItem(
                    value: key, 
                    child: Text(widget.dropDownData[key]),
                  );
                }).toList(),
                onChanged: (value) => selectedValue = value, 
                validator: (value) {
                  if(widget.generalData.isRequired){
                    if(value == null){
                      return widget.generalData.label + " is required."; 
                    } else {
                      widget.getDropDownData({selectedValue: widget.dropDownData[selectedValue]});
                      return null;
                    }
                  } else {
                    return null;
                  }
                }
              ),
            ),      
          ),
        ],
      ),
    ); 

  }
}