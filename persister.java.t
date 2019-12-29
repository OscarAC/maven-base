package ##groupId.core.persister;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ##groupId.core.persister.repository.##baseModelRepository;
import ##groupId.core.entity.##baseModelEntity;

import java.util.List;

@Repository
public class ##baseModelPersister {

    private static final Logger log = LoggerFactory.getLogger(##baseModelPersister.class);

    private ##baseModelRepository repository;


    @Autowired
    public ##baseModelPersister(##baseModelRepository repository) {
        this.repository = repository;
    }

    public List<##baseModelEntity> findAll() {

        log.debug("##baseModelPersister.findAll()");

        return repository.findAll();       
    }
}