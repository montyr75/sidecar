import '../../../../db/models/saved_builds.dart';

class ChopShopState {
  final bool isLoading;
  final SavedBuilds savedBuilds;

  const ChopShopState({
    this.isLoading = false,
    this.savedBuilds = const SavedBuilds(),
  });

  ChopShopState copyWith({
    bool? isLoading,
    SavedBuilds? savedBuilds,
  }) {
    return ChopShopState(
      isLoading: isLoading ?? this.isLoading,
      savedBuilds: savedBuilds ?? this.savedBuilds,
    );
  }
}
