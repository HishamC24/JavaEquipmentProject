package edu.oakland.csi3370.model;

import java.util.Objects;

public class Equipment {
  private final String id;
  private final String name;
  private final String type;
  private final EquipmentStatus status;
  private final boolean available;

  public Equipment(
      String id,
      String name,
      String type,
      EquipmentStatus status,
      boolean available) {
    this.id = Objects.requireNonNull(id);
    this.name = Objects.requireNonNull(name);
    this.type = Objects.requireNonNull(type);
    this.status = Objects.requireNonNull(status);
    this.available = available;
  }

  public String getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public String getType() {
    return type;
  }

  public EquipmentStatus getStatus() {
    return status;
  }

  public boolean isAvailable() {
    return available;
  }
}