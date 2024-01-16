import 'package:architec_practice1/core/view_models/sign_in_view_model.dart';
import 'package:architec_practice1/ui/route_navigation.dart';
import 'package:architec_practice1/ui/shared/ui_helpers.dart';
import 'package:architec_practice1/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.green,
                centerTitle: true,
                title: Text('Sign In page'),
              ),
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(UIHelper.bigPadding(context)),
                  child: Form(
                    key: model.formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              label: const Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Text(
                                    'Mobile Number',
                                    // "Name",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              // labelText: 'Name',
                              alignLabelWithHint: true,
                              hintText: 'Please Enter Your Mobile Number',
                              hintStyle: const TextStyle(color: Colors.grey),
                              // prefixIcon: const Icon(Icons.search),
                              prefixIconColor: Colors.blueAccent,
                              filled: true,
                              fillColor: Colors.white10,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 4.5,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 4.5,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.indigoAccent,
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            controller: model.mobileNumberController,
                            validator: (value) =>
                                model.passwordValidator(value!),
                          ),
                          SizedBox(
                            height: UIHelper.extraBigSpacing(context),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              label: const Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Text(
                                    'Password',
                                    // "Name",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              // labelText: 'Name',
                              alignLabelWithHint: true,
                              hintText: 'Please Enter Your Password',
                              hintStyle: const TextStyle(color: Colors.grey),
                              // prefixIcon: const Icon(Icons.search),
                              prefixIconColor: Colors.blueAccent,
                              filled: true,
                              fillColor: Colors.white10,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.green,
                                  width: 4.5,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 4.5,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.indigoAccent,
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            controller: model.passwordController,
                            validator: (value) =>
                                model.passwordValidator(value!),
                          ),
                          SizedBox(
                            height: UIHelper.extraBigSpacing(context),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 70,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (model.formKey.currentState!.validate()) {
                                  if (await model.signIn()!) {
                                    if (context.mounted) {
                                      Navigator.pushNamed(
                                          context, RouteNavigation.profileView);
                                    }
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.red,
                                side: const BorderSide(
                                  color: Colors.yellow,
                                  width: 1,
                                ),
                                elevation: 4,
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.blue,

                                // minimumSize: const Size(double.infinity, 10),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text('Sign In'),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ));
  }
}
