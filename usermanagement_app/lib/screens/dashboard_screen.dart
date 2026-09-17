import 'package:flutter/material.dart';
import 'package:usermanagement_app/db/db_helper.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  //load all users
  void _loadUsers() async {
    final data = await DatabaseHelper().getUsers();
    setState(() {
      users = data;
    });
  }

  //delete user
  void _deleteUser(int id) async {
    await DatabaseHelper().deleteUser(id);
    _loadUsers(); //Refresh the list
  }

  //update the user , we will navigate to the registration page
  void _editUser(Map<String, dynamic> user, int userId) async {
    Navigator.pushNamed(
      context,
      '/register',
      arguments: {
        'id': userId,
        'fullname': user['fullname'],
        'email': user['email'],
        'password': user['password']
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]['fullname']),
            subtitle: Text(users[index]['email']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => _editUser(users[index], users[index]['id']),
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteUser(users[index]['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/register')},
        child: Icon(Icons.add),
      ),
    );
  }
}
