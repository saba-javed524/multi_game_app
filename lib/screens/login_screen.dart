import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_user_app/constants.dart';
import 'package:multi_user_app/screens/tekken_screen.dart';
import 'package:multi_user_app/screens/home_screen.dart';
import 'package:multi_user_app/screens/genshin_screen.dart';
import 'package:multi_user_app/screens/dota_screen.dart';
import 'package:multi_user_app/widgets/my_button.dart';
import 'package:multi_user_app/widgets/my_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool isLoggedin = false;
String game = '';
String? newValue;
List<String> gamesList = ['Dota 2', 'Tekken 7', 'Genshin Impact'];

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klightBlackColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Image.asset(
                'assets/images/console.png',
                height: 300,
              ),
              //choose your game
              Text(
                'Hey! Choose your favourite game!',
                style: kTextStyle,
              ),
              const SizedBox(height: 25),
              //username text field
              MyTextField(
                  controller: emailController,
                  hintText: 'Enter Email',
                  icon: Icon(
                    Icons.email_outlined,
                    color: kButtonBlueColor,
                  ),
                  obscureText: false),
              const SizedBox(height: 25),
              //password text field
              MyTextField(
                  controller: passwordController,
                  hintText: 'Enter Password',
                  icon: Icon(
                    Icons.lock_outline,
                    color: kButtonBlueColor,
                  ),
                  obscureText: true),
              const SizedBox(height: 25),
              //roles dropdown
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Text(
                    "Your Game?",
                    style: kTextStyle.copyWith(fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text(
                          'Dota 2',
                          style: kTextStyle,
                        ),
                        icon: FaIcon(FontAwesomeIcons.arrowTurnDown,
                            size: 20, color: kIconBlueColor),
                        dropdownColor: kButtonBlueColor,
                        elevation: 16,
                        focusColor: klightBlackColor,
                        onChanged: (String? changedValue) async {
                          newValue = changedValue;
                          game = newValue!;

                          setState(() {
                            newValue;
                          });
                        },
                        value: newValue,
                        items: gamesList
                            .map((String value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value, style: kTextStyle),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              //login button
              MyButton(
                buttonText: 'Let\'s Go!',
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('userRole', newValue!);
                  sp.setBool('isLoggedIn', true);
                  if (newValue == 'Dota 2') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DotaScreen()));
                  } else if (game == 'Tekken 7') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TekkenScreen()));
                  } else if (game == 'Genshin Impact') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GenshinScreen()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
