package edu.oakland.csi3370.model;

import java.util.List;
import java.util.Objects;

public class UserActivity {
  private final String userId;
  private final List<String> currentReservationIds;
  private final List<String> activeCheckoutIds;

  public UserActivity(
      String userId,
      List<String> currentReservationIds,
      List<String> activeCheckoutIds) {
    this.userId = Objects.requireNonNull(userId);
    this.currentReservationIds =
        currentReservationIds == null ? List.of() : List.copyOf(currentReservationIds);
    this.activeCheckoutIds =
        activeCheckoutIds == null ? List.of() : List.copyOf(activeCheckoutIds);
  }

  public String getUserId() {
    return userId;
  }

  public List<String> getCurrentReservationIds() {
    return currentReservationIds;
  }

  public List<String> getActiveCheckoutIds() {
    return activeCheckoutIds;
  }
}