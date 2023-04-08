part of 'package:darurat/screens/home_screen/home_screen.dart';

class _SearchAppBar extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearch;
  const _SearchAppBar({Key? key, required this.searchController, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      titleSpacing: 0,
      floating: true,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).shadowColor,
                width: 1,
              ),
            ),
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 34,
                child: TextField(
                  controller: searchController,
                  onChanged:onSearch,
                  style: Poppins.regular.copyWith(fontSize: 13),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).backgroundColor,
                      prefixIcon: Image.asset(
                        Images.iconSearch,
                        scale: 3.5,
                        color: Theme.of(context).hintColor,
                      ),
                      contentPadding: const EdgeInsets.only(right: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      hintText: AppLocalizations.of(context)!.search,
                      hintStyle: Poppins.regular.copyWith(fontSize: 14)),
                ),
              ),
            ),
            AppBarIcon(
              Images.iconAdd,
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactFormScreen(
                      title: AppLocalizations.of(context)!.addEmergencyContact,
                    ),
                  ),
                );
              },
              tooltip: AppLocalizations.of(context)!.add,
              leftPadding: 8,
              rightPadding: 4,
            ),
            AppBarIcon(
              Images.iconMenu,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              tooltip: AppLocalizations.of(context)!.setting,
              leftPadding: 4,
              rightPadding: 16,
            ),
          ],
        ),
      ),
    );
  }
}
