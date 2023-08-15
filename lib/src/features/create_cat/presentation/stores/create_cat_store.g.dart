// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_cat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateCatStore on _CreateCatStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_CreateCatStoreBase.state', context: context);

  @override
  StateCreateCat get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StateCreateCat value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$_CreateCatStoreBaseActionController =
      ActionController(name: '_CreateCatStoreBase', context: context);

  @override
  dynamic setState(StateCreateCat stateInput) {
    final _$actionInfo = _$_CreateCatStoreBaseActionController.startAction(
        name: '_CreateCatStoreBase.setState');
    try {
      return super.setState(stateInput);
    } finally {
      _$_CreateCatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
