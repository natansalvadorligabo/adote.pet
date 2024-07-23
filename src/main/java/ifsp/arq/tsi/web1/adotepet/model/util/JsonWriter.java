package ifsp.arq.tsi.web1.adotepet.model.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

public class JsonWriter {

    public static boolean write(List<?> dataset, String path) {
        Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateTypeAdapter())
                .create();

        String json = gson.toJson(dataset);

        try {
            FileWriter writer = new FileWriter(path);
            writer.write(json);
            writer.close();
        } catch(IOException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}
