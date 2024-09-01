package ifsp.arq.tsi.web1.adotepet.model.util.user;


import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.Encoder;
import ifsp.arq.tsi.web1.adotepet.model.util.JsonWriter;
import ifsp.arq.tsi.web1.adotepet.model.util.Utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class UsersWriter {

    public static Boolean write(User user) {
        List<User> datasetUsers = UsersReader.read();

        String path = Utils.RESOURCES_PATH.value() + File.separator + "json" + File.separator + "users.json";

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

    public static Boolean update(User user) {
        List<User> datasetUsers = UsersReader.read();

        String path = Utils.RESOURCES_PATH.value() + File.separator + "json" + File.separator + "users.json";

        int index = 0;
        for(User u : datasetUsers) {
            if(u.getId().equals(user.getId())) {
                datasetUsers.set(index, user);
            }
            index++;
        }

        return JsonWriter.write(datasetUsers, path);
    }
}
