import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_calcu/features/home/data/home_repo.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  bool isInput = true;

  /// **Filter Result by Input or Output*
  void operationFilter() {
    isInput = !isInput;
    emit(HomeState.filterChanged(isInput: isInput));
  }
}
