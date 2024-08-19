package ifsp.arq.tsi.web1.adotepet.model.util.user;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.LocalDateTypeAdapter;
import ifsp.arq.tsi.web1.adotepet.model.util.Utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

public class UsersReader {

    public static List<User> read(){
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new LocalDateTypeAdapter())
                .create();
        List<User> datasetUsers = null;

        String path = Utils.RESOURCES_PATH.getString() + "/json/users.json";

        try {
            File file = new File(path);
            if(file.exists()) {
                BufferedReader buffer = new BufferedReader(new FileReader(path));

                TypeToken<List<User>> type = new TypeToken<>() {};

                datasetUsers = gson.fromJson(buffer, type);
                buffer.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return datasetUsers;
    }

    public static User findUserByEmail(String email) {
        List<User> users = read();

        for (User u : users) {
            if (u.getEmail().equals(email)) {
                return u;
            }
        }

        return null;
    }

    public static User findUserById(Long id) {
        List<User> users = read();

        for (User u : users) {
            if (u.getId() == (id)) {
                return u;
            }
        }

        return null;
    }
}
