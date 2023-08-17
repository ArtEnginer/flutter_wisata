import 'package:constrained_scrollable_views/constrained_scrollable_views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wisata/module/login_page/login_notifier.dart';
import 'package:wisata/utils/constants.dart';
import 'package:wisata/utils/widgets/custom_text_button.dart';
import 'package:wisata/utils/widgets/custom_textfield.dart';
import 'package:wisata/utils/widgets/rounded_bottom_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginNotifier(context),
      child: Consumer<LoginNotifier>(
        builder: (context, value, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Input card
                  Form(
                    key: value.formKey,
                    child: RoundedBottomContainer(
                      padding: const EdgeInsets.fromLTRB(25.0, 28, 25.0, 20),
                      children: [
                        //Page name
                        Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontSize: 32,
                              ),
                        ),

                        const SizedBox(height: 20),

                        //Email
                        CustomTextField(
                          floatingText: 'Email',
                          hintText: 'Type your email address',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: value.validateEmail,
                          onSaved: (newValue) => value.email = newValue,
                        ),

                        const SizedBox(height: 25),

                        //Password
                        CustomTextField(
                          floatingText: 'Password',
                          hintText: 'Type your password',
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          onSaved: (newValue) => value.password = newValue,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password Tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  //Login button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        20, 40, 20, Constants.bottomInsets),
                    child: CustomTextButton.gradient(
                      width: double.infinity,
                      onPressed: () {
                        if (value.formKey.currentState!.validate()) {
                          value.formKey.currentState!.save();
                          value.login();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data......')));
                        }
                      },
                      gradient: Constants.buttonGradientOrange,
                      child: const Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
