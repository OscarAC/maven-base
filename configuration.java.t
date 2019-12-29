package  ##groupId.service.configuration;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import ##groupId.service.##baseModelService;

@Configuration
public class ##baseModelConfiguration {
    
    private ApplicationContext context;
    
    @Value("${##groupId.##baseModel:rest}")
    private String consumerType;

    public static final String QUALIFIER = "##baseModel-config";

    @Autowired
    public void setContext(ApplicationContext context) {
        this.context = context;
    }

    @Bean
    @Qualifier(QUALIFIER)
    public ##baseModelService getBean() {
        
        ##baseModelService bean;
        try {
            if (consumerType.equals("local")) {
                bean = context.getBean("##groupId.service.##baseModelService-local", ##baseModelService.class);
            } else {
                bean = context.getBean("##groupId.service.##baseModelService-rest", ##baseModelService.class);
            }

        } catch (Exception e) {            
            throw new RuntimeException(e);
        }

        return bean;
    }
}