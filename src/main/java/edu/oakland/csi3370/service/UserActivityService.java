package edu.oakland.csi3370.service;

import edu.oakland.csi3370.model.User;
import edu.oakland.csi3370.model.UserActivity;
import edu.oakland.csi3370.repository.IUserRepository;
import java.util.NoSuchElementException;
import java.util.Objects;

public class UserActivityService {
  private final IUserRepository userRepository;

  public UserActivityService(IUserRepository userRepository) {
    this.userRepository = Objects.requireNonNull(userRepository);
  }

  public UserActivity getUserActivity(String userId) {
    User user = userRepository.findById(userId)
        .orElseThrow(() -> new NoSuchElementException("User not found: " + userId));
    return new UserActivity(
        user.getId(),
        user.getCurrentReservationIds(),
        user.getActiveCheckoutIds());
  }
}