const { Model } = require("objection");

class Vaccine extends Model {
    static get tableName() {
        return "vaccine";
    }
    static get relationMappings() {
        const patient = require("./Patient");
        const company = require("./Company")
        return {
            patients: {
                relation: Model.ManyToManyRelation,
                modelClass: patient,
                join: {
                    from: "vaccine.id",
                    through: {
                        from: "vaccination.vaccine_id",
                        to: "vaccination.patient_id"
                    },
                    to: "patient.id",
                },
            },
            companies: {
                relation: Model.BelongsToOneRelation,
                modelClass: company,
                join:{
                    from: "vaccine.company_id",
                    to: "company.id"
                }
            }
        };
    }
}

module.exports = Vaccine;
