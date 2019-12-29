package ##groupId.core.logic;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import ##groupId.service.##baseModelService;
import ##groupId.model.##baseModelModel;
import ##groupId.core.persister.##baseModelPersister;
import ##groupId.core.entity.##baseModelEntity;
import ##groupId.core.transformer.##baseModelTransformer;

@Service("##groupId.##baseModelService-local")
@Qualifier("local")
public class ##baseModelLogic implements ##baseModelService {

    private static final Logger log = LoggerFactory.getLogger(##baseModelLogic.class);
    
    private ##baseModelPersister modelPersister;
    
    @Autowired
    public ##baseModelLogic(##baseModelPersister modelPersister) {
        this.modelPersister = modelPersister;        
    }

    @Override
    public List<##baseModelModel> findAll() {
        log.debug("##baseModelLogic.findAll()");

        List<##baseModelModel> models = 
        modelPersister.findAll()
                      .stream()
                      .map(this::castTo##baseModel)
                      .collect(Collectors.toList());

        return models;
    }

    private ##baseModelModel castTo##baseModel(##baseModelEntity modelEntity) {
        ##baseModelModel model = ##baseModelTransformer.toModel(modelEntity);
        return model;
    }
}