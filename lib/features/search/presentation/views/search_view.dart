import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/service_locator.dart';
import 'package:fruits_hub/core/widgets/custom_appbar.dart';
import 'package:fruits_hub/features/search/presentation/widgets/search_view_body.dart';
import 'package:fruits_hub/generated/l10n.dart';
import '../cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SearchCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: S.of(context).search),
        body: SearchViewBody(),
      ),
    );
  }
}
