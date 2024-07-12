import 'package:flutter/material.dart';
import 'package:flutter_app_islami_fri_c11/app_colors.dart';
import 'package:flutter_app_islami_fri_c11/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                /// change theme to dark
                provider.changeTheme(ThemeMode.dark);
              },

              /// dark
              child: provider.isDarkMode()
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.dark)),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                /// change theme to light
                provider.changeTheme(ThemeMode.light);
              },

              /// light
              child: provider.isDarkMode()
                  ? getUnSelectedItemWidget(AppLocalizations.of(context)!.light)
                  : getSelectedItemWidget(AppLocalizations.of(context)!.light)),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: provider.isDarkMode()
                  ? AppColors.yellowColor
                  : Theme.of(context).primaryColor),
        ),
        Icon(Icons.check,
            size: 35,
            color: provider.isDarkMode()
                ? AppColors.yellowColor
                : Theme.of(context).primaryColor)
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }
}
