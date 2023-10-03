import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:websocket/features/socket/models/socket_data_ui.dart';
import 'package:websocket/features/socket/repo/sockets_repo.dart';

part 'socket_event.dart';
part 'socket_state.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  SocketBloc() : super(SocketInitial()) {
    on<SocketInitialFetchEvent>(socketInitialFetchEvent);
  }

  FutureOr<void> socketInitialFetchEvent(
      SocketInitialFetchEvent event, Emitter<SocketState> emit) async {
    emit(SocketFetchingLoadingState());
    List<SocketDataModel> sockets = await SocketRepo.fetchSocketData();
    emit(SocketFetchingSuccessState(sockets: sockets));
  }
}
