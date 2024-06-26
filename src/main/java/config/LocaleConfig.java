package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.LocaleResolver;

import java.util.Locale;
// đánh dấu lớp
@Configuration
// LocaleConfig là một lớp cấu hình Spring, nó sẽ được Spring sử dụng để cấu hình các bean trong ứng dụng
// WebMvcConfigurer, cho phép lớp này ghi đè các phương thức cấu hình mặc định của Spring MVC.
public class LocaleConfig implements WebMvcConfigurer {
// đánh dấu phương thức localeResolver như một bean quản lý bởi Spring.
    @Bean
    public LocaleResolver localeResolver() {
    	// xác định locale (ngôn ngữ) sẽ được lưu trữ trong session của người dùng
        SessionLocaleResolver localeResolver = new SessionLocaleResolver();
        localeResolver.setDefaultLocale(Locale.ENGLISH);
        return localeResolver;
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
    	//  kiểm tra các yêu cầu HTTP để thay đổi locale(ngôn ngữ) dựa trên một tham số nhất định.
        LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
        // Đặt tên tham số  thay đổi locale là "lang"
        interceptor.setParamName("lang");
        return interceptor;
    }
//  Ghi đè phương thức addInterceptors của WebMvcConfigurer để thêm localeChangeInterceptor vào danh sách các interceptor của Spring MVC
    // Thêm localeChangeInterceptor vào registry để nó có thể kiểm tra và thay đổi locale cho các yêu cầu HTTP.	
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }
    
 

}
