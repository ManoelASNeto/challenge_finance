import '../bloc/finance_bloc.dart';
import '../../../../injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _bloc = sl<FinanceBloc>();

  @override
  void initState() {
    _bloc.add(FinanceYahooEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desafio'),
      ),
      body: BlocBuilder<FinanceBloc, FinanceState>(
        builder: (context, state) {
          switch (state.status) {
            case FinanceStatus.loading:
              return const Center(
                child: Text('carregando'),
              );
            case FinanceStatus.ready:
              return _loading(state);
            case FinanceStatus.error:
              return const Scaffold(
                body: Center(
                  child: Text('Carregando'),
                ),
              );
            default:
              return const Center();
          }
        },
      ),
    );
  }

  Widget _loading(FinanceState state) {
    final chartOpen =
        state.entity?.chart?.result?[0].indicators?.quote?[0].open;
    final chartTimestamp = state.entity?.chart?.result?[0].timestamp;
    var date = chartTimestamp
        ?.map((e) =>
            DateTime.fromMillisecondsSinceEpoch(e != null ? e * 1000 : 0))
        .toList();
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => Column(
        children: [
          Text(
            'Abertura ${chartOpen?.take(30).toList()}',
          ),
          const SizedBox(
            height: 10,
          ),
          Text('${date?.take(30).toList()}'),
        ],
      ),
    );
  }
}



//indicators?.quote?[index].open?.take(29)

//${chart?[index].timestamp?.take(29) ?? 0}

//'Abertura ${chartOpen?.take(30).toList()}',

/**/


    /* AspectRatio(
      aspectRatio: 1.66,
      child: Padding(
        padding: EdgeInsets.only(top: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return DChartTime(
                groupData: const [], measureLineDashPattern: chartTimestamp);
          },
        ),
      ),
    );*/ 