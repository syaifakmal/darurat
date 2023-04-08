part of 'package:darurat/screens/home_screen/home_screen.dart';

class _EmptyState extends StatelessWidget {
  final String searchText;
  const _EmptyState({Key? key, required this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Images.imageLogo,
            scale: 3,
            colorBlendMode: BlendMode.difference,
          ),
          const SizedBox(height: 10),
          Text(
            AppLocalizations.of(context)!.emptyResultTitle(searchText),
            style: Poppins.medium.copyWith(fontSize: 13),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 3),
          Text(
            AppLocalizations.of(context)!.emptyResultDesc,
            style: Poppins.medium.copyWith(fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
