package ifsp.arq.tsi.web1.adotepet.model;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

public class Pet implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;
    private String name;
    private String breed;
    private PetGender gender;
    private Size size;
    private Integer age;
    private String color;
    private String description;
    private LocalDate admissionDate;
    private Boolean isAdopted;
    private Long adopterId;
    private String photo;
    private long ownerId;

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getBreed() { return breed; }

    public void setBreed(String breed) { this.breed = breed; }

    public PetGender getGender() { return gender; }

    public void setGender(PetGender gender) { this.gender = gender; }

    public Size getSize() { return size; }

    public void setSize(Size size) { this.size = size; }

    public Integer getAge() { return age; }

    public void setAge(Integer age) { this.age = age; }

    public String getColor() { return color; }

    public void setColor(String color) { this.color = color; }

    public String getDescription() { return description; }

    public void setDescription(String description) { this.description = description; }

    public LocalDate getAdmissionDate() { return admissionDate; }

    public void setAdmissionDate(LocalDate admissionDate) { this.admissionDate = admissionDate; }

    public Boolean getAdopted() { return isAdopted; }

    public void setAdopted(Boolean adopted) { isAdopted = adopted; }

    public Long getAdopterId() { return adopterId; }

    public void setAdopterId(Long adopterId) { this.adopterId = adopterId; }

    public Boolean isAvailableForAdoption() { return !isAdopted; }

    public String getPhoto() { return photo; }

    public void setPhoto(String photo) { this.photo = photo; }

    public long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(long ownerId) {
        this.ownerId = ownerId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Pet pet = (Pet) o;
        return Objects.equals(id, pet.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}