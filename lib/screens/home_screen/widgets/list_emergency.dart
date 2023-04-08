part of 'package:darurat/screens/home_screen/home_screen.dart';

class _ListEmergency extends StatelessWidget {
  final String title;
  final List<EmergencyContact> listData;
  final Function? onLongPress;

  const _ListEmergency({
    Key? key,
    required this.title,
    required this.listData,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 5),
          child: Text(
            title,
            style: Poppins.medium.copyWith(
              fontSize: 12,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          // padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return AppCard(
              onTap: () async {
                await GlobalFunction.dialNumber(listData[index].number);
              },
              onLongPress: onLongPress != null
                  ? () {
                      onLongPress!(listData[index]);
                    }
                  : null,
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
