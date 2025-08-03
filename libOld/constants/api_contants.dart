class ApiContants {
  static String apiKey = "dabc91955d0bf6fbd1fa4a12c8a6f868";
  static String bearerToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYWJjOTE5NTVkMGJmNmZiZDFmYTRhMTJjOGE2Zjg2OCIsIm5iZiI6MTc0MTY0NzUxMi43MjMsInN1YiI6IjY3Y2Y2ZTk4NjY4OTJiYWQ2MjgxMDY4NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Pch6JZuXhX1ZSflu93StCGI9ttTnsGeBfLqMxtwzcrw";
  static String baseUrl = "https://api.themoviedb.org/3";
  static Map<String, String> get headers => {
    'accept': 'application/json',
    'Authorization': 'Bearer $bearerToken'
  };
}