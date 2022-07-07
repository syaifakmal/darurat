import 'package:darurat/theme.dart';
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
        //   centerTitle: false,
        //   title: SizedBox(
        //     height: 32,
        //     child: TextField(
        //       decoration: InputDecoration(
        //           filled: true,
        //           fillColor: lightGrey,
        //           contentPadding: EdgeInsets.only(top: 6.h, left: 14.w),
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(10.r),
        //             borderSide: BorderSide.none,
        //           ),
        //           hintText: 'Search',
        //           hintStyle:
        //               Textstyle.regular.copyWith(fontSize: 13.sp, color: grey)),
        //     ),
        //   ),
        //   backgroundColor: white,
        //   elevation: 0.4,
        // ),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: white,
          title: SizedBox(
            height: 32,
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: lightGrey,
                  contentPadding: EdgeInsets.only(top: 6.h, left: 14.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search',
                  hintStyle:
                      Textstyle.regular.copyWith(fontSize: 13.sp, color: grey)),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/plusIcon.png'))
          ],
        ),
      ],
    ));
  }
}
