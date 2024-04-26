import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit(super.initialState);


  changeLang({required String language}){


    final newState = ClientState(
      language:language,
    );


    emit(newState);
  }
}
