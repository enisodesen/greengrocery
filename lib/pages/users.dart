import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../hive/user.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  late List<UserList> _users;
  late Box<UserList> _box;
  @override
  void initState() {
    super.initState();
    _box = Hive.box<UserList>('userBox');
    _users = _box.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      setState(() {
                        _users.removeAt(index);
                        _box.deleteAt(index);
                      });
                    },
                    backgroundColor: Colors.grey.shade700,
                    icon: Icons.delete,
                  ),
                ],
              ),
              child: Container(
                color: Colors.yellow.shade200,
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    'Name: ${_users[index].name}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    'Username: ${_users[index].userName}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
