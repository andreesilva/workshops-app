import 'package:google_fonts/google_fonts.dart';
import 'package:workshops_app/app/core/theme/colors.app.dart';
import 'package:workshops_app/app/modules/home/controller.dart';
import 'package:workshops_app/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ata das workshops',
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'Roboto',
                  color: ColorsApp.appTitle)),
          backgroundColor: ColorsApp.appBackground,
          shape: const Border(
              bottom: BorderSide(color: ColorsApp.appBorder, width: 0.5)),
        ),
        body: controller.obx(
          (state) => SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Form(
                                          key: controller.formKey,
                                          child: Column(
                                            children: [
                                              Center(
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textAlign: TextAlign.center,
                                                  autofocus: false,
                                                  controller: controller
                                                      .searchWorkshopName,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Informe o nome do workshop",
                                                    helperStyle:
                                                        GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    filled: true,
                                                    focusColor: Colors.black,
                                                    fillColor: Colors.white,
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3)),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                    ),
                                                    labelStyle:
                                                        GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: (String? value) {
                                                    if (value != null &&
                                                        value.isEmpty) {
                                                      return 'Favor preencher o campo';
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.flagSearchButton.value =
                                                1;
                                            controller.submitSearch();
                                          },
                                          child: Text(
                                            'Buscar',
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Form(
                                          key: controller.formKey2,
                                          child: Column(
                                            children: [
                                              Center(
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textAlign: TextAlign.center,
                                                  autofocus: false,
                                                  controller: controller
                                                      .searchWorkshopData,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Informe a data do workshop",
                                                    helperStyle:
                                                        GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    filled: true,
                                                    focusColor: Colors.black,
                                                    fillColor: Colors.white,
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3)),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  3)),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
                                                    ),
                                                    labelStyle:
                                                        GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: (String? value) {
                                                    if (value != null &&
                                                        value.isEmpty) {
                                                      return 'Favor preencher o campo';
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            controller.flagSearchButton.value =
                                                2;
                                            controller.submitSearch();
                                          },
                                          child: Text(
                                            'Buscar',
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(90),
                    child: Column(
                      children: [
                        for (var donation in state!)
                          Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 20),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            elevation: 4,
                            shadowColor: Colors.blueGrey,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, left: 20),
                                            child: Text(
                                              "Workshop",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                                onPressed: () => Get.toNamed(
                                                    Routes.workshop
                                                        .replaceFirst(
                                                            ':id',
                                                            donation.id
                                                                .toString())),
                                                child: Text(
                                                  donation.name,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'Roboto',
                                                      color: Colors.black87),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, left: 20, bottom: 5),
                                            child: Text(
                                              "Data de realização",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(
                                              DateFormat.yMd().format(
                                                  donation.dateCompletion),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5, left: 20),
                                            child: Text(
                                              donation.description,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Roboto',
                                                  color: Colors.black87),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          onEmpty: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Form(
                                        key: controller.formKey,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                autofocus: false,
                                                controller: controller
                                                    .searchWorkshopName,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      "Informe o nome do workshop",
                                                  helperStyle:
                                                      GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  filled: true,
                                                  focusColor: Colors.black,
                                                  fillColor: Colors.white,
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                  ),
                                                  labelStyle:
                                                      GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                validator: (String? value) {
                                                  if (value != null &&
                                                      value.isEmpty) {
                                                    return 'Favor preencher o campo';
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.flagSearchButton.value = 1;
                                          controller.submitSearch();
                                        },
                                        child: Text(
                                          'Buscar',
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Form(
                                        key: controller.formKey2,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                textAlign: TextAlign.center,
                                                autofocus: false,
                                                controller: controller
                                                    .searchWorkshopData,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      "Informe a data do workshop",
                                                  helperStyle:
                                                      GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  filled: true,
                                                  focusColor: Colors.black,
                                                  fillColor: Colors.white,
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                  ),
                                                  labelStyle:
                                                      GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                validator: (String? value) {
                                                  if (value != null &&
                                                      value.isEmpty) {
                                                    return 'Favor preencher o campo';
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.flagSearchButton.value = 2;
                                          controller.submitSearch();
                                        },
                                        child: Text(
                                          'Buscar',
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    "Não há workshops com esse nome",
                    textAlign: TextAlign.center,
                    style:
                        Get.textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
