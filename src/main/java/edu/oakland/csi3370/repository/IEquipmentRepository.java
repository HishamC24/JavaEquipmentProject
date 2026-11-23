package edu.oakland.csi3370.repository;

import edu.oakland.csi3370.model.Equipment;
import java.util.Optional;

public interface IEquipmentRepository {
  Optional<Equipment> findById(String equipmentId);
}