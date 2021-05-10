const { Model } = require("objection");

class Patient extends Model {
    static get tableName() {
        return "patient";
    }
    static get relationMappings() {
        const vaccine = require("./Vaccine");
        return {
            vaccines: {
                relation: Model.ManyToManyRelation,
                modelClass: vaccine,
                join: {
                    from: "patient.id",
                    through: {
                        from: "vaccination.patient_id",
                        to: "vaccination.vaccine_id"
                    },
                    to: "vaccine.id",
                },
            },
        };
    }
}

module.exports = Patient;
