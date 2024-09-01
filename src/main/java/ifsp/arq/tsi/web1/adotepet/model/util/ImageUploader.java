package ifsp.arq.tsi.web1.adotepet.model.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

public class ImageUploader {
    // O diretório de upload será relativo à pasta webapp
    private static final String UPLOAD_DIR =  "images";

    public static String upload(HttpServletRequest req, Part filePart, String directory) throws IOException, URISyntaxException {
        UUID randomImageId = UUID.randomUUID();
        String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        String fileNameWithoutExtension = removeImageExtension(originalFileName);
        String extension = getImageExtension(originalFileName);

        String fileNameWithUUID = fileNameWithoutExtension + "-" + randomImageId + "." + extension;

        String uploadFilePath = Utils.RESOURCES_PATH.value() + File.separator + UPLOAD_DIR + File.separator + directory;
        String serverFilePath = req.getServletContext().getRealPath("/resources/") + UPLOAD_DIR + File.separator + directory;

        File uploadDir = new File(uploadFilePath);
        File serverUploadDir = new File(serverFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        if (!serverUploadDir.exists()) {
            serverUploadDir.mkdirs();
        }

        Path filePath = Paths.get(uploadFilePath, fileNameWithUUID);

        Files.copy(filePart.getInputStream(), filePath);
        // copia para o /out também para mostrar imagem sem necessidade de redeploy
        Files.copy(filePart.getInputStream()
                , Paths.get(serverFilePath, fileNameWithUUID));

        return "resources/images/" + directory + "/" + fileNameWithUUID;
    }

    private static String removeImageExtension(String fileName) {
        return fileName.substring(0, fileName.lastIndexOf("."));
    }

    private static String getImageExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }
}