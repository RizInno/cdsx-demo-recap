module.exports = async service => {
	const external = await cds.connect.to("API_BUSINESS_PARTNER");

	service.on("READ", "A_BusinessPartner", async context => {
		return await external.run(context.query);
	});
};