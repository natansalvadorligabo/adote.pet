package ifsp.arq.tsi.web1.adotepet.model.util.user;

import java.io.Serial;

public class UserNotFoundException extends Exception {

	@Serial
	private static final long serialVersionUID = 1L;

	public UserNotFoundException() {
		super("User not found");
	}
}