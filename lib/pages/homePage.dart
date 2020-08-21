import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:staticdatafetching/pages/profile_details.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<FormState> _globalKey=GlobalKey<FormState>();

  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();

  List<String> city=["Dharan","Kathmandu","Butwal","Hetauda","NEpalgunj"];
  String selectedCity="Dharan";

  String groupvalue="Male";

  bool isChecked1=false;
  bool isChecked2=false;
  bool isChecked3=false;

  List course=[];


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Form Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: RequiredValidator(errorText: "Please Enter FullName"),
                          controller: name,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Full Name",
                          ),

                        ),
                        TextFormField(
                          validator: RequiredValidator(errorText: "Please Enter phone"),
                          autovalidate: true,
                          controller: phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: "phone",
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        DropdownButton(
                          isExpanded: true,
                          value: selectedCity,
                            items: city.map((String value){
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value));
                            },).toList(),
                            onChanged: (String value){
                              setState(() {
                                this.selectedCity=value;
                              });
                              }
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                    value: "Male",
                                    groupValue: groupvalue,
                                    onChanged: (value){
                                      setState(() {
                                        this.groupvalue=value;
                                      });
                                    },
                                  ),
                                  Text("Male"),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Radio(
                                    value: "Female",
                                    groupValue: groupvalue,
                                    onChanged: (value){
                                      setState(() {
                                        this.groupvalue=value;
                                      });
                                    },
                                  ),
                                  Text("Female")
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    value:isChecked1,
                                    onChanged: (value){
                                      setState(() {
                                        this.isChecked1=value;
                                        if(isChecked1==true){
                                          course.add("Flutter");
                                        }else{
                                          course.remove("Flutter");
                                        }
                                      });
                                    },
                                  ),
                                  Text("Flutter")
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: isChecked2,
                                    onChanged: (value){
                                      setState(() {
                                        this.isChecked2=value;
                                        if(isChecked2==true){
                                          course.add("C++");
                                        }else{
                                          course.remove("C++");
                                        }
                                      });
                                    },
                                  ),
                                  Text("C++")
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    value:isChecked3,
                                    onChanged: (value){
                                      setState(() {
                                        this.isChecked3=value;
                                        if(isChecked3==true){
                                          course.add("Dart");
                                        }else{
                                          course.remove("Dart");
                                        }
                                      });
                                    },
                                  ),
                                  Text("Dart")
                                ],
                              ),
                            ),
                          ],
                        ),

                        RaisedButton(
                          child: Text('Submit'),
                            onPressed: () {
                            if(_globalKey.currentState.validate()){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileDetails(name: name.text,phone: phone.text,city: selectedCity,gender: groupvalue,course: course,)));
                            }
                            }
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
