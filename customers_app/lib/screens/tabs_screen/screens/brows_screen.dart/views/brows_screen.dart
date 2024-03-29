import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/brows_provider.dart';
import '../../../../../theme/customers_theme.dart';
import '../../../../../widgets/loading_error.dart';
import './widgets/brands_row.dart';
import '../../../../../widgets/products_grid.dart';
import '../../../../../providers/user_provider.dart';

class BrowsScreen extends StatelessWidget {
  const BrowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserProvider>(context, listen: false).token!;

    final browsProvider = Provider.of<BrowsProvider>(context, listen: false);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomersTheme.colors.backgroundColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
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
                      ? browsConsumer.fetchBrandProducts(token)
                      : null,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: CustomersTheme.colors.primaryColor,
                        ),
                      );
                    } else if (snapshot.error != null) {
                      return snapshot.error is SocketException ||
                              snapshot.error is TimeoutException
                          ? LoadingError(
                              message: 'تحقق من اتصالك بالشبكة ثم قم',
                              refresh: browsConsumer.refetchProducts,
                            )
                          : LoadingError(
                              message: 'حدث خطأ ما في النظام، قم',
                              refresh: browsConsumer.refetchProducts,
                            );
                    } else {
                      return ProductsGrid(
                        products: browsConsumer.products,
                      );
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
