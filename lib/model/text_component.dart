import 'package:demo_features/model/components.dart';
import 'package:flutter/material.dart'; 

class TextBoxComponent extends GeneralWidget{
  static Map<String, String> boxValue = {}; 

  final TextEditingController _controller = new TextEditingController(); 
  
  TextBoxComponent(String type, String label, bool isRequired) : super(type, label, isRequired);

  Map<String, String> get getTextBox => boxValue;

  void _checkExistingElement(Map mapBox, String label, String value){
    if(mapBox.containsKey(label)){
      if(mapBox[label] != value){
        mapBox[label] = value; 
      }
    } else {
      mapBox[label] = value; 
    }
  }

  Widget buildWidget(){
    
    return  Container(
      padding: const EdgeInsets.all(10), 
      width: 300,
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: label, 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value){
          _checkExistingElement(boxValue, label, value);
          if(isRequired){
            if(value.isEmpty){
              return label + " is required "; 
            }          
            return null; 
          } else {
            return null; 
          }
          
        },
        // validator: isRequired? (value){
        //   if(value.isEmpty){
        //     return label + " is required "; 
        //   }
        //   return null;
        // } : null, 
      ),
    ); 
  }

  

  // //String get textValue => "${_controller.text}";
  // void printOut(){
  //  // print(_values);
  //  print(number);
  // }
  
}