package DANIM.Project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
//import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;


@SpringBootApplication
//@EnableGlobalMethodSecurity(securedEnabled = true)
public class DanimApplication {

	public static void main(String[] args) {
		SpringApplication.run(DanimApplication.class, args);
	}

}
