import 'package:demo_features/model/components.dart';
import 'package:demo_features/model/text_component.dart';
import 'package:flutter/material.dart'; 

class TextBoxComponent extends StatefulWidget{
  final GeneralWidget generalData; 

  // Callback Function 
  final Function(Map<String, String>) textBoxValue; 

  TextBoxComponent({Key key, @required this.generalData, this.textBoxValue}): super(key: key); 

  @override
  _TextBoxComponentState createState() => _TextBoxComponentState(); 
}

class _TextBoxComponentState extends State<TextBoxComponent>{
  final TextEditingController _controller = new TextEditingController(); 

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10), 
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: widget.generalData.label, 
        ),
        validator: (value){
          if(value.isEmpty){
            if(widget.generalData.isRequired){
              return widget.generalData.label + " is required "; 
            } else {return null;}
          } else {
            // Return value
            widget.textBoxValue({widget.generalData.label: _controller.text});
            return null;
            
          }
        }
      ),
    ); 
  }
}