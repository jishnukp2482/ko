import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ko/core/respose_classify.dart';
import 'package:ko/presentaion/manager/controller/auth/auth_proivder.dart';
import 'package:provider/provider.dart';
import '../../routes/app_pages.dart';
import '../../themes/app_assets.dart';
import '../../themes/appcolors.dart';
import '../../widgets/custome_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final authProvider = Provider.of<Authprovider>(context);
    return SafeArea(
        child: Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
        notification.disallowIndicator();
        return true;
      }, child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return ListView(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
                child: AutofillGroup(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image.asset(
                          AppAssets.splash,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Center(
                          child: Text(
                        "Login Now..!",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      CustomTextField(
                        controller: authProvider.userNamecontroller,
                        autofillHints: [AutofillHints.username],
                        hintText: "User Id",
                        label: const Text("username"),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      CustomTextField(
                        controller: authProvider.userpassword,
                        hintText: "Password",
                        label: const Text("Password"),
                        autofillHints: [AutofillHints.password],
                        passwordfield: true,
                      ),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
                        child: SizedBox(
                          height: 50,
                          width: width,
                          child: Consumer<Authprovider>(
                            builder: (context, value, child) => authProvider
                                        .loginstate.status ==
                                    Status.LOADING
                                ? const SizedBox(
                                    height: 40,
                                    width: 20,
                                    child: Center(
                                        child: CircularProgressIndicator()))
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: AppColors.maincolor,
                                        foregroundColor: AppColors.white),
                                    onPressed: () {
                                      authProvider.getLogin();
                                    },
                                    child: const Text("Login")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
                child: AutofillGroup(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image.asset(
                          AppAssets.splash,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Center(
                          child: Text(
                        "Login Now..!",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      CustomTextField(
                        controller: authProvider.userNamecontroller,
                        autofillHints: [AutofillHints.username],
                        hintText: "User Id",
                        label: const Text("username"),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      CustomTextField(
                        controller: authProvider.userpassword,
                        hintText: "Password",
                        label: const Text("Password"),
                        autofillHints: [AutofillHints.password],
                        passwordfield: true,
                      ),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
                        child: SizedBox(
                          height: 50,
                          width: width,
                          child: Consumer<Authprovider>(
                            builder: (context, value, child) => authProvider
                                        .loginstate.status ==
                                    Status.LOADING
                                ? const SizedBox(
                                    height: 40,
                                    width: 20,
                                    child: Center(
                                        child: CircularProgressIndicator()))
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: AppColors.maincolor,
                                        foregroundColor: AppColors.white),
                                    onPressed: () {
                                      authProvider.getLogin();
                                    },
                                    child: const Text("Login")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      })),
    ));
  }
}
