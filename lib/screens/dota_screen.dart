import 'package:flutter/material.dart';
import 'package:multi_user_app/constants.dart';
import 'package:multi_user_app/screens/login_screen.dart';
import 'package:multi_user_app/widgets/my_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DotaScreen extends StatefulWidget {
  const DotaScreen({super.key});

  @override
  State<DotaScreen> createState() => _DotaScreenState();
}

class _DotaScreenState extends State<DotaScreen> with TickerProviderStateMixin {
  String? email = '';
  String? game = '';
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    email = sharedPreferences.getString('email') ?? '';
    game = sharedPreferences.getString('game') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klightBlackColor,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const Image(
            fit: BoxFit.fill,
            height: double.infinity,
            image: AssetImage("assets/gifs/dota.gif"),
            // controller: controller,
          ),
          MyButton(
            buttonText: 'Go Back!',
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      ),
    );
  }
}
