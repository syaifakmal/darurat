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
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: Textstyle.semiBold.copyWith(fontSize: 24),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 16.w),
                SizedBox(
                  width: 25.w,
                  height: 25.h,
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
              ],
            );
          },
        ),
        leadingWidth: 60.w,
        backgroundColor: white,
        elevation: 1,
      ),
      body: SafeArea(
        child: Container(
          child: Text('data'),
        ),
      ),
    );
  }
}
