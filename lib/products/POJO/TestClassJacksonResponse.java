public record TestClassJacksonResponse(

	@JsonProperty("country")
	String country,

	@JsonProperty("image")
	String image,

	@JsonProperty("quantity")
	int quantity,

	@JsonProperty("quantityStock")
	int quantityStock,

	@JsonProperty("city")
	String city,

	@JsonProperty("codeProd")
	String codeProd,

	@JsonProperty("codeEan")
	String codeEan,

	@JsonProperty("datePublication")
	String datePublication,

	@JsonProperty("description")
	String description,

	@JsonProperty("brandModel")
	String brandModel,

	@JsonProperty("codeQr")
	String codeQr,

	@JsonProperty("price")
	int price,

	@JsonProperty("dateUpdate")
	String dateUpdate,

	@JsonProperty("imageURL")
	String imageURL,

	@JsonProperty("isEnabled")
	boolean isEnabled,

	@JsonProperty("name")
	String name,

	@JsonProperty("kilometer")
	String kilometer,

	@JsonProperty("currency")
	String currency,

	@JsonProperty("id")
	int id,

	@JsonProperty("category")
	String category,

	@JsonProperty("brand")
	String brand,

	@JsonProperty("isFavorite")
	boolean isFavorite
) {
}
