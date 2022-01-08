import 'package:flutter/material.dart';

import '../../widget/widgets.dart';
import 'TabBarInFeast.dart';

class FeastPersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = new Stack(
      children: <Widget>[
        new Positioned(
          child: Container(
            width: 420.0, //容器的相关参数
            height: 235.0,
            alignment: Alignment.center, //在容器的位置
            child: Container(
              //从这里开始
              child: VideoView(
                // widget.product.videoUrl,
                'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                cover:
                    'https://images8.alphacoders.com/498/thumb-1920-498307.jpg',
              ),
            ),
          ),
        ),
        new Positioned(
          top: 210.0,
          child: Container(
            //从这里开始
            height: 288,
            width: 415,

            decoration: new BoxDecoration(
//背景
              color: Colors.white,
              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
          ),
        ),
        new Positioned(
          top: 195.0,
          left: 25.0,
          child: new CircleAvatar(
            //底层的组件
            backgroundImage: new NetworkImage(
                'https://up.enterdesk.com/edpic/f9/50/b0/f950b0aa078f3a0be7ba87f46a43705a.jpg'),
            radius: 31.0, //参数
          ),
        ),
        new Positioned(
          top: 264.0,
          left: 127.0,
          child: Container(
            width: 80.0, //容器的相关参数
            height: 25.0,
            // color: Colors.green,
            child: new Image.asset('assets/images/biaoshi.png',
                fit: BoxFit.fill //在容器中如何填充图片
                ),
          ),
        ),
        new Positioned(
          top: 258.0,
          left: 38.0,
          child: Container(
            width: 80.0, //容器的相关参数
            height: 30.0,
            // color: Colors.green,
            child: Text(
              '姓名',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 18.0,
                color: Colors.black,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
          ),
        ),
        new Positioned(
          top: 300.0,
          left: 25.0,
          child: Container(
            width: 100.0, //容器的相关参数
            height: 25.0,
            // color: Colors.green,
            child: Text(
              '标签标签标签',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 12.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        new Positioned(
          top: 336.0,
          left: 25.0,
          child: Container(
            width: 100.0, //容器的相关参数
            height: 30.0,
            // color: Colors.green,
            child: Text(
              '4130 关注',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        new Positioned(
          top: 383.0,
          left: 25.0,
          child: Container(
            width: 250.0, //容器的相关参数
            height: 30.0,
            // color: Colors.green,
            child: Text(
              '职能/职能/职能 身份 身份 身份',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 13.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        new Positioned(
          top: 413.0,
          left: 38.0,
          child: Container(
            width: 150.0, //容器的相关参数
            height: 60.0,
            // color: Colors.green,
            child: Text(
              '介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍',
              style: TextStyle(
                //文本的相关参数
                fontFamily: "方正楷体简体.TTF",
                fontSize: 13.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
        new Positioned(
          top: 223.0,
          right: 16.0,
          child: Container(
            child: new Material(
              child: new Ink(
                //设置背景
                decoration: new BoxDecoration(
                  //背景
                  color: Color.fromRGBO(66, 191, 75, 1),
                  //设置四周圆角 角度
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: new InkResponse(
                  borderRadius: new BorderRadius.all(new Radius.circular(25.0)),
                  //点击或者toch控件高亮时显示的控件在控件上层,水波纹下层
//    highlightColor: Colors.deepPurple,
                  //点击或者toch控件高亮的shape形状
                  highlightShape: BoxShape.rectangle,
                  //.InkResponse内部的radius这个需要注意的是，我们需要半径大于控件的宽，如果radius过小，显示的水波纹就是一个很小的圆，
                  //水波纹的半径
                  radius: 300.0,
                  //水波纹的颜色
                  splashColor: Colors.yellow,
                  //true表示要剪裁水波纹响应的界面 false不剪裁 如果控件是圆角不剪裁的话水波纹是矩形
                  containedInkWell: true,
                  //点击事件
                  onTap: () {
                    print("click");
                  },
                  child: Container(
                      //设置 child 居中
                      alignment: Alignment(0, 0),
                      height: 25,
                      width: 75,
                      child: Stack(
                        children: [
                          new Positioned(
                            top: 2.0,
                            left: 35.0,
                            child: Text(
                              '关注',
                              style: TextStyle(
                                //文本的相关参数
                                fontSize: 12.0,
                                color: Colors.white,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                            ),
                          ),
                          new Positioned(
                              top: 4.0,
                              left: 12.0,
                              child: Icon(
                                Icons.local_fire_department_sharp,
                                size: 15,
                                color: Colors.white,
                                textDirection: TextDirection.ltr,
                              )),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
        body: new ListView(
      // scrollDirection: Axis.vertical, //纵向滚动
      children: <Widget>[
        new Container(
          width: 375.0,
          height: 498.0,
          color: Colors.lightBlue,
          child: stack,
        ),
        new Container(
          width: 375.0,
          height: 500.0,
          alignment: Alignment.center,
          child: AppBardemoPage(),
        ),
      ],
    )

        //流式布局
//         new CustomScrollView(
//           slivers: <Widget>[
//
//
//             new SliverAppBar(
//               leading: GestureDetector(
//                 child: Icon(Icons.arrow_back),
//                 onTap: () => Navigator.pop(context),
//               ),
//               //左侧按钮
//               /**
//                * 如果没有leading，automaticallyImplyLeading为true，就会默认返回箭头
//                * 如果 没有leading 且为false，空间留给title
//                * 如果有leading，这个参数就无效了
//                */
//               automaticallyImplyLeading: true,
//               // title: Text('大标题'), //标题
//               centerTitle: true,
//               //标题是否居中
//               // actions: [Icon(Icons.archive)],
//               //右侧的内容和点击事件啥的
//               elevation: 4,
//               //阴影的高度
//               forceElevated: false,
//               //是否显示阴影
//               // backgroundColor: Colors.green,
//               //背景颜色
//               flexibleSpace: new FlexibleSpaceBar(
//                 background: Image.asset("images/a.png", fit: BoxFit.fill),
//               ),
//
//               //背景图片
//               brightness: Brightness.dark,
//               //黑底白字，lignt 白底黑字
//               iconTheme: IconThemeData(color: Colors.black, size: 30, opacity: 1),
//               //所有的icon的样式,不仅仅是左侧的，右侧的也会改变
//               textTheme: TextTheme(),
//               //字体样式
//               primary: true,
//               // appbar是否显示在屏幕的最上面，为false是显示在最上面，为true就显示在状态栏的下面
//               titleSpacing: 16,
//               //标题两边的空白区域
//               expandedHeight: 235.0,
//               //默认高度是状态栏和导航栏的高度，如果有滚动视差的话，要大于前两者的高度
//               floating: false,
//               //滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
//               pinned: true,
//               //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
//               snap: false,
//               //只跟floating相对应，如果为true，floating必须为true，也就是向下滑动一点儿，整个大背景就会动画显示全部，网上滑动整个导航栏的内容就会消失
//               // flexibleSpace: new FlexibleSpaceBar(
//               //   title: new Text("随内容一起滑动的头部"),
//               //   centerTitle: true,
//               //   collapseMode: CollapseMode.pin,
//               // ),
//             ),
//
//             SliverGrid(
//               //Grid
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1, //Grid按两列显示
//                 mainAxisSpacing: 10.0,
//                 crossAxisSpacing: 10.0,
//                 childAspectRatio: 1.5,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                   //创建子widget
//                       Wrap(
// //      direction: Axis.vertical,
//                         direction: Axis.horizontal,
//                         spacing: 16.0, //在direction: Axis.horizontal的时候指左右两个Widget的间距,在direction: Axis.vertical的时候指上下两个widget的间距
//                         runSpacing: 16.0,//在direction: Axis.horizontal的时候指上下两个Widget的间距,在direction: Axis.vertical的时候指左右两个widget的间距
//                         alignment: WrapAlignment.start,
//                         crossAxisAlignment: WrapCrossAlignment.start,
//                         textDirection: TextDirection.ltr,
// //       verticalDirection: VerticalDirection.up,
//                         children: <Widget>[
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0),
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 86.0,
//                               height: 36.0,
//                               color: Colors.orange,
//                               child: Text('历史记录1'),
//                             ),
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0),
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 86.0,
//                               height: 36.0,
//                               color: Colors.redAccent,
//                               child: Text('历史记录2'),
//                             ),
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0),
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 86.0,
//                               height: 36.0,
//                               color: Colors.blue,
//                               child: Text('历史记录3'),
//                             ),
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0),
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 86.0,
//                               height: 36.0,
//                               color: Colors.greenAccent,
//                               child: Text('历史记录4'),
//                             ),
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0),
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 86.0,
//                               height: 36.0,
//                               color: Colors.amber,
//                               child: Text('历史记录5'),
//                             ),
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10.0),
//                             child: Container(
//                               alignment: Alignment.center,
//                               width: 86.0,
//                               height: 36.0,
//                               color: Colors.indigoAccent,
//                               child: Text('历史记录6'),
//                             ),
//                           ),
//                         ],
//                       );
//                   return Container(
//                     alignment: Alignment.center,
//
//                     child:Container(
//                       color: Colors.white,
//                       height: 300,
//                       child:
//                       WrapDemo()
//                     //  Stack(
//                     //
//                     // children: <Widget>[
//                     //   new Positioned(//其他的组件加上去以这种形式
//                     //     top:0.0,
//                     //     left:10.0,
//                     //     child: new CircleAvatar(//底层的组件
//                     //       backgroundImage: new NetworkImage('https://up.enterdesk.com/edpic/f9/50/b0/f950b0aa078f3a0be7ba87f46a43705a.jpg'),
//                     //       radius: 30.0,//参数
//                     //     ),
//                     //   ),
//                     //
//                     //   new Positioned(//其他的组件加上去以这种形式
//                     //   top:10.0,
//                     //   left:10.0,
//                     //   child: new Text('JSPang.com'),
//                     //   ),
//                     //   new Positioned(
//                     //   bottom:10.0,
//                     //   right:10.0,
//                     //   child: new Text('技术胖'),
//                     //   )
//                     //   ],
//                     //   )
//
//
//                       // OverflowBox(
//                       //   alignment: Alignment.topLeft,
//                       //   minWidth: 20,
//                       //   maxWidth: 200,
//                       //   maxHeight: 1000000,
//                       //   minHeight: 20,
//                       //   child: Container(
//                       //     width: 50,
//                       //     height: 2500,
//                       //     color: Colors.black,
//                       //   ),
//                       // ),
//                     ),
//                   );
//                 },
//                 childCount: 1,
//               ),
//             ),
//             SliverGrid(
//               //Grid
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1, //Grid按两列显示
//                 mainAxisSpacing: 10.0,
//                 crossAxisSpacing: 10.0,
//                 childAspectRatio: 0.01,
//               ),
//               delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                   //创建子widget
//                   return Container(
//                     alignment: Alignment.center,
//
//                     color: Colors.cyan[100 * (index % 9)],
//                     child: AppBardemoPage(),
//                   );
//                 },
//                 childCount: 20,
//               ),
//             ),
//             // SliverGrid(
//             // //Grid
//             // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             // crossAxisCount: 1, //Grid按两列显示
//             // mainAxisSpacing: 10.0,
//             // crossAxisSpacing: 10.0,
//             // childAspectRatio: 0.01,
//             // ),
//             // delegate: SliverChildBuilderDelegate(
//             // (BuildContext context, int index) {
//             // //创建子widget
//             // return Container(
//             // alignment: Alignment.center,
//             //
//             // child: AppBardemoPage(),
//             // );
//             // },
//             // childCount: 20,
//             // ),
//             // ),
//
//             // Container(
//             // width:500.0,//容器的相关参数
//             // height:400.0,
//             // color: Colors.lightBlue,
//             // alignment: Alignment.center,//在容器的位置
//             // child:HomePage(),//容器内的文字，大小，颜色等参数
//
//             // ),
//
//             // Container(
//             //   width: 500.0, //容器的相关参数
//             //   height: 500.0,
//             // child: new ListView(
//             //     children: <Widget>[
//             //
//             //       Container(
//             //         width: 200.0, //容器的相关参数
//             //         height: 200.0,
//             //         child: AppBardemoPage(),
//             //       ),
//             //     ]),
//             // ),
//
//
//           ],
//         ) ,

        //     body: new CustomScrollView(
        //       slivers: <Widget>[
        //         new SliverAppBar(
        //           leading: GestureDetector(
        //             child: Icon(Icons.arrow_back),
        //             onTap: () => Navigator.pop(context),
        //           ),
        //           //左侧按钮
        //           /**
        //            * 如果没有leading，automaticallyImplyLeading为true，就会默认返回箭头
        //            * 如果 没有leading 且为false，空间留给title
        //            * 如果有leading，这个参数就无效了
        //            */
        //           automaticallyImplyLeading: true,
        //           // title: Text('大标题'), //标题
        //           centerTitle: true,
        //           //标题是否居中
        //           actions: [Icon(Icons.archive)],
        //           //右侧的内容和点击事件啥的
        //           elevation: 4,
        //           //阴影的高度
        //           forceElevated: false,
        //           //是否显示阴影
        //           backgroundColor: Colors.green,
        //           //背景颜色
        //           brightness: Brightness.dark,
        //           //黑底白字，lignt 白底黑字
        //           iconTheme: IconThemeData(color: Colors.red, size: 30, opacity: 1),
        //           //所有的icon的样式,不仅仅是左侧的，右侧的也会改变
        //           textTheme: TextTheme(),
        //           //字体样式
        //           primary: true,
        //           // appbar是否显示在屏幕的最上面，为false是显示在最上面，为true就显示在状态栏的下面
        //           titleSpacing: 16,
        //           //标题两边的空白区域
        //           expandedHeight: 200.0,
        //           //默认高度是状态栏和导航栏的高度，如果有滚动视差的话，要大于前两者的高度
        //           floating: false,
        //           //滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
        //           pinned: true,
        //           //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
        //           snap: false,
        //           //只跟floating相对应，如果为true，floating必须为true，也就是向下滑动一点儿，整个大背景就会动画显示全部，网上滑动整个导航栏的内容就会消失
        //           flexibleSpace: new FlexibleSpaceBar(
        //             title: new Text("随内容一起滑动的头部"),
        //             centerTitle: true,
        //             collapseMode: CollapseMode.pin,
        //           ),
        //         ),
        // // Container(
        // // width:500.0,//容器的相关参数
        // // height:400.0,
        // // color: Colors.lightBlue,
        // // alignment: Alignment.center,//在容器的位置
        // // child:HomePage(),//容器内的文字，大小，颜色等参数
        //
        // // ),
        //         new SliverFixedExtentList(
        //           itemExtent: 150.0,
        //           delegate: new SliverChildBuilderDelegate(
        //               (context, index) => new ListTile(
        //                     title: new Text("List item $index"),
        //                   )),
        //         )
        //
        //       ],
        //     ),
        );
  }
}
