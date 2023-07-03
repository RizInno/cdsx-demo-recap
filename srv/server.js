const cdsx = require("@rizing/cds-extension");

cds.on("bootstrap", () => {
	cdsx.load({ config: true });
});