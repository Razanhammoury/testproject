import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/Doctor_Profile.dart';
import 'package:untitled2/pages/login_screen.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'home_screen.dart';
import 'auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthMiddle(),
    );
  }
}

//
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  bool showKeyboard = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    // listen to focus changes
    focusNode.addListener(() {
      if (focusNode.hasFocus == false && showKeyboard == false) {
        setState(() {
          showKeyboard = false;
        });
      }
    });
  }

  void setFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (focusNode.hasFocus == false) {
          setState(() {
            showKeyboard = false;
          });
        }
      },
      child: Scaffold(
          body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  focusNode: focusNode,
                  keyboardType: TextInputType.none,
                  controller: textEditingController,
                  textDirection: TextDirection.rtl,
                  onTap: () {
                    setState(() {
                      showKeyboard = true;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: showKeyboard
                ? Container(
                    color: Colors.black,
                    child: VirtualKeyboard(
                      fontSize: 20,
                      textColor: Colors.white,
                      textController: textEditingController,
                      type: VirtualKeyboardType.Alphanumeric,
                      defaultLayouts: const [
                        VirtualKeyboardDefaultLayouts.Arabic
                      ],
                    ),
                  )
                : Container(),
          )
        ],
      )),
    );
  }
}
