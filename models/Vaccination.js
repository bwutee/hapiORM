const { Model } = require("objection");

class Vaccination extends Model {
    static get tableName() {
        return "vaccination";
    }
    static get relationMappings() {
        const vaccine = require("./Vaccine");
        const patinet = require("./Patient");
        return {
            vaccines: {
                relation: Model.BelongsToOneRelation,
                modelClass: vaccine,
                join: {
                    from: "vaccination.vaccine_id",
                    to: "vaccine.id",
                },
            },
            pateints:{
                relation: Model.BelongsToOneRelation,
                modelClass: patinet,
                join: {
                    from: "vaccination.patient_id",
                    to: "patient.id"
                }

            }
        };
    }
}

module.exports = Vaccination;
