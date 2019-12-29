package ##groupId.core.transformer;

import ##groupId.core.entity.##baseModelEntity;
import ##groupId.model.##baseModelModel;

public class ##baseModelTransformer {

    public static ##baseModelEntity toEntity(##baseModelModel model) {
        
        ##baseModelEntity entity = new ##baseModelEntity();

        entity.setId(model.getId());
        entity.setName(model.getName());

        return entity;
    }

    public static ##baseModelModel toModel(##baseModelEntity entity) {

        ##baseModelModel model = new ##baseModelModel();

        model.setId(entity.getId());
        model.setName(entity.getName());
        
        return model;
    }
}