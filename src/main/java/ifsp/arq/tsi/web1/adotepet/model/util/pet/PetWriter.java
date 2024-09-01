package ifsp.arq.tsi.web1.adotepet.model.util.pet;

import ifsp.arq.tsi.web1.adotepet.model.Pet;
import ifsp.arq.tsi.web1.adotepet.model.User;
import ifsp.arq.tsi.web1.adotepet.model.util.JsonWriter;
import ifsp.arq.tsi.web1.adotepet.model.util.Utils;
import ifsp.arq.tsi.web1.adotepet.model.util.user.UsersReader;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class PetWriter {

    public static Boolean write(Pet pet) {
        List<Pet> datasetPet = PetReader.read();

        String path = Utils.RESOURCES_PATH.value() + File.separator + "json" + File.separator + "pets.json";

        if(datasetPet == null || datasetPet.isEmpty()) {
            datasetPet = new ArrayList<>();
            pet.setId(1L);
        } else {
            pet.setId(datasetPet.getLast().getId() + 1);
        }

        datasetPet.add(pet);

        return JsonWriter.write(datasetPet, path);
    }

    public static Boolean delete(Pet pet) {
        List<Pet> datasetPet = PetReader.read();
        String path = Utils.RESOURCES_PATH.value() + File.separator + "json" + File.separator + "pets.json";

        datasetPet.remove(pet);

        return JsonWriter.write(datasetPet, path);
    }

    public static Boolean update(Pet pet) {
        List<Pet> datasetPet = PetReader.read();

        String path = Utils.RESOURCES_PATH.value() + File.separator + "json" + File.separator + "pets.json";

        int index = 0;
        for(Pet p: datasetPet) {
            if(p.getId().equals(pet.getId())) {
                datasetPet.set(index, pet);
            }
            index++;
        }

        return JsonWriter.write(datasetPet, path);
    }
}
