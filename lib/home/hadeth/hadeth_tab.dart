import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_islami_fri_c11/home/hadeth/item_hadeth_name.dart';
import 'package:flutter_app_islami_fri_c11/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(child: Image.asset('assets/images/hadeth_logo.png')),
        Divider(
          color: provider.isDarkMode()
              ? AppColors.yellowColor
              : AppColors.primaryLightColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: provider.isDarkMode()
              ? AppColors.yellowColor
              : AppColors.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ahadethList.isEmpty
              ? Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
            ),
          )
              : ListView.separated(
              itemBuilder: (context, index) {
                return ItemHadethName(
                  hadeth: ahadethList[index],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                      color: provider.isDarkMode()
                          ? AppColors.yellowColor
                          : AppColors.primaryLightColor,
                      thickness: 2,
                    );
              },
              itemCount: ahadethList.length),
        )
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadthList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadthList.length; i++) {
      print(hadthList[i]);
      List<String> hadethLines = hadthList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;

  List<String> content;

  Hadeth({required this.title, required this.content});
}
