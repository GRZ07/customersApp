import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/customers_theme.dart';
import '../../../providers/auth_provider.dart';
import '../../../../../widgets/auth_button.dart';
import '../../../views/widgets/auth_field.dart';
import '../providers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Theme(
        data: ThemeData(
          primaryColor: CustomersTheme.colors.primaryColor,
        ),
        child: Scaffold(
          backgroundColor: CustomersTheme.colors.backgroundColor,
          body: SafeArea(
            child: Form(
              key: loginProvider.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'تسجيل الدخول',
                        style: CustomersTheme.textStyles.titleLarge,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthField(
                        decoration: CustomersInputDecoration.primary(
                            label: 'اسم المستخدم'),
                        inputType: TextInputType.text,
                        controller: loginProvider.usernameController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthField(
                        decoration: CustomersInputDecoration.primary(
                            label: 'كلمة المرور'),
                        inputType: TextInputType.text,
                        controller: loginProvider.passwordController,
                        obscureText: true,
                        onSubmitted: loginProvider.isLoading
                            ? null
                            : (_) => loginProvider.login(context: context),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Consumer<LoginProvider>(
                        builder: (context, loginConsumer, _) {
                          return AuthButton(
                            onClick: loginConsumer.isLoading
                                ? null
                                : () => loginProvider.login(context: context),
                            child: loginConsumer.isLoading
                                ? const Center(
                                    child: SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    'دخول',
                                    style: CustomersTheme.textStyles.titleLarge
                                        .copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'لا تمتلك حساب؟',
                            style:
                                CustomersTheme.textStyles.titleMedium.copyWith(
                              color: CustomersTheme.colors.displayTextColor,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          TextButton(
                            child: Text(
                              'إنشاء حساب',
                              style: CustomersTheme.textStyles.titleMedium,
                            ),
                            onPressed: () => Provider.of<AuthProvider>(context,
                                    listen: false)
                                .switchScreen('signUp'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
