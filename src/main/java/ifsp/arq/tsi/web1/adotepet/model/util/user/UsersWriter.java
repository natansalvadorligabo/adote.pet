package ifsp.arq.tsi.web1.adotepet.model.util.user;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.Encoder;
import ifsp.arq.tsi.web1.adotepet.model.util.JsonWriter;
import ifsp.arq.tsi.web1.adotepet.model.util.LocalDateTypeAdapter;

import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UsersWriter {

    public static Boolean write(User user) {
        List<User> datasetUsers = UsersReader.read();

        String path = UsersWriter.class.getProtectionDomain().getCodeSource().getLocation().getPath()+"json/users.json";

        if(datasetUsers == null || datasetUsers.isEmpty()) {
            datasetUsers = new ArrayList<>();
            user.setId(1L);
        } else {
            for(User u : datasetUsers) {
                if(u.getEmail().equals(user.getEmail())) {
                    return false;
                }
            }

            user.setId(datasetUsers.getLast().getId() + 1);
        }
        user.setPassword(Encoder.encode(user.getPassword()));

        datasetUsers.add(user);

        return JsonWriter.write(datasetUsers, path);
    }
}
