class CommonResponse<T> {
  int? statusCode; //ok
  T? data;
  String? message; //error
//objject
  CommonResponse.fromJson(dynamic json) {
    this.statusCode = json['statusCode'];
    if (statusCode.toString().startsWith('2')) {
      this.data = json['response'];

      // this.staus==true
    } else {
      if (json['response'] != null &&
          json['response'] is Map &&
          json['response']['title'] != null) {
        //title or num
        this.message = json['response']['title']; //if no key for error
      } else {
        //or status code
        switch (statusCode) {
          case 400:
            this.message = '400 Bad Request';
            break;
          case 401:
            this.message = '401 UnAuthorized';
            break;
          case 404:
            this.message = '404 Not Found';
            break;
          case 501:
            this.message = '501 Internal server error';
            break;
          case 503:
            this.message = '503 Server unavailable';
            break;
          //error on phone without console
        }
      }
    }
  }
  // bool get getStatus=>statusCode==200?true:false;
  bool get getStatus => statusCode.toString().startsWith('2');
  //ok or not ok for this req
  //for  developper
  //message from api
//
}
// CommonResponse<String>();
