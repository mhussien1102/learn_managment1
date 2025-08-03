class CartService {
  final List<Map<String, dynamic>> cartItems;

  CartService(this.cartItems);

  void addToCart(
    product,
    void Function() setStateCallback,
    void Function(String) showMessage,
  ) {
    final existingIndex = cartItems.indexWhere(
      (item) => item['id'] == product.id,
    );

    if (existingIndex != -1) {
      setStateCallback.call(); // triggers UI rebuild
      cartItems[existingIndex]['quantity'] += 1;
    } else {
      setStateCallback.call();
      cartItems.add({
        'id': product.id,
        'title': product.name,
        'image': product.url,
        'price': product.price,
        'quantity': 1,
      });
    }

    showMessage('${product.name} added to cart');
  }
}
