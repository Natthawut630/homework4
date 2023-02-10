import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LockScreen(),
    );
  }
}

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => LockScreenState();
}

class LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {

    List<Widget> list = [];
    for (var i=1 ; i<4 ; i++){
      list.add(_buildColumn(i));
    };

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(Icons.lock,size: 80.0,color: Colors.grey,),
          Text('กรุณาใส่รหัสผ่าน',style: TextStyle(fontSize: 20.0),),
          const SizedBox(height: 30.0),
          Column(
            children: list,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 48,),
              _buildButton4(0),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Icon(Icons.backspace),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                TextButton(onPressed: (){}, child: Text('ลืมรหัสผ่าน')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(count == 1)
          for (var i=1 ;i<4 ; i++)
           _buildButton4(i)
        else if (count == 2)
          for (var i=4 ;i<7 ; i++)
            _buildButton4(i)
        else if (count == 3)
          for (var i=7 ;i<10 ; i++)
            _buildButton4(i)
        ],
    );
  }

  Widget _buildButton4(int count) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: Text(count.toString(),),
            width: 60.0,
            height: 60.0,
            //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 0.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // สีเงา
                    offset: Offset(1, 2), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                  ),
                ],
            ),
          ),
        ),
      ],
    );
  }




}


