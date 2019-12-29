package ##groupId.core.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import ##groupId.service.##baseModelService;
import ##groupId.model.##baseModelModel;


@RestController
@RequestMapping(value = "/", headers = "Accept=application/json")
public class ##baseModelController {

    private static final Logger log = LoggerFactory.getLogger(##baseModelController.class);
    
    private ##baseModelService service;

    @Autowired
    public void ##baseModelController(@Qualifier("local") ##baseModelService service) {
        this.service = service;
    }

    @GetMapping("/")
    public ResponseEntity<List<##baseModelModel>> findAll() {
        log.debug("##baseModelController.findAll()");
        
        List<##baseModelModel> model = service.findAll();
        return ResponseEntity.ok().body(model);
    }
}