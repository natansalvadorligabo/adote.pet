package ifsp.arq.tsi.web1.adotepet.model.util.user;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import ifsp.arq.tsi.web1.adotepet.model.User;

import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UsersWriter {

    public static Boolean write(User user) {
        Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateTypeAdapter())
                .create();

        List<User> datasetUsers = UsersReader.read();

        String path = UsersWriter.class.getProtectionDomain().getCodeSource().getLocation().getPath()+"json/users.json";

        if(datasetUsers == null) {
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

        String json = gson.toJson(datasetUsers);

        try {
            FileWriter writer = new FileWriter(path);
            writer.write(json);
            writer.close();
        } catch(IOException e) {
            e.printStackTrace();
        }

        return true;
    }
}
