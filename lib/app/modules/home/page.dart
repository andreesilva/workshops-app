import 'package:google_fonts/google_fonts.dart';
import 'package:workshops_app/app/core/theme/colors.app.dart';
import 'package:workshops_app/app/modules/home/controller.dart';
import 'package:workshops_app/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:workshops_app/app/widgets/button.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.appBackground,
          shape: const Border(
              bottom: BorderSide(color: ColorsApp.appBorder, width: 0.5)),
        ),
        body: controller.obx(
            (state) => SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text(
                          "Ata dos workshops",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              color: Colors.black87),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Expanded(
                                /*1*/
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              controller:
                                                  controller.searchWorkshopName,
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
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                                labelStyle: GoogleFonts.poppins(
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
                              ),
                              const SizedBox(width: 5),
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.flagSearchButton.value = 1;
                                      controller.submitSearch();
                                    },
                                    style: button,
                                    child: Text(
                                      'Buscar',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Expanded(
                                /*1*/
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              controller:
                                                  controller.searchWorkshopData,
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
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                                labelStyle: GoogleFonts.poppins(
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
                              ),
                              const SizedBox(width: 5),
                              Column(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.flagSearchButton.value = 1;
                                      controller.submitSearch();
                                    },
                                    style: button,
                                    child: Text(
                                      'Buscar',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            children: [
                              for (var donation in state!)
                                Card(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 0),
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 15, left: 10),
                                                    child: Text(
                                                      "Workshop",
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        left: 10,
                                                        bottom: 10),
                                                    child: TextButton(
                                                        onPressed: () => {
                                                              Get.toNamed(
                                                                  Routes
                                                                      .workshop,
                                                                  parameters: {
                                                                    'id': donation
                                                                        .id
                                                                        .toString()
                                                                  })
                                                            },
                                                        child: Text(
                                                          donation.name,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: Colors
                                                                      .black87),
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5, left: 10),
                                                    child: Text(
                                                      "Descricão",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5, left: 20),
                                                    child: Text(
                                                      donation.description,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        left: 10,
                                                        right: 10,
                                                        bottom: 5),
                                                    child: Text(
                                                      "Data de realização",
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Colors.black87),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    child: Text(
                                                      DateFormat.yMd().format(
                                                          donation
                                                              .dateCompletion),
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Colors.black87),
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
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            onEmpty: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  child: Column(
                    children: [
                      Text(
                        "Ata dos workshops",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            color: Colors.black87),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            Expanded(
                              /*1*/
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Form(
                                    key: controller.formKey,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            autofocus: false,
                                            controller:
                                                controller.searchWorkshopName,
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Informe o nome do workshop",
                                              helperStyle: GoogleFonts.poppins(
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              labelStyle: GoogleFonts.poppins(
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
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    controller.flagSearchButton.value = 1;
                                    controller.submitSearch();
                                  },
                                  style: button,
                                  child: Text(
                                    'Buscar',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            Expanded(
                              /*1*/
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Form(
                                    key: controller.formKey2,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            autofocus: false,
                                            controller:
                                                controller.searchWorkshopData,
                                            decoration: InputDecoration(
                                              hintText:
                                                  "Informe a data do workshop",
                                              helperStyle: GoogleFonts.poppins(
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Colors.grey),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              labelStyle: GoogleFonts.poppins(
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
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    controller.flagSearchButton.value = 1;
                                    controller.submitSearch();
                                  },
                                  style: button,
                                  child: Text(
                                    'Buscar',
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
