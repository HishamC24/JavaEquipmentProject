package edu.oakland.csi3370.model;

import java.util.List;
import java.util.Objects;

public class User {

    private final String id;
    private final Role role;
    private final List<String> currentReservationIds;
    private final List<String> activeCheckoutIds;

    public User(
            String id,
            Role role,
            List<String> currentReservationIds,
            List<String> activeCheckoutIds) {
        this.id = Objects.requireNonNull(id);
        this.role = Objects.requireNonNull(role);
        this.currentReservationIds
                = currentReservationIds == null ? List.of() : List.copyOf(currentReservationIds);
        this.activeCheckoutIds
                = activeCheckoutIds == null ? List.of() : List.copyOf(activeCheckoutIds);
    }

    public String getId() {
        return id;
    }

    public Role getRole() {
        return role;
    }

    public List<String> getCurrentReservationIds() {
        return currentReservationIds;
    }

    public List<String> getActiveCheckoutIds() {
        return activeCheckoutIds;
    }
}
