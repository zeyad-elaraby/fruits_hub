import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/search/presentation/cubit/search_cubit.dart';
import 'package:fruits_hub/features/search/presentation/cubit/search_state.dart';
import 'package:fruits_hub/features/search/presentation/widgets/empty_search_result_view.dart';
import 'package:fruits_hub/features/search/presentation/widgets/search_history_list_view.dart';
import 'package:fruits_hub/features/search/presentation/widgets/search_initial_view.dart';
import 'package:fruits_hub/features/search/presentation/widgets/search_loading_view.dart';
import 'package:fruits_hub/features/search/presentation/widgets/search_result_view.dart';
import 'package:fruits_hub/generated/l10n.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

late TextEditingController _searchController;

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    _searchController = TextEditingController();
    context.read<SearchCubit>().init();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 16.h, bottom: 24.h),
            child: SearchTextField(
              controller: _searchController,
              prefixIcon: GestureDetector(
                onTap: () {
                  context.read<SearchCubit>().saveRecent(
                    _searchController.text,
                  );
                  context.read<SearchCubit>().onSearchChanged(
                    _searchController.text,
                  );
                },
                child: SvgPicture.asset(
                  Assets.imagesSearch,
                  height: 20.h,
                  width: 20.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              onChanged: (value) {
                context.read<SearchCubit>().onSearchSubmitted(value);
              },
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchSuccess) {
                return SearchResultView(
                  products: state.products,
                  query: _searchController.text,
                );
              } else if (state is SearchEmptyResult) {
                return EmptySearchResultView(query: _searchController.text);
              } else if (state is SearchLoading) {
                return SearchLoadingView();
              } else if (state is SearchError) {
                return Center(child: Text(S.of(context).somethingWentWrong));
              } else if (state is SearchInitial) {
                return const SearchInitialView();
              } else if (state is SearchRecentLoaded) {
                return SearchHistoryListView(
                  historyItems: state.recentQueries,
                  onItemTap: (query) {
                    _searchController.text = query;
                    context.read<SearchCubit>().onSearchSubmitted(query);
                  },
                  onClearItem: (query) {
                    context.read<SearchCubit>().clearRecentItem(query);
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
