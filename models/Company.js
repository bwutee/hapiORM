const { Model } = require("objection");

class Company extends Model {
  static get tableName() {
    return "company";
  }
  static get relationMappings() {
    const vaccine = require("./Vaccine");
    return {
      vaccines: {
        relation: Model.HasManyRelation,
        modelClass: vaccine,
        join: {
          from: "company.id",
          to: "vaccine.company_id",
        },
      },
    };
  }
}

module.exports = Company;
