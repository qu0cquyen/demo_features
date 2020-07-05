import 'package:demo_features/model/dropdown_component.dart';
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
      "required": false, 
    },
  ];


  List<Widget> _widgetTranslation(List<Map> data){
    List<Widget> lstWidget = []; 
    TextBoxComponent textBox;
    DropDownComponent dropDown; 

    for(Map m in data){
      if(m["type"] == "text"){
        textBox = new TextBoxComponent(m["type"], m["label"], m["required"]); 
        lstWidget.add(textBox.buildWidget());
      }

      if(m["type"] == "dropdown"){
        dropDown = new DropDownComponent(m["type"], m["label"], m["required"], m["dropdownData"]);
        lstWidget.add(dropDown.buildWidget());




        //print(m["dropdownData"].values); 
        // lstWidget.add(
        //   Container(
        //     width: 300,
        //     padding: const EdgeInsets.all(10), 
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: <Widget>[
        //         Expanded(
        //           flex: 0, 
        //           child: Text(m["label"]),
        //         ),
                
        //         SizedBox(width: 10,), 

        //         Expanded(
        //           flex: 1, 
        //           child: DropdownButton<String>(
        //             value: m["dropdownData"].values.first, 
        //             items: m["dropdownData"].values.map<DropdownMenuItem<String>>((value){
        //               return new DropdownMenuItem<String>(
        //                 value: value,
        //                 child: Text(value),
        //               );
        //             }).toList(), 
        //             onChanged: (_){},
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ); 
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