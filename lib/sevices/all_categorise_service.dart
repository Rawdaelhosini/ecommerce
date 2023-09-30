import '../helper/api.dart';
class AllCategoriseService
{
  Future<List<dynamic>> getAllCateogrise() async
  {
        List<dynamic> data  = await Api().get(url: 'https://fakestoreapi.com/products/categories', token: '');
       
  return data;
}

}
