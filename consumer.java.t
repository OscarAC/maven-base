package ##groupId.service.consumer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;

import java.util.*;

import ##groupId.model.##baseModelModel;
import ##groupId.service.##baseModelService;

@Service("##groupId.service.##baseModelService-rest")
@Qualifier("rest")
public class ##baseModelRestConsumer implements ##baseModelService {
    
    private static final Logger log = LoggerFactory.getLogger(##baseModelRestConsumer.class);
    
    private RestTemplate restTemplate;

    @Value("${##baseModel-uri}")
    private String requestUri;

    @Autowired
    public ##baseModelRestConsumer(RestTemplate restTemplate) {
         
         this.restTemplate = restTemplate;
    }

   public List<##baseModelModel> findAll() {

       log.debug("##baseModelRestConsumer.findAll()");
       
       Map<String, String> urlParameters = new HashMap<>();

       ResponseEntity<##baseModelModel[]> entity = restTemplate.getForEntity(requestUri, ##baseModelModel[].class, urlParameters);

       return entity.getBody() != null ? Arrays.asList(entity.getBody()) : Collections.emptyList();
    }
}
