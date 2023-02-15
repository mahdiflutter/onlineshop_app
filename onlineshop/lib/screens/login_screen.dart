import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/bloc/auth/login_bloc.dart';
import 'package:onlineshop/bloc/auth/login_event.dart';
import 'package:onlineshop/bloc/auth/login_state.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/screens/profile_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _identityController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: const [
                  SizedBox(
                    width: double.infinity,
                  ),
                  Icon(
                    Icons.apple,
                    size: 80,
                    color: MainColors.mainBlue,
                  ),
                  Text(
                    'خوش برگشتی کاربر عزیز☺',
                    style: TextStyle(
                      color: MainColors.mainBlue,
                      fontSize: 18,
                      fontFamily: 'SB',
                    ),
                  ),
                  Text(
                    'نام کاربری و رمز عبور خود را برای ورود به پروفایل خود وارد نمایید',
                    style: TextStyle(
                      color: MainColors.mainGray,
                      height: 2,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 44,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 54,
                        child: TextFormField(
                          controller: _identityController,
                          decoration: InputDecoration(
                            labelText: 'نام کاربری',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: MainColors.mainBlue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: MainColors.mainBlue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 54,
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'رمز عبور',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: MainColors.mainBlue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: MainColors.mainBlue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginInitState) {
                            return SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  backgroundColor: MainColors.mainBlue,
                                  textStyle: const TextStyle(
                                      fontSize: 17, fontFamily: 'SB'),
                                ),
                                onPressed: () async {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    LoginSendRequestEvent(
                                      _identityController.text,
                                      _passwordController.text,
                                    ),
                                  );
                                },
                                child: const Text('ورود به حساب'),
                              ),
                            );
                          }
                          if (state is LoginLoadingState) {
                            return const Text('منتظر بمانید');
                          }
                          if (state is LoginResponseState) {
                            Widget widget = state.response!.fold(
                              (l) {
                                return Column(
                                  children: [
                                    Text(
                                      l,
                                      style: const TextStyle(
                                        color: MainColors.mainRed,
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 44,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: ContinuousRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          backgroundColor: MainColors.mainBlue,
                                          textStyle: const TextStyle(
                                              fontSize: 17, fontFamily: 'SB'),
                                        ),
                                        onPressed: () async {
                                          BlocProvider.of<LoginBloc>(context)
                                              .add(
                                            LoginSendRequestEvent(
                                              _identityController.text,
                                              _passwordController.text,
                                            ),
                                          );
                                        },
                                        child: const Text('ورود به حساب'),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              (r) {
                                return const Text(
                                  'با موفقیت وارد شدید',
                                  style: TextStyle(
                                    color: MainColors.mainGreen,
                                  ),
                                );
                              },
                            );
                            return widget;
                          }
                          return const Text('i dont know');
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Text(
                            'حساب کاربری ندارید؟',
                            style: TextStyle(
                              color: MainColors.mainGray,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'ایجاد حساب',
                            style: TextStyle(
                              color: MainColors.mainBlue,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
