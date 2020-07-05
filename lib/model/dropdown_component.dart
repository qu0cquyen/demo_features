import 'package:demo_features/model/components.dart';
import 'package:flutter/material.dart'; 

class DropDownComponent extends GeneralWidget{
  Map<String, String> _dropDownData = {}; 

  Map<String, String> _selectedData = {}; 

  DropDownComponent(String type, String label, bool isRequired, this._dropDownData): super(type, label, isRequired){
    this._selectedData = {_dropDownData.keys.first: _dropDownData.values.first}; 
  }

  Map<String, String> get getDropDownData => this._dropDownData; 

  Map<String, String> get getSelectedData => this._selectedData; 

  Widget buildWidget(){
    return(
      Container(
        width: 300,
        padding: const EdgeInsets.all(10), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 0, 
              child: Text(label),
            ),
            
            SizedBox(width: 20,), 

            Expanded(
              flex: 1, 
              child: DropdownButton<String>(
                value: "CAD",//this._selectedData.keys.first, 
                items: this._dropDownData.keys.map<DropdownMenuItem<String>>((key){
                  return new DropdownMenuItem<String>(
                    value: key, //this._dropDownData.keys.firstWhere((key) => this._dropDownData[key] == value),
                    child: Text(this._dropDownData[key]),
                  );
                }).toList(), 
                onChanged: (newValue){
                  this._selectedData = {newValue : this._dropDownData[newValue]}; 
                  
                  print(_selectedData.keys.first);
                  //this._selectedData.update(this._dropDownData, (value) => newValue);
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}