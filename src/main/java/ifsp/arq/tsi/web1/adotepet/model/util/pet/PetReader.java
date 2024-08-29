package ifsp.arq.tsi.web1.adotepet.model.util.pet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import ifsp.arq.tsi.web1.adotepet.model.Pet;
import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.LocalDateTypeAdapter;
import ifsp.arq.tsi.web1.adotepet.model.util.Utils;
import ifsp.arq.tsi.web1.adotepet.model.util.user.UsersReader;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

public class PetReader {

    public static List<Pet> read() {
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new LocalDateTypeAdapter())
                .create();
        List<Pet> datasetPet = null;

        String path = Utils.RESOURCES_PATH.value() + File.separator + "json" + File.separator + "pets.json";

        try {
            File file = new File(path);
            if(file.exists()) {
                BufferedReader buffer = new BufferedReader(new FileReader(path));

                TypeToken<List<Pet>> type = new TypeToken<>() {};

                datasetPet = gson.fromJson(buffer, type);
                buffer.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return datasetPet;
    }

    public static Pet findPetById(Long petId) {
        return read()
                .stream()
                .filter(pet -> pet.getId().equals(petId))
                .findFirst()
                .orElse(null);
    }
}
