import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mainWindow.dart';
import 'login.dart';
bool _showPassWord=false;//显示密码栏
int _radioSelected=1;//单选框
class user{
  var userName;
  var passWord;
  var nickName;//昵称
  var profile;//头像
  var gender;//性别
  var level;//等级
  var passFindQuiz;
  var passFindQuizAns;
}
var newUser =  user();
class TextFieldAndCheckPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldAndCheckPageState();
}

class TextFieldAndCheckPageState extends State<TextFieldAndCheckPage> {
  //手机号的控制器
  TextEditingController phoneController = TextEditingController();
  //密码的控制器
  TextEditingController passController = TextEditingController();
  //昵称
  TextEditingController nickNameController = TextEditingController();
  //头像
  TextEditingController profileController = TextEditingController();
  //性别
  TextEditingController sexController = TextEditingController();
  //等级
  TextEditingController levelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册界面'),
      ),
      body:new SingleChildScrollView(
      child:new ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 120.0,
      ),
      child:new Column(
        
        children: <Widget>[
          TextField(
            controller: phoneController,
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.phone),
              labelText: '请输入你的用户名',

            ),
            autofocus: false,
          ),
          TextField(
                  controller: passController,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    icon: Icon(Icons.lock),
                    labelText: '请输入密码)',
                  ),
                  obscureText: _showPassWord),
          ElevatedButton(
                onPressed: _changeState,
                child: Text('密码可见'),
              ),
          TextField(
            controller: nickNameController,
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.account_circle),
              labelText: '请输入你的昵称',
            ),
            autofocus: false,
          ),
          Text(
            '选择您的性别',
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.wavy,
            ),
          ),
          RadioListTile(
            title:Text('男'),
            value: 1,
            groupValue: _radioSelected,
            activeColor: Colors.red,
            onChanged: (value){
              setState(() {
                _radioSelected=value;
              });
            },
            autofocus: false,
          ),
          RadioListTile(
            title:Text('女'),
            value: 2,
            groupValue: _radioSelected,
            activeColor: Colors.red,
            onChanged: (value){
              setState(() {
                _radioSelected=value;
              });
            },
            autofocus: false,
          ),
          ElevatedButton(
            onPressed: _login,
            child: Text('注册'),
          ),
        ],
      ),
    )));
  }
  void _changeState(){//改变密码可见性
    if(_showPassWord)
      {
        setState(() {
          _showPassWord=false;
        });
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('密码已可见！'),
            ));
      }
    else {
      setState(() {
        _showPassWord=true;
      });
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('密码已隐藏！'),
          ));
    }
  }
  void _login() {
    print({'phone': phoneController.text, 'password': passController.text});
    if(phoneController.text.length==0)
      {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('用户名不能为空！'),
            ));
    } else if (passController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('密码不能为空！'),
          ));
    } else {

      newUser.userName=phoneController.text;
      newUser.passWord=passController.text;

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('注册成功'),
          ));
      phoneController.clear();
      passController.clear();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>loginPage()));
    }
  }

  void onTextClear() {
    setState(() {
      phoneController.clear();
      passController.clear();
    });
  }
}
