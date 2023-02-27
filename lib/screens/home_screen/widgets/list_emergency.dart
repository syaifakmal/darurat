import 'package:darurat/data/model/emergency_contact_model.dart';
import 'package:darurat/screens/widgets/card_widget.dart';
import 'package:darurat/utils/fonts.dart.dart';
import 'package:darurat/utils/global_function.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListEmergency extends StatelessWidget {
  final String title;
  final List<EmergencyContact> listData;

  const ListEmergency({Key? key, required this.title, required this.listData}) : super(key: key);


  Future<void> _callPhone(String phoneNumber) async {
    Uri _uri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(_uri)) {
      await launchUrl(_uri);
    } else {
      throw 'Could not call $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 15),
          child: Text(
            title,
            style: Poppins.medium.copyWith(fontSize: 12, color: const Color(0XFF6E6F73)),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          // padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return CardTile(
              onTap: () async {
                await _callPhone(listData[index].number);
              },
              onLongPress: (){
                print('object');
              },
              title: listData[index].name,
              trailing: SizedBox(
                width: GlobalFunction.flexibleWidth(context, 30),
                child: Text(
                  listData[index].number,
                  style: Poppins.regular.copyWith(
                    fontSize: 14,
                    // color: themeProvider.textTheme,
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
