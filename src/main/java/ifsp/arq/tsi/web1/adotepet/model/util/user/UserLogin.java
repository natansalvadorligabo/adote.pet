package ifsp.arq.tsi.web1.adotepet.model.util.user;
import java.util.List;
import ifsp.arq.tsi.web1.adotepet.model.User;

public class UserLogin {

	private UserLogin() {}

	public static User login(String email, String password) throws UserNotFoundException {
		List<User> users = UsersReader.read();

		if (users != null)
			for (User user : users)
				if (user.getEmail().equals(email) && user.getPassword().equals(Encoder.encode(password)))
					return user;
		
		throw new UserNotFoundException();
	}
}