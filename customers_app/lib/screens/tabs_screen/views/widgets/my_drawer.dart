import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/customers_theme.dart';
import '../../providers/tabs_provider.dart';
import './drawer_item.dart';
import '../../../../providers/user_provider.dart';
import '../../../../widgets/my_alert_dialog.dart';
import '../../../../widgets/loading_dialog.dart';
import '../../../../widgets/dialog_button.dart';
import '../../../../providers/user_provider.dart';

class MyDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MyDrawer({
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  void _confirmLogOutDialog(
      BuildContext context, Future<void> Function(BuildContext) logout) {
    showDialog(
      context: context,
      builder: (ctx) => MyAlertDialog(
        label: 'هل أنت متأكد من تسجيل الخروج من حسابك؟',
        leftButton: Expanded(
          child: DialogButton(
            onClick: () async {
              Navigator.of(ctx).pop();
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) =>
                    const LoadingDialog(message: 'جار تسجيل الخروج'),
              );
              await logout(context);
              if (!context.mounted) return;
              Navigator.of(context).pop();
              scaffoldKey.currentState?.closeDrawer();
            },
            label: 'تأكيد',
            color: CustomersTheme.colors.errorColor,
          ),
        ),
        rightButton: Expanded(
          child: DialogButton(
            onClick: () => Navigator.of(context).pop(),
            label: 'تراجع',
            color: CustomersTheme.colors.primaryColor,
          ),
        ),
        borderColor: CustomersTheme.colors.errorColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<TabsProvider>(builder: (context, tabsScreenConsumer, _) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(CustomersTheme.radius),
                bottomRight: Radius.circular(CustomersTheme.radius),
              ),
              child: Container(
                color: CustomersTheme.colors.primaryColor,
                height: 170,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                            'lib/assets/images/profile_placeholder.png'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            Provider.of<UserProvider>(context).name!,
                            style: CustomersTheme.textStyles.titleLarge
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DrawerItem(
              icon: const Icon(Icons.add),
              label: 'تصفح',
              selectedPageIndex: tabsScreenConsumer.selectedPageIndex,
              onClick: () {
                Navigator.of(context).pop();
                tabsScreenConsumer.selectPage(1);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DrawerItem(
              icon: const Icon(Icons.shopping_cart),
              label: 'طلباتي',
              selectedPageIndex: tabsScreenConsumer.selectedPageIndex,
              onClick: () {
                Navigator.of(context).pop();
                tabsScreenConsumer.selectPage(2);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DrawerItem(
              icon: const Icon(Icons.home),
              label: 'الرئيسية',
              selectedPageIndex: tabsScreenConsumer.selectedPageIndex,
              onClick: () {
                Navigator.of(context).pop();
                tabsScreenConsumer.selectPage(0);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // Add more DrawerItems here as needed

            DrawerItem(
              icon: const Icon(Icons.logout),
              label: 'تسجيل الخروج',
              selectedPageIndex: tabsScreenConsumer.selectedPageIndex,
              onClick: () => _confirmLogOutDialog(
                context,
                Provider.of<UserProvider>(context, listen: false).logout,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      }),
    );
  }
}
