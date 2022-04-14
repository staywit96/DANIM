package DANIM.Project.Vo;

public class MapVO {
	private String placeID;
	private String placeName;
	private String addressName;
	private String phone;
	private double x;
	private double y;
	private int count;
	
	public MapVO() {
		
	}

	public String getId() {
		return placeID;
	}

	public void setId(String id) {
		this.placeID = id;
	}

	public String getPlace_name() {
		return placeName;
	}

	public void setPlace_name(String place_name) {
		this.placeName = place_name;
	}

	public String getAddress_name() {
		return addressName;
	}

	public void setAddress_name(String address_name) {
		this.addressName = address_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
