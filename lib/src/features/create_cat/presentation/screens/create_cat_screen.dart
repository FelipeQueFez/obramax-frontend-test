import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:obramax_frontend_test/src/features/create_cat/presentation/stores/create_cat_state.dart';
import 'package:obramax_frontend_test/src/features/create_cat/presentation/stores/create_cat_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:obramax_frontend_test/src/ui/responsive/core_colors.dart';
import 'package:obramax_frontend_test/src/ui/responsive/core_fonts.dart';

import '../../../../../service_locator.dart';
import '../../../../core/state/base_state.dart';
import '../../../../ui/responsive/core_sizes.dart';

class CreateCatScreen extends StatefulWidget {
  @override
  _CreateCatScreenState createState() => _CreateCatScreenState();
}

class _CreateCatScreenState extends State<CreateCatScreen> {
  late CreateCatStore controller;

  @override
  void initState() {
    super.initState();

    controller = sl<CreateCatStore>();
    controller.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        mobile: Container(),
        desktop: _body(size: size, resposiveType: 'desktop'),
        tablet: _body(size: size, resposiveType: 'tablet'),
      ),
    );
  }

  Widget _body({required size, required String resposiveType}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              height: 680,
              child: Observer(builder: ((context) {
                if (controller.state.loading == BaseLoadingState.loading) {
                  return const Center(
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (controller.state.loading == BaseLoadingState.error) {
                  return Center(
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Text(controller.state.errorMessage ?? ''),
                    ),
                  );
                } else if (controller.state.loading ==
                    BaseLoadingState.loaded) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 5, top: 15),
                                  child: Text(
                                    'Nome',
                                    style: CoreFonts.ubuntubold16
                                        .copyWith(color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(6),
                                  child: TextFormField(
                                    controller: controller
                                        .state.databinding.nameTextController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 5, top: 15),
                                  child: Text(
                                    'Idade',
                                    style: CoreFonts.ubuntubold16
                                        .copyWith(color: Colors.grey),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(6),
                                  child: TextFormField(
                                    controller: controller
                                        .state.databinding.ageTextController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildButton(),
                      const SizedBox(
                        height: 48,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount:
                              controller.state.databinding.list.elements.length,
                          padding: const EdgeInsets.all(8),
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemBuilder: (context, index) {
                            var item = controller
                                .state.databinding.list.elements[index];
                            return Container(
                              height: 50,
                              color: Colors.grey,
                              child: Center(
                                child: Text(
                                  'Nome: ${item.name}\nIdade: ${item.age}',
                                  style: CoreFonts.ubuntubold16,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              })),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black87,
      backgroundColor: FactoryColors.color2,
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {
        controller.post();
      },
      child: Text('Cadastrar', style: CoreFonts.ubuntubold16),
    );
  }
}
