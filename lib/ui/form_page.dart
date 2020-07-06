import 'package:demo_features/model/components.dart';
import 'package:demo_features/model/custom_dropdown.dart';
import 'package:demo_features/model/dropdown_stateful.dart';
import 'package:demo_features/model/radio_component.dart';
import 'package:demo_features/model/textbox_stateful.dart';

import 'package:flutter/material.dart';

class FormPage extends StatefulWidget{
  final String name; 
  final String description; 

  FormPage({Key key, @required this.name, @required this.description}) : super(key: key); 

  @override
  _FormPageState createState() => _FormPageState(); 
}

class _FormPageState extends State<FormPage>{

  final _formKey = GlobalKey<FormState>(); 

  List<Map> form1 = [
    {
      "type": "text",
      "label": "First Name", 
      "required": true, 
    },
    {
      "type": "text",
      "label": "Last name",
      "required": false,
    },
    {
      "type": "dropdown", 
      "label": "Country", 
      "dropdownData": {"AUS": "Australia", "CAD": "Canada", "USA": "America"},
      "required": true,
    },
    {
      "type": "radio", 
      "label": "Sex", 
      "required": true, 
      "radioData": {"M": "Male", "F": "Female", "X": "Others"}, 
    },
  ];


  List<Widget> _widgetTranslation(List<Map> data){
    List<Widget> lstWidget = []; 
    TextBoxComponent textBox;
    DropDownComponent dropDown; 
    CustomDropDown cusDropDown; 
    DropDownComponent radioDropDown; 
    RadioComponent radioComponent; 
    Map<String, String> _selectedDropDownValue = {}; 
    List<Map<String, String>> lstUserData = []; 


    for(Map m in data){
      if(m["type"] == "text"){
        textBox = new TextBoxComponent(
          generalData: new GeneralWidget(m["type"], m["label"], m["required"]),
          textBoxValue: (Map<String, String> value){
            setState((){
              /// Everytimes it gets called the lstTextValue will be empty 
              /// and add correspondingly firstname and lastname value again
              lstUserData.add(value);
            });
          });
        lstWidget.add(textBox);
      }

      if(m["type"] == "dropdown"){
        dropDown = new DropDownComponent(
          generalData: new GeneralWidget(m["type"], m["label"], m["required"]),
          dropDownData: m["dropdownData"],
          getDropDownData: (Map<String, String> value){
            setState((){
               lstUserData.add(value);
            });
          });
        lstWidget.add(dropDown);
      }

      if(m["type"] == "radio"){
        radioDropDown = new DropDownComponent(
          generalData: new GeneralWidget(m["type"], m["label"], m["required"]),
          dropDownData: m["radioData"],
          getDropDownData: (Map<String, String> value){
            setState((){
               lstUserData.add(value);
            });
          });
        lstWidget.add(radioDropDown);
      }

      // if(m["type"] == "text"){
      //   textBox = new TextBoxComponent(m["type"], m["label"], m["required"]); 
      //   lstWidget.add(textBox.buildWidget());
      // }

      // if(m["type"] == "dropdown" || m["type"] == "radio"){
      //   //dropDown = new DropDownComponent(m["type"], m["label"], m["required"], m["dropdownData"]);
      //   //lstWidget.add(dropDown.buildWidget());
      //   if(m["type"] == "dropdown"){
      //     cusDropDown = new CustomDropDown(m["type"], m["label"], m["required"], m["dropdownData"]); 
      //     lstWidget.add(cusDropDown.buildWidget());
      //   } else {
      //     radioDropDown = new CustomDropDown(m["type"], m["label"], m["required"], m["radioData"]);
      //     lstWidget.add(radioDropDown.buildWidget());
      //   }
        
      // }

      // if(m["type"] == "radio"){
      //   // radioComponent = new RadioComponent(m["type"], m["label"], m["required"], m["radioData"]); 
      //   // lstWidget.add(radioComponent.buildWidget()); 
      //   radioComponent = new RadioComponent(type: m["type"], label: m["label"], radioData: m["radioData"], onValueChanged: (Map value){
      //     _selectedRadioValue = value; 
      //   },);
        
      //   lstWidget.add(radioComponent);
      // }

    }
    lstWidget.add(
      Container(
        width: 300,
        padding: const EdgeInsets.all(10), 
        child: RaisedButton(
          onPressed: (){
            if(_formKey.currentState.validate()){
              print("Processing Data.....");
              print(lstUserData);
              //print(textBox.getTextBox);
              //print(cusDropDown.getSelectedData);
              //print(radioDropDown.getSelectedData);
              
              
            }
          },
          child: Text("Submit"),
        ),
      ),
    );
    return lstWidget; 
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, 
              child: Center(
                child: Container(
                  width: 350,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1), 
                  ),
                  child: Column(
                    children: _widgetTranslation(form1),
                  ),
                ),
              ),
            ), 
          ),
        ),
      ),
    ); 
  }
}