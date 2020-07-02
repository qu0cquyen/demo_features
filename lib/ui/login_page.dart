import 'package:flutter/material.dart'; 

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState(); 
}

class _LoginPageState extends State<LoginPage>{

  TextEditingController username_controller = new TextEditingController(); 
  TextEditingController password_controller = new TextEditingController(); 


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.cyan,
      body:  Center(
        child: Container(
          margin: const EdgeInsets.only(top: 200),
          width: 250,
          child: Column(
            children: <Widget>[
              // Title 
              Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 30,
                ), 
              ),

              SizedBox(height: 20),               

              TextFormField(
                controller: username_controller, 
                decoration: InputDecoration(
                  hintText: "User name", 
                  hintStyle: TextStyle(color: Colors.white), 
                  prefixIcon: Icon(Icons.person, color: Colors.white), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ), 
              
              SizedBox(height: 10),

              TextFormField(
                controller: password_controller, 
                decoration: InputDecoration(
                  hintText: "Password", 
                  hintStyle: TextStyle(color: Colors.white), 
                  prefixIcon: Icon(Icons.lock, color: Colors.white), 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              
              SizedBox(height: 10), 

              RaisedButton(
                onPressed: (){}, 
                elevation: 10,
                child: Text("SIGIN"), 
              ),

              SizedBox(height: 10), 
              
              // Should use Rich Text 
              Text("Don't have an acount", style: TextStyle(color: Colors.white)),
              Text("SIGN UP", style: TextStyle(color: Colors.white)), 

            ],
          ), 
        ),
      ),
    ); 
  }
}