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
    {
      "type": "submit", 
      "label": "Submit", 
    },
  ];


  List<Widget> _widgetTranslation(List<Map> data){
    List<Widget> lstWidget = []; 

    for(Map m in data){
      if(m["type"] == "text"){
        lstWidget.add(Container(
          width: 300,
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: m["label"],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: m["required"]? (value){
              if(value.isEmpty){
                return m["label"] + " is Empty"; 
              }
              return null; 
            } : null, 
          ),
        )); 
      }

      if(m["type"] == "dropdown"){
        //print(m["dropdownData"].values); 
        lstWidget.add(
          Container(
            width: 300,
            padding: const EdgeInsets.all(10), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 0, 
                  child: Text(m["label"]),
                ),
                
                SizedBox(width: 10,), 

                Expanded(
                  flex: 1, 
                  child: DropdownButton<String>(
                    value: m["dropdownData"].values.first, 
                    items: m["dropdownData"].values.map<DropdownMenuItem<String>>((value){
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(), 
                    onChanged: (_){},
                  ),
                ),
              ],
            ),
          ),
        ); 
      }

      if(m["type"] == "submit"){
        lstWidget.add(
          Container(
            width: 300,
            padding: const EdgeInsets.all(10), 
            child: RaisedButton(
              onPressed: (){
                if(_formKey.currentState.validate()){
                 print("Processing Data.....");
                }
              },
              child: Text(m["label"]),
            ),
          ),
        );
      }
    }
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