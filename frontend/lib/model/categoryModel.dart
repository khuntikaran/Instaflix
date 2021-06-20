class CategoryModel {
  final String name;
  final String image;
  CategoryModel(this.name, this.image);
}

List<CategoryModel> categoryList = [
  CategoryModel('Scary',
      'https://image.shutterstock.com/z/stock-vector-high-quality-emoticon-isolated-on-white-background-screaming-emoticon-emoji-with-two-hands-holding-1701874210.jpg'),
  CategoryModel('Sci-fi',
      'https://images.unsplash.com/photo-1571818684035-c1afe7eab7f5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHNjaSUyMGZpfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  CategoryModel('Comedy',
      'https://images.unsplash.com/photo-1438283173091-5dbf5c5a3206?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZnVubnl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  CategoryModel('Crime',
      'https://images.unsplash.com/photo-1592772874383-d08932d29db7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y3JpbWV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
  CategoryModel('Romance',
      'https://images.unsplash.com/photo-1542311222-5632cf0e6c51?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80'),
  CategoryModel('Drama',
      'https://images.unsplash.com/photo-1547392533-66007d0a1750?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8ZHJhbWF8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
];

class Image {
  final String image;
  Image(this.image);
}

List<Image> imageList = [
  Image('https://wallpapercave.com/wp/wp3891770.jpg'),
  Image('https://wallpapercave.com/wp/wp8118255.jpg'),
  Image('https://wallpapercave.com/wp/wp8663949.jpg'),
  Image('https://images3.alphacoders.com/107/thumbbig-1072835.webp'),
  Image('https://wallpapercave.com/wp/wp6577371.jpg')
];
