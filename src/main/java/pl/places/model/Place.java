package pl.places.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "place")
public class Place extends BaseEntity {

	@NotNull
	@Size(min = 3, max = 150, message = "Podaj dlugosc od {min} do {max}")
	private String placeName;

	@NotNull
	@Length(min = 3, max = 500)
	private String description;

	public Place() {
	}

	public Place(String placeName, String description) {
		super();
		this.placeName = placeName;
		this.description = description;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
