package boot.mvc.sist;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("data.model.*")
@MapperScan("data.model.mapper")
public class SpringBootJMybatis4Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootJMybatis4Application.class, args);
	}

}
