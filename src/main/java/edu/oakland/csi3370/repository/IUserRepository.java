package edu.oakland.csi3370.repository;

import edu.oakland.csi3370.model.User;
import java.util.Optional;

public interface IUserRepository {
  Optional<User> findById(String userId);
}