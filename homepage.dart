


import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webapp/new_user_view.dart';
import 'package:flutter_webapp/user_detail_view.dart';

import 'api_service.dart';

  //Import the ApiService file;

class HomePage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List'),backgroundColor: Color.fromARGB(255, 9, 8, 40),shadowColor: const Color.fromARGB(255, 203, 203, 203),elevation: 10,),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton:  FloatingActionButton(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewUserView()),
                      
                    );
                },
                child: Icon(Icons.add),
                ),
                
      body: FutureBuilder(
        // Fetch data from the API using ApiService
        future:   _checkInternetConnectivity().then((_) => ApiService.fetchData('users')),
        
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
            
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Data has been successfully loaded
            List<dynamic> users = snapshot.data ?? [];
            return Column(
              children: [
                
                
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> user = users[index];
                      var inc =index+1;
                      return ListTile(
                        
                        shape: Border.all(width: .1,),
                
                        leading: Text('$inc',),
                      
                       title: Text(user['name'],),
                       
                        subtitle: Text(user['email'],style: TextStyle(color: Colors.blue),),
                        trailing: Text(user['gender']),
                        titleTextStyle: TextStyle(color:  Color.fromARGB(255, 82, 81, 81),fontSize: 20),
                        leadingAndTrailingTextStyle: TextStyle(backgroundColor: Color.fromARGB(255, 250, 246, 246), fontSize: 18,color: Color.fromARGB(255, 15, 185, 241)),
                        subtitleTextStyle: TextStyle(color: const Color.fromARGB(255, 23, 38, 51)),
                        onTap: () {
                         Navigator.push(
                           context,
                          MaterialPageRoute(
                           builder: (context) => UserDetailView(user),
                          ),
                         );
                         // _viewUser(context,user[index]);
                        },
                        
                       
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}



Future<void> _checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    var context;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('No Internet Connection'),
          content: Text('Please check your internet connection and try again.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


/*void _viewUser(BuildContext context,User user) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(user.name),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Email: ${user.email}'),
            
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}*/










