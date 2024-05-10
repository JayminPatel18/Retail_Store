class CategoryModel{
  
     late String name, image;
      CategoryModel(this.name, this.image);

      CategoryModel.fromJson(Map<dynamic,dynamic> map){
        // if(map == null){
        //   // Handle the case where map is null
        //   // For example, you can throw an exception or return a default instance
        //   throw Exception("Cannot create CategoryModel from null map");
        // }
          name = map['name'] ?? ''; // Provide a default value if 'name' key is missing
          image = map['image'] ?? ''; // Provide a default value if 'image' key is missing

      }

      toJson(){
        return {
          'name': name,
          'image': image
        };
      }


}