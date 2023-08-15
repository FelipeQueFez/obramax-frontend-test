import '../../../../core/state/base_state.dart';
import 'create_cat_databinding.dart';

class StateCreateCat extends BaseState {
  final CreateCatDatabinding databinding;
  StateCreateCat({
    required this.databinding,
    required BaseLoadingState loading,
    String? errorMessage,
  }) : super(loading: loading, errorMessage: errorMessage);

  factory StateCreateCat.initial() {
    return StateCreateCat(
      loading: BaseLoadingState.initial,
      databinding: CreateCatDatabinding.initial(),
    );
  }

  StateCreateCat copyWith({
    CreateCatDatabinding? databinding,
    BaseLoadingState? loading,
    String? errorMessage,
  }) {
    return StateCreateCat(
      databinding: databinding ?? this.databinding,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
