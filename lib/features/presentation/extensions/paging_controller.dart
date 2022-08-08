import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

extension PagingControllerEx<PageKeyType, ItemType>
    on PagingController<PageKeyType, ItemType> {
  void reset() {
    value = PagingState<PageKeyType, ItemType>(
      error: null,
      itemList: null,
      nextPageKey: null,
    );
  }

  void appendToStart(List<ItemType> newItems) {
    final previousItems = value.itemList ?? [];
    final itemList = [newItems, ...previousItems] as List<ItemType>;
    value = PagingState<PageKeyType, ItemType>(
      error: null,
      itemList: itemList,
      nextPageKey: nextPageKey,
    );
  }

  void removeItem(String id) {
    final previousItems = value.itemList ?? [] as List<dynamic>;
    previousItems.removeWhere((element) => element?.id == id);
    value = PagingState<PageKeyType, ItemType>(
      error: null,
      nextPageKey: null,
      itemList: previousItems as List<ItemType>,
    );
  }
}
