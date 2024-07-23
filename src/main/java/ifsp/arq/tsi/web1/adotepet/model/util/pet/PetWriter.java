package ifsp.arq.tsi.web1.adotepet.model.util.pet;

import ifsp.arq.tsi.web1.adotepet.model.Pet;
import ifsp.arq.tsi.web1.adotepet.model.util.JsonWriter;

import java.util.ArrayList;
import java.util.List;

public class PetWriter {

    public static Boolean write(Pet pet) {
        List<Pet> datasetPet = PetReader.read();

        String path = PetWriter.class.getProtectionDomain().getCodeSource().getLocation().getPath()+"json/pets.json";

        if(datasetPet == null || datasetPet.isEmpty()) {
            datasetPet = new ArrayList<>();
            pet.setId(1L);
        } else {
            pet.setId(datasetPet.getLast().getId() + 1);
        }

        datasetPet.add(pet);

        return JsonWriter.write(datasetPet, path);
    }
}
