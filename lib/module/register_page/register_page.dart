import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:wisata/module/register_page/register_notifier.dart';
import 'package:wisata/utils/constants.dart';
import 'package:wisata/utils/widgets/custom_text_button.dart';
import 'package:wisata/utils/widgets/custom_textfield.dart';
import 'package:wisata/utils/widgets/rounded_bottom_container.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterNotifier(context),
      child: Consumer<RegisterNotifier>(
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
                          'Daftar',
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
                          floatingText: 'Nama Lengkap',
                          hintText: 'Masukkan nama lengkap anda',
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama Lengkap Tidak boleh kosong';
                            }
                            return null;
                          },
                          onSaved: (newValue) => value.name = newValue,
                        ),
                        //Email
                        CustomTextField(
                          floatingText: 'Email',
                          hintText: 'Masukkan Email anda',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: value.validateEmail,
                          onSaved: (newValue) => value.email = newValue,
                        ),

                        const SizedBox(height: 25),

                        //Password
                        CustomTextField(
                          floatingText: 'Kata Sandi',
                          hintText: 'Masukkan Kata sandi',
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
                        CustomTextField(
                          floatingText: 'Ulangi Kata Sandi',
                          hintText: 'Masukkan Ulangi Kata sandi',
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          validator: (input) {
                            if (input == null || input.isEmpty) {
                              return 'Ulangi Kata Sandi Tidak boleh kosong';
                            }
                            if (input != value.password) {
                              return 'Ulangi Kata Sandi Harus sama dengan kata sandi';
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
                        value.formKey.currentState!.save();
                        if (value.formKey.currentState!.validate()) {
                          value.register();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data......')));
                        }
                      },
                      gradient: Constants.buttonGradientOrange,
                      child: const Center(
                        child: Text(
                          'DAFTAR',
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
