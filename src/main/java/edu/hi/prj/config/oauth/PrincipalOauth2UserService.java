package edu.hi.prj.config.oauth;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import edu.hi.prj.mapper.UserMapper;
import edu.hi.prj.vo.UserDetailsVO;
import edu.hi.prj.vo.UserVO;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
	@Autowired
	UserMapper usermapper;

	UserVO userVO = new UserVO();
	BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

	// 구글에서 받은 userRequest데이터에 대한 후처리함수.
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("getClientRegistration : " + userRequest.getClientRegistration());
		System.out.println("getAccessToken : " + userRequest.getAccessToken().getTokenValue());

		OAuth2User oauth2User = super.loadUser(userRequest);
		// 구글로그인클릭 -> 구글로그인창 -> 로그인완료 -> code를리턴(OAuth-client라이브러리) -> Access Token요청 ->
		// userRequest정보 -> userRequest정보로loadUser함수 -> 회원프로필받음
		System.out.println("getAttributes : " + oauth2User.getAttributes());

		OAuth2UserInfo oauth2UserInfo = null;
		if (userRequest.getClientRegistration().getRegistrationId().equals("google")) {
			System.out.println("google login");
			oauth2UserInfo = new GoogleUserInfo(oauth2User.getAttributes());
		} else if (userRequest.getClientRegistration().getRegistrationId().equals("facebook")) {
			System.out.println("facebook login");
			oauth2UserInfo = new FacebookUserInfo(oauth2User.getAttributes());
		} else if (userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
			System.out.println("naver login");
			oauth2UserInfo = new NaverUserInfo((Map<String, Object>) oauth2User.getAttributes().get("response"));
		} else if (userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
			System.out.println("kakao login");
			oauth2UserInfo = new KakaoUserInfo(oauth2User.getAttributes());
		} else {
			System.out.println("login else");
		}

		String provider = oauth2UserInfo.getProbider();
		String providerId = oauth2UserInfo.getProviderId();
		String username = provider + "_" + providerId;// google_11111111
		String uuid = UUID.randomUUID().toString();
		String password = bCryptPasswordEncoder.encode(uuid);
		String memail = oauth2UserInfo.getMemail();
		String mname = oauth2UserInfo.getMname();
		UserVO user = usermapper.getUser(username);

		System.out.println("-----------------------------------------------------------------------------------");
		System.out.println("password :   " + password);
		System.out.println("user .............." + user);
		System.out.println("username....... " + username);
		System.out.println("memali....... : " + memail);
		System.out.println("name ......." + mname);

		if (user == null) {
			System.out.println("회원가입진행--------------------------------------------------------------------------");
			usermapper.insertgoogle(username, password, mname, memail);
			usermapper.insertAuthoritiesgoogle(username);
		} else {
			System.out.println("회원가입되어있음 ---------------------------------------------------");

		}

		UserVO logininfo = usermapper.userinfo(username);
		System.out.println("userVO : =========" + logininfo);
		UserVO userinfo = usermapper.getUser(username);
		System.out.println("----------------------");
		UserDetailsVO userdetailsVO = new UserDetailsVO(userinfo);
		System.out.println(userdetailsVO);

		return userdetailsVO;
	}

}
