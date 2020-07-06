import 'package:demo_features/model/components.dart';
import 'package:flutter/material.dart'; 


class RadioComponent extends StatefulWidget{
  final String type; 
  final String label; 
  final Map<String, String> radioData; 

  // Callback function return current Selected value 
  final Function(Map<String, String>) onValueChanged; 

  RadioComponent({Key key, @required this.type, @required this.label, @required this.radioData, @required this.onValueChanged}) : super(key: key); 

  @override
  _RadioComponentState createState() => _RadioComponentState(); 
}

class _RadioComponentState extends State<RadioComponent>{

  Map<String, String> _currentSelected;

  @override
  void initState(){
    super.initState(); 
    _currentSelected = {widget.radioData.keys.first : widget.radioData.values.first};
  }

  List<Widget> buildRadio(){
    List<Widget> lstRadio = []; 

    
    widget.radioData.forEach((key, value){
      lstRadio.add(
        Expanded(flex: 1, 
        
          child: RadioListTile(
          title: Text(value), 
          value: key, 
          groupValue: _currentSelected.keys.first, 
          onChanged: (newValue){
            setState((){
              _currentSelected = {newValue: widget.radioData[newValue]}; 

              // Callback function return current Selected Value
              widget.onValueChanged(_currentSelected);
            });
          },
        ),
        
        ),
        
        
      );
    });
    return lstRadio; 
  }

  @override 
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10),
      width: 300,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 0, 
            child: Text(widget.label),
          ),

          Expanded(
            flex: 1, 
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: buildRadio(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}