<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<%
String clientId = "4nBnuWcWjFv3FReSECnJ";//애플리케이션 클라이언트 아이디값";
String clientSecret = "Nl3ailMbn4";//애플리케이션 클라이언트 시크릿값";
String code = request.getParameter("code");
String state = request.getParameter("state");
String redirectURI = URLEncoder.encode("http://localhost:8088/MissionLogin/naverCallback.jsp", "UTF-8");
String apiURL;
apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
apiURL += "client_id=" + clientId;
apiURL += "&client_secret=" + clientSecret;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&code=" + code;
apiURL += "&state=" + state;
String access_token = "";
String refresh_token = "";
System.out.println("apiURL=" + apiURL);
try {
	URL url = new URL(apiURL);
	HttpURLConnection con = (HttpURLConnection) url.openConnection();
	con.setRequestMethod("GET");
	int responseCode = con.getResponseCode();
	BufferedReader br;
	System.out.print("responseCode=" + responseCode);
	if (responseCode == 200) { // 정상 호출
		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	} else { // 에러 발생
		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	}
	String inputLine;
	StringBuffer res = new StringBuffer();
	while ((inputLine = br.readLine()) != null) {
		res.append(inputLine);
	}
	br.close();
	if (responseCode == 200) { //인증 성공 시
		System.out.println(res.toString());
		JSONParser parsing = new JSONParser();
		Object obj = parsing.parse(res.toString());
		JSONObject jsonObj = (JSONObject) obj;

		access_token = (String) jsonObj.get("access_token");
		refresh_token = (String) jsonObj.get("refresh_token");
	}
} catch (Exception e) {
	e.printStackTrace();
}
if (access_token != null) { // access_token을 잘 받아왔다면
	try {
		String token = access_token; // 네이버 로그인 접근 토큰;
		String header = "Bearer " + token; // Bearer 다음에 공백 추가
		String apiurl = "https://openapi.naver.com/v1/nid/me";
		URL url = new URL(apiurl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("Authorization", header);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
	br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
	br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
	res.append(inputLine);
		}
		br.close();
		JSONParser parsing = new JSONParser();
		Object obj = parsing.parse(res.toString());
		JSONObject jsonObj = (JSONObject) obj;
		JSONObject resObj = (JSONObject) jsonObj.get("response");

		String naverCode = (String) resObj.get("id");
		String email = (String) resObj.get("email");
		String name = (String) resObj.get("name");
		String nickName = (String) resObj.get("nickname");
		
		if (naverCode != null && email != null) {
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		response.sendRedirect("datainsert.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.println("실패");
	}
}
%>