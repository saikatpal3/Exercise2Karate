function fn(){
	
	karate.configure('connectTimeout', 5000);
   	karate.configure('readTimeout', 5000);
	karate.configure('report', true);
   	karate.configure('logPrettyRequest', true);
   	karate.configure('logPrettyResponse', true);
	
	var config = {
		baseUrl: 'http://dummy.restapiexample.com/'
	};
	
	
	return config;
}

