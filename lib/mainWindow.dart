import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutter/User.dart' as User;
import 'login.dart';
class mainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => mainPageState();
}
class mainPageState extends State<mainPage> {
  //手机号的控制器
  TextEditingController phoneController = TextEditingController();

  //密码的控制器
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录信息'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.phone),
              labelText: User.newUser.userName),
            ),
          TextField(
              controller: passController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                icon: Icon(Icons.lock),
                labelText: User.newUser.passWord),
              ),
          ElevatedButton(
            onPressed: _exit,
            child: Text('注销'),
          ),
        ],
      ),
    );}
void _exit() {
  showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('注销您的信息，返回主界面'),
          ));
    Navigator.push(context, MaterialPageRoute(builder: (context)=>loginPage()));
  }
}