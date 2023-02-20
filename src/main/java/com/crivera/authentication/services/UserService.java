package com.crivera.authentication.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.crivera.authentication.models.LoginUser;
import com.crivera.authentication.models.User;
import com.crivera.authentication.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	// TO-DO: Write register and login methods!
	public User register(User user, BindingResult result) {

		Optional<User> potentialUser = userRepository.findByEmail(user.getEmail());

		// Does email already exist?
		if (potentialUser.isPresent()) {
			// oh no! the email exists! remind the user to log in.
			result.rejectValue("email", "emailExists", "A user has that email. Did you forget to login?");
		}

		// Does password match confirm password?
		if (!user.getPassword().equals(user.getConfirm())) {
			// they don't match! add an error message
			result.rejectValue("confirm", "noMatch", "Passwords must match.");
		}

		if (result.hasErrors())
			return null;

		// hash the password, save the user
		else {
			String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
			user.setPassword(hashed);
			return userRepository.save(user);
		}
	}

	public User login(LoginUser loginUser, BindingResult result) {
		// Does user exist?
		Optional<User> potentialUser = userRepository.findByEmail(loginUser.getEmail());

		if (potentialUser.isEmpty()) {
			result.rejectValue("email", "noEmail", "User not found. Please register.");
			return null;
		}

		User user = potentialUser.get();

		// Is password correct?
		if (!BCrypt.checkpw(loginUser.getPassword(), user.getPassword())) {
			result.rejectValue("password", "noMatch", "Incorrect password.");
		}

		if (result.hasErrors())
			return null;
		else
			return user;

	}

	public User findById(Long id) {
		return userRepository.findById(id).orElse(null);
	}

}
