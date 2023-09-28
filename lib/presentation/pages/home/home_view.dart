import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_cashier/config/util/app_theme.dart';
import 'package:my_cashier/config/util/custom_widget.dart';
import 'package:my_cashier/presentation/widget/custom_tab.dart';
import 'package:my_cashier/presentation/widget/custom_text_field.dart';
import 'package:my_cashier/presentation/widget/spacing.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textFieldController = TextEditingController();

  int indexSelected = 0;

  List<String> listFilter = [
    'Semua',
    'Makanan',
    'Minuman Dingin',
    'Minuman Panas',
    'Cemilan',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.bgColor,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            color: AppTheme.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    placeholderText: 'Cari menu disini...',
                    textFieldController: textFieldController,
                  ),
                ),
                horizontalSpacing(8),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: MaterialButton(
                    color: AppTheme.white,
                    elevation: 0,
                    padding: const EdgeInsets.all(4),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                      side: BorderSide(color: AppTheme.blackShadow, width: 1),
                    ),
                    onPressed: () {},
                    child: ImageIcon(
                      AssetImage(imagePaths('ic_search')),
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding:
                            const EdgeInsets.only(left: 16, right: 8, top: 16),
                        scrollDirection: Axis.horizontal,
                        itemCount: listFilter.length,
                        itemBuilder: (context, index) {
                          return _buildListFilter(listFilter[index], index);
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListFilter(String filter, int index) {
    if (indexSelected == index) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: CustomTabActive(
          buttonTap: () {},
          textButton: filter,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: CustomTabInactive(
          buttonTap: () {
            setState(() {
              indexSelected = index;
            });
          },
          textButton: filter,
        ),
      );
    }
  }
}
