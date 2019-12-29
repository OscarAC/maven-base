package ##groupId.core;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
class Application extends SpringBootServletInitializer {

   public static void main(String[] args) {

       try {
            ApplicationContext context = SpringApplication.run(Application.class, args);
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
   }

   @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Application.class);
    }

}
