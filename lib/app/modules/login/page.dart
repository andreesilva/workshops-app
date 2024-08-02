import 'package:workshops_app/app/core/theme/colors.app.dart';
import 'package:workshops_app/app/modules/login/controller.dart';
import 'package:workshops_app/app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACESSAR',
            style: TextStyle(
                fontSize: 17, fontFamily: 'Roboto', color: ColorsApp.appTitle)),
        centerTitle: true,
        backgroundColor: ColorsApp.appBackground,
        shape: const Border(
            bottom: BorderSide(color: ColorsApp.appBorder, width: 0.5)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Center(
                    child: Column(
                      children: [
                        Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              Center(
                                child: TextFormField(
                                  controller: controller.emailController,
                                  decoration: const InputDecoration(
                                    labelText: "E-mail",
                                    labelStyle: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto'),
                                    filled: true,
                                    focusColor: Colors.black,
                                    fillColor: Colors.white,
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value != null && value.isEmpty) {
                                      return 'Informe o seu e-mail';
                                    } else if (controller
                                            .isEmailValid(value!) ==
                                        false) {
                                      return 'Preencha com um e-mail válido';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Obx(
                                () => TextFormField(
                                  controller: controller.passwordController,
                                  decoration: InputDecoration(
                                    suffixIcon: Obx(() => GestureDetector(
                                          onTap: () {
                                            controller.isObscure.value =
                                                !controller.isObscure.value;
                                          },
                                          child: Icon(controller.isObscure.value
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                        )),
                                    labelText: "Senha",
                                    labelStyle: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Roboto'),
                                    filled: true,
                                    focusColor: Colors.black,
                                    fillColor: Colors.white,
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                  obscureText: controller.isObscure.value,
                                  validator: (String? value) {
                                    if (value != null && value.isEmpty) {
                                      return 'Informe a sua senha';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: ElevatedButton(
                                        style: button,
                                        child: AnimatedBuilder(
                                          animation: controller.loadingCircular,
                                          builder: (context, _) {
                                            return controller
                                                    .loadingCircular.value
                                                ? const SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                : const Text('Entrar');
                                          },
                                        ),
                                        onPressed: () => {
                                          if (controller.formKey.currentState!
                                              .validate())
                                            {
                                              controller.loadingCircular.value =
                                                  true,
                                              controller.login(),
                                            },
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
