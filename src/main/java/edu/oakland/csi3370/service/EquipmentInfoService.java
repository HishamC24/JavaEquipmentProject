package edu.oakland.csi3370.service;

import edu.oakland.csi3370.model.Equipment;
import edu.oakland.csi3370.model.EquipmentStatus;
import edu.oakland.csi3370.repository.IEquipmentRepository;
import java.util.NoSuchElementException;
import java.util.Objects;

public class EquipmentInfoService {
  private final IEquipmentRepository equipmentRepository;

  public EquipmentInfoService(IEquipmentRepository equipmentRepository) {
    this.equipmentRepository = Objects.requireNonNull(equipmentRepository);
  }

  public Equipment getEquipment(String equipmentId) {
    return equipmentRepository.findById(equipmentId)
        .orElseThrow(() -> new NoSuchElementException("Equipment not found: " + equipmentId));
  }

  public EquipmentStatus getEquipmentStatus(String equipmentId) {
    return getEquipment(equipmentId).getStatus();
  }

  public EquipmentStatus parseStatus(String rawStatus) {
    if (rawStatus == null || rawStatus.isBlank()) {
      throw new IllegalArgumentException("Equipment status cannot be null or blank");
    }
    return EquipmentStatus.valueOf(rawStatus.trim().toUpperCase());
  }
}