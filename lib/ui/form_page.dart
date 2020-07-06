import 'package:demo_features/model/custom_dropdown.dart';
import 'package:demo_features/model/dropdown_component.dart';
import 'package:demo_features/model/radio_component.dart';
import 'package:demo_features/model/text_component.dart';
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
      "required": false, // Doesn't matter with the current implementation
    },
    {
      "type": "radio", 
      "label": "Sex", 
      "radioData": {"M": "Male", "F": "Female", "X": "Others"}, 
    },
  ];


  List<Widget> _widgetTranslation(List<Map> data){
    List<Widget> lstWidget = []; 
    TextBoxComponent textBox;
    DropDownComponent dropDown; 
    CustomDropDown cusDropDown; 
    RadioComponent radioComponent; 

    for(Map m in data){
      if(m["type"] == "text"){
        textBox = new TextBoxComponent(m["type"], m["label"], m["required"]); 
        lstWidget.add(textBox.buildWidget());
      }

      if(m["type"] == "dropdown"){
        //dropDown = new DropDownComponent(m["type"], m["label"], m["required"], m["dropdownData"]);
        //lstWidget.add(dropDown.buildWidget());
        cusDropDown = new CustomDropDown(m["type"], m["label"], m["required"], m["dropdownData"]); 
        lstWidget.add(cusDropDown.buildWidget());
      }

      if(m["type"] == "radio"){
        // radioComponent = new RadioComponent(m["type"], m["label"], m["required"], m["radioData"]); 
        // lstWidget.add(radioComponent.buildWidget()); 
        radioComponent = new RadioComponent(type: m["type"], label: m["label"], radioData: m["radioData"]);
        lstWidget.add(radioComponent);
      }

    }
    lstWidget.add(
      Container(
        width: 300,
        padding: const EdgeInsets.all(10), 
        child: RaisedButton(
          onPressed: (){
            if(_formKey.currentState.validate()){
              print("Processing Data.....");
              print(textBox.getTextBox);
              print(cusDropDown.getSelectedData);
              
              
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
      
      body: SafeArea(
        child: Form(
          key: _formKey, 
          child: Center(
            child: Container(
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
    ); 
  }
}