import 'package:flutter/material.dart';
import 'package:multi_user_app/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Home!'),
        automaticallyImplyLeading: false,
      ),
      body: InkWell(
        onTap: () async {
          SharedPreferences sp = await SharedPreferences.getInstance();

          sp.clear();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(color: Colors.teal),
          child: Center(
            child: Text(
              'CLICK',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
