package edu.hi.prj.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import edu.hi.prj.config.oauth.PrincipalOauth2UserService;
import edu.hi.prj.security.CustomUserDetailsService;

//지금부터 하는거는 시큐리티 설정 클래스 만들기
@Configuration // 이 클래스는 설정 파일인것을 알려 주고, 부모가 @Component + 설정
@EnableWebSecurity // 스프링 시큐리티 필터가 스프링 필터체인에 등록됨
@EnableGlobalMethodSecurity(securedEnabled = true)//secured 어노테이션 활성화
public class SecurityConfig extends WebSecurityConfigurerAdapter  {
	
	@Autowired
	private PrincipalOauth2UserService principalOauth2UserService;
	
	
	@Bean
	public BCryptPasswordEncoder encodePwd() {
		return new BCryptPasswordEncoder();
	}
	
	@Autowired
	private CustomUserDetailsService customUserDetailsService;

	//우선 정적파일들은 시큐리티에 적용되지 않도록 아래와 같이 설정을 한다.
	// 이제 더이상 리소스파일들은 스프링 시큐리티에서 관리를 하지 않는다.	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**","/css/**", "/fonts/**", "/images/**", "/js/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		//우선 CSRF설정을 해제한다.
		//초기 개발시만 해주는게 좋다.
		http.csrf().disable();
		//http://localhost:8282/user/userHome
		//http://localhost:8282/admin/adminHome
		
		http.authorizeHttpRequests()
			.antMatchers("/mypage/**").hasAnyRole("USER","MANAGER","ADMIN")
			.antMatchers("/admin/**").hasAnyRole("ADMIN")
			.antMatchers("/manager/**").hasAnyRole("MANAGER","ADMIN")
			.antMatchers("/product/reservation/**").hasAnyRole("USER","MANAGER","ADMIN")
			.antMatchers("/**").permitAll();
		
		
		http.formLogin()
			.loginPage("/login")
			.defaultSuccessUrl("/")
			.and()
			
			.oauth2Login()//소셜로그인
			.loginPage("/login")
			.userInfoEndpoint()
			.userService(principalOauth2UserService);
			
		
	  
	}
	
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	    
		auth.userDetailsService(customUserDetailsService)
			.passwordEncoder(new BCryptPasswordEncoder());
		
	            
	}
	
	
}
