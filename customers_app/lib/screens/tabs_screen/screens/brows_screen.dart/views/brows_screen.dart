import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/brows_provider.dart';
import '../../../../../theme/customers_theme.dart';
import '../../../../../widgets/loading_error.dart';
import './widgets/brands_row.dart';

class BrowsScreen extends StatelessWidget {
  const BrowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final browsProvider = Provider.of<BrowsProvider>(context, listen: false);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomersTheme.colors.backgroundColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: BrandsRow(
                brands: browsProvider.brands.keys.toList(),
                selectedBrandIndex: browsProvider.selectedBrandIndex,
              ),
            ),
            // The messages list
            Expanded(
              child:
                  Consumer<BrowsProvider>(builder: (context, browsConsumer, _) {
                return FutureBuilder(
                  future: !browsConsumer.productsFetched
                      ? browsConsumer.fetchProducts()
                      : null,
                  builder: (context, messagesSnapshot) {
                    if (messagesSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: CustomersTheme.colors.primaryColor,
                        ),
                      );
                    } else if (messagesSnapshot.error != null) {
                      return messagesSnapshot.error is SocketException ||
                              messagesSnapshot.error is TimeoutException
                          ? LoadingError(
                              message: 'تحقق من اتصالك بالشبكة ثم قم',
                              refresh: browsConsumer.refetchProducts,
                            )
                          : LoadingError(
                              message: 'حدث خطأ ما في النظام، قم',
                              refresh: browsConsumer.refetchProducts,
                            );
                    } else {
                      return const Text('products');
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
