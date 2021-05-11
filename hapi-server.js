// Configure Knex.
const knex = require("knex")({
  client: "pg",
  connection: {
    host: "faraday.cse.taylor.edu",
    user: "min_lee",
    password: "pegediju",
    database: "min_lee"
  },
});

// Configure Objection.
const { Model } = require("objection");
Model.knex(knex);

// Load model classes.
const Company = require("./models/Company");
const Patient = require("./models/Patient");
const Vaccination = require("./models/Vaccination");
const Vaccine = require("./models/Vaccine");

// Configure Hapi.
const Hapi = require("@hapi/hapi");
const Boom = require("@hapi/boom");

const init = async () => {
  const server = Hapi.server({
    host: "localhost",
    port: 3000,
  });

  // Log stuff.
  await server.register({
    plugin: require("hapi-pino"),
    options: {
      prettyPrint: true,
    },
  });

  server.route([
    {
      method: "GET",
      path: "/",
      handler: (request, h) => "Hello, Hapi",
    },

    {
      method: "GET",
      path: "/patients",
      config: {
        description: "List of all patient records"
      },
      handler: async (request, h) => {
        return await Patient.query();
      }
    },
    {
      method: "GET",
      path: "/companies",
      config: {
        description: "List all companies and the vaccines produced by each"
      },
      handler: async (request, h) =>{
        return Company.query().withGraphFetched("vaccines")
      } 
      
    },
    {
      method: "GET",
      path: "/patients/{id}",
      config: {
        description: "Retrieve details on patient id, including all vaccines taken by the patient. The company that manufactured vaccines are included for each"
      },
      handler: async (request, h) =>{
          return await Patient.query().select().where("id",request.params.id).first().withGraphFetched("vaccines.companies")
      } 
      
    },
    {
      method: "GET",
      path: "/vaccines",
      handler: async (request, h) => Vaccine.query().withGraphFetched("companies")
    },

    
    {
      method: "POST",
      path: "/patient",
      config: {
        description: "Create new patient"
      },
      handler: async (request, h) => {
        const newPatient = await Patient.query().insert({
          first_name: request.payload.first_name,
          last_name: request.payload.last_name,
          phone: request.payload.phone,
        })
        .returning('*');
        return newPatient;
      }
    },

    {
      method: "POST",
      path: "/patients/{pid}/vaccines/{vid}",
      config: {
        description: "create new vaccination"
      },
      handler: async (request, h) => 
        await Patient.relatedQuery("vaccines")
        .for(request.params.pid)
        .relate(request.params.vid)
    },

    {
      method: "PATCH",
      path: "/patients/{id}",
      config: {
        description: "update patient id and return updated patient record"
      },
      handler: async (request, h) => {
        const searchId = await Patient.query().where("id",request.params.id).first();
        if(!searchId){throw Boom.notFound(`id ${request.params.id} does not exist`)}

        const updatePatient = await Patient.query()
        .patch({
          first_name: request.payload.first_name,
          last_name: request.payload.last_name,
          phone: request.payload.phone
        })
        .where("id", request.params.id)
        .returning('*')
        .first()

        return updatePatient;
      }
    },
    {
      method: "DELETE",
      path: "/patients/{pid}/vaccines/{vid}",
      config: {
        description: "Delete the information that patient pid is receiving vaccine vid"
      },
      handler: async (request, h) => {
      const deleteVaccination = await Vaccination.query()
      .where("vaccine_id", request.params.vid)
      .andWhere("patient_id", request.params.pid);

      if(!deleteVaccination){
        throw Boom.notFound("wrong id")
      }

      return await Vaccination.query()
      .delete()
      .where("vaccine_id", request.params.vid)
      .andWhere("patient_id", request.params.pid)
      }
    }
  ]);

  console.log("Server listening on", server.info.uri);
  await server.start();
};

init();

