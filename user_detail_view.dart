import 'package:flutter/material.dart';
import 'package:flutter_webapp/edit_user_view.dart';

class UserDetailView extends StatefulWidget {
   final Map<String, dynamic> user;

 const UserDetailView(this.user, {super.key});

  @override
   _UserDetailViewState createState() => _UserDetailViewState();
}

 class _UserDetailViewState extends State<UserDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text('User Detail'),backgroundColor: Color.fromARGB(255, 9, 8, 40),shadowColor: Colors.blueGrey,elevation: 10,

      actions: [
    IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditUserView(widget.user),
          ),
        );
      },
    ),
  ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          //color: Colors.green,
          height: 250,
          width: 500,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),
          margin: EdgeInsets.symmetric(vertical: 30),
          padding: EdgeInsets.all(15),
          child: Column(
              
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Text('Name:  ${widget.user['name']}',style: TextStyle(fontSize: 25,color: Colors.blue,letterSpacing: 3,wordSpacing:2),),
              SizedBox(height: 20,),
              Text('Email: ${widget.user['email']}',style: TextStyle(fontSize: 17),),
              SizedBox(height: 10,),
              Text('Geneder: ${widget.user['gender']}',style: TextStyle(fontSize: 17),),
              SizedBox(height: 10,),
              Text('Status: ${widget.user['status']}',style: TextStyle(fontSize: 19),),
            ],
          ),
        ),
      ),
      
    );
  }
}
