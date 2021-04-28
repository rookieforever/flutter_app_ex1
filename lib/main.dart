import 'package:flutter/material.dart';
import 'package:myflutter/User.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: '实验一',
      home:Scaffold(
        appBar: AppBar(
          title: Text('第XX小组第一'),
        ),
        body: MyWidget(),
      )
    );
  }
}
class MyWidget extends StatelessWidget{
    Widget build(BuildContext context)
    {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                child: Text('5120182551胡载宜'),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TextFieldAndCheckPage()));
             },
        ),
            RaisedButton(
                child: Text('兰望'),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>TextFieldAndCheckPage()));
            },
        ),
      ],
      ));
}}