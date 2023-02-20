package com.crivera.authentication.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.crivera.authentication.models.User;

public interface UserRepository extends CrudRepository<User, Long>{
	Optional<User> findByEmail(String email);
}
