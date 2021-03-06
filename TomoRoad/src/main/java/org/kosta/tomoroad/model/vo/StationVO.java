package org.kosta.tomoroad.model.vo;

public class StationVO {
	private String name;
	private String detail;
	private String simpleDetail;
	private String section;
	private String img;
	private double lat;
	private double lng;
	private String cityurl;
	private int spendTime = Integer.MAX_VALUE;
	private StationVO child;

	public StationVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StationVO(String name, String detail, String simpleDetail, String section, String img, double lat,
			double lng, String cityurl, StationVO child, int spendTime) {
		super();
		this.name = name;
		this.detail = detail;
		this.simpleDetail = simpleDetail;
		this.section = section;
		this.img = img;
		this.lat = lat;
		this.lng = lng;
		this.cityurl = cityurl;
		this.child = child;
		this.spendTime = spendTime;
	}

	public StationVO(String name) {
		super();
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getSimpleDetail() {
		return simpleDetail;
	}

	public void setSimpleDetail(String simpleDetail) {
		this.simpleDetail = simpleDetail;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getCityurl() {
		return cityurl;
	}

	public void setCityurl(String cityurl) {
		this.cityurl = cityurl;
	}

	public StationVO getChild() {
		return child;
	}

	public void setChild(StationVO child) {
		this.child = child;
	}

	public int getSpendTime() {
		return spendTime;
	}

	public void setSpendTime(int spendTime) {
		this.spendTime = spendTime;
	}

	@Override
	public String toString() {
		return "StationVO [name=" + name + ", detail=" + detail + ", simpleDetail=" + simpleDetail + ", section="
				+ section + ", img=" + img + ", lat=" + lat + ", lng=" + lng + ", cityurl=" + cityurl + ", spendTime="
				+ spendTime + ", child=" + child + "]";
	}

	

}
