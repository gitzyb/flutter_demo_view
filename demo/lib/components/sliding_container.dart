import 'package:demo/components/sliding_card.dart';
import 'package:demo/model/movie.dart';
import 'package:flutter/material.dart';

List<Movie> movies = [
  Movie(
      name: '狗眼看阴阳',
      intro:
      '重案组布网围剿国际毒枭过程中，督察张崇邦亲睹战友被杀，但在深入追查发现，悍匪首领竟是昔日战友，宿命让二人再次纠缠，恩恩怨怨就此了断的故事',
      poster:
      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F95dade672717bae214ee1a638a0c614a87b315f210d652-hjfdAT_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665979192&t=acc7bdeaed38e2d769cc80f9c583f2b5',
      date: '2021-07-30',
      price: '19.90'),
  Movie(
      name: '千与千寻',
      intro:
      '由吉卜力工作室制作的动画电影，由宫崎骏执导，柊瑠美、入野自由、中村彰男、夏木真理等人参与配音。',
      poster:
      'https://bkimg.cdn.bcebos.com/pic/f2deb48f8c5494eef01fde05baa4f7fe9925bc31d0d7?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxMTY=,g_7,xp_5,yp_5/format,f_auto',
      date: '2021-07-30',
      price: '39.90'),
  Movie(
      name: '长津湖',
      intro:
      '1950年，中国人民志愿军部队与美军在朝鲜长津湖地区交战，中国人民志愿军第9兵团将美军1个多师分割包围于长津湖地区，歼敌1.3万余人，扭转了战场态势。',
      poster:
      'https://bkimg.cdn.bcebos.com/pic/71cf3bc79f3df8dcd100a77f4143658b4710b8128299?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxODA=,g_7,xp_5,yp_5/format,f_auto',
      date: '2021-12-20',
      price: '56.65'),
  Movie(
      name: '侏罗纪世界3',
      intro:
      '在纳布拉尔岛火山爆发、洛克伍德庄园事件的四年后，恐龙在世界各地与人类共同生活。而一场迫在眉睫的生态浩劫，让末日模式再次开启。',
      poster:
      'https://bkimg.cdn.bcebos.com/pic/d4628535e5dde71190ef43e89cbbd91b9d16fdfacb2b?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxMTY=,g_7,xp_5,yp_5/format,f_auto',
      date: '2021-12-20',
      price: '46.80'),
  Movie(
      name: '鸿门宴传奇',
      intro:
      '秦末暴政，叛兵四起，天下大乱。项羽、刘邦双雄争霸。双雄背后，原来另有一人操控全局，是在秦末复国的楚怀王，他暗施奸计诱项羽、刘邦相争，自己想从中取利。不料项羽、刘邦双雄比他强横，反客为主。',
      poster:
      'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01e37e554918730000019ae90f61ac.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665979333&t=39a5b4496b5a2161d143e607bf8c6917',
      date: '2022-12-20',
      price: '16.80'),
];

class SlidingContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SlidingContainerState();
}

class _SlidingContainerState extends State<SlidingContainer> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.84);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page!);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.55,
      child: PageView(
        controller: pageController,
        children: List.generate(movies.length, (index)  {
            return SlidingCard(movie: movies[index], offset: pageOffset - index);
      },),
    ),);
  }
}
