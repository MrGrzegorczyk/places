package pl.places.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "place")
public class Place extends BaseEntity {

	@NotNull
	@Size(min = 3, max = 50)
	private String name;

	@NotNull
	@Length(min = 3, max = 200)
	private String description;

	@NotNull
	@Min(-180)
	@Max(180)
	private Float longitude;

	@NotNull
	@Min(-90)
	@Max(90)
	private Float latitude;

	@NotNull
	private Long userId;

	public Place() {
	}

	public Place(String name, String description, Float longitude, Float latitude, Long userId) {
		super();
		this.name = name;
		this.description = description;
		this.longitude = longitude;
		this.latitude = latitude;
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Float getLongitude() {
		return longitude;
	}

	public void setLongitude(Float longitude) {
		this.longitude = longitude;
	}

	public Float getLatitude() {
		return latitude;
	}

	public void setLatitude(Float latitude) {
		this.latitude = latitude;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

}
