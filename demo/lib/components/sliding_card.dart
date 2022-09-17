import 'package:demo/model/movie.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SlidingCard extends StatelessWidget {
  //动画过程偏移量
  final double offset;

  //电影模型
  final Movie movie;

  SlidingCard({
    Key? key,
    required this.movie,
    required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //计算拖拽过程中的偏移量
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 24,
        ),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child: Image.network(
                '${movie.poster}',
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment(-offset.abs(), 0),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${movie.name}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '上映日期：${movie.date}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '${movie.intro}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      RaisedButton(
                        color: Color(0xFF162A49),
                        child: Text('立即购买'),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        onPressed: () {
                          print('点击:${movie.name}');
                        },
                      ),
                      Spacer(),
                      Text(
                        '￥${movie.price}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16,),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
