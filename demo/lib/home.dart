import 'package:demo/components/sliding_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/home_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    '正在热播',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SlidingContainer(),
                SizedBox(height: 90,),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 45),
                      primary: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Text('看看其他',style: TextStyle(color: Colors.white,fontSize: 17),),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),),
        ),
      ),
    );
  }
}
