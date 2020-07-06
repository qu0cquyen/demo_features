import 'package:demo_features/model/components.dart';
import 'package:flutter/material.dart'; 

class CustomDropDown extends GeneralWidget{
  Map<String, String> _dropDownData = {}; 

  Map<String, String> _selectedData = {}; 

  CustomDropDown(String type, String label, bool isRequired, this._dropDownData): super(type, label, isRequired){
    this._selectedData = {_dropDownData.keys.first: _dropDownData.values.first}; 
  }

  Map<String, String> get getDropDownData => this._dropDownData; 

  Map<String, String> get getSelectedData => this._selectedData; 

  Widget buildWidget(){
    return Container(
      padding: const EdgeInsets.all(10), 
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 0, 
            child: Text(label), 
          ),

          SizedBox(width: 20,),

          Expanded(
            flex: 1, 
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                hint: Text("Select A Country"), 
                value: _selectedData.keys.first, 
                items: this._dropDownData.keys.map<DropdownMenuItem<String>>((key){
                  return new DropdownMenuItem(
                    value: key, 
                    child: Text(this._dropDownData[key]),
                  );
                }).toList(),
                onChanged: (newValue){
                  this._selectedData = {newValue: this._dropDownData[newValue]}; 
                },
                validator: (value){
                  if(isRequired){
                    if(value.isEmpty){
                      return label + " is missing information."; 
                    } else { 
                      return null; 
                    }
                  }
                  return null; 
                }
              ),
            ),
          ),
        ],
      ),
    ); 
  }
}