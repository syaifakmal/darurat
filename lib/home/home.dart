import 'package:darurat/utils/colors.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/images.dart';
import 'package:darurat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Container(
        //     height: 32,
        //     color: Colors.green,
        //     child: Row(
        //       children: [
        //         // TextField(
        //         //   decoration: InputDecoration(
        //         //       filled: true,
        //         //       fillColor: lightGrey,
        //         //       contentPadding: EdgeInsets.only(top: 6.h, left: 14.w),
        //         //       border: OutlineInputBorder(
        //         //         borderRadius: BorderRadius.circular(10),
        //         //         borderSide: BorderSide.none,
        //         //       ),
        //         //       hintText: 'Search',
        //         //       hintStyle:
        //         //           Poppins.regular.copyWith(fontSize: 13, color: grey)),
        //         // ),
        //       ],
        //     ),
        //   ),
        // ),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: white,
          titleSpacing: 0,
          title: Container(
            // height: 32,
            // color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TextField(
                  //   decoration: InputDecoration(
                  //       filled: true,
                  //       fillColor: lightGrey,
                  //       contentPadding: EdgeInsets.only(top: 6.h, left: 14.w),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //         borderSide: BorderSide.none,
                  //       ),
                  //       hintText: 'Search',
                  //       hintStyle:
                  //           Poppins.regular.copyWith(fontSize: 13, color: grey)),
                  // ),
                  Expanded(
                    child: Container(
                      height: 34,
                      // color: Colors.blue,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: lightGrey,
                            contentPadding: EdgeInsets.only(top: 6.h, left: 14.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search',
                            hintStyle: Poppins.regular.copyWith(fontSize: 15, color: grey)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    height: 56,
                    width: 34,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(Images.iconAdd),
                    )),
                    // child: IconButton(
                    //   onPressed: () {},
                    //   icon: Image.asset(Images.iconAdd, fit: BoxFit.cover, ),
                    // ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    height: 56,
                    width: 34,
                    decoration: const BoxDecoration(
                        // color: Colors.orange,
                        image: DecorationImage(
                      // fit: BoxFit.fitWidth,
                      image: AssetImage(Images.iconMenu),
                    )),
                    // child: IconButton(
                    //   onPressed: () {},
                    //   icon: Image.asset(Images.iconMenu),
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          child: Center(
            child: Text(Size.flexibleWidth(context, 100).toString()),
          ),
        )
      ],
    ));
  }
}
