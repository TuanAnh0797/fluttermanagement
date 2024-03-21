import 'package:flutter/material.dart';

import 'main.dart';

class menuform extends StatefulWidget {
  const menuform({super.key});

  @override
  State<menuform> createState() => _menuformState();
}

class _menuformState extends State<menuform> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Padding(padding: EdgeInsets.only(top: 10)),
        Card(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Expanded(

                  child: Center(child: Text('Xin chào Tuấn Anh',style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic,fontWeight: FontWeight.w600,color: Colors.lightBlue),))
              ),


              IconButton(onPressed: () {
                Navigator.popAndPushNamed(context, listroute[0]);
              }, icon: const Icon(Icons.exit_to_app,size: 30,color: Colors.deepOrange,))
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 20)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, listroute[2]);
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage('assets/pngimage/management.png'),
                          width: 120),
                      Text('Quản lý sản phẩm',style: TextStyle(fontSize: 14),)
                    ],
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage('assets/pngimage/report.png'),
                          width: 120),
                      Text('Báo cáo doanh số')
                    ],
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                          image: AssetImage('assets/pngimage/oder.png'),
                          width: 120),
                      Text('Đặt hàng')
                    ],
                  ))
            ],
          ),
        )
      ]),
    ));
  }
}
