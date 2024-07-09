import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/employee.dart';
import 'package:flutter_crud/service/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

Stream? EmployeeStream;
getontheload()async{
  EmployeeStream=await DatabaseMethods().getEmployeeDetails();
  setState(() {
    
  });
}

@override
  void initState(){
    getontheload();
    super.initState();
  }

Widget allEmployeeDetails(){
  return StreamBuilder(
   stream:EmployeeStream, builder: (context,AsyncSnapshot snapshot){
    return snapshot.hasData? 
    ListView.builder(
     itemCount: snapshot.data.docs.length, itemBuilder: (context,Index){
      DocumentSnapshot ds=snapshot.data.docs[Index];
      return Container(
        margin:EdgeInsets.only(bottom:30.0),
        child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("Name:"+ds["Name"],style:TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold)),
                  Text("Age:"+ds["Age"],style:TextStyle(color: Colors.yellow, fontSize: 20.0,fontWeight: FontWeight.bold)),
                  Text("Location:"+ds["Location"],style:TextStyle(color: Colors.blue, fontSize: 20.0,fontWeight: FontWeight.bold))
                ],),
              ),
            ),
      );
      
    }):Container();
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=>Employee()));
      },child: Icon(Icons.add),),
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Flutter",
          style: TextStyle(color:Colors.blue,
          fontSize: 50.0,
          fontWeight: FontWeight.bold),
          ),
          
          Text(
          "Firebase",
          style: TextStyle(
          color:Colors.yellow,
          fontSize: 50.0,
          fontWeight: FontWeight.bold),
          ),
      ],),),
      body:Container(
        margin:EdgeInsets.only(left:30.0,right: 30.0,top: 40.0),
        child: Column(children: [
          Expanded(child: allEmployeeDetails())
        ],),
      )
    );
  }
}