package ##groupId.core.persister.repository;

import ##groupId.core.entity.##baseModelEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ##baseModelRepository extends JpaRepository<##baseModelEntity, Long> {
}