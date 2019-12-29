package ##groupId.model;

import java.io.Serializable;

public class ##baseModelModel implements Serializable {
    
    protected Long id;
    protected String name;
    
    public ##baseModelModel() {
    }

    public ##baseModelModel(##baseModelModel copy) {
        this.id = copy.id;
        this.name = copy.name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
