import 'package:flutter/material.dart';
import 'package:websocket/features/socket/ui/bid_bar_chart.dart';
import '../bloc/socket_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocketPage extends StatefulWidget {
  const SocketPage({super.key});

  @override
  State<SocketPage> createState() => _SocketPageState();
}

class _SocketPageState extends State<SocketPage> {
  final SocketBloc socketBloc = SocketBloc();

  @override
  void initState() {
    socketBloc.add(SocketInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Data using SyncFusion'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocConsumer<SocketBloc, SocketState>(
        bloc: socketBloc,
        listenWhen: (previous, current) => current is SocketActionState,
        buildWhen: (previous, current) => current is! SocketActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case SocketFetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case SocketFetchingSuccessState:
              final successState = state as SocketFetchingSuccessState;
              final bidslist = successState.sockets
                  .map((socketData) => socketData.bids)
                  .expand((bids) => bids)
                  .toList();
              return Container(
                child: BidBarChart(bids: bidslist),
              );
             default:
              return SizedBox(); 
          }
        },
      ),
    );
  }
}
