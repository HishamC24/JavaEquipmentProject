package edu.oakland.csi3370.service;

import edu.oakland.csi3370.model.Role;
import edu.oakland.csi3370.model.User;
import edu.oakland.csi3370.repository.IUserRepository;
import java.util.NoSuchElementException;
import java.util.Objects;

public class UserRoleService {
  private final IUserRepository userRepository;

  public UserRoleService(IUserRepository userRepository) {
    this.userRepository = Objects.requireNonNull(userRepository);
  }

  public Role getUserRole(String userId) {
    User user = userRepository.findById(userId)
        .orElseThrow(() -> new NoSuchElementException("User not found: " + userId));
    return user.getRole();
  }

  public boolean hasRole(String userId, Role expectedRole) {
    Objects.requireNonNull(expectedRole);
    return getUserRole(userId) == expectedRole;
  }
}