import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:obramax_frontend_test/src/features/create_cat/data/models/post_cat_model.dart';
import 'package:obramax_frontend_test/src/features/create_cat/domain/usecases/create_cat_use_case.dart';

import '../../../../../service_locator.dart';
import '../../../../core/state/base_state.dart';
import 'create_cat_state.dart';

part 'create_cat_store.g.dart';

class CreateCatStore = _CreateCatStoreBase with _$CreateCatStore;

abstract class _CreateCatStoreBase with Store {
  late CreateCatUseCase useCase;

  @observable
  StateCreateCat state = StateCreateCat.initial();

  _CreateCatStoreBase() : useCase = sl.get<CreateCatUseCase>();

  @action
  setState(StateCreateCat stateInput) {
    state = stateInput;
  }

  fetchAll() async {
    setState(
      state.copyWith(loading: BaseLoadingState.loading),
    );

    try {
      var result = await useCase.fetchAll();

      result.fold((success) {
        setState(
          state.copyWith(
            loading: BaseLoadingState.loaded,
            databinding: state.databinding.copyWith(
              list: success,
            ),
          ),
        );
      }, (error) {
        setState(
          state.copyWith(
              loading: BaseLoadingState.error, errorMessage: error.toString()),
        );
      });
    } catch (e) {
      setState(
        state.copyWith(
            loading: BaseLoadingState.error, errorMessage: e.toString()),
      );
    }
  }

  post() async {
    if (state.databinding.nameTextController.text.isEmpty ||
        state.databinding.nameTextController.text == null) {
      return;
    }

    if (state.databinding.ageTextController.text.isEmpty ||
        state.databinding.ageTextController.text == null) {
      return;
    }

    setState(
      state.copyWith(loading: BaseLoadingState.loading),
    );

    try {
      var result = await useCase.post(
        PostCatModel(
          name: state.databinding.nameTextController.text,
          age: int.tryParse(state.databinding.ageTextController.text) ?? 0,
          breed: '',
        ),
      );

      result.fold((success) {
        resetFields();
        fetchAll();
      }, (error) {
        setState(
          state.copyWith(
              loading: BaseLoadingState.error, errorMessage: error.toString()),
        );
      });
    } catch (e) {
      setState(
        state.copyWith(
            loading: BaseLoadingState.error, errorMessage: e.toString()),
      );
    }
  }

  resetFields() {
    setState(
      state.copyWith(
        databinding: state.databinding.copyWith(
          ageTextController: TextEditingController(),
          nameTextController: TextEditingController(),
        ),
      ),
    );
  }
}
