import 'package:flutter/material.dart';
import 'package:hguforest/Register.dart';
import 'package:hguforest/phone.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handong Forest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhonePage(phoneController: _phoneController),
    );
  }
}

class PhonePage extends StatefulWidget {
  final TextEditingController phoneController;

  PhonePage({Key? key, required this.phoneController}) : super(key: key);

  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  void sendVerificationCode() {
    // TODO: Add logic to send verification code
    // You can replace the print statement with the actual code to send the verification code
    print('Verification code sent!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '핸드폰 번호를\n 인증해주세요.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Icon(Icons.battery_std, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  '${DateTime.now().hour}:${DateTime.now().minute}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.7,
              width: 130.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hguforest_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Phone number input field with number keyboard
                  TextFormField(
                    controller: widget.phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: '휴대폰 번호를 입력하세요.',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      // Password validation logic can be added here
                      sendVerificationCode();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneCheckPage(phoneNumber: widget.phoneController.text),
                        ),
                      );
                    },
                    child: Text('인증번호 받기'),
                  ),
                  SizedBox(height: 160.0), // 조정된 여백 크기
                  // Logo image
                  Image.asset(
                    'assets/images/hguforest_logo.png',
                    height: 80.0,
                  ),
                  SizedBox(height: 24.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneCheckPage extends StatefulWidget {
  final String phoneNumber;

  PhoneCheckPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _PhoneCheckPageState createState() => _PhoneCheckPageState();
}

class _PhoneCheckPageState extends State<PhoneCheckPage> {
  TextEditingController _verificationCodeController = TextEditingController();
  bool isVerificationCodeSent = false;

  void sendVerificationCode() {
    // TODO: Add logic to send verification code
    // You can replace the print statement with the actual code to send the verification code
    print('Verification code sent!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '핸드폰 번호를\n 인증해주세요.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Icon(Icons.battery_std, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  '${DateTime.now().hour}:${DateTime.now().minute}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.7,
              width: 130.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hguforest_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Phone number input field with number keyboard
                  TextFormField(
                    controller: TextEditingController(text: widget.phoneNumber),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: '휴대폰 번호를 입력하세요.',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  // Verification code input field
                  TextFormField(
                    controller: _verificationCodeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: '인증번호를 입력하세요.',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    '인증번호를 발송하였습니다.',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Password validation logic can be added here
                      sendVerificationCode();
                      setState(() {
                        isVerificationCodeSent = true;
                      });
                    },
                    child: Text('다음으로'),
                  ),
                  SizedBox(height: 70.0), // 조정된 여백 크기
                  // Logo image
                  Image.asset(
                    'assets/images/hguforest_logo.png',
                    height: 80.0,
                  ),
                  SizedBox(height: 24.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
